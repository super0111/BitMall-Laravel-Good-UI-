<?php

namespace App\Http\Controllers\Api;

use Auth;
use Exception;
use App\Models\Blog;
use App\Models\User;
use ReflectionClass;
use App\Models\Offer;
use App\Models\Trade;
use App\Models\Wallet;
use App\Models\Review;
use App\Models\Comment;
use App\Models\Country;
use App\Models\Currency;
use App\Models\TradeChat;
use App\Models\LoginLogs;
use App\Models\Transaction;
use App\Helpers\MediaHelper;
use Illuminate\Http\Request;
use App\Models\SupportTicket;
use App\Models\TicketMessage;
use App\Models\Generalsetting;
use App\Models\PaymentGateway;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;
use App\Http\Requests\OfferValidation;
use App\Http\Requests\User\AuthRequest;
use App\Http\Requests\Admin\BlogRequest;
use App\Http\Resources\BlogResource;
use App\Models\BlogCategory;
use Illuminate\Validation\ValidationException;

class ApiController extends Controller
{
  
    public function register(Request $request)
    {	 

      $gs = Generalsetting::first();
      if($gs->registration == 0){
        return response()->json(['status' => 'error', 'message' => 'Registration is currently off.'], 422);
      }

      $countries = Country::query();
      $name = $countries->pluck('name')->toArray();
       $data = $request->validate([
         'name' => 'required',
         'email' => ['required','email','unique:users',$gs->allowed_email != null ? 'email_domain:'.$request->email:''],
         'dial_code' => 'required',
         'phone' => 'required',
         'country' => 'required|in:'.implode(',',$name),
         //'address' => 'required',
		 'profile_photo' => 'required|image|mimes:png,jpg,jpeg|max:5120',
         'password' => 'required|min:6',
       ],
       $request->all());
      
	  $data['name'] = $request->name;
	  $data['email'] = $request->email;
	  $data['country'] = $request->country;		
      $data['phone'] = $request->dial_code.$request->phone;
	  $data['photo'] = MediaHelper::handleMakeImage($request->profile_photo,[300,300]);
      $data['password'] = bcrypt($request->password);
      $data['email_verified	'] = $gs->is_verify == 1 ? 0:1;

      $user = User::create($data);

      if($gs->is_verify == 1){
        $user->verify_code = randNum();
        $user->save();

        @email([
          'email'   => $user->email,
          'name'    => $user->name,
          'subject' => translate('Email Verification Code'),
          'message' => 'Salute Ninja,<br /><br />Welcome to Orkt, you had initiated a sign up attempt, with verification code: ' . $user->verify_code .'<br /><br />If you hadn\'t initiated this event, kindly disregard or send an email to angels@orkt.one<br /><br />Salute!',
        
        ]);
		  
		  @email([
          'email'   => $user->email,
          'name'    => $user->name,
          'subject' => translate('Welcome to Orkt'),
          'message' => 'Salute Ninja,<br /><br />Welcome to Orkt, the global money transfer mobile bank. Powered by cryptocurrency, Orkt allows you to easily convert your cryptocurrencies to over 162 forms of other legal tenders and agreed means of exchange favourable to your location. Our P2P feature allows you to trade your cryptocurrency for any other form of exchange favourable to you.<br /><br />From your USDT account you could then easily move your money to any other territory in the form of: <ul> <li>Direct bank deposits</li> <li>Gift cards</li> <li>Utility bills</li> </ul>Orkt is a revolution out to power the new world. Come with us on this journey, you\'ll be proud you did.<br /><br />Facing any issues, kindly reach the angels at, angels@orkt.one.<br /><br />Salute!',
        ]);
      }

      $currencies = Currency::where('type',2)->get();
      foreach ($currencies as $curr) {
        Wallet::create([
          'user_id' => $user->id,
          'crypto_id' => $curr->id,
          'balance' => 0
        ]);
      }

      if($gs->is_verify == 1){
        return response()->json(['message' => 'Verification Code sent to email']);
      }
      
      return response()->json(['message' => 'account created']);
    }

    public function resendCode(Request $request)
	{
		$request->validate([
			'email' => 'required|exists:users'
		]);
		
		$user = User::where('email', $request->email)->first();
		
		
        $user->verify_code = randNum();
        $user->save();

        @email([
          'email'   => $user->email,
          'name'    => $user->name,
          'subject' => translate('Email Verification Code'),
          'message' => translate('Email Verification Code is : '). $user->verify_code,
        ]);
      
		return response()->json(['message' => 'Verification Code resent to email']);
		
	}

	public function forgetPassword(Request $request)
	{
		$request->validate(['email'=>'required|exists:users']);
		
        $exist = User::where('email',$request->email)->first();
        
        $exist->verify_code = randNum();
        $exist->save();

        @email([
          'email'   => $exist->email,
          'name'    => $exist->name,
          'subject' => __('Password Reset Code'),
          'message' => __('Password reset code is : ').$exist->verify_code,
        ]);
        
        return response()->json(['status' => 'success', 'message' => 'A password reset code has been sent to your email.']);
	}
	
	public function updatePassword(Request $request)
	{
		$request->validate(['password'=>'required|min:6', 'email' => 'required|exists:users', 'code' => 'required']);
        $user = User::where('email',$request->email)->first();
		
		if($user->verify_code != $request->code) {
			return response()->json(['status' => 'error', 'message' => 'Invalid Code'], 422);	
		}
		
        $user->password = bcrypt($request->password);
		$user->verify_code = randNum();
        $user->update();
        return response()->json(['status' => 'success', 'message' => 'Password reset successful.']);	
	}
	
    public function login(Request $request)
    {

      $request->validate([
          'email' => 'required|email|exists:users',
          'password' => 'required',
          'device_name' => 'required',
          'device_token' => 'required',
      ]);

      $user = User::where('email', $request->email)->first();

      if (! $user || ! Hash::check($request->password, $user->password)) {
          throw ValidationException::withMessages([
              'email' => ['The provided credentials are incorrect.'],
          ]);
      }

      if($user->status == 0){
        
        return response()->json(["status" => 'error', 'message' => 'You are temporarily banned from the system.'], 422);
      }
      
      $exists = LoginLogs::where('user_id', $user->id)->where('ip', @loginIp()->geoplugin_request)->exists();
      
      if(!$exists) {
          
          if($request->device_token) {
              sendFirebaseNotification('Sign in', "Sign in attempt from new location ", $request->device_token, []);
          }
      }

      LoginLogs::create([
          'user_id' => $user->id,
          'ip' => @loginIp()->geoplugin_request,
          'country' => @loginIp()->geoplugin_countryName,
          'city' => @loginIp()->geoplugin_city,
      ]);

      $currencies = Currency::where('type',2)->get(['id','code']);
      foreach($currencies as $curr){
          $exist = $user->wallets()->where('crypto_id',$curr->id)->first();
          if(!$exist){
            Wallet::create([
              'user_id' => $user->id,
              'crypto_id' => $curr->id,
              'balance' => 0
            ]);
          }
      }      
      
      $user->tokens()->delete();
      
      $user->device_token = $request->device_token;
      $user->save();
      
      return response()->json(['user' => $user, 'status' => 'success', "token" => $user->createToken('123')->plainTextToken ]);

    }

    public function logout()
    {
        $auth = Auth::guard('sanctum');
        if($auth->user()->two_fa_status == 1){
          $auth->user()->two_fa = 1;
          $auth->user()->save();
        }
        $auth->tokens()->delete();
        return response()->json(["status" => 'success', 'message' => 'You are logout successfully.']);
    }

    public function forgotPasswordSubmit(Request $request)
    {
        $request->validate(['email'=>'required|email']);
        $exist = User::where('email',$request->email)->first();
        if(!$exist){
          return response()->json(["status" => 'error', 'message' =>'Sorry! Email doesn\'t exist']);
        }

        $exist->verify_code = randNum();
        $exist->save();

        @email([
          'email'   => $exist->email,
          'name'    => $exist->name,
          'subject' => __('Password Reset Code'),
          'message' => __('Password reset code is : ').$exist->verify_code,
        ]);
        
        return response()->json(['status' => 'success', 'message' => 'A password reset code has been sent to your email.']);
    }



    public function verifyCodeSubmit(Request $request)
    {
        $request->validate(['code' => 'required|integer', 'email' => 'required|exists:users']);
        $user = User::where('email',$request->email)->first();
        if(!$user){
          return response()->json(["status" => 'error', 'message' =>'Sorry! Email doesn\'t exist'], 422);
        }

        if($user->verify_code != $request->code){
            return response()->json(["status" => 'error', 'message' =>'Invalid verification code.'], 422);
        }
        return response()->json(['status' => 'success']);
    }

    public function resetPasswordSubmit(Request $request)
    {
        $request->validate(['password'=>'required|confirmed|min:6']);
        $user = User::where('email', $request->email)->first();
        $user->password = bcrypt($request->password);
        $user->update();
        return response()->json(['status' => 'success', 'message' => 'Password reset successful.']);
    }
    
    public function portfolio(Request $request)
    {
        $wallets = Wallet::where('user_id', $request->user()->id)->get();
    
        $data = [];
        
        foreach($wallets as $key=>$wallet) {
            $data[$key]['crypto_id'] = $wallet->crypto_id;
            $data[$key]['balance'] = $wallet->balance;
            $data[$key]['curr_code'] = $wallet->curr->code;
            $data[$key]['curr_name'] = $wallet->curr->curr_name;
            $data[$key]['rate'] = $wallet->curr->rate;
			$data[$key]['icon'] = $wallet->curr->icon;
            
        }
        
        return response()->json(['portfolio' => $data]);
    }
    
    public function totalUSD(Request $request)
    {
        $wallets = Wallet::where('user_id', $request->user()->id)->get();
        
        $total = 0;
        
        foreach($wallets as $key=>$wallet) {
            $total += $wallet->balance * $wallet->curr->rate;
        }
        
        return response()->json(['totalUSD' => $total]);
        
    }
    
    public function transactions(Request $request)
    {
        $search = request('search');

        $transaction = Transaction::where('user_id',$request->user()->id)
        // ->when($search,function($q) use($search){
        //     return $q->where('trnx',$search);
        // })
        ->with('currency')->latest()->paginate($request->per_page ? $request->per_page : 15);
        
        return response()->json(['transactions' => $transaction]);
    }
    
    public function blogDetails($id)
    {
        $blog = Blog::where('status', 1)->where('id', $id)->with('comments.commenter')->first();
        return response()->json(['blog' => $blog]);
    }
    
    public function blogs(Request $request)
    {
        $blogs = Blog::where('status', 1)->paginate();
        return response()->json(['blogs' => $blogs]);
    }

    // https://bitmall.live/offer-lists?type=sell /
    // https://bitmall.live/offer-lists?type=buy / 
    // https://bitmall.live/user/profile //
    // https://bitmall.live/user/change-password //
    // https://bitmall.live/user/verify/phone-number //
    // https://bitmall.live/user/two-step/authentication //
    // https://bitmall.live/user/support/tickets

    public function twoStepResendCode()
    {
        $code = randNum();
        $user = auth()->user();
        $user->two_fa_code = $code;
        $user->update();
        try {
          sendSMS($user->phone,'Your two step authentication OTP is : '.$code,Generalsetting::value('contact_no'));
          return response()->json(['status' => 'success', 'message' => 'OTP code is sent to your phone.']);

        } catch (Exception $ex) {
          return response()->json(['status' => 'error', 'message' => $ex->getMessage()], 500);
        }
    }

    public function twoStepVerify(Request $request)
    {
        if(!$request->code) {
          return response()->json(['status' => 'error', 'message' => 'Code is required'], 422);
        }
        $user = auth()->user();
        if($request->code != $user->two_fa_code){
            return response()->json(['status' => 'error', 'message' => 'Invalid OTP'], 422);
        }

        $user->two_fa = 0;
        $user->two_fa_status = 1;
        $user->two_fa_code = randNum();
        $user->save();
        
        return response()->json(['status' => 'success', 'message' => 'code verified'], 200);

    }

    public function changePass(Request $request)
    {
      if(!$request->old_password) {
        $errors[] = "Email is required";
      }
      
      if(!$request->password) {
          $errors[] = "Password is required";
      }
        $user = auth()->user();
        if (Hash::check($request->old_password, $user->password)) {
            $password = bcrypt($request->password);
            $user->password = $password;
            $user->save();
            return response()->json(['status' => 'success', 'message' => 'Password has been changed']);
        } else {
            return response()->json(['status' => 'error', 'message' => 'The old password doesn\'t match!'], 422);
        }
    }

    public function offerList(Request $request)
    {
        if($request->type != 'buy' && $request->type != 'sell') {
          return response()->json(['status' => 'error', 'message' => 'Invalid type' ]);
        }

        if($request->type == 'buy') $type = 'sell';
        else $type = 'buy';

    
        $offers = Offer::where('type',$type)
        ->when(request('crypto'),function($q){
            $crypto = Currency::where('code',request('crypto'))->first(['id']);
            return $q->where('cryp_id',$crypto->id);   
         })
        ->when(request('gateway'),function($q){
            $gateway = PaymentGateway::where('slug',request('gateway'))->first(['id']);
            return $q->where('gateway_id',$gateway->id);   
         })
        ->when(request('currency'),function($q){
            $curr = Currency::where('code',request('currency'))->first(['id']);
            return $q->where('fiat_id',$curr->id);   
         })
        ->when(request('amount'),function($q){
            return $q->where('minimum',request('amount'))->orWhere('maximum',request('amount'));   
         })
        ->where('status',1)->with(['gateway','crypto','fiat','duration','user'])
        ->latest()->paginate(15);

        $currencies     = Currency::where('type',2)->get();
        $paymentMethods = PaymentGateway::where('status',1)->get();

        
        return response()->json(['offers' => $offers, 'currencies' => $currencies, 'paymentMethods' => $paymentMethods]);
    }

    // https://bitmall.live/user/offers //
    // https://bitmall.live/user/create-offer // 
    // https://bitmall.live/user/trades //
    // https://bitmall.live/user/trade-requests //
    // https://bitmall.live/user/deposit
    // https://bitmall.live/user/deposit/histoty
    // https://bitmall.live/user/withdraw-wallets

    public function myOffers(Request $request)
    {
      $offers = Offer::where('user_id',auth()->id())->with(['gateway','crypto','fiat','duration'])->latest()->paginate(15);
      return response()->json(['offers' => $offers]);
    }

    public function createOffer(OfferValidation $request)
    {
        if(!kycOfferLimit()){
            return response()->json(['status' => 'error', 'message' => 'Please submit your KYC info to create further offer'], 422);
        }
        if(!offerLimit()){
            return response()->json(['status' => 'error', 'message' => 'Sorry!! You must complete more trade to create further offer'], 422);
        }

        $data = $request->except('_token');
        if($request->margin && $request->margin < 0){
            $data['margin']     = abs($request->margin);
            $data['neg_margin'] = 1;
        }
        $data['user_id']  = auth()->id();
        $data['offer_id'] = str_rand();
        Offer::create($data);
        return response()->json(['status' => 'success', 'message' => 'Offer has been created']);
    }

    public function myTrades(Request $request)
    {      
      $trades = Trade::where('trader_id', auth()->id())->with(['crypto','fiat','trader'])->latest()->paginate(15);
      return response()->json(['trades' => $trades]);
    }

    public function tradeRequests(Request $request)
    {      
      $trades = Trade::where('offer_user_id', auth()->id())->with(['crypto','fiat','trader'])->latest()->paginate(15);
      return response()->json(['trades' => $trades]);
    }

    public function saveComment(Request $request)    
    {
        try {
            $comment = new Comment;
            $comment->user_id = auth()->id();
            $comment->blog_id = $request->blog_id;
            $comment->comment = $request->comment;
            $comment->status = 1;
            $comment->save();
            
            return response()->json(['status' => 'success', 'message' => 'comment saved successfully']);
        } catch (Exception $ex) {
            return response()->json(['status' => 'server error'], 500);
        }
        
    }
    
    public function saveLike(Request $request)
    {
        try {
            $blog = Blog::where('id', $request->blog_id)->first();
            $blog->likes = $blog->likes +1;
            $blog->save();
            return response()->json(['status' => 'success', 'message' => 'liked successfully']);
            
        } catch(Exception $ex) {
            return response()->json(['status' => 'server error'], 500);
        }
    }
    
    public function openTicket(Request $request)
    {
        try {
						
            $request->validate(['subject'=>'required']);
            $user = auth()->user();
            $pref = 'user';
            $tkt = 'TKT'.randNum(8);
            SupportTicket::create([
                'user_id' => $user->id,
                'ticket_num' => $tkt,
                'subject'  => $request->subject,
            ]);
            
            return response()->json(['status' => 'success', 'ticket_no' => $tkt]);
        } catch(Exception $ex) {
            return response()->json(['status' => 'server error'], 500);
        }
    }
    
    public function myTickets(Request $request)
    {
        $user = auth()->user();
        $pref = 'user';
        $tickets = SupportTicket::where('user_id',$user->id)->latest()->paginate(15);
        
        return response()->json(['status' => 'success', 'tickets' => $tickets]);
    }
    
    public function getTicketMessage(Request $request, $ticketNo)
    {
        $messages = TicketMessage::where('ticket_num',$ticketNo)->where('user_id', auth()->user()->id)->get();
        return response()->json(['status' => 'success', 'messages' => $messages]);
    }
    
    public function storeTicketMessage(Request $request)
    {
        $request->validate(['message'=>'required_without:file','file'=>'mimes:pdf,jpeg,jpg,png,PNG,JPG']);
        $user = auth()->user();
        $ticket = SupportTicket::where('ticket_num',$request->ticket_no)->where('user_id',$user->id)
        ->firstOrFail();
        $message = new TicketMessage();
        $message->ticket_id = $ticket->id;
        $message->ticket_num = $ticket->ticket_num;
        $message->user_id = $user->id;
        $message->message = $request->message;
        if($request->file) $message->file = MediaHelper::handleMakeImage($request->file,null,true);
        $message->save();

        $ticket->status = 0;
        $ticket->save();
        
        return response()->json(['status' => 'success', 'message' => 'replied successfully']);
    }

    public function storeBlog(BlogRequest $request)
    {        
        $blogResource = new BlogResource;
        $request->merge(['status' => 2]); 
        $request->merge(['type' => 'user']);    
        $request->merge(['user_id' => auth()->user()->id]);
        $input = $request->only('title','category_id','description','photo','status', 'type', 'user_id');        
        $blogResource->store($input);
        return response()->json(['status' => 'success', 'message' => 'New blog has been created, and is in under review']);
    }

    public function getCategory()
    {
        $categories = BlogCategory::where('status', 1)->get();

        return response()->json(['categories' => $categories]);
    }

    public function bestSeller()
    {
        $users = User::where('best_seller', 1)->get();
        return response()->json(['users' => $users]);
    }

    public function countries()
    {
        $countries = Country::all();
        return response()->json(['countries' => $countries]);
    }
	
	public function currencies()
    {
        $currencies = Currency::where('type',2)->get();
        return response()->json(['currencies' => $currencies]);
    }
	
	public function gateways()
    {
        $gateways = PaymentGateway::where('status',1)->get();
		
		$data = [];
		
		foreach($gateways as $key => $gateway)
		{
			$gateway['fiats'] = $gateway->fiats();
			$data[$key] = $gateway;	
		}
        return response()->json(['gateways' => $data]);
    }
	
	public function createTrade(Request $request)
    {
        if (!kycTradeLimit()) {
           return response()->json(['status' => 'error', 'message' => 'Please submit your KYC info for further trade'], 422);
        }
        $data = $request->validate([
            'offer_id'       => 'required',
            'fiat_id'       => 'required',
            'crypto_id'       => 'required',
            'fiat_amount'    => 'required|gt:0',
            'crypto_amount'  => 'required|gt:0'
        ]);
		
		$checkOffer = Offer::where('status', 1)->where('user_id', auth()->user()->id)->where('id', $request->offer_id)->get();
		
		if(count($checkOffer)) {
			return response()->json(['status' => 'error', 'message' => 'User can not request on their own trade'], 422);
		}
		
        $offer = Offer::where('status', 1)->where('user_id', '!=', auth()->id())->where('id', $request->offer_id)->first();
        
		if(!$offer) {
			return response()->json(['status' => 'error', 'message' => 'Invalid offer'], 422);
		}
		
        $cryptoAmount = numFormat($request->fiat_amount / crypto_rate($offer),9);

        if($request->fiat_amount < $offer->minimum || $request->fiat_amount > $offer->maximum){            
			return response()->json(['status' => 'error', 'message' => 'Please follow the limit.'], 422);
        }

        if($offer->type == 'buy'){
            $data['trade_type'] = 'sell';
            $trade_fee = Generalsetting::value('trade_fee');
          
            $wallet = Wallet::where('user_id',auth()->user()->id)->where('crypto_id',$offer->cryp_id)->first();
          
            if(!$wallet){
                $wallet = Wallet::create([
                    'user_id' => auth()->id(),
                    'crypto_id' => $offer->cryp_id,
                    'balance'  => 0
                ]);
            } 
            if($wallet->balance < $cryptoAmount){
				return response()->json(['status' => 'error', 'message' => "Insufficient ".$offer->crypto->code." balance"], 422);             
            }

            $wallet->balance -= ($cryptoAmount + ($cryptoAmount * $trade_fee/100));
            $wallet->update();
            
        }
        elseif($offer->type == 'sell'){
            $data['trade_type'] = 'buy';
            $wallet = Wallet::where('user_id',$offer->user_id)->where('crypto_id',$offer->cryp_id)->first();
          
            if(!$wallet){
				return response()->json(['status' => 'error', 'message' => 'Something went wrong'], 422);                
            } 
            if($wallet->balance < $cryptoAmount){
				return response()->json(['status' => 'error', 'message' => 'Sorry! Insufficient seller fund'], 422);                
            }

            $wallet->balance -= $cryptoAmount;
            $wallet->update();

        }else{
            return response()->json(['status' => 'error', 'message' => 'Invalid Offer type'], 422);
        }

        $data['rate']           = crypto_rate($offer);
        $data['trade_fee']      = @$trade_fee ? ($cryptoAmount * $trade_fee/100) : 0;
        $data['crypto_amount']  = $cryptoAmount;
        $data['trade_code']     = str_rand();
        $data['trade_duration'] = $offer->trade_duration;
        $data['offer_user_id']  = $offer->user_id;
        $data['trader_id']      = auth()->user()->id;
        $rec = Trade::create($data);
        

        if($offer->user->device_token) {
            sendFirebaseNotification('Trade Request', "New trade request has received from ". auth()->user()->name, $offer->user->device_token, []);
        }
        
		return response()->json(['status' => 'success', 'message' => 'Trading has been started', 'trade' => $rec]);        
    }
	
	public function kyc(Request $request)
	{
		$data = $request->validate([
         'nid' => 'required',
         'description' => 'required',
         'nid_screenshot' => 'image|mimes:png,jpg,jpeg|max:5120',
       ],
       	$request->all());	
		
	   	$filename = MediaHelper::handleMakeImage(request("nid_screenshot"));
		
	   	$data = [];
	   	$data['image']['nid_screenshot'] = $filename;
	   	$data['details']['description_of_address'] = request("description");	
		$data['nid'] = request('nid');
		
	   	$user = auth()->user();
		$user->kyc_info = $data;
        $user->kyc_status = 2;        
        $user->save();
		
		return response()->json(['status' => 'success', 'message' => 'KYC data has been submitted for review.']); 
	}
	
  	public function getChat(Request $request, Trade $trade)
	{
		$messages = TradeChat::where('trade_id',$trade->id)->with(['user','trade'])->get();
		
		return response()->json(['chat' => $messages]);
	}
	
	public function tradeDetails($tradeCode)
    {
        $trade = Trade::whereTradeCode($tradeCode)->where(function ($q){
            $q->where('offer_user_id', auth()->id())->orWhere('trader_id', auth()->id());
        })->with(['offer','trader','offerOwner'])->firstOrFail();

        $messages = TradeChat::where('trade_id',$trade->id)->with(['user','trade'])->get();
                
        $trader = $trade->trader_id == auth()->id() ? true : false;
        $rated = Review::where('offer_id', $trade->id)->exists();
        $rated = $rated ? 1 : 0;
        
        $reviews = Review::where('offer_id', $trade->id)->with('reviewer')->get();		
		
        return response()->json(['trade' => $trade, 'trader' => $trader, 'rated' => $rated, 'review' => $reviews]);
    }
	
	public function submitChat(Request $request)
    {
        $data = $request->validate([
            'trade_id' => 'required',
            'message'  => 'required_without:file',
            'file'     => 'image|mimes:jpg,png,JPG,jpeg,PNG|max:2048'
        ]);
        $trade = Trade::findOrFail($request->trade_id);
        if($trade->status == 3 || $trade->status == 2){
            return response()->json(['status' => 'error', 'message' => 'Can not chat in a completed or canceled trade.'], 422);
        }
        $data['user_id'] = auth()->id();
        if($request->file){
            $data['file'] = MediaHelper::handleMakeImage($request->file);
        }
        TradeChat::create($data);
        
        $user = $trade->offer_user_id == auth()->user()->id ? $trade->trader : $trade->offerOwner;
        if($user->device_token) {
            sendFirebaseNotification('New message', "New message received from ". auth()->user()->name, $user->device_token, []);
        }
        return response()->json(['status' => 'success','message' => 'Message sent']);
    }
	
	public function tradeReview(Request $request)
    {
        $review = new Review;
        $review->user_id = $request->offer_user_id;
        $review->offer_id = $request->trade_id;
        $review->rating = $request->rating;
        $review->description = $request->comment;
        $review->reviewer_id = auth()->user()->id;
        
        $review->save();
  
        return response()->json(['status' => 'success', 'message' => 'Your review has been submitted Successfully,']);
    }    
	
	public function testt()
	{
		email([
          'email'   => 'xubayr.ali@gmail.com',
          'name'    => 'Jubair',
          'subject' => translate('Email Verification Code'),
          'message' => translate('Email Verification Code is : 123456'),
        ]);
		
		return response()->json(['status' => 'success']);
	}
}
