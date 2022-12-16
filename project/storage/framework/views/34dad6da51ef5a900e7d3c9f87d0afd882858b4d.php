

<?php $__env->startSection('title'); ?>
    <?php echo translate('Withdraw'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="dashboard--content-item">
    <div class="row gy-5">
        <div class="col-lg-5 col-xxl-4">
            <div class="sticky-deposit">
                <div class="dashboard-card">
                    <div class="dashboard-card__header">
                        <div class="dashboard-card__header__icon">
                            <img src="<?php echo e(getPhoto($curr->icon)); ?>" alt="wallet">
                        </div>
                        <div class="dashboard-card__header__cont">
                            <h6 class="name"><?php echo translate('Current Balance'); ?></h6>
                            <div class="balance"><?php echo e(numFormat($wallet->balance,8)); ?> <?php echo e($curr->code); ?></div>
                        </div>
                    </div>
                </div>
                <div class="dashboard-card">
                    <div class="dashboard-card__header">
                        <div class="dashboard-card__header__icon">
                            <img src="<?php echo e(getPhoto('discount.png')); ?>" alt="payment">
                        </div>
                        <div class="dashboard-card__header__cont">
                            <h6 class="name text--danger"><?php echo translate('Withdraw Charge'); ?></h6>
                            <div class="balance"><?php echo e($curr->charges->withdraw_charge); ?>%</div>
                        </div>
                    </div>
                </div>
                <div class="dashboard-card">
                    <div class="dashboard-card__header">
                        <div class="dashboard-card__header__icon">
                            <img src="<?php echo e(getPhoto('limit.png')); ?>" alt="payment">
                        </div>
                        <div class="dashboard-card__header__cont">
                            <h6 class="name text--primary"><?php echo translate('Withdraw Limit'); ?></h6>
                            <div class="balance"><?php echo translate('min : '); ?> <?php echo e($curr->charges->withdraw_limit_min); ?> - <?php echo translate('max : '); ?> <?php echo e($curr->charges->withdraw_limit_max); ?> <?php echo e($curr->code); ?></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-7 col-xxl-8">
            <div class="dashboard--content-item">
                <div class="create-offer-wrapper py-lg-5">
                    <div class="create-offer-body py-2">
                        <form class="create-offer-form" method="POST" action="<?php echo e(route('user.withdraw.submit')); ?>">
                            <?php echo csrf_field(); ?>
                            <h5 class="text--base mb-3 mt-0"><?php echo translate('Withdraw'); ?> <?php echo e($curr->curr_name); ?>

                            </h5>
                            <div class="row gy-3">
                                <div class="col-sm-6">
                                    <label for="wallet-address" class="form-label text--primary"><?php echo e($curr->curr_name); ?> <?php echo translate('Wallet
                                        Address'); ?></label>
                                        <input type="text" name="wallet_address" class="form-control form--control bg--section" id="wallet-address" value="<?php echo e(old('wallet_address')); ?>" required>
                                </div>
                                <div class="col-sm-6">
                                    <label for="withdraw-amount" class="form-label text--primary"><?php echo translate('Withdraw
                                        Amount'); ?></label>
                                    <input type="text" name="amount" class="form-control form--control bg--section"
                                        id="withdraw-amount" required value="<?php echo e(old('amount')); ?>">
                                </div>
                                <input type="hidden" name="currency_id" value="<?php echo e($curr->id); ?>" required>
                                <input type="hidden" name="wallet_id" value="<?php echo e($wallet->id); ?>" required>
                                <div class="col-sm-12">
                                    <button type="submit" class="cmn--btn rounded w-100">
                                        <?php echo translate('Submit'); ?> </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.user', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/vhosts/orkt.one/httpdocs/admin/project/resources/views/user/withdraw/withdraw_form.blade.php ENDPATH**/ ?>