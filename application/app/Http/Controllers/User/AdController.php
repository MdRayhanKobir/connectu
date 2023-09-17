<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Rules\FileTypeValidate;
use App\Http\Controllers\Controller;
use App\Models\Ad;

class AdController extends Controller
{

    public function index(){
        $pageTitle = 'List Advertisement';
        $ads = Ad::where('user_id',auth()->user()->id)->where('status',1)->latest()->paginate(getPaginate());
        return view($this->activeTemplate.'user.ads.index',compact('ads','pageTitle'));

    }
    public function create(){
        $pageTitle = 'Create Ad';
        return view($this->activeTemplate.'user.ads.create',compact('pageTitle'));
    }

    public function store( Request $request){

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
        $ad->status = isset($request->status)? 1:0;

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

}
