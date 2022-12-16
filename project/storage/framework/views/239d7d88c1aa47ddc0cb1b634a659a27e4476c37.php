

<?php $__env->startSection('title'); ?>
   <?php echo translate('User Details'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
 <section class="section">
    <div class="section-header justify-content-between">
        <h1><?php echo translate('User Details'); ?></h1>
        <a href="<?php echo e(route('admin.user.index')); ?>" class="btn btn-primary"><i class="fas fa-backward"></i> <?php echo translate('Back'); ?></a>
    </div>
</section>
<?php $__env->stopSection(); ?>
<style>
         * {
         box-sizing: border-box;
         }
         /* Add a gray background color with some padding */
         body {
         font-family: Arial;
         padding: 20px;
         background: #f1f1f1;
         }
         /* Header/Blog Title */
         .header {
         padding: 30px;
         font-size: 40px;
         text-align: center;
         background: white;
         }
         /* Create two unequal columns that floats next to each other */
         /* Left column */
         .leftcolumn {   
         float: left;
         width: 75%;
         }
         /* Right column */
         .rightcolumn {
         float: left;
         width: 25%;
         padding-left: 20px;
         }
         /* Fake image */
         .fakeimg {
         background-color: #aaa;
         width: 100%;
         padding: 20px;
         }
         /* Add a card effect for articles */
         .card {
         background-color: white;
         padding: 20px;
         margin-top: 20px;
         }
         /* Clear floats after the columns */
         .row:after {
         content: "";
         display: table;
         clear: both;
         }
         .avatar {
         vertical-align: middle;
         width: 50px;
         height: 50px;
         border-radius: 50%;
         }
         .rate {
         float: left;
         height: 46px;
         padding: 0 10px;
         }
         .rate:not(:checked) > input {
         position:absolute;
         display: none;
         }
         .rate:not(:checked) > label {
         float:right;
         width:1em;
         overflow:hidden;
         white-space:nowrap;
         cursor:pointer;
         font-size:30px;
         color:#ccc;
         }
         .rate:not(:checked) > label:before {
         content: '★ ';
         }
         .rate > input:checked ~ label {
         color: #ffc700;
         }
         .rate:not(:checked) > label:hover,
         .rate:not(:checked) > label:hover ~ label {
         color: #deb217;
         }
         .rate > input:checked + label:hover,
         .rate > input:checked + label:hover ~ label,
         .rate > input:checked ~ label:hover,
         .rate > input:checked ~ label:hover ~ label,
         .rate > label:hover ~ input:checked ~ label {
         color: #c59b08;
         }
         .rating-container .form-control:hover, .rating-container .form-control:focus{
         background: #fff;
         border: 1px solid #ced4da;
         }
         .rating-container textarea:focus, .rating-container input:focus {
         color: #000;
         }
         /* End */
      </style>
<?php $__env->startSection('content'); ?>

    <div class="row justify-content-center">
        <div class="col-xxl-8 col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h6><?php echo app('translator')->get('User Wallets'); ?></h6>
                    <hr>
                    <div class="row justify-content-center">
                        <?php $__empty_1 = true; $__currentLoopData = $user->wallets; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                        <div class="col-xxl-6 col-lg-12 col-md-6">
                            <a href="javascript:void(0)" class="wallet"  data-code="<?php echo e($item->curr->code); ?>" data-id="<?php echo e($item->id); ?>" data-toggle="tooltip" title="<?php echo app('translator')->get('Click to Add or Subtract Balance'); ?>">
                                <div class="card card-statistic-1 bg-sec">
                                    <div class="card-icon bg-primary text-white">
                                        <?php echo e($item->curr->code); ?>

                                    </div>
                                    <div class="card-wrap">
                                        <div class="card-header ">
                                            <h4 class="text-dark"><?php echo app('translator')->get($item->curr->curr_name); ?></h4>
                                        </div>
                                        <div class="card-body">
                                            <?php echo e(numFormat($item->balance,8)); ?> <?php echo e($item->curr->code); ?>

                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                      <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                        <p><?php echo app('translator')->get('No wallet found'); ?></p>
                      <?php endif; ?>
                    </div>
                    <h6 class="mt-3"><?php echo translate('User details'); ?></h6>
                    <hr>
                    <form action="<?php echo e(route('admin.user.profile.update',$user->id)); ?>" method="POST" class="row">
                        <?php echo csrf_field(); ?>
                        <div class="form-group col-md-6">
                            <label><?php echo translate('Name'); ?></label>
                            <input class="form-control" type="text" name="name" value="<?php echo e($user->name); ?>" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label><?php echo translate('Email'); ?></label>
                            <input class="form-control" type="email" name="email" value="<?php echo e($user->email); ?>" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label><?php echo translate('Phone'); ?></label>
                            <input class="form-control" type="text" name="phone" value="<?php echo e($user->phone); ?>" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label><?php echo translate('Country'); ?></label>
                            <Select class="form-control js-example-basic-single" name="country" required>
                                <?php $__currentLoopData = $countries; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($item->name); ?>" <?php echo e($user->country == $item->name ? 'selected':''); ?>><?php echo e($item->name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </Select>
                        </div>
                        <div class="form-group col-md-6">
                            <label><?php echo translate('City'); ?></label>
                            <input class="form-control" type="text" name="city" value="<?php echo e($user->city); ?>">
                        </div>
                        <div class="form-group col-md-6">
                            <label><?php echo translate('Zip'); ?></label>
                            <input class="form-control" type="text" name="zip" value="<?php echo e($user->zip); ?>">
                        </div>
                        <div class="form-group col-md-12">
                            <label><?php echo translate('Address'); ?></label>
                            <input class="form-control" type="text" name="address" value="<?php echo e($user->address); ?>">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="cswitch d-flex justify-content-between align-items-center border p-2">
                                <input class="cswitch--input" name="status" type="checkbox" <?php echo e($user->status == 1 ? 'checked':''); ?> /><span class="cswitch--trigger wrapper"></span>
                                <span class="cswitch--label font-weight-bold"><?php echo translate('User status'); ?></span>
                            </label>
                        </div>
                        <div class="form-group col-md-6 ">
                            <label class="cswitch d-flex justify-content-between align-items-center border p-2">
                                <input class="cswitch--input update" name="email_verified" type="checkbox" <?php echo e($user->email_verified == 1 ? 'checked':''); ?> /><span class="cswitch--trigger wrapper"></span>
                                <span class="cswitch--label font-weight-bold"><?php echo translate('Email Verified'); ?></span>
                            </label>
                        </div>
                        
                        <?php if(access('update user')): ?>
                        <div class="form-group col-md-12 text-right">
                           <button type="submit" class="btn btn-primary btn-lg"><?php echo translate('Submit'); ?></button>
                        </div>
                        <?php endif; ?>
                    </form>
                    <h6 class="mt-3"><?php echo translate('User Posted Blogs'); ?></h6>
                    <hr>
                    <div class="table-responsive p-3">
                        <table class="table align-items-center table-striped">

                            <tr>            
                                <th><?php echo e(__('Title')); ?></th>
                                <th><?php echo e(__('Category')); ?></th>
                                <th><?php echo e(__('Views')); ?></th>
                                <th><?php echo e(__('Status')); ?></th>
                                <th width="116px"><?php echo e(__('Action')); ?></th>
                            </tr>
                    
                    
                            <?php $__empty_1 = true; $__currentLoopData = $blogs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                            <tr>
                                <td data-label="<?php echo e(__('Title')); ?>">
                                    <?php echo e($item->title); ?>

                                </td>
                                <td data-label="<?php echo e(__('Category')); ?>">
                                    <?php echo e($item->category->name); ?>

                                </td>
                                <td data-label="<?php echo e(__('Views')); ?>">
                                    <?php echo e($item->views); ?>

                                </td>
                                
                                <td data-label="<?php echo e(__('Status')); ?>">
                                    <?php if($item->status == 1): ?>
                                    <span class="badge badge-success"> <?php echo translate('Active'); ?> </span>
                                    <?php else: ?>
                                    <span class="badge badge-warning"> <?php echo translate('Inactive'); ?> </span>
                                    <?php endif; ?>
                                </td>

                                <td data-label="<?php echo e(__('Action')); ?>">
                                    <a href="<?php echo e(route('admin.blog.user.edit',$item->id)); ?>" class="btn btn-primary  btn-sm edit mb-1" data-toggle="tooltip" title="<?php echo translate('Edit'); ?>"><i class="fas fa-eye"></i></a>
                                    <a href="javascript:void(0)" class="btn btn-danger  btn-sm remove mb-1" data-route="<?php echo e(route('admin.blog.destroy',$item)); ?>" data-toggle="tooltip" title="<?php echo translate('Delete'); ?>"><i class="fas fa-trash"></i></a>
                                    
                                </td>
                            </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>

                            <tr>
                                <td class="text-center" colspan="100%"><?php echo translate('No Data Found'); ?></td>
                            </tr>

                        <?php endif; ?>
                        
                        </table>
                    </div>
                    <h6 class="mt-3"><?php echo translate('User Reviews'); ?></h6>
                    <hr>
                    <div class="table-responsive p-3">
                        <table class="table align-items-center table-striped">

                            <tr>            
                                <th><?php echo e(__('Reviewer')); ?></th>
                                <th><?php echo e(__('Rating/ Comment')); ?></th>
                                <th width="116px"><?php echo e(__('Action')); ?></th>
                            </tr>
                    
                    
                            <?php $__empty_1 = true; $__currentLoopData = $reviews; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $review): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                            <tr>
                                <td data-label="<?php echo e(__('Title')); ?>">
                                    <?php echo e($review->reviewer->name); ?>

                                </td>
                                
                                <td data-label="<?php echo e(__('Status')); ?>">
                                <span class="m-0"> <?php echo str_repeat('<span><i class="fa fa-star" style="color: gold;"></i></span>', $review->rating); ?> </span> <?php echo e($review->description); ?>

                                </td>

                                <td data-label="<?php echo e(__('Action')); ?>">
                                <a class="btn btn-primary btn-sm mb-1 details" data-rating="<?php echo e($review); ?>" href="javascript:void(0)" data-route="<?php echo e(route('admin.review.update',$review->id)); ?>" title="<?php echo translate('Details'); ?>"><i class="fas fa-edit"></i></a>
                                    <a href="javascript:void(0)" class="btn btn-danger  btn-sm remove mb-1" data-route="<?php echo e(route('admin.review.destroy',$review)); ?>" data-toggle="tooltip" title="<?php echo translate('Delete'); ?>"><i class="fas fa-trash"></i></a>
                                    
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
            </div>
        </div>
        <div class="col-xxl-4 col-lg-6 col-md-8">
            <div class="card">
                <div class="card-body">
                        <label class="font-weight-bold"><?php echo translate('Profile Picture'); ?></label>
                        <div id="image-preview" class="image-preview u_details w-100"
                        style="background-image:url(<?php echo e(getPhoto($user->photo)); ?>);">
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <ul class="list-group">
                        <li class="list-group-item active"><h5><?php echo translate('Information'); ?></h5></li>

                        <li class="list-group-item d-flex justify-content-between"><?php echo translate('Deposit History'); ?> <a target="_blank" href="<?php echo e(route('admin.user.deposit.history',$user->id)); ?>" class="btn btn-dark btn-sm"><?php echo translate('View'); ?></a></li>

                        <li class="list-group-item d-flex justify-content-between"><?php echo translate('Withdraw History'); ?> <a target="_blank" href="<?php echo e(route('admin.user.withdraw.history',$user->id)); ?>" class="btn btn-dark btn-sm"><?php echo translate('View'); ?></a></li>

                        <li class="list-group-item d-flex justify-content-between"><?php echo translate('User Login Info'); ?> <span><a href="<?php echo e(route('admin.user.login.info',$user->id)); ?>" class="btn btn-dark btn-sm"><?php echo translate('View'); ?></a></span></li>

                        <?php if(access('user login')): ?>
                        <li class="list-group-item d-flex justify-content-between"><?php echo translate('Login to User'); ?> <span><a target="_blank" href="<?php echo e(route('admin.user.login',$user->id)); ?>" class="btn btn-dark btn-sm"><?php echo translate('Login'); ?></a></span></li>
                       <?php endif; ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <?php if(access('user balance modify')): ?>
    <div class="modal fade" id="balanceModal" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form action="<?php echo e(route('admin.user.balance.modify')); ?>" method="post">
                <?php echo csrf_field(); ?>
                <input type="hidden" name="wallet_id">
                <input type="hidden" name="user_id" value="<?php echo e($user->id); ?>">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><?php echo translate('Add/Subract Balance -- '); ?> <span class="code"></span></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                    </div>
                    <div class="modal-body">
                       <div class="form-group">
                           <label><?php echo translate('Amount'); ?></label>
                           <input class="form-control" type="text" name="amount" required>
                       </div>
                       <div class="form-group">
                           <label><?php echo translate('Type'); ?></label>
                          <select name="type" id="" class="form-control">
                              <option value="1"><?php echo translate('Add Balance'); ?></option>
                              <option value="2"><?php echo translate('Subtract Balance'); ?></option>
                          </select>
                       </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark" data-dismiss="modal"><?php echo translate('Close'); ?></button>
                        <button type="submit" class="btn btn-primary"><?php echo translate('Confirm'); ?></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <?php endif; ?>

    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><?php echo translate('Add new Review'); ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
               <form action="<?php echo e(route('admin.review.store')); ?>" method="POST">
                  <?php echo csrf_field(); ?>
                   <div class="form-group">
                     <label for=""><?php echo translate('Select Reviewer'); ?></label>
                     <select name="reviewer" class="form-control">
                         <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                          <option value="<?php echo e($item->id); ?>"><?php echo e($item->name); ?></option>
                         <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                     </select>
                   </div>

                   <div class="form-group">
                        <label for=""><?php echo translate('Select User'); ?></label>
                        <select name="user" class="form-control">
                            <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $curr): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($curr->id); ?>"><?php echo e($curr->name); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                   </div>
                   <div class="form-group row">
                        <div class="col-sm-6">
                            <div class="rate">
                            <input type="radio" id="star5" class="rate" name="rating" value="5"/>
                            <label for="star5" title="text">5 stars</label>
                            <input type="radio" id="star4" class="rate" name="rating" value="4"/>
                            <label for="star4" title="text">4 stars</label>
                            <input type="radio" id="star3" class="rate" name="rating" value="3"/>
                            <label for="star3" title="text">3 stars</label>
                            <input type="radio" id="star2" class="rate" name="rating" value="2">
                            <label for="star2" title="text">2 stars</label>
                            <input type="radio" id="star1" class="rate" name="rating" value="1"/>
                            <label for="star1" title="text">1 star</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row mt-4">
                        <div class="col-sm-12 ">
                            <textarea class="form-control" name="comment" rows="6 " placeholder="Comment" maxlength="200"></textarea>
                        </div>
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
      $('.details').on('click',function () { 
        console.log($(this).data('rating'));
            $('#addModal').find('.modal-title').text("<?php echo translate('Edit Review'); ?>")
            $('#addModal').find('#star'+$(this).data('rating').rating).attr('checked', 'checked');
            $('#addModal').find('textarea[name=comment]').val($(this).data('rating').description)
            $('#addModal').find('select[name=user]').val($(this).data('rating').user_id)
            $('#addModal').find('select[name=reviewer]').val($(this).data('rating').reviewer_id)                        
            $('#addModal').find('form').attr('action',$(this).data('route'))
            $('#addModal').modal('show')
        })
    </script>
    <script>
        'use strict';
        $.uploadPreview({
            input_field: "#image-upload", // Default: .image-upload
            preview_box: "#image-preview", // Default: .image-preview
            label_field: "#image-label", // Default: .image-label
            label_default: "<?php echo translate('Choose File'); ?>", // Default: Choose File
            label_selected: "<?php echo translate('Update Image'); ?>", // Default: Change File
            no_label: false, // Default: false
            success_callback: null // Default: null
        });

        $('.wallet').on('click',function () { 
            $('#balanceModal').find('input[name=wallet_id]').val($(this).data('id'))
            $('#balanceModal').find('.code').text($(this).data('code'))
            $('#balanceModal').modal('show')
        })

        $(document).ready(function() {
           $('.js-example-basic-single').select2();
        });
    </script>
<?php $__env->stopPush(); ?>

<?php $__env->startPush('style'); ?>
    <style>
        .bg-sec{
            background-color: #cdd3d83c
        }
        .u_details{
            height: 370px!important;
        }
    </style>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/vhosts/orkt.one/httpdocs/admin/project/resources/views/admin/user/details.blade.php ENDPATH**/ ?>