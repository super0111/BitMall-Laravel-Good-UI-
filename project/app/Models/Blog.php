<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
    use HasFactory;
    protected $fillable = ['title','category_id','photo','slug', 'description', 'source', 'views','updated_at', 'status','meta_tag','meta_description','tags', 'type', 'user_id'];
    protected $appends = ['photo_url'];

    public function category()
    {
        return $this->belongsTo(BlogCategory::class)->withDefault([
            'name' => 'Deleted',
        ]);
    }
    
    public function getPhotoUrlAttribute()
    {
        return getPhoto($this->photo);
    }
    
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
