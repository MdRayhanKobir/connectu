<?php

namespace App\Http\Controllers\User;

use App\Models\Ad;
use App\Models\AdView;
use App\Models\Withdrawal;
use App\Models\Transaction;
use Illuminate\Http\Request;
use App\Rules\FileTypeValidate;
use App\Http\Controllers\Controller;

class AdController extends Controller
{

    public function index(){
        $pageTitle = 'List Advertisement';
        $ads = Ad::where('user_id',auth()->user()->id)->where('status',1)->latest()->paginate(getPaginate());
        return view($this->activeTemplate.'user.ads.index',compact('ads','pageTitle'));

    }
    public function create(){

        $subscribe = isSubscribe(auth()->user()->id);
        if(empty($subscribe)){
            $notify[] = ['warning', 'Please subscribe to package and try again.'];
            return back()->withNotify($notify);
        }

        $pageTitle = 'Create Ad';
        return view($this->activeTemplate.'user.ads.create',compact('pageTitle'));
    }

    public function store( Request $request){


        $subscribe = isSubscribe(auth()->user()->id);
        if(empty($subscribe)){
            $notify[] = ['warning', 'Please subscribe to package and try again.'];
            return back()->withNotify($notify);
        }

        $request->validate([
            'title' => 'required',
            'amount' => 'required|numeric|min:0',
            'duration' => 'required|numeric|min:1',
            'max_show' => 'required|numeric|min:1',
            'website_link' => 'nullable|url|required_without_all:image,script',
            'youtube' => 'nullable|url|required_without_all:image,script,website_link',
            'image' => ['nullable','image',new FileTypeValidate(['jpg','jpeg','png'])],
            'script' => 'nullable|required_without_all:image,website_link',

        ]);

        $ad = new Ad();
        $ad->user_id  =  auth()->user()->id;
        $ad->title  = $request->title;
        $ad->amount = $request->amount;
        $ad->duration = $request->duration;
        $ad->max_show = $request->max_show;
        $ad->remain = $request->max_show;
        $ad->ads_type = $request->ads_type;
        $ad->status = 1;

        if($ad->ads_type == 1){
            $ad->ads_body = $request->website_link;
        }
        elseif($ad->ads_type == 2){
            if ($request->hasFile('image')) {
                try {
                    $filePath = fileUploader($request->hasFile('image'), getFilePath('adsImage'));
                    $ad->ads_body = $filePath;
                } catch (\Exception $exp) {
                    $notify[] = ['error', 'Couldn\'t upload your file'];
                    return back()->withNotify($notify);
                }
            }

        }elseif($ad->ads_type==3){
            $ad->ads_body = $request->script;

        }else{
            $ad->ads_body = $request->youtube;

        }

        $ad->save();
        $notify[] = ['success', 'Ads has been Created Successfully.'];
        return redirect()->route('user.ad.index')->withNotify($notify);

    }


    public function edit($id){
        $pageTitle = 'Update';
        $ad = Ad::findOrFail($id);
        return view($this->activeTemplate.'user.ads.edit',compact('ad','pageTitle'));
    }

    public function update( Request $request,$id){

        $request->validate([
            'title' => 'required',
            'amount' => 'required|numeric|min:0',
            'duration' => 'required|numeric|min:1',
            'max_show' => 'required|numeric|min:1',
        ]);

        $ad = Ad::findOrFail($id);
        $ad->user_id  =  auth()->user()->id;
        $ad->title  = $request->title;
        $ad->amount = $request->amount;
        $ad->duration = $request->duration;
        $ad->max_show = $request->max_show;
        $ad->remain = $request->max_show - $ad->showed;;

        $ad->status = isset($request->status)? 1:0;

        if($ad->ads_type == 1){
            $ad->ads_body = $request->website_link;
        }elseif($ad->ads_type == 3){
            $ad->ads_body = $request->script;

        }elseif($ad->ads_type == 4){
            $ad->ads_body = $request->youtube;
        }

        $ad->save();
        $notify[] = ['success', 'Ads has been updated Successfully.'];
        return redirect()->route('user.ad.index')->withNotify($notify);

    }

    public function details($id){
        $pageTitle = 'Details';
        $adDetails = Ad::findOrFail($id);
        return view($this->activeTemplate.'user.ads.details',compact('pageTitle','adDetails'));
    }

    public function delete(Request $request){
        $ad = Ad::findOrFail($request->id);

        $adPath = getFilePath('adsImage') . '/' . $ad->ads_body;
        fileManager()->removeFile($adPath);

        $ad->delete();

        $notify[] = ['success', 'Ads has been deleted Successfully.'];
        return redirect()->route('user.ad.index')->withNotify($notify);

    }


    public function fetchAds(){
        $pageTitle = 'All Advertises';
        $ads = Ad::where('user_id', '!=', auth()->user()->id)
                ->where('status',1)
                ->inRandomOrder()
                ->paginate(getPaginate());
        return view($this->activeTemplate.'user.ads.all_ads',compact('pageTitle','ads'));
    }


    // ads show
    public function show($hash){
        $pageTitle = 'Show Advertisement';
        $user = auth()->user();

        $subscribe = isSubscribe($user->id);
        if(empty($subscribe)){
            $notify[] = ['error','You\'ve no subscription plan. Please subscribe a plan first'];
            return back()->withNotify($notify);
        }

        // check ad
        $id = $this->checkEligibleAd($hash,$user);

        if(!$id){
            $notify[] = ['error',"You are not eligible for this link"];
            return redirect()->route('user.home')->withNotify($notify);
        }

        $ads = Ad::where('id',$id)->where('remain','>',0)->where('status',1)->firstOrFail();
        $viewAds = AdView::where('user_id',$user->id)->where('view_date',Date('Y-m-d'))->get();

         if($viewAds->count()>= @$subscribe->daily_view_limit){
            $notify[] = ['error','Opps! Your limit is over. You cannot see more ads today'];
            return back()->withNotify($notify);
        }

        if ($viewAds->where('user_id',$ads->id)->first()) {
            $notify[] = ['error','You cannot see this add before 24 hour'];
            return back()->withNotify($notify);
        }

        return view($this->activeTemplate.'user.ads.show',compact('ads','pageTitle'));

    }

    public function confirm(Request $request,$hash){
        $request->validate([
            'g-recaptcha-response' => 'required',
        ], [
            'g-recaptcha-response.required' => 'Please complete the reCAPTCHA verification.',

        ]);

        $user = auth()->user();
        $subscribe = isSubscribe($user->id);
        if(empty($subscribe)){
            $notify[] = ['error','You\'ve no subscription plan. Please subscribe a plan first'];
            return back()->withNotify($notify);
        }

        $id = $this->checkEligibleAd($hash,$user);

        if(!$id){
            $notify[] = ['error',"You are not eligible for this link"];
            return redirect()->route('user.home')->withNotify($notify);
        }

        $ads = Ad::where('id',$id)->where('remain','>',0)->where('status',1)->firstOrFail();
        $viewAds = AdView::where('user_id',$user->id)->where('view_date',Date('Y-m-d'))->get();

         if($viewAds->count() >= @$subscribe->daily_view_limit){
            $notify[] = ['error','Opps! Your limit is over. You cannot see more ads today'];
            return back()->withNotify($notify);
        }

        if ($viewAds->where('ad_id',$ads->id)->first()) {
            $notify[] = ['error','You cannot see this add before 24 hour'];
            return back()->withNotify($notify);
        }

        $ads->increment('showed');
        $ads->decrement('remain');
        $ads->save();

        $user->balance += $ads->amount;
        $user->save();

        $trx                            =   getTrx();
        $transection                    =   new Transaction();
        $transection->user_id           =   $user->id;
        $transection->amount            =   $ads->amount;
        $transection->post_balance      =   $user->balance;
        $transection->charge            =   0;
        $transection->trx_type          =   '+';
        $transection->trx               =   $trx;
        $transection->details           =   'Earn amount from ads';
        $transection->remark            =   'Ads earn';
        $transection->save();

        $PtcView                        =   New AdView();
        $PtcView->user_id               =   $user->id;
        $PtcView->ad_id                =   $ads->id;
        $PtcView->amount                =   $ads->amount;
        $PtcView->view_date             =   Date('Y-m-d');
        $PtcView->save();

        $notify[] = ['success','Successfully viewed this ads'];
        return redirect()->route('user.ad.fetch')->withNotify($notify);

    }



     protected function checkEligibleAd($hash, $user){
        $decrypted =   decrypt($hash);
        $decryptData =   explode('|',$decrypted);
        $id                 =   $decryptData[0];

        if($decryptData[1]!= $user->id){
            return false;
        }

        return $id;
    }


    public function fetchEarn(){
        $pageTitle = 'My Earning';
        $user = auth()->user();
        $total['adsEarn'] = AdView::where('user_id',$user->id)->sum('amount');
        $total['pendingWithdraw'] = Withdrawal::where('user_id',$user->id)->where('status','=',2)->sum('amount');
        $total['Withdraw'] = Withdrawal::where('user_id',$user->id)->where('status','=',1)->sum('amount');
        return view($this->activeTemplate.'user.ads.earning',compact('pageTitle','total','user'));
    }


}
