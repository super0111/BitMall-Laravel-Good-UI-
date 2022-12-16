<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ApiController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::get('/testt', [ApiController::class, 'testt']);
Route::post('/signup', [ApiController::class, 'register']);
Route::post('/login', [ApiController::class, 'login']);
Route::post('/verify/code', [ApiController::class, 'verifyCodeSubmit']);
Route::post('/send-verification/code', [ApiController::class, 'resendCode']);
Route::get('/blogs', [ApiController::class, 'blogs']);
Route::get('/blog-details/{id}', [ApiController::class, 'blogDetails']);
Route::get('/offer-list', [ApiController::class, 'offerList']);
Route::get('/countries', [ApiController::class, 'countries']);
Route::post('/forget-password', [ApiController::class, 'forgetPassword']);
Route::post('/update-password', [ApiController::class, 'updatePassword']);

Route::get('/test', function() {
    return response()->json(["name" => "zubair"]); 
});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::middleware('auth:sanctum')->group(function() {
    
    Route::get('/portfolio', [ApiController::class, 'portfolio']);
    Route::get('/user/total', [ApiController::class, 'totalUSD']);
    Route::get('/transaction/history', [ApiController::class, 'transactions']);
    Route::post('/change-password', [ApiController::class, 'changePass']);
    Route::post('/two-step/send-verification/code', [ApiController::class, 'twoStepResendCode']);
    Route::post('/two-step/verify/code', [ApiController::class, 'twoStepVerify']);
    
    Route::get('/my-offers', [ApiController::class, 'myOffers']);
    Route::get('/my-trades', [ApiController::class, 'myTrades']);
    Route::get('/trade-requests', [ApiController::class, 'tradeRequests']);
	Route::post('/create-trade-request', [ApiController::class, 'createTrade']);
    Route::post('/create-offer', [ApiController::class, 'createOffer']);
    Route::post('/comment', [ApiController::class, 'saveComment']);
    Route::post('/like', [ApiController::class, 'saveLike']);
    Route::post('/open/ticket', [ApiController::class, 'openTicket']);
    Route::get('/my/tickets', [ApiController::class, 'myTickets']);
    Route::get('/ticket/messages/{ticketNo}', [ApiController::class, 'getTicketMessage']);
    Route::post('/ticket/message', [ApiController::class, 'storeTicketMessage']);
    Route::get('/get/categories', [ApiController::class, 'getCategory']);
    Route::post('/create/blog', [ApiController::class, 'storeBlog']);
    Route::get('/best-sellers', [ApiController::class, 'bestSeller']);
	Route::get('/currencies', [ApiController::class, 'currencies']);
	Route::get('/gateways', [ApiController::class, 'gateways']);
	Route::post('/kyc', [ApiController::class, 'kyc']);
	Route::post('/trade/submit-chat', [ApiController::class, 'submitChat']);
	Route::post('/trade/submit-review', [ApiController::class, 'tradeReview']);
	Route::get('/trade-details/{code}', [ApiController::class, 'tradeDetails']);
	Route::get('/trade/{trade}/chat', [ApiController::class, 'getChat']);

});
