<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\Generalsetting;

class TwoStep
{

    public function handle(Request $request, Closure $next)
    {
        
        $two_fa = Generalsetting::value('two_fa');
        if($two_fa){ 
            $user = auth()->user();
            $asdf =  substr(get_class(auth()->user()), -5);
            $pref = substr(get_class(auth()->user()), -5) == 'Admin' ? 'admin' : 'user';
            
            if($user->two_fa_status == 1 && $user->two_fa == 1){
                $code = randNum();
                $user->two_fa_code = $code;
                $user->update();
                sendSMS($user->phone,'Your two step authentication OTP is : '.$code,Generalsetting::value('contact_no'));
                
                @email([
                  'email'   => $user->email,
                  'name'    => $user->name,
                  'subject' => 'Bitmall! OTP Alert',
                  'message' => 'Your two step authentication OTP is : '. $code,
                ]);
                return redirect(route($pref.'.two.step.verification'));
            }
            return $next($request);
        }
        return $next($request);
    }

    protected $except = [
        'merchant/resend/two-step/verify-code',
        'user/resend/two-step/verify-code'
    ];
}
