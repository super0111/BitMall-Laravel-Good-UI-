@extends('layouts.admin')

@section('title')
   @langg('Profile Setting')
@endsection

@section('breadcrumb')
 <section class="section">
    <div class="section-header">
        <h1>@langg('Send Notification')</h1>
    </div>
</section>
@endsection

@section('content')
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    @if(Session::has('flash_msg_success'))
                     <div class="alert alert-success p-2">
                        <strong>Success!</strong> {!! session('flash_msg_success')!!}.
                     </div>
                     @endif
                    <form action="{{route('admin.sendNotification')}}" class="row" method="POST" enctype="multipart/form-data">
                        @csrf
                        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>@langg('Title')</label>
                                <input class="form-control" type="text" name="title" required>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="message" rows="6 " placeholder="Message" maxlength="200"></textarea>
                            </div>
                            <div class="form-group text-right">
                                <button type="submit" class="btn btn-primary btn-lg">@langg('Submit')</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection