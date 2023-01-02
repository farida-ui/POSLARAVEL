<?php

use App\Penjualan;
use Carbon\Carbon;

function no_invoice(){
    $cek_kode_hari_ini = penjualan::whereDate('created_at', Carbon::today())->count();// 0
    if ($cek_kode_hari_ini == 0){
        $kode_penjualan = 'LM'. date('dmy'). '0001';
        return $kode_penjualan;
    } else{
        $get_penjualan = penjualan::orderBy('id', 'desc')->whereDate('created_at', Carbon::today())->first(); // LM1409220001
        $sub = substr($get_penjualan->kode_penjualan, 8, 4) + 1; //0001 + 1 = 0002

        //00010
        $string = sprintf('%04s', $sub); // 0010
        $kode_penjualan = 'LM'. date('dmy'). $string;
        return $kode_penjualan;

}
}


function rupiah($parameter){
   $string = number_format($parameter, 0, ',', '.');
   return $string;
}
