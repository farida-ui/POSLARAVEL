<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class barang extends Model
{
    protected $table = "barang";
    protected $fillable = ['supplier_id','barcode', 'nama', 'satuan', 'stok', 'harga_beli', 'harga_jual', 'profit'];

    public function supplier()
    {
        return $this->belongsTo(supplier::class);
    }
}
