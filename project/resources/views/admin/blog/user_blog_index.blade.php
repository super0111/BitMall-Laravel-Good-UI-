@extends('layouts.admin')

@section('title')
   @langg('Manage User Blog')
@endsection

@section('breadcrumb')
 <section class="section">
    <div class="section-header">
        <h1>@langg('Manage User Blog')</h1>
    </div>
</section>
@endsection
@section('content')

<!-- Row -->
<div class="row">
  <div class="col-lg-12">
	<div class="card mb-4">
    <div class="card-header d-flex justify-content-end">
      
    </div>
	  <div class="table-responsive p-3">
      <table class="table align-items-center table-striped">

          <tr>
            <th>{{ __('User Name')}}</th>
            <th>{{ __('Title') }}</th>
            <th>{{ __('Category') }}</th>
            <th>{{ __('Views') }}</th>
            <th>{{ __('Status') }}</th>
            <th>{{ __('Action') }}</th>
          </tr>
  
 
          @forelse ($blogs as $item)
          <tr>
               <td> {{$item->user->name}}</td>
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
                  @elseif ($item->status == 2)
                  <span class="badge badge-warning"> @langg('Pending') </span>
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
	</div>
  </div>
  <!-- DataTable with Hover -->

</div>
<!--Row-->



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
    </script>
@endpush
