

<?php $__env->startSection('title'); ?>
   <?php echo translate('Best Sellers'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
 <section class="section">
    <div class="section-header justify-content-between">
        <h1> <?php echo translate('Best Sellers'); ?></h1>
        <form action="">
            <div class="row">                
                <div class="col-md-12">
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
            <button class="btn add btn-primary" data-toggle="modal" data-target="#addModal"> <i class="fas fa-plus"></i> <?php echo translate('Add New'); ?></button>
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
                                 
                                 <td data-label="<?php echo translate('Action'); ?>">
                                 <a href="javascript:void(0)" class="btn btn-danger remove mb-1" data-route="<?php echo e(route('admin.review.remove_best_seller',$user)); ?>" data-toggle="tooltip" title="<?php echo translate('Delete'); ?>"><i class="fas fa-trash"></i>Remove</a>
                                 </td>                                 
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

<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><?php echo translate('Add to List'); ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
               <form action="<?php echo e(route('admin.user.add_best_seller')); ?>" method="POST">
                  <?php echo csrf_field(); ?>
                   <div class="form-group">
                        <label for=""><?php echo translate('Select User'); ?></label>
                        <select name="user" class="form-control js-example-basic-single">
                            <?php $__currentLoopData = $allUsers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $curr): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($curr->id); ?>"><?php echo e($curr->name); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                   </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-dark" data-dismiss="modal"><?php echo translate('Close'); ?></button>
                <button type="submit" class="btn btn-primary"><?php echo translate('Save'); ?></button>
            </div>
        </form>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="del" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
   <form action="" method="post">
      <?php echo csrf_field(); ?>
      <?php echo method_field('DELETE'); ?>
      <div class="modal-content">
        <div class="modal-body">
          <h5 class="mt-3"><?php echo translate('Are you sure to remove?'); ?></h5>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-dark" data-dismiss="modal"><?php echo translate('Close'); ?></button>
          <button type="submit" class="btn btn-danger"><?php echo translate('Confirm'); ?></button>
        </div>
      </div>
   </form>
  </div>
</div>
<?php $__env->stopSection(); ?>


<?php $__env->startPush('script'); ?>
    <script>
      'use strict';
      $('.remove').on('click',function () { 
        var route = $(this).data('route')
        $('#del').find('form').attr('action',route)
        $('#del').modal('show')
      })
      $('.add').on('click',function () { 
            $('#addModal').find('.append').children().remove()
            $('#addModal').find('form')[0].reset();
        })     
        $(document).ready(function() {
           $('.js-example-basic-single').select2({
             dropdownParent: $('#addModal')
           });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/vhosts/orkt.one/httpdocs/admin/project/resources/views/admin/user/best_seller.blade.php ENDPATH**/ ?>