<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Generalsetting;
use App\Models\User;
use App\Classes\GeniusMailer;
use App\Http\Requests\User\RegisterRequest;
use App\Models\Notification;
use Auth;
use Illuminate\Support\Facades\DB;
use Validator;



class RegisterController extends Controller
{
    public function __construct()
    {
        $this->gs = DB::table('generalsettings')->find(1);
    }


    public function registerForm()
    {
       return view('user.register');
    }

    public function register(RegisterRequest $request)
    {

        

    }

    public function token($token)
    {
        
        
       $gs = Generalsetting::findOrFail(1);

        if($gs->is_verification_email == 1)
        {      
            $user = User::where('verification_link',$token)->first();
            if(isset($user))
            { 
                $user->email_verified = 'Yes';
                $user->update();


            $notification = new Notification;
            $notification->user_id = $user->id;
            $notification->order_type = 'User';
            $notification->save();


            Auth::guard('web')->login($user); 
            return redirect()->route('user-dashboard')->with('success',__('Email Verified Successfully'));
        }
            }
            else {
            return redirect()->back();  
            }
    }


    // Capcha Code Image
    private function  code_image()
    {
        $image = imagecreatetruecolor(200, 50);
        $background_color = imagecolorallocate($image, 255, 255, 255);
        imagefilledrectangle($image,0,0,200,50,$background_color);
        $pixel = imagecolorallocate($image, 0,0,255);
        for($i=0;$i<500;$i++)
        {
            imagesetpixel($image,rand()%200,rand()%50,$pixel);
        }

        $font = base_path('../assets/front/fonts/NotoSans-Bold.ttf');
     
        $allowed_letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        $length = strlen($allowed_letters);
        $letter = $allowed_letters[rand(0, $length-1)];
        $word='';
        //$text_color = imagecolorallocate($image, 8, 186, 239);
        $text_color = imagecolorallocate($image, 0, 0, 0);
        $cap_length=6;// No. of character in image
        for ($i = 0; $i< $cap_length;$i++)
        {
            $letter = $allowed_letters[rand(0, $length-1)];
            imagettftext($image, 25, 1, 35+($i*25), 35, $text_color, $font, $letter);
            $word.=$letter;
        }
        $pixels = imagecolorallocate($image, 8, 186, 239);
        for($i=0;$i<500;$i++)
        {
            imagesetpixel($image,rand()%200,rand()%50,$pixels);
        }
        session(['captcha_string' => $word]);
        imagepng($image, base_path('../assets/images/capcha_code.png'));
}
}
