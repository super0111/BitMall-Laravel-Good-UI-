@extends('layouts.user')

@section('title')
   @lang('Trade Details')
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
<div class="dashboard--content-item">
    <div class="col-sm-8 float-right">
         @if(Session::has('flash_msg_success'))
         <div class="alert alert-success p-2">
            <strong>Success!</strong> {!! session('flash_msg_success')!!}.
         </div>
         @endif
      </div>
    @if($trader == 1 && $rated == 0 && $trade->status == 3)
        <div class="row">
                     <div class="col-sm-12 mt-4 ">
                        <form class="py-2 px-4" action="{{route('user.trade.review')}}" style="box-shadow: 0 0 10px 0 #ddd;" method="POST" autocomplete="off">
                           @csrf
                           <input type="hidden" name="offer_id" value="{{$trade->id}}">
                           <input type="hidden" name="offer_user_id" value="{{$trade->offer_user_id}}">
                           <h5 class="font-weight-bold ">Give a Review</h5>
                           <br />
                           <div class="form-group row">
                              <div class="col-sm-6">
                                 <div class="rate">
                                    <input type="radio" id="star5" class="rate" name="rating" value="5"/>
                                    <label for="star5" title="text">5 stars</label>
                                    <input type="radio" checked id="star4" class="rate" name="rating" value="4"/>
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
                           <div class="mt-3 ">
                              <button class="btn btn-sm py-2 px-3 btn-info">Submit
                              </button>
                           </div>
                        </form>
                     </div>
                  </div>
    @endif
    <div class="row gy-5">
        @include('user.trade.tradebar')
        @include('user.trade.chat')

        <div class="col-md-6">
            <div class="accordion-wrapper">
                <div class="accordion-item bg--body">
                    <div class="accordion-title">
                        <h5 class="title">
                            @langg('Offer Terms')
                        </h5>
                        <span class="right-icon"></span>
                    </div>
                    <div class="accordion-content">
                        {{$trade->offer->offer_terms}}
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="accordion-wrapper">
                <div class="accordion-item bg--body">
                    <div class="accordion-title">
                        <h5 class="title">
                            @langg('Trade Instructions')
                        </h5>
                        <span class="right-icon"></span>
                    </div>
                    <div class="accordion-content">
                        {{$trade->offer->trade_instructions}}
                    </div>
                </div>
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




<div id="disputeModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form method="POST" action="{{route('user.trade.dispute')}}">
                @csrf
                <input type="hidden" name="trade_code" value="{{$trade->trade_code}}">
                <div class="modal-body p-4 text-center">
                    <h5>@langg('Are you confirm to dispute?')</h5>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn  btn--danger" data-bs-dismiss="modal">@langg('Cancel')</button><button type="submit" class="btn btn--primary">@langg('Confirm')</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="releaseModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form method="POST" action="{{route('user.trade.release')}}">
                @csrf
                <input type="hidden" name="trade_code" value="{{$trade->trade_code}}">
                <div class="modal-body p-4 text-center">
                    <h5>@langg('Are you confirm to release?')</h5>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn  btn--danger" data-bs-dismiss="modal">@langg('Cancel')</button><button type="submit" class="btn btn--primary">@langg('Confirm')</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div id="paidModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form method="POST" action="{{route('user.trade.paid')}}">
                @csrf
                <input type="hidden" name="trade_code" value="{{$trade->trade_code}}">
                <div class="modal-body p-4 text-center">
                    <h5>@langg('Are you confirm to pay?')</h5>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn  btn--danger" data-bs-dismiss="modal">@langg('Cancel')</button><button type="submit" class="btn btn--primary">@langg('Confirm')</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div id="deleteModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form method="POST" action="{{route('user.trade.cancel')}}">
                @csrf
                <input type="hidden" name="trade_code" value="{{$trade->trade_code}}">
                <div class="modal-body p-4 text-center">
                    <h5>@langg('Are you confirm about this action ?')</h5>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn  btn--danger" data-bs-dismiss="modal">@langg('Cancel')</button><button type="submit" class="btn btn--primary">@langg('Confirm')</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="userInfo" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="about-offer">
                <div class="about-offer-area border rounded">
                    <div class="cmn--media ms-0">
                        <img src="" alt="clients" class="img">
                        <div class="subtitle">
                            <h5 class="m-0 name"></h5>
                            <span class="m-0 tradeCount"></span>
                        </div>
                    </div>
                    <ul class="user-info-list"></ul>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@php
    $to = Carbon\Carbon::parse($trade->created_at)->addMinutes($trade->trade_duration);
    $from   = \Carbon\Carbon::now();
    $diff = $from->diffInMinutes($to) - 0.5;
    if($from > $to) $diff = 0;
    
@endphp

@push('script')
    <script>
        'use strict';
            function counter(duration, id = true,trade = true,chat = false) { 
                var duration = duration
                var countDownDate = new Date();
                countDownDate.setMinutes(countDownDate.getMinutes() + parseInt(duration));
                var x = setInterval(function () {  
                    var now = new Date().getTime();  
                    var distance = countDownDate - now; 
                    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                    var seconds = Math.floor((distance % (1000 * 60)) / 1000); 
                    
                    if(id){
                       document.getElementById("time").innerHTML = minutes + "m " + seconds + "s "; 
                    }
                    if(distance < 0) {
                        if(id){
                            document.getElementById("time").innerHTML = '0m 0s'
                        }
                        clearInterval(x);
                        if(trade){
                            $(".trade").html(`<a href="#0" class="btn btn--danger cancel">@langg('Cancel Trade')</a>`)
                        }

                        if(chat){
                            $("#load").load(location.href + " #messages");
                            setTimeout(function () {
                                $("#messages").animate({ scrollTop: $('#messages').prop("scrollHeight")}, 1000);
                            },300)
                        }
                    }
                }, 1000);

            }
            counter("{{$diff}}")
            counter(1,false,false,true)

            $(document).on('click','.cancel',function () { 
                $('#deleteModal').modal('show')
            })

            $(".imageUpload").on('change', function () {
              $('.files').text('File : '+this.files[0].name) ;
            });

            $(".reload").on('click', function () {
                $("#load").load(location.href + " #messages");
                setTimeout(function () {
                    $("#messages").animate({ scrollTop: $('#messages').prop("scrollHeight")}, 1000);
                },300)
            });
            $("#messages").scrollTop($('#messages')[0].scrollHeight);

            $('.user_info').on('click',function () {
                var img = $(this).data('img')
                var tradeCount = $(this).data('trade_count')
                var info = $(this).data('info')
                var content = '';
                if(info.kyc_status == 1){
                    content += `<li>@langg('KYC verified')</li>`
                }else{
                    content += `<li  class="no">@langg('KYC not verified')</li>`
                }
                if(info.email_verified == 1){
                    content += `<li>@langg('Email verified')</li>`
                }else{
                    content += `<li  class="no">@langg('Email not verified')</li>`
                }

                if(info.phone_verified == 1){
                    content += `<li>@langg('Phone verified')</li>`
                }else{
                    content += `<li  class="no">@langg('Phone not verified')</li>`
                }
                $('#userInfo').find('.img').attr('src',img)
                $('#userInfo').find('.user-info-list').html(content)
                $('#userInfo').find('.tradeCount').text('@langg('Total Completed Trade : ')'+' '+tradeCount)
                $('#userInfo').find('.name').text(info.name)
                $('#userInfo').modal('show')
            })
    </script>
@endpush