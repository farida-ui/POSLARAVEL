<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class detail_penjualan extends Model
{
    protected $table = "detail_penjualan";
    protected $fillable = ['kode_penjualan', 'total_pembayaran', 'pembayaran', 'kembalian'];
}
