@extends('layouts.frontend')

@section('title')
    @lang(@$page->title ?? 'About')
@endsection

@section('content')
  
   <div class="dashboard--content-item">
        
        <div class="profile--card">
            <div class="user--profile mb-5">
                <div class="thumb">
                    <img src="{{getPhoto($user->photo)}}" alt="clients">
                </div>
                <div class="remove-thumb">
                    <i class="fas fa-times"></i>
                </div>
                <div class="content">
                    <div>
                        <h3 class="title">
                            {{$user->name}}
                        </h3>
                        <!--<a href="#0" class="text--base">-->
                        <!--   {{$user->email}}-->
                        <!--</a>-->
                        <p><span class="m-0">@langg('Total Completed Trade : ') {{$user->completedTrade()}}</span></p>
                    </div>
                    <br />
                    <ul class="user-info-list">
                           
                            @if ($user->kyc_status == 1)
                                <li>
                                    @langg('KYC verified')
                                </li>
                            @else
                                <li class="no">
                                    @langg('KYC not verified')
                                </li>
                                 
                            @endif
                            @if ($user->email_verified == 1)
                                <li>
                                    @langg('Email verified')
                                </li>
                            @else
                                <li class="no">
                                    @langg('Email not verified')
                                </li>
                                 
                            @endif
                            @if ($user->phone_verified == 1)
                                <li>
                                    @langg('Phone verified')
                                </li>
                            @else
                                <li class="no">
                                    @langg('Phone not verified')
                                </li>
                                 
                            @endif
                        </ul>
                </div>
            </div>
         <div class="col-lg-12">
                <div class="about-offer">
                    <h4 class="title mb-3 pt-3">Reviews</h4>
                     
                    <div class="about-offer-area border rounded">
                        @if(count($reviews)>0)
                        @foreach($reviews as $review)
                        <div class="cmn--media ms-0">
                            <img src="{{getPhoto($review->reviewer->photo)}}" alt="clients">
                            <div class="subtitle" style="width: 90%;">
                                <h5 class="m-0">{{$review->reviewer->name}}</h5>
                                <span class="m-0"> {!! str_repeat('<span><i class="fa fa-star" style="color: gold;"></i></span>', $review->rating) !!} </span>
                            </div>
                            <div>
                                <br />
                                <p>{{$review->description}}</p>
                            </div>
                        </div>
                        @endforeach
                        @else
                            <p>No Reviews.</p>
                        @endif
                    </div>
                </div>
            </div>  
                
                
                </div>
            </div>
        
    </div>
@endsection