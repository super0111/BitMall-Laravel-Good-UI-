<div class="col-xl-6 col-xxl-5">
    <div class="font--sm">
        <div class="alert alert-danger d-flex align-items-center mb-4">
            <span class="flex-shrink-0 me-2 display-6">
                <i class="fas fa-info-circle"></i>
            </span>
            <div class="me-3">
                @langg('Remember to keep all conversations within the trade chat. Trading off escrow
                is against our policies and we won’t be able to assist you if
                something goes wrong outside of our system.')
            </div>   
        </div>
        <div class="create-offer-wrapper p-0">
            <div
                class="alert border-0 radius-0 border-bottom bg--body d-flex align-items-center mb-0">
                <span class="flex-shrink-0 me-3 display-6">
                    <i class="fas fa-tachometer-alt"></i>
                </span>
                @if ($trade->status == 3)
                <div class="me-3">
                    <h5 class="m-0">@langg('Trade has been completed')</h5>
                </div>
                @elseif ($trade->status == 3)
                <div class="me-3">
                    <h5 class="m-0">@langg('Trade has been canceled')</h5>
                </div>
                @elseif ($trade->status == 4)
                <div class="me-3">
                    <h5 class="m-0">@langg('Dispute is running.')</h5>
                </div>
                @else
                <div class="me-3">
                    @if ($trade->offer->type == 'sell')
                        @if ($trade->trader_id == auth()->id())
                            <h5 class="m-0">@lang('Please make the payment to get '.numFormat($trade->crypto_amount,8)) {{$trade->crypto->code}}</h5>
                            <span>
                                {{numFormat($trade->crypto_amount,8)}} {{$trade->crypto->code}} @lang("will be added to your ". $trade->crypto->code ." wallet")
                            </span>
                        @elseif($trade->offer_user_id == auth()->id())
                            <h5 class="m-0">@lang('Please wait for the payment from '.$trade->offerOwner->name) ({{numFormat($trade->fiat_amount)}} {{$trade->fiat->code}})</h5>
                            <span>
                                {{numFormat($trade->crypto_amount,8)}} {{$trade->crypto->code}} @lang("will be deducted from your ". $trade->crypto->code ." wallet")
                            </span>
                        @endif
                    @endif
                  
                  
                    @if ($trade->offer->type == 'buy')
                        @if ($trade->trader_id == auth()->id())
                            <h5 class="m-0">@lang('Please wait for the payment from '.$trade->offerOwner->name) ({{numFormat($trade->fiat_amount)}} {{$trade->fiat->code}})</h5>
                            <span>
                                {{numFormat($trade->crypto_amount,8)}} {{$trade->crypto->code}} @lang("will be deducted from your ". $trade->crypto->code ." wallet")
                            </span>
                        @elseif($trade->offer_user_id == auth()->id())
                            <h5 class="m-0">@lang('Please make the payment to get '.numFormat($trade->crypto_amount,8)) {{$trade->crypto->code}}</h5>
                            <span>
                                {{numFormat($trade->crypto_amount,8)}} {{$trade->crypto->code}} @lang("will be added to your ". $trade->crypto->code ." wallet")
                            </span>
                        @endif
                    @endif

                </div>
                @endif
            </div>
            <div class="create-offer-body px-3 pb-3">
                <div class="alert border-0 px-0 mb-0 d-flex align-items-center">
                    @if ($trade->offer->type == 'buy')
                      @if ($trade->trader_id == auth()->id())
                        <div>
                            <div class="mb-3">
                                @langg('Once buyer made the payment, after confirmation be sure to click Release Now for transfer crypto to the buyer. If you didn\'t get payment chat with your buyer within the system.') 
                            </div>
                            <div class="w-100 d-flex flex-wrap">
                                @if($trade->status != 2 && $trade->status != 3 && $trade->status != 4) 
                                <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#releaseModal" class="paid-btn flex-grow-1 m-1">
                                    <h5 class="subtitle"><i class="fas fa-exchange-alt"></i> @langg('Release now')</h5>
                                    <div class="d-flex">
                                        <ul class="d-flex">
                                            <li>
                                                @lang('Crypto will be release to buyer account.')
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                                @endif
                              
                                <a href="javascript:void(0)" class="paid-btn flex-grow-1 m-1">
                                    <h5 class="subtitle"><i class="fas fa-history"></i> @langg('Time Left')</h5>
                                    <div class="d-flex">
                                        <ul class="countdown d-flex">
                                            <li>
                                                <span class="me-1" @if($trade->status != 2 && $trade->status != 3) id="time" @endif>0m 0s</span> <span>@langg('minutes')</span>
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                               
                            </div>
                        </div>
                      @elseif($trade->offer_user_id == auth()->id())
                        <div>
                            <div class="mb-3">
                                @langg('Once you’ve made the payment, be sure to click Paid within the given time limit. Otherwise the trade will be automatically canceled and the Bitcoin will be returned to the seller’s wallet.') 
                            </div>
                            <div class="w-100 d-flex flex-wrap">
                                @if($trade->status != 2 && $trade->status != 3 && $trade->status != 4) 
                                <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#paidModal" class="paid-btn flex-grow-1 m-1">
                                    <h5 class="subtitle"><i class="fas fa-check-circle"></i> @langg('Paid')</h5>
                                    <div class="d-flex">
                                        <ul class="d-flex">
                                            <li>
                                                @lang('Make payment through : '.@$trade->offer->gateway->name)
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                                @endif
                              
                                <a href="javascript:void(0)" class="paid-btn flex-grow-1 m-1">
                                    <h5 class="subtitle"><i class="fas fa-history"></i> @langg('Time Left')</h5>
                                    <div class="d-flex">
                                        <ul class="countdown d-flex">
                                            <li>
                                                <span class="me-1" @if($trade->status != 2 && $trade->status != 3) id="time" @endif>0m 0s</span> <span>@langg('minutes')</span>
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                              
                            </div>
                        </div>
                      @endif
                    @elseif($trade->offer->type == 'sell')
                       @if ($trade->trader_id == auth()->id())
                        <div>
                            <div class="mb-3">
                                @langg('Once you’ve made the payment, be sure to click Paid within the given time limit. Otherwise the trade will be automatically canceled and the Bitcoin will be returned to the seller’s wallet.') 
                            </div>
                            <div class="w-100 d-flex flex-wrap">
                                @if($trade->status != 2 && $trade->status != 3 && $trade->status != 1 && $trade->status != 4) 
                                <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#paidModal" class="paid-btn flex-grow-1 m-1">
                                    <h5 class="subtitle"><i class="fas fa-check-circle"></i> @langg('Paid')</h5>
                                    <div class="d-flex">
                                        <ul class="d-flex">
                                            <li>
                                                @lang('Make payment through : '.@$trade->offer->gateway->name)
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                                @endif
                              
                                <a href="javascript:void(0)" class="paid-btn flex-grow-1 m-1">
                                    <h5 class="subtitle"><i class="fas fa-history"></i> @langg('Time Left')</h5>
                                    <div class="d-flex">
                                        <ul class="countdown d-flex">
                                            <li>
                                                <span class="me-1" @if($trade->status != 2 && $trade->status != 3) id="time" @endif>0m 0s</span> <span>@langg('minutes')</span>
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                           
                            </div>
                        </div>
                       @elseif($trade->offer_user_id == auth()->id())
                        <div>
                            <div class="mb-3">
                                @langg('Once buyer made the payment, after confirmation be sure to click Release Now for transfer crypto to the buyer. If you didn\'t get payment chat with your buyer within the system.') 
                            </div>
                            <div class="w-100 d-flex flex-wrap">
                                @if($trade->status != 2 && $trade->status != 3 && $trade->status != 4) 
                                <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#releaseModal" class="paid-btn flex-grow-1 m-1">
                                    <h5 class="subtitle"><i class="fas fa-exchange-alt"></i> @langg('Release now')</h5>
                                    <div class="d-flex">
                                        <ul class="d-flex">
                                            <li>
                                                @lang('Crypto will be release to buyer account.')
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                                @endif
                        
                                <a href="javascript:void(0)" class="paid-btn flex-grow-1 m-1">
                                    <h5 class="subtitle"><i class="fas fa-history"></i> @langg('Time Left')</h5>
                                    <div class="d-flex">
                                        <ul class="countdown d-flex">
                                            <li>
                                                <span class="me-1" @if($trade->status != 2 && $trade->status != 3) id="time" @endif>0m 0s</span> <span>@langg('minutes')</span>
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                           
                            </div>
                        </div>
                       @endif
                    @endif
                    
                </div>
                <div class="alert alert-warning d-flex align-items-center mb-4">
                    <span class="flex-shrink-0 me-3 display-6">
                        <i class="fas fa-info"></i>
                    </span>
                    <div class="me-3">
                        @langg('Keep trades within the system. Some users may ask you to trade outside the our platform. This is against our Terms of Service and likely a scam attempt. You must insist on keeping all trade conversations within our platform. If you choose to proceed outside this platform, note that we cannot help or support you if you are scammed during such trades.')
                    </div>
                   
                </div>
               
                    @if ($trade->offer->type == 'sell')
                        @if ($trade->trader_id == auth()->id())
                            @if($trade->status != 2 && $trade->status != 3  && $trade->status != 4) 
                            <div class="d-flex justify-content-end">
                                <a href="#0" class="btn btn--danger cancel">@langg('Cancel Trade')</a>
                            </div>
                            @endif
                        @elseif($trade->offer_user_id == auth()->id())
                          @if($trade->status != 2 && $trade->status != 3  && $trade->status != 4) 
                            <div class="d-flex justify-content-end trader">
                                
                            </div>
                          @endif
                        @endif
                    @endif

                    @if ($trade->offer->type == 'buy')
                       @if ($trade->trader_id == auth()->id())
                         @if($trade->status != 2 && $trade->status != 3  && $trade->status != 4) 
                            <div class="d-flex justify-content-end trader">
                            
                            </div>
                          @endif
                        @elseif($trade->offer_user_id == auth()->id())
                          @if($trade->status != 2 && $trade->status != 3  && $trade->status != 4) 
                            <div class="d-flex justify-content-end">
                                <a href="#0" class="btn btn--danger cancel">@langg('Cancel Trade')</a>
                            </div>
                          @endif
                        @endif
                    @endif

                
            </div>
        </div>
    </div>
</div>