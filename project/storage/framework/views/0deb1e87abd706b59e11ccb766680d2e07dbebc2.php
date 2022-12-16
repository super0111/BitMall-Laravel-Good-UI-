

<?php $__env->startSection('title'); ?>
   <?php echo translate('Add New Currency'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
 <section class="section">
    <div class="section-header d-flex justify-content-between">
        <h1><?php echo translate('Add New Currency'); ?></h1>
        <a href="<?php echo e(route('admin.currency.index')); ?>" class="btn btn-primary btn-sm"><i class="fas fa-backward"></i> <?php echo translate('Back'); ?></a>
    </div>
</section>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="row justify-content-center">

    <div class="col-md-8">
       <div class="card">
            <div class="card-body">
                <?php echo $__env->make('admin.partials.form-both', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                <form action="" method="post" enctype="multipart/form-data">
                    <?php echo csrf_field(); ?>
                    <div class="row">
                        <div class="col-md-12 mb-2">
                            <div class="form-group">
                                <label class="col-form-label"><?php echo translate('Currency Icon'); ?></label>
                                <div id="image-preview" class="image-preview"
                                    style="background-image:url('/');">
                                    <label for="image-upload" id="image-label"><?php echo translate('Choose File'); ?></label>
                                    <input type="file" name="icon" id="image-upload" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label><?php echo translate('Currency Name'); ?></label>
                            <input class="form-control" type="text" name="curr_name" required value="<?php echo e(old('curr_name')); ?>">
                        </div>
                        <div class="form-group col-md-6">
                            <label><?php echo translate('Currency Code'); ?></label>
                            <input class="form-control code" type="text" name="code" required value="<?php echo e(old('code')); ?>">
                        </div>
                        <div class="form-group col-md-6">
                            <label><?php echo translate('Currency Symbol'); ?></label>
                            <input class="form-control" type="text" name="symbol"  required value="<?php echo e(old('symbol')); ?>">
                        </div>
                        <div class="form-group col-md-6">
                            <label><?php echo translate('Currency Type'); ?></label>
                            <select class="form-control type" name="type" required>
                                <option value="" selected>--<?php echo translate('Select Type'); ?>--</option>
                                <option value="1"><?php echo translate('FIAT'); ?></option>
                                <option value="2"><?php echo translate('CRYPTO'); ?></option>
                            </select>
                        </div>
              
                        <div class="form-group col-md-6">
                            <label><?php echo translate('Currency Rate'); ?></label>
                            <div class="input-group has_append">
                                <div class="input-group-prepend">
                                    <div class="input-group-text cur_code">1 <?php echo e($gs->curr_code); ?> = </div>
                                </div>
                                <input type="text" class="form-control" placeholder="0" name="rate" value="<?php echo e(old('rate')); ?>"/>
                                <div class="input-group-append">
                                    <div class="input-group-text curr_text"></div>
                                </div>
                            </div>
                        </div>
                       
                        <div class="form-group col-md-6">
                            <label><?php echo translate('Set As Default'); ?> </label>
                            <select class="form-control default" name="default" required>
                                <option value="" selected>--<?php echo translate('Select'); ?>--</option>
                                <option value="1"><?php echo translate('Yes'); ?></option>
                                <option value="0"><?php echo translate('No'); ?></option>
                            </select>
                        </div>

                       
                        <div class="form-group col-md-12">
                            <label><?php echo translate('Status'); ?> </label>
                            <select class="form-control" name="status" required>
                                <option value="" selected>--<?php echo translate('Select'); ?>--</option>
                                <option value="1"><?php echo translate('Active'); ?></option>
                                <option value="0"><?php echo translate('Inactive'); ?></option>
                            </select>
                        </div>
                    </div>

                    <div class="row payments">

                    </div>
                    
                    <div class="form-group text-right col-md-12">
                        <button class="btn  btn-primary btn-lg" type="submit"><?php echo translate('Submit'); ?></button>
                    </div>
                </form>
            </div>
       </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('script'); ?>
    <script>
        'use strict';
        $('.type').on('change',function () { 
            var value = $(this).find('option:selected').val()
            if($('.code').val() == ''){
                toast('error','<?php echo translate('Please put the currency code first.'); ?>')
                return false;
            }
            if(value == 2){
                $('.default').attr('disabled',true)
                $('.cur_code').text('1 '+ $('.code').val()+' =')
                $('.curr_text').text('<?php echo e($gs->curr_code); ?>')

                var html = `
                           
                            <div class="input-group mb-3 col-xl-6">
                                <label class="form-control-label"><?php echo translate('Deposit Charge'); ?></label>

                                <div class="input-group has_append">
                                    <input class="form-control" type="number" name="deposit_charge" placeholder="0" required>
                                    <div class="input-group-append">
                                        <div class="input-group-text"><span>%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="input-group mb-3 col-xl-6">
                                <label class="form-control-label"><?php echo translate('Withdraw Charge'); ?> </label>

                                <div class="input-group has_append">
                                    <input class="form-control" type="number" name="withdraw_charge" placeholder="0" required>
                                    <div class="input-group-append">
                                        <div class="input-group-text"><span>%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="input-group mb-3 col-xl-6">
                                <label class="form-control-label"><?php echo app('translator')->get('Minimum Withdraw Limit'); ?></label>
                                <div class="input-group has_append">
                                    <input class="form-control" type="number" name="withdraw_limit_min" placeholder="0" required>
                                    <div class="input-group-append">
                                        <div class="input-group-text"><span>${$('.code').val()}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="input-group mb-3 col-xl-6">
                                <label class="form-control-label"><?php echo translate('Maximum Withdraw Limit'); ?></label>
                                <div class="input-group has_append">
                                    <input class="form-control" type="number" name="withdraw_limit_max" placeholder="0" required>
                                    <div class="input-group-append">
                                        <div class="input-group-text"><span>${$('.code').val()}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                       `
                $('.payments').html(html)
            } 
            if(value == 1){
                $('.default').attr('disabled',false)
                $('.cur_code').text('1 <?php echo e($gs->curr_code); ?> =')
                $('.curr_text').text($('.code').val())
                $('.payments').children().remove()
            }
        })
        $('.code').on('keyup',function () { 
            var type = $('.type').find('option:selected').val()
            var value = $(this).val()
            if(type == 1){
                $('.curr_text').text(value)
            }else{
                $('.cur_code').text('1 '+ $('.code').val()+' =')
            }
        })

        $.uploadPreview({
                input_field: "#image-upload", // Default: .image-upload
                preview_box: "#image-preview", // Default: .image-preview
                label_field: "#image-label", // Default: .image-label
                label_default: "<?php echo e(translate('Choose File')); ?>", // Default: Choose File
                label_selected: "<?php echo e(translate('Update Image')); ?>", // Default: Change File
                no_label: false, // Default: false
                success_callback: null // Default: null
            });
    </script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/vhosts/orkt.one/httpdocs/admin/project/resources/views/admin/currency/create.blade.php ENDPATH**/ ?>