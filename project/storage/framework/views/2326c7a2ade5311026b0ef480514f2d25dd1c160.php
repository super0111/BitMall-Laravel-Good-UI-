

<?php $__env->startSection('title'); ?>
   <?php echo translate('Manage Reviews'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
 <section class="section">
    <div class="section-header justify-content-between">
        <h1><?php echo translate('Manage Reviews'); ?></h1>
        <button class="btn add btn-primary" data-toggle="modal" data-target="#addModal"> <i class="fas fa-plus"></i> <?php echo translate('Add New'); ?></button>
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
<div class="row">
    <div class="col-12 col-md-12 col-lg-12">
        <div class="card">
            <div class="card-body text-center">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <tr>
                            <th><?php echo translate('Reviewer Name'); ?></th>
                            <th><?php echo translate('User'); ?></th>
                            <th><?php echo translate('Description'); ?></th>
                            <th width="136px"><?php echo translate('Action'); ?></th>
                        </tr>
                        <?php $__empty_1 = true; $__currentLoopData = $reviews; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $review): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>                            
                            <tr>
                                <td data-label="<?php echo translate('Reviewer'); ?>"><?php echo e($review->reviewer->name); ?></td>
                                <td data-label="<?php echo translate('User'); ?>"><?php echo e($review->reviewee->name); ?></td>                    
                                <td data-label="<?php echo translate('Description'); ?>" style="text-align: left;">
                                <span class="m-0"> <?php echo str_repeat('<span><i class="fa fa-star" style="color: gold;"></i></span>', $review->rating); ?> </span> <?php echo e($review->description); ?>

                                </td>                                
                                <td data-label="<?php echo translate('Action'); ?>">      
                                <a class="btn btn-primary details mb-1" data-rating="<?php echo e($review); ?>" href="javascript:void(0)" data-route="<?php echo e(route('admin.review.update',$review->id)); ?>" title="<?php echo translate('Details'); ?>"><i class="fas fa-edit"></i></a>                              
                                <a href="javascript:void(0)" class="btn btn-danger remove mb-1" data-route="<?php echo e(route('admin.review.destroy',$review)); ?>" data-toggle="tooltip" title="<?php echo translate('Delete'); ?>"><i class="fas fa-trash"></i></a>
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
            <?php if($reviews->hasPages()): ?>
                <?php echo e($reviews->links('admin.partials.paginate')); ?>

            <?php endif; ?>
        </div>
    </div>
</div>


<!-- Modal -->
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
                     <select name="reviewer" class="form-control js-example-basic-single">
                         <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                          <option value="<?php echo e($item->id); ?>"><?php echo e($item->name); ?></option>
                         <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                     </select>
                   </div>

                   <div class="form-group">
                        <label for=""><?php echo translate('Select User'); ?></label>
                        <select name="user" class="form-control js-example-basic-single">
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
      $('.add').on('click',function () { 
            $('#addModal').find('.append').children().remove()
            $('#addModal').find('form')[0].reset();
        })
      $('.details').on('click',function () { 
        console.log('zubair ali');
        console.log($(this).data());
            $('#addModal').find('.modal-title').text("<?php echo translate('Edit Review'); ?>")
            // $('#addModal').find('input[name=name]').val($(this).data('staff').name)
            $('#addModal').find('#star'+$(this).data('rating').rating).attr('checked', 'checked');
            $('#addModal').find('textarea[name=comment]').val($(this).data('rating').description)
            $('#addModal').find('select[name=user]').val($(this).data('rating').user_id)
            $('#addModal').find('select[name=reviewer]').val($(this).data('rating').reviewer_id)                        
            $('#addModal').find('form').attr('action',$(this).data('route'))
            $('#addModal').modal('show')
        })
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/vhosts/orkt.one/httpdocs/admin/project/resources/views/admin/reviews/index.blade.php ENDPATH**/ ?>