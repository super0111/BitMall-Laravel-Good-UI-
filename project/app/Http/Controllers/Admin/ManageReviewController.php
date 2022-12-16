<?php

namespace App\Http\Controllers\Admin;

use App\Models\Review;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Currency;

class ManageReviewController extends Controller
{
    public function index()
    {
        $search = request('search');

        $reviews = Review::when($search,function($q) use($search){$q->where('name','like',"%$search%");})
                ->with(['reviewer', 'reviewee'])->paginate(10);
        $users = User::all();
        
        return view('admin.reviews.index',compact('reviews', 'users'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'reviewer'     => 'required|exists:users,id',
            'user'       => 'required|exists:users,id|different:reviewer',
            'rating' => 'required|integer',
            'comment' => 'required'
        ]);

        try {

            $review = new Review();
            $review->user_id     = $request->user;
            $review->reviewer_id = $request->reviewer;
            $review->rating        = $request->rating;
            $review->description   = $request->comment;
            $review->save();

            return back()->with('success','Review has been added');

        } catch (\Throwable $th) {
            return back()->with('error',$th->getMessage());
        }
       
    }

    public function update(Review $review, Request $request)
    {
        $request->validate([
            'reviewer'     => 'required|exists:users,id',
            'user'       => 'required|exists:users,id|different:reviewer',
            'rating' => 'required|integer',
            'comment' => 'required'
        ]);

        $review->user_id     = $request->user;
        $review->reviewer_id = $request->reviewer;
        $review->rating        = $request->rating;
        $review->description   = $request->comment;
        $review->save();

        return back()->with('success','Review has been updated');
    }

    public function destroy(Review $review)
    {
        $review->delete();
        return back()->with('success','Review has been deleted');
    }
}
