<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Lib\CurlRequest;
use App\Models\AdminNotification;
use App\Models\Deposit;
use App\Models\Transaction;
use App\Models\User;
use App\Models\UserLogin;
use App\Models\Withdrawal;
use App\Models\SupportTicket;
use App\Rules\FileTypeValidate;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{

    public function dashboard()
    {

        $pageTitle = 'Dashboard';

        // User Info
        $widget['total_users']             = User::count();
        $widget['verified_users']          = User::where('status', 1)->where('ev',1)->where('sv',1)->count();
        $widget['email_unverified_users']  = User::emailUnverified()->count();
        $widget['mobile_unverified_users'] = User::mobileUnverified()->count();


        $deposit['total_deposit_amount']        = Deposit::successful()->sum('amount');
        $deposit['total_deposit_pending']       = Deposit::pending()->count();
        $deposit['total_deposit_rejected']      = Deposit::rejected()->count();
        $deposit['total_deposit_charge']        = Deposit::successful()->sum('charge');

        $withdrawals['total_withdraw_amount']   = Withdrawal::approved()->sum('amount');
        $withdrawals['total_withdraw_pending']  = Withdrawal::pending()->count();
        $withdrawals['total_withdraw_rejected'] = Withdrawal::rejected()->count();
        $withdrawals['total_withdraw_charge']   = Withdrawal::approved()->sum('charge');

        // Monthly Deposit & Withdraw Report Graph
        $deposits = Deposit::selectRaw("SUM(amount) as amount, MONTHNAME(created_at) as month_name, MONTH(created_at) as month_num")
            ->whereYear('created_at', date('Y'))
            ->whereStatus(1)
            ->groupBy('month_name', 'month_num')
            ->orderBy('month_num')
            ->get();
        $depositsChart['labels'] = $deposits->pluck('month_name');
        $depositsChart['values'] = $deposits->pluck('amount');

        $withdrawalsReport = Withdrawal::selectRaw("SUM(amount) as amount, MONTHNAME(created_at) as month_name, MONTH(created_at) as month_num")
            ->whereYear('created_at', date('Y'))
            ->whereStatus(1)
            ->groupBy('month_name', 'month_num')
            ->orderBy('month_num')
            ->get();
        $withdrawalsChart['labels'] = $withdrawalsReport->pluck('month_name');
        $withdrawalsChart['values'] = $withdrawalsReport->pluck('amount');
        // Monthly Deposit & Withdraw Report Graph

        // UserLogin Report Graph
        $userLoginsReport = UserLogin::selectRaw("COUNT(*) as login_count, DATE_FORMAT(created_at, '%Y-%m-%d') as login_date")
            ->orderBy('login_date', 'desc')
            ->groupByRaw("DATE_FORMAT(created_at, '%Y-%m-%d')")
            ->limit(10)
            ->pluck('login_count', 'login_date');
        $userLogins['labels'] = $userLoginsReport->keys();
        $userLogins['values'] = $userLoginsReport->values();
            // UserLogin Report Graph

        $newTickets = SupportTicket::with('user')->orderBy('created_at', 'desc')->whereStatus(0)->limit(5)->get();
        return view('admin.dashboard', compact('pageTitle', 'widget', 'withdrawalsChart', 'depositsChart', 'deposit', 'withdrawals', 'userLogins', 'newTickets'));
    }


    public function profile()
    {
        $pageTitle = 'Profile';
        $admin = auth('admin')->user();
        return view('admin.profile', compact('pageTitle', 'admin'));
    }

    public function profileUpdate(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email',
            'image' => ['nullable','image',new FileTypeValidate(['jpg','jpeg','png'])]
        ]);
        $user = auth('admin')->user();

        if ($request->hasFile('image')) {
            try {
                $old = $user->image;
                $user->image = fileUploader($request->image, getFilePath('adminProfile'), getFileSize('adminProfile'), $old);
            } catch (\Exception $exp) {
                $notify[] = ['error', 'Couldn\'t upload your image'];
                return back()->withNotify($notify);
            }
        }

        $user->name = $request->name;
        $user->email = $request->email;
        $user->save();
        $notify[] = ['success', 'Profile has been updated successfully'];
        return to_route('admin.profile')->withNotify($notify);
    }


    public function password()
    {
        $pageTitle = 'Password Setting';
        $admin = auth('admin')->user();
        return view('admin.profile', compact('pageTitle', 'admin'));
    }

    public function passwordUpdate(Request $request)
    {
        $this->validate($request, [
            'old_password' => 'required',
            'password' => 'required|min:5|confirmed',
        ]);

        $user = auth('admin')->user();
        if (!Hash::check($request->old_password, $user->password)) {
            $notify[] = ['error', 'Password doesn\'t match!!'];
            return back()->withNotify($notify);
        }
        $user->password = bcrypt($request->password);
        $user->save();
        $notify[] = ['success', 'Password changed successfully.'];
        return to_route('admin.profile')->withNotify($notify);
    }

    public function notifications(){
        $notifications = AdminNotification::orderBy('id','desc')->with('user')->paginate(getPaginate());
        $pageTitle = 'Notifications';
        return view('admin.notifications',compact('pageTitle','notifications'));
    }


    public function notificationRead($id){
        $notification = AdminNotification::findOrFail($id);
        $notification->read_status = 1;
        $notification->save();
        $url = $notification->click_url;
        if ($url == '#') {
            $url = url()->previous();
        }
        return redirect($url);
    }

    public function readAll(){
        AdminNotification::where('read_status',0)->update([
            'read_status'=>1
        ]);
        $notify[] = ['success','Notifications read successfully'];
        return back()->withNotify($notify);
    }

    public function downloadAttachment($fileHash)
    {
        $filePath = decrypt($fileHash);
        $extension = pathinfo($filePath, PATHINFO_EXTENSION);
        $general = gs();
        $title = slug($general->site_name).'- attachments.'.$extension;
        $mimetype = mime_content_type($filePath);
        header('Content-Disposition: attachment; filename="' . $title);
        header("Content-Type: " . $mimetype);
        return readfile($filePath);
    }


}
