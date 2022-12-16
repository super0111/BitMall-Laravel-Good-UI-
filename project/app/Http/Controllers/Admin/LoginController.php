<?php

namespace App\Http\Controllers\Admin;


use App\Helpers\MailHelper;
use App\Models\Generalsetting;
use App\Models\Admin;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\AdminAuthRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Validator;

class LoginController extends Controller
{
    public function __construct()
    {
      $this->middleware('admin_guest:admin', ['except' => ['logout']]);
    }

    public function showLoginForm()
    {
      return view('admin.auth.login');
    }

    public function login(AdminAuthRequest $request)
    {
      if (Auth::guard('admin')->attempt(['email' => $request->email, 'password' => $request->password], $request->remember)) {
        if(admin()->status == 2){
          auth()->guard('admin')->logout();
          return back()->with('error','Sorry! Currently you are banned in this system.');
        }
        
		$auth = Auth::guard('admin');
        $auth->user()->two_fa = 1;
        $auth->user()->save();
		
        return redirect(route('admin.dashboard'));
      }
      return back()->with('error','Sorry! Credentials Mismatch.')->withInput();
    }

    public function forgotPasswordForm()
    {
        return view('admin.auth.forgot_passowrd');
    }

    public function forgotPasswordSubmit(Request $request)
    {
        $request->validate(['email'=>'required|email']);
        $existMerchant = Admin::where('email',$request->email)->first();
        if(!$existMerchant){
            return back()->with('error','Sorry! Email doesn\'t exist');
        }

        $existMerchant->verify_code = randNum();
        $existMerchant->save();

        @email([
            'email'   => $existMerchant->email,
            'name'    => $existMerchant->name,
            'subject' => 'Password Reset Code',
            'message' => 'Password reset code is : '.$existMerchant->verify_code,
        ]);
        session()->put('email',$existMerchant->email);
        return redirect(route('admin.verify.code'))->with('success','A password reset code has been sent to your email.');
    }

    public function verifyCode()
    {
        return view('admin.auth.verify_code');
    }

    public function verifyCodeSubmit(Request $request)
    {
        $request->validate(['code' => 'required|integer']);
        $user = Admin::where('email',session('email'))->first();
        if(!$user){
            return back()->with('error','User doesn\'t exist');
        }

        if($user->verify_code != $request->code){
            return back()->with('error','Invalid verification code.');
        }
        return redirect(route('admin.reset.password'));
    }

    public function resetPassword()
    {
        return view('admin.auth.reset_password');
    }

    public function resetPasswordSubmit(Request $request)
    {
        $request->validate(['password'=>'required|confirmed|min:5']);
        $merchant = Admin::where('email',session('email'))->first();
        $merchant->password = bcrypt($request->password);
        $merchant->update();
        return redirect(route('admin.login'))->with('success','Password reset successful.');
    }

    public function logout()
    {
        $auth = Auth::guard('admin');
        $auth->user()->two_fa = 1;
        $auth->user()->save();
        
        Auth::guard('admin')->logout();
        return redirect('/admin/login');
    }
}
