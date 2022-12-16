<div class="col-xl-6 col-xxl-5">
    <div class="font--sm">
        <div class="alert alert-danger d-flex align-items-center mb-4">
            <span class="flex-shrink-0 me-2 display-6">
                <i class="fas fa-info-circle"></i>
            </span>
            <div class="me-3">
                <?php echo translate('Remember to keep all conversations within the trade chat. Trading off escrow
                is against our policies and we won’t be able to assist you if
                something goes wrong outside of our system.'); ?>
            </div>   
        </div>
        <div class="create-offer-wrapper p-0">
            <div
                class="alert border-0 radius-0 border-bottom bg--body d-flex align-items-center mb-0">
                <span class="flex-shrink-0 me-3 display-6">
                    <i class="fas fa-tachometer-alt"></i>
                </span>
                <?php if($trade->status == 3): ?>
                <div class="me-3">
                    <h5 class="m-0"><?php echo translate('Trade has been completed'); ?></h5>
                </div>
                <?php elseif($trade->status == 3): ?>
                <div class="me-3">
                    <h5 class="m-0"><?php echo translate('Trade has been canceled'); ?></h5>
                </div>
                <?php elseif($trade->status == 4): ?>
                <div class="me-3">
                    <h5 class="m-0"><?php echo translate('Dispute is running.'); ?></h5>
                </div>
                <?php else: ?>
                <div class="me-3">
                    <?php if($trade->offer->type == 'sell'): ?>
                        <?php if($trade->trader_id == auth()->id()): ?>
                            <h5 class="m-0"><?php echo app('translator')->get('Please make the payment to get '.numFormat($trade->crypto_amount,8)); ?> <?php echo e($trade->crypto->code); ?></h5>
                            <span>
                                <?php echo e(numFormat($trade->crypto_amount,8)); ?> <?php echo e($trade->crypto->code); ?> <?php echo app('translator')->get("will be added to your ". $trade->crypto->code ." wallet"); ?>
                            </span>
                        <?php elseif($trade->offer_user_id == auth()->id()): ?>
                            <h5 class="m-0"><?php echo app('translator')->get('Please wait for the payment from '.$trade->offerOwner->name); ?> (<?php echo e(numFormat($trade->fiat_amount)); ?> <?php echo e($trade->fiat->code); ?>)</h5>
                            <span>
                                <?php echo e(numFormat($trade->crypto_amount,8)); ?> <?php echo e($trade->crypto->code); ?> <?php echo app('translator')->get("will be deducted from your ". $trade->crypto->code ." wallet"); ?>
                            </span>
                        <?php endif; ?>
                    <?php endif; ?>
                  
                  
                    <?php if($trade->offer->type == 'buy'): ?>
                        <?php if($trade->trader_id == auth()->id()): ?>
                            <h5 class="m-0"><?php echo app('translator')->get('Please wait for the payment from '.$trade->offerOwner->name); ?> (<?php echo e(numFormat($trade->fiat_amount)); ?> <?php echo e($trade->fiat->code); ?>)</h5>
                            <span>
                                <?php echo e(numFormat($trade->crypto_amount,8)); ?> <?php echo e($trade->crypto->code); ?> <?php echo app('translator')->get("will be deducted from your ". $trade->crypto->code ." wallet"); ?>
                            </span>
                        <?php elseif($trade->offer_user_id == auth()->id()): ?>
                            <h5 class="m-0"><?php echo app('translator')->get('Please make the payment to get '.numFormat($trade->crypto_amount,8)); ?> <?php echo e($trade->crypto->code); ?></h5>
                            <span>
                                <?php echo e(numFormat($trade->crypto_amount,8)); ?> <?php echo e($trade->crypto->code); ?> <?php echo app('translator')->get("will be added to your ". $trade->crypto->code ." wallet"); ?>
                            </span>
                        <?php endif; ?>
                    <?php endif; ?>

                </div>
                <?php endif; ?>
            </div>
            <div class="create-offer-body px-3 pb-3">
                <div class="alert border-0 px-0 mb-0 d-flex align-items-center">
                    <?php if($trade->offer->type == 'buy'): ?>
                      <?php if($trade->trader_id == auth()->id()): ?>
                        <div>
                            <div class="mb-3">
                                <?php echo translate('Once buyer made the payment, after confirmation be sure to click Release Now for transfer crypto to the buyer. If you didn\'t get payment chat with your buyer within the system.'); ?> 
                            </div>
                            <div class="w-100 d-flex flex-wrap">
                                <?php if($trade->status != 2 && $trade->status != 3 && $trade->status != 4): ?> 
                                <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#releaseModal" class="paid-btn flex-grow-1 m-1">
                                    <h5 class="subtitle"><i class="fas fa-exchange-alt"></i> <?php echo translate('Release now'); ?></h5>
                                    <div class="d-flex">
                                        <ul class="d-flex">
                                            <li>
                                                <?php echo app('translator')->get('Crypto will be release to buyer account.'); ?>
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                                <?php endif; ?>
                              
                                <a href="javascript:void(0)" class="paid-btn flex-grow-1 m-1">
                                    <h5 class="subtitle"><i class="fas fa-history"></i> <?php echo translate('Time Left'); ?></h5>
                                    <div class="d-flex">
                                        <ul class="countdown d-flex">
                                            <li>
                                                <span class="me-1" <?php if($trade->status != 2 && $trade->status != 3): ?> id="time" <?php endif; ?>>0m 0s</span> <span><?php echo translate('minutes'); ?></span>
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                               
                            </div>
                        </div>
                      <?php elseif($trade->offer_user_id == auth()->id()): ?>
                        <div>
                            <div class="mb-3">
                                <?php echo translate('Once you’ve made the payment, be sure to click Paid within the given time limit. Otherwise the trade will be automatically canceled and the Bitcoin will be returned to the seller’s wallet.'); ?> 
                            </div>
                            <div class="w-100 d-flex flex-wrap">
                                <?php if($trade->status != 2 && $trade->status != 3 && $trade->status != 4): ?> 
                                <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#paidModal" class="paid-btn flex-grow-1 m-1">
                                    <h5 class="subtitle"><i class="fas fa-check-circle"></i> <?php echo translate('Paid'); ?></h5>
                                    <div class="d-flex">
                                        <ul class="d-flex">
                                            <li>
                                                <?php echo app('translator')->get('Make payment through : '.@$trade->offer->gateway->name); ?>
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                                <?php endif; ?>
                              
                                <a href="javascript:void(0)" class="paid-btn flex-grow-1 m-1">
                                    <h5 class="subtitle"><i class="fas fa-history"></i> <?php echo translate('Time Left'); ?></h5>
                                    <div class="d-flex">
                                        <ul class="countdown d-flex">
                                            <li>
                                                <span class="me-1" <?php if($trade->status != 2 && $trade->status != 3): ?> id="time" <?php endif; ?>>0m 0s</span> <span><?php echo translate('minutes'); ?></span>
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                              
                            </div>
                        </div>
                      <?php endif; ?>
                    <?php elseif($trade->offer->type == 'sell'): ?>
                       <?php if($trade->trader_id == auth()->id()): ?>
                        <div>
                            <div class="mb-3">
                                <?php echo translate('Once you’ve made the payment, be sure to click Paid within the given time limit. Otherwise the trade will be automatically canceled and the Bitcoin will be returned to the seller’s wallet.'); ?> 
                            </div>
                            <div class="w-100 d-flex flex-wrap">
                                <?php if($trade->status != 2 && $trade->status != 3 && $trade->status != 1 && $trade->status != 4): ?> 
                                <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#paidModal" class="paid-btn flex-grow-1 m-1">
                                    <h5 class="subtitle"><i class="fas fa-check-circle"></i> <?php echo translate('Paid'); ?></h5>
                                    <div class="d-flex">
                                        <ul class="d-flex">
                                            <li>
                                                <?php echo app('translator')->get('Make payment through : '.@$trade->offer->gateway->name); ?>
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                                <?php endif; ?>
                              
                                <a href="javascript:void(0)" class="paid-btn flex-grow-1 m-1">
                                    <h5 class="subtitle"><i class="fas fa-history"></i> <?php echo translate('Time Left'); ?></h5>
                                    <div class="d-flex">
                                        <ul class="countdown d-flex">
                                            <li>
                                                <span class="me-1" <?php if($trade->status != 2 && $trade->status != 3): ?> id="time" <?php endif; ?>>0m 0s</span> <span><?php echo translate('minutes'); ?></span>
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                           
                            </div>
                        </div>
                       <?php elseif($trade->offer_user_id == auth()->id()): ?>
                        <div>
                            <div class="mb-3">
                                <?php echo translate('Once buyer made the payment, after confirmation be sure to click Release Now for transfer crypto to the buyer. If you didn\'t get payment chat with your buyer within the system.'); ?> 
                            </div>
                            <div class="w-100 d-flex flex-wrap">
                                <?php if($trade->status != 2 && $trade->status != 3 && $trade->status != 4): ?> 
                                <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#releaseModal" class="paid-btn flex-grow-1 m-1">
                                    <h5 class="subtitle"><i class="fas fa-exchange-alt"></i> <?php echo translate('Release now'); ?></h5>
                                    <div class="d-flex">
                                        <ul class="d-flex">
                                            <li>
                                                <?php echo app('translator')->get('Crypto will be release to buyer account.'); ?>
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                                <?php endif; ?>
                        
                                <a href="javascript:void(0)" class="paid-btn flex-grow-1 m-1">
                                    <h5 class="subtitle"><i class="fas fa-history"></i> <?php echo translate('Time Left'); ?></h5>
                                    <div class="d-flex">
                                        <ul class="countdown d-flex">
                                            <li>
                                                <span class="me-1" <?php if($trade->status != 2 && $trade->status != 3): ?> id="time" <?php endif; ?>>0m 0s</span> <span><?php echo translate('minutes'); ?></span>
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                           
                            </div>
                        </div>
                       <?php endif; ?>
                    <?php endif; ?>
                    
                </div>
                <div class="alert alert-warning d-flex align-items-center mb-4">
                    <span class="flex-shrink-0 me-3 display-6">
                        <i class="fas fa-info"></i>
                    </span>
                    <div class="me-3">
                        <?php echo translate('Keep trades within the system. Some users may ask you to trade outside the our platform. This is against our Terms of Service and likely a scam attempt. You must insist on keeping all trade conversations within our platform. If you choose to proceed outside this platform, note that we cannot help or support you if you are scammed during such trades.'); ?>
                    </div>
                   
                </div>
               
                    <?php if($trade->offer->type == 'sell'): ?>
                        <?php if($trade->trader_id == auth()->id()): ?>
                            <?php if($trade->status != 2 && $trade->status != 3  && $trade->status != 4): ?> 
                            <div class="d-flex justify-content-end">
                                <a href="#0" class="btn btn--danger cancel"><?php echo translate('Cancel Trade'); ?></a>
                            </div>
                            <?php endif; ?>
                        <?php elseif($trade->offer_user_id == auth()->id()): ?>
                          <?php if($trade->status != 2 && $trade->status != 3  && $trade->status != 4): ?> 
                            <div class="d-flex justify-content-end trader">
                                
                            </div>
                          <?php endif; ?>
                        <?php endif; ?>
                    <?php endif; ?>

                    <?php if($trade->offer->type == 'buy'): ?>
                       <?php if($trade->trader_id == auth()->id()): ?>
                         <?php if($trade->status != 2 && $trade->status != 3  && $trade->status != 4): ?> 
                            <div class="d-flex justify-content-end trader">
                            
                            </div>
                          <?php endif; ?>
                        <?php elseif($trade->offer_user_id == auth()->id()): ?>
                          <?php if($trade->status != 2 && $trade->status != 3  && $trade->status != 4): ?> 
                            <div class="d-flex justify-content-end">
                                <a href="#0" class="btn btn--danger cancel"><?php echo translate('Cancel Trade'); ?></a>
                            </div>
                          <?php endif; ?>
                        <?php endif; ?>
                    <?php endif; ?>

                
            </div>
        </div>
    </div>
</div><?php /**PATH /var/www/vhosts/orkt.one/httpdocs/admin/project/resources/views/user/trade/tradebar.blade.php ENDPATH**/ ?>