

<?php $__env->startSection('title'); ?>
   <?php echo translate('Two Step Authentication'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
   
<div class="card card-primary logincard default--card">
    <div class="card-header">
    <h4> <?php echo translate('Two Step Verification'); ?></h4>
    </div>
    
    <div class="card-body">
    <form action="" method="POST">
        <?php echo csrf_field(); ?>
        <div class="form-group">
            <h4><?php echo translate('Please check your email/phone number to get OTP code'); ?></h4>
        </div>
        <div class="form-group mb-2">
            <label class="mb-1"><?php echo translate('OTP Code'); ?></label>
            <input class="form-control" type="text" name="code" required>
        </div>
        <div class="form-group d-flex justify-content-between">
            <a href="<?php echo e(route('user.two.step.resend')); ?>" class="text-left"><?php echo translate('Didn\'t get code? Resend.'); ?></a>
            <button type="submit" class="btn btn-primary"><?php echo translate('Submit'); ?></button>
        </div>
    </form>
    </div>
</div>
   


<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.auth', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/vhosts/orkt.one/httpdocs/admin/project/resources/views/user/twostep/otp_code.blade.php ENDPATH**/ ?>