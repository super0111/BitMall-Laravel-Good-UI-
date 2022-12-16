@extends('layouts.admin')

@section('title')
   @langg('User Details')
@endsection

@section('breadcrumb')
 <section class="section">
    <div class="section-header justify-content-between">
        <h1>@langg('User Details')</h1>
        <a href="{{route('admin.user.index')}}" class="btn btn-primary"><i class="fas fa-backward"></i> @langg('Back')</a>
    </div>
</section>
@endsection
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
@section('content')

    <div class="row justify-content-center">
        <div class="col-xxl-8 col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h6>@lang('User Wallets')</h6>
                    <hr>
                    <div class="row justify-content-center">
                        @forelse ($user->wallets as $item)
                        <div class="col-xxl-6 col-lg-12 col-md-6">
                            <a href="javascript:void(0)" class="wallet"  data-code="{{$item->curr->code}}" data-id="{{$item->id}}" data-toggle="tooltip" title="@lang('Click to Add or Subtract Balance')">
                                <div class="card card-statistic-1 bg-sec">
                                    <div class="card-icon bg-primary text-white">
                                        {{$item->curr->code}}
                                    </div>
                                    <div class="card-wrap">
                                        <div class="card-header ">
                                            <h4 class="text-dark">@lang($item->curr->curr_name)</h4>
                                        </div>
                                        <div class="card-body">
                                            {{numFormat($item->balance,8)}} {{$item->curr->code}}
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                      @empty
                        <p>@lang('No wallet found')</p>
                      @endforelse
                    </div>
                    <h6 class="mt-3">@langg('User details')</h6>
                    <hr>
                    <form action="{{route('admin.user.profile.update',$user->id)}}" method="POST" class="row">
                        @csrf
                        <div class="form-group col-md-6">
                            <label>@langg('Name')</label>
                            <input class="form-control" type="text" name="name" value="{{$user->name}}" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label>@langg('Email')</label>
                            <input class="form-control" type="email" name="email" value="{{$user->email}}" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label>@langg('Phone')</label>
                            <input class="form-control" type="text" name="phone" value="{{$user->phone}}" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label>@langg('Country')</label>
                            <Select class="form-control js-example-basic-single" name="country" required>
                                @foreach ($countries as $item)
                                <option value="{{$item->name}}" {{$user->country == $item->name ? 'selected':''}}>{{$item->name}}</option>
                                @endforeach
                            </Select>
                        </div>
                        <div class="form-group col-md-6">
                            <label>@langg('City')</label>
                            <input class="form-control" type="text" name="city" value="{{$user->city}}">
                        </div>
                        <div class="form-group col-md-6">
                            <label>@langg('Zip')</label>
                            <input class="form-control" type="text" name="zip" value="{{$user->zip}}">
                        </div>
                        <div class="form-group col-md-12">
                            <label>@langg('Address')</label>
                            <input class="form-control" type="text" name="address" value="{{$user->address}}">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="cswitch d-flex justify-content-between align-items-center border p-2">
                                <input class="cswitch--input" name="status" type="checkbox" {{$user->status == 1 ? 'checked':''}} /><span class="cswitch--trigger wrapper"></span>
                                <span class="cswitch--label font-weight-bold">@langg('User status')</span>
                            </label>
                        </div>
                        <div class="form-group col-md-6 ">
                            <label class="cswitch d-flex justify-content-between align-items-center border p-2">
                                <input class="cswitch--input update" name="email_verified" type="checkbox" {{$user->email_verified == 1 ? 'checked':''}} /><span class="cswitch--trigger wrapper"></span>
                                <span class="cswitch--label font-weight-bold">@langg('Email Verified')</span>
                            </label>
                        </div>
                        
                        @if (access('update user'))
                        <div class="form-group col-md-12 text-right">
                           <button type="submit" class="btn btn-primary btn-lg">@langg('Submit')</button>
                        </div>
                        @endif
                    </form>
                    <h6 class="mt-3">@langg('User Posted Blogs')</h6>
                    <hr>
                    <div class="table-responsive p-3">
                        <table class="table align-items-center table-striped">

                            <tr>            
                                <th>{{ __('Title') }}</th>
                                <th>{{ __('Category') }}</th>
                                <th>{{ __('Views') }}</th>
                                <th>{{ __('Status') }}</th>
                                <th width="116px">{{ __('Action') }}</th>
                            </tr>
                    
                    
                            @forelse ($blogs as $item)
                            <tr>
                                <td data-label="{{ __('Title') }}">
                                    {{$item->title}}
                                </td>
                                <td data-label="{{ __('Category') }}">
                                    {{$item->category->name}}
                                </td>
                                <td data-label="{{ __('Views') }}">
                                    {{$item->views}}
                                </td>
                                
                                <td data-label="{{ __('Status') }}">
                                    @if ($item->status == 1)
                                    <span class="badge badge-success"> @langg('Active') </span>
                                    @else
                                    <span class="badge badge-warning"> @langg('Inactive') </span>
                                    @endif
                                </td>

                                <td data-label="{{ __('Action') }}">
                                    <a href="{{route('admin.blog.user.edit',$item->id)}}" class="btn btn-primary  btn-sm edit mb-1" data-toggle="tooltip" title="@langg('Edit')"><i class="fas fa-eye"></i></a>
                                    <a href="javascript:void(0)" class="btn btn-danger  btn-sm remove mb-1" data-route="{{route('admin.blog.destroy',$item)}}" data-toggle="tooltip" title="@langg('Delete')"><i class="fas fa-trash"></i></a>
                                    
                                </td>
                            </tr>
                        @empty

                            <tr>
                                <td class="text-center" colspan="100%">@langg('No Data Found')</td>
                            </tr>

                        @endforelse
                        
                        </table>
                    </div>
                    <h6 class="mt-3">@langg('User Reviews')</h6>
                    <hr>
                    <div class="table-responsive p-3">
                        <table class="table align-items-center table-striped">

                            <tr>            
                                <th>{{ __('Reviewer') }}</th>
                                <th>{{ __('Rating/ Comment') }}</th>
                                <th width="116px">{{ __('Action') }}</th>
                            </tr>
                    
                    
                            @forelse ($reviews as $review)
                            <tr>
                                <td data-label="{{ __('Title') }}">
                                    {{$review->reviewer->name}}
                                </td>
                                
                                <td data-label="{{ __('Status') }}">
                                <span class="m-0"> {!! str_repeat('<span><i class="fa fa-star" style="color: gold;"></i></span>', $review->rating) !!} </span> {{$review->description}}
                                </td>

                                <td data-label="{{ __('Action') }}">
                                <a class="btn btn-primary btn-sm mb-1 details" data-rating="{{$review}}" href="javascript:void(0)" data-route="{{route('admin.review.update',$review->id)}}" title="@langg('Details')"><i class="fas fa-edit"></i></a>
                                    <a href="javascript:void(0)" class="btn btn-danger  btn-sm remove mb-1" data-route="{{route('admin.review.destroy',$review)}}" data-toggle="tooltip" title="@langg('Delete')"><i class="fas fa-trash"></i></a>
                                    
                                </td>
                            </tr>
                        @empty

                            <tr>
                                <td class="text-center" colspan="100%">@langg('No Data Found')</td>
                            </tr>

                        @endforelse
                        
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xxl-4 col-lg-6 col-md-8">
            <div class="card">
                <div class="card-body">
                        <label class="font-weight-bold">@langg('Profile Picture')</label>
                        <div id="image-preview" class="image-preview u_details w-100"
                        style="background-image:url({{getPhoto($user->photo)}});">
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <ul class="list-group">
                        <li class="list-group-item active"><h5>@langg('Information')</h5></li>

                        <li class="list-group-item d-flex justify-content-between">@langg('Deposit History') <a target="_blank" href="{{route('admin.user.deposit.history',$user->id)}}" class="btn btn-dark btn-sm">@langg('View')</a></li>

                        <li class="list-group-item d-flex justify-content-between">@langg('Withdraw History') <a target="_blank" href="{{route('admin.user.withdraw.history',$user->id)}}" class="btn btn-dark btn-sm">@langg('View')</a></li>

                        <li class="list-group-item d-flex justify-content-between">@langg('User Login Info') <span><a href="{{route('admin.user.login.info',$user->id)}}" class="btn btn-dark btn-sm">@langg('View')</a></span></li>

                        @if (access('user login'))
                        <li class="list-group-item d-flex justify-content-between">@langg('Login to User') <span><a target="_blank" href="{{route('admin.user.login',$user->id)}}" class="btn btn-dark btn-sm">@langg('Login')</a></span></li>
                       @endif
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    @if(access('user balance modify'))
    <div class="modal fade" id="balanceModal" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form action="{{route('admin.user.balance.modify')}}" method="post">
                @csrf
                <input type="hidden" name="wallet_id">
                <input type="hidden" name="user_id" value="{{$user->id}}">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">@langg('Add/Subract Balance -- ') <span class="code"></span></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                    </div>
                    <div class="modal-body">
                       <div class="form-group">
                           <label>@langg('Amount')</label>
                           <input class="form-control" type="text" name="amount" required>
                       </div>
                       <div class="form-group">
                           <label>@langg('Type')</label>
                          <select name="type" id="" class="form-control">
                              <option value="1">@langg('Add Balance')</option>
                              <option value="2">@langg('Subtract Balance')</option>
                          </select>
                       </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark" data-dismiss="modal">@langg('Close')</button>
                        <button type="submit" class="btn btn-primary">@langg('Confirm')</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    @endif

    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@langg('Add new Review')</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
               <form action="{{route('admin.review.store')}}" method="POST">
                  @csrf
                   <div class="form-group">
                     <label for="">@langg('Select Reviewer')</label>
                     <select name="reviewer" class="form-control">
                         @foreach ($users as $key => $item)
                          <option value="{{$item->id}}">{{$item->name}}</option>
                         @endforeach
                     </select>
                   </div>

                   <div class="form-group">
                        <label for="">@langg('Select User')</label>
                        <select name="user" class="form-control">
                            @foreach ($users as $curr)
                            <option value="{{$curr->id}}">{{$curr->name}}</option>
                            @endforeach
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
                <button type="button" class="btn btn-dark" data-dismiss="modal">@langg('Close')</button>
                <button type="submit" class="btn btn-primary">@langg('Save')</button>
            </div>
        </form>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="del" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
   <form action="" method="post">
      @csrf
      @method('DELETE')
      <div class="modal-content">
        <div class="modal-body">
          <h5 class="mt-3">@langg('Are you sure to remove?')</h5>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-dark" data-dismiss="modal">@langg('Close')</button>
          <button type="submit" class="btn btn-danger">@langg('Confirm')</button>
        </div>
      </div>
   </form>
  </div>
</div>
@endsection

@push('script')
<script>
      'use strict';
      $('.remove').on('click',function () { 
        var route = $(this).data('route')
        $('#del').find('form').attr('action',route)
        $('#del').modal('show')
      })
      $('.details').on('click',function () { 
        console.log($(this).data('rating'));
            $('#addModal').find('.modal-title').text("@langg('Edit Review')")
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
            label_default: "@langg('Choose File')", // Default: Choose File
            label_selected: "@langg('Update Image')", // Default: Change File
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
@endpush

@push('style')
    <style>
        .bg-sec{
            background-color: #cdd3d83c
        }
        .u_details{
            height: 370px!important;
        }
    </style>
@endpush
