<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class penjualan extends Model
{
    protected $table= 'penjualan';
    protected $fillable = ['user_id', 'kode_penjualan', 'barcode', 'gty', 'total_harga'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
