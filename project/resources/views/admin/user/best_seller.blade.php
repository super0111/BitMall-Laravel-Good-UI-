@extends('layouts.admin')

@section('title')
   @langg('Best Sellers')
@endsection

@section('breadcrumb')
 <section class="section">
    <div class="section-header justify-content-between">
        <h1> @langg('Best Sellers')</h1>
        <form action="">
            <div class="row">                
                <div class="col-md-12">
                    <div class="input-group has_append ">
                      <input type="text" class="form-control" placeholder="@langg('email')" name="search" value="{{$search ?? ''}}"/>
                      <div class="input-group-append">
                          <button class="input-group-text bg-primary border-0"><i class="fas fa-search text-white"></i></button>
                      </div>
                    </div>
                </div>
                
            </div>
          </form>
    </div>
</section>
@endsection

@section('content')
        
<div class="row">
    <div class="col-12 col-md-12 col-lg-12">
        <div class="card">
            <div class="card-header d-flex justify-content-end">
            <button class="btn add btn-primary" data-toggle="modal" data-target="#addModal"> <i class="fas fa-plus"></i> @langg('Add New')</button>
            </div>
            <div class="card-body text-center">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <tr>
                            <th>@langg('Sl')</th>
                            <th>@langg('Name')</th>
                            <th>@langg('Email')</th>
                            <th>@langg('Country')</th>
                            <th>@langg('Status')</th>
                            <th>@langg('Email Verified')</th>
                            <th>@langg('Action')</th>
                        </tr>
                        @forelse ($users as $key => $user)
                            <tr>
                                <td data-label="@langg('Sl')">{{$key + $users->firstItem()}}</td>
                    
                                 <td data-label="@langg('Name')">
                                   {{$user->name}}
                                 </td>
                                 <td data-label="@langg('Email')">{{$user->email}}</td>
                                 <td data-label="@langg('Country')">{{$user->country}}</td>
                                 <td data-label="@langg('Status')">
                                    @if($user->status == 1)
                                        <span class="badge badge-success">@langg('active')</span>
                                    @else
                                         <span class="badge badge-danger">@langg('banned')</span>
                                    @endif
                                 </td>
                                 <td data-label="@langg('Email Verified')">
                                    @if($user->email_verified == 1)
                                        <span class="badge badge-success"><i class="fa-solid fa-check"></i> @langg('Yes')</span>
                                    @else
                                         <span class="badge badge-danger"><i class="fa-solid fa-ban"></i> @langg('No')</span>
                                    @endif
                                 </td>
                                 
                                 <td data-label="@langg('Action')">
                                 <a href="javascript:void(0)" class="btn btn-danger remove mb-1" data-route="{{route('admin.review.remove_best_seller',$user)}}" data-toggle="tooltip" title="@langg('Delete')"><i class="fas fa-trash"></i>Remove</a>
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
            @if ($users->hasPages())
                {{ $users->links('admin.partials.paginate') }}
            @endif
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@langg('Add to List')</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
               <form action="{{route('admin.user.add_best_seller')}}" method="POST">
                  @csrf
                   <div class="form-group">
                        <label for="">@langg('Select User')</label>
                        <select name="user" class="form-control js-example-basic-single">
                            @foreach ($allUsers as $curr)
                            <option value="{{$curr->id}}">{{$curr->name}}</option>
                            @endforeach
                        </select>
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
@endpush
