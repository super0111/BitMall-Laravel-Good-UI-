

<?php $__env->startSection('title'); ?>
   <?php echo translate('Manage Roles'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
 <section class="section">
    <div class="section-header justify-content-between">
        <h1><?php echo translate('Manage Roles'); ?></h1>
        <a href="<?php echo e(route('admin.role.create')); ?>" class="btn btn-primary"><i class="fas fa-plus"></i> <?php echo translate('Add New Role'); ?></a>
    </div>
</section>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="row">
    <div class="col-12 col-md-12 col-lg-12">
        <div class="card">
            <div class="card-body text-center">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <tr>
                            <th><?php echo translate('Sl'); ?></th>
                            <th><?php echo translate('Name'); ?></th>
                            <th><?php echo translate('Action'); ?></th>
                        </tr>
                        <?php $__empty_1 = true; $__currentLoopData = $roles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $role): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                            <?php if($role->name != 'admin'): ?>
                                <tr>
                                    <td data-label="<?php echo translate('Sl'); ?>"><?php echo e($key); ?></td>
                        
                                    <td data-label="<?php echo translate('Name'); ?>">
                                    <?php echo e($role->name); ?>

                                    </td>
                                    <?php if(access('edit permissions')): ?>
                                    <td data-label="<?php echo translate('Action'); ?>">
                                        <a class="btn btn-primary" href="<?php echo e(route('admin.role.edit',$role->id)); ?>"><?php echo translate('Permissions'); ?></a>
                                    </td>
                                    <?php endif; ?>
                                
                                </tr>
                                
                            <?php endif; ?>
                         <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>

                            <tr>
                                <td class="text-center" colspan="100%"><?php echo translate('No Data Found'); ?></td>
                            </tr>

                        <?php endif; ?>
                    </table>
                </div>
            </div>
            
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/vhosts/orkt.one/httpdocs/admin/project/resources/views/admin/role/index.blade.php ENDPATH**/ ?>