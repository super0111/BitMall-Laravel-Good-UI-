@extends('layouts.user')

@section('title')
@if (auth()->user()->two_fa_status == 1)
@langg('Deactivate Two Step Authentication')
@else
@langg('Activate Two Step Authentication')
@endif
@endsection



@section('content')
    <div class="dashboard--content-item">
        <h6 class="dashboard-title">@langg('Please check your phone number to get OTP code. Your phone number is : '.auth()->user()->phone)</h6>
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card default--card">
                    
                    <div class="card-body">
                        <form action="" method="POST">
                            @csrf
                            
                            <div class="form-group mb-2">
                                <label class="mb-1">@langg('OTP Code')</label>
                                <input class="form-control" type="text" name="code" required>
                            </div>
                            <div class="form-group d-flex justify-content-between">
                                <a href="{{route('user.two.step.resend')}}" class="text-left">@langg('Didn\'t get code? Resend.')</a>
                               <button type="submit" class="btn btn--base">@langg('Submit')</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection