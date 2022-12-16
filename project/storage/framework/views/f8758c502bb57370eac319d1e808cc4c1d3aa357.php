<?php $__env->startSection('title'); ?>
   <?php echo translate('Reset Password'); ?>
<?php $__env->stopSection(); ?>

<?php
$login = App\Models\SiteContent::where('slug','login')->first();
?>

<?php $__env->startSection('content'); ?>

<section class="accounts-section">
    <div class="accounts-inner">
        <div class="accounts-inner__wrapper bg--section">
            <div class="accounts-left">
                <div class="accounts-left-content">
                    <a href="<?php echo e(url('/')); ?>" class="top--icon">
                        <i class="fas fa-bolt"></i>
                    </a>
                    <div class="section-header">
                        <h6 class="section-header__subtitle"></h6>
                        <h3 class="section-header__title"><?php echo translate('Forgot Password'); ?></h3>
                        <p>
                            <?php echo translate('Enter your email address and a verification code will be sent to your email.'); ?>
                        </p>
                    </div>
                    <form class="row gy-4" action="" method="post">
                        <?php echo csrf_field(); ?>
                        <div class="col-sm-12 form-group">
                            <label class="form--label" for="email"><?php echo translate('Email'); ?></label>
                            <input type="email" name="email" class="form-control" id="email" placeholder="<?php echo translate('Email Address'); ?>" value="<?php echo e(old('email')); ?>" required>
                        </div>
                        <div class="col-sm-12">
                            <button type="submit" class="cmn--btn"><?php echo translate('Send verification code'); ?></button>
                        </div>
                      
                    </form>
                </div>
            </div>
            <div class="accounts-right bg--blue">
                <img src="<?php echo e(getPhoto($login->content->image)); ?>" alt="images">
                <div class="section-header text-center text-white mb-0">
                    <h6 class="section-header__subtitle"></h6>
                    <h3 class="section-header__title"><?php echo translate('Forgot Password ?'); ?></h3>
                    <p>
                        <?php echo translate('Put your email which you have used to register your account.'); ?>
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.auth', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/vhosts/orkt.one/httpdocs/admin/project/resources/views/user/auth/forgot_password.blade.php ENDPATH**/ ?>