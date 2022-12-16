

<?php $__env->startSection('title'); ?>
   <?php echo translate('Manage User'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
 <section class="section">
    <div class="section-header justify-content-between">
        <h1> <?php echo translate('Manage User'); ?></h1>
        <form action="">
            <div class="row">
                <div class="col-md-6">
                    <select class="form-control" id="" onChange="window.location.href=this.value">
                        <option value="<?php echo e(url('admin/manage-users/'.'?status=all')); ?>" <?php echo e(request('status') == 'all'?'selected':''); ?>><?php echo translate('All'); ?></option>
                        <option value="<?php echo e(url('admin/manage-users/'.'?status=active')); ?>" <?php echo e(request('status') == 'active'?'selected':''); ?>><?php echo translate('Active'); ?></option>
                        <option value="<?php echo e(url('admin/manage-users/'.'?status=banned')); ?>" <?php echo e(request('status') == 'banned'?'selected':''); ?>><?php echo translate('Banned'); ?></option>
                    </select>
                </div>
                <div class="col-md-6">
                    <div class="input-group has_append ">
                      <input type="text" class="form-control" placeholder="<?php echo translate('email'); ?>" name="search" value="<?php echo e($search ?? ''); ?>"/>
                      <div class="input-group-append">
                          <button class="input-group-text bg-primary border-0"><i class="fas fa-search text-white"></i></button>
                      </div>
                    </div>
                </div>
                
            </div>
          </form>
    </div>
</section>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
        
<div class="row">
    <div class="col-12 col-md-12 col-lg-12">
        <div class="card">
            <div class="card-header d-flex justify-content-end">
                <a href="<?php echo e(route('admin.mail.group.show')); ?>" class="btn btn-primary"><i class="fa-solid fa-paper-plane"></i> <?php echo translate('Send Group Mail'); ?></a>
            </div>
            <div class="card-body text-center">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <tr>
                            <th><?php echo translate('Sl'); ?></th>
                            <th><?php echo translate('Name'); ?></th>
                            <th><?php echo translate('Email'); ?></th>
                            <th><?php echo translate('Country'); ?></th>
                            <th><?php echo translate('Status'); ?></th>
                            <th><?php echo translate('Email Verified'); ?></th>
                            <th><?php echo translate('Action'); ?></th>
                        </tr>
                        <?php $__empty_1 = true; $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                            <tr>
                                <td data-label="<?php echo translate('Sl'); ?>"><?php echo e($key + $users->firstItem()); ?></td>
                    
                                 <td data-label="<?php echo translate('Name'); ?>">
                                   <?php echo e($user->name); ?>

                                 </td>
                                 <td data-label="<?php echo translate('Email'); ?>"><?php echo e($user->email); ?></td>
                                 <td data-label="<?php echo translate('Country'); ?>"><?php echo e($user->country); ?></td>
                                 <td data-label="<?php echo translate('Status'); ?>">
                                    <?php if($user->status == 1): ?>
                                        <span class="badge badge-success"><?php echo translate('active'); ?></span>
                                    <?php else: ?>
                                         <span class="badge badge-danger"><?php echo translate('banned'); ?></span>
                                    <?php endif; ?>
                                 </td>
                                 <td data-label="<?php echo translate('Email Verified'); ?>">
                                    <?php if($user->email_verified == 1): ?>
                                        <span class="badge badge-success"><i class="fa-solid fa-check"></i> <?php echo translate('Yes'); ?></span>
                                    <?php else: ?>
                                         <span class="badge badge-danger"><i class="fa-solid fa-ban"></i> <?php echo translate('No'); ?></span>
                                    <?php endif; ?>
                                 </td>
                                 <?php if(access('edit user')): ?>
                                 <td data-label="<?php echo translate('Action'); ?>">
                                     <a class="btn btn-primary btn-sm details" href="<?php echo e(route('admin.user.details',$user->id)); ?>"><i class="fa-solid fa-arrow-right"></i> <?php echo translate('Details'); ?> </a>
                                 </td>
                                 <?php else: ?>
                                 N/A
                                 <?php endif; ?>
                               
                            </tr>
                         <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>

                            <tr>
                                <td class="text-center" colspan="100%"><?php echo translate('No Data Found'); ?></td>
                            </tr>

                        <?php endif; ?>
                    </table>
                </div>
            </div>
            <?php if($users->hasPages()): ?>
                <?php echo e($users->links('admin.partials.paginate')); ?>

            <?php endif; ?>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>



<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/vhosts/orkt.one/httpdocs/admin/project/resources/views/admin/user/index.blade.php ENDPATH**/ ?>