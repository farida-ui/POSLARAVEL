<?php

namespace App\Http\Controllers;

use App\barang;
use App\penjualan;
use App\detail_penjualan;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class PenjualanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($kode_penjualan)
    {
        $title = 'Penjualan';
        $penjualan = DB::table('penjualan')
        ->join('barang', 'penjualan.barcode','=', 'barang.barcode')
        ->select('penjualan.*', 'barang.*', 'penjualan.id as id_penjualan')
        ->where('penjualan.kode_penjualan', $kode_penjualan)
        ->get();
        return view('penjualan.index',compact('title', 'penjualan'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       //dd($request->all());
       $barang = barang::where('barcode', $request->barcode)->first();

       $penjualan = new penjualan;
       $penjualan->user_id = Auth::user()->id;
       $penjualan->kode_penjualan = $request->kode_penjualan;
       $penjualan->barcode = $request->barcode;
       $penjualan->qty = 1; 
       $penjualan->total_harga = $barang->harga_jual * 1;
       $penjualan->save();
       
       return redirect('/penjualan/' .$request->kode_penjualan);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\penjualan  $penjualan
     * @return \Illuminate\Http\Response
     */
    public function show(penjualan $penjualan)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\penjualan  $penjualan
     * @return \Illuminate\Http\Response
     */
    public function edit(penjualan $penjualan)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\penjualan  $penjualan
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, penjualan $penjualan)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\penjualan  $penjualan
     * @return \Illuminate\Http\Response
     */
    public function destroy(penjualan $penjualan)
    {
        //
    }

    public function tambah_qty($id_penjualan)
    {
       //dd($id_penjualan);
       $penjualan = DB::table('penjualan')->where('id', $id_penjualan)->first();
       $barang = DB::table('barang')->where('barcode', $penjualan->barcode)->first();

       $update_stok_barang = DB::table('barang')
       ->where('barcode', $penjualan->barcode)
       ->update(['stok' => DB::raw('stok-1')]);

       $update_qty_penjualan = DB::table('penjualan')
       ->where('id', $penjualan->id)
       ->update([
        'qty' => DB::raw('qty + 1'),
        'total_harga' => DB::raw("total_harga + $barang->harga_jual"),
       ]);

       return redirect('/penjualan/' . $penjualan->kode_penjualan);
    }


    public function kurangi_qty($id_penjualan)
    {
       //dd($id_penjualan);
       $penjualan = DB::table('penjualan')->where('id', $id_penjualan)->first();

       if ($penjualan->qty == 1){
        echo "<script>
        alert('Ups.. qty sudah 1')
        window.location.href= '/penjualan/$penjualan->kode_penjualan'
        </script>";
       } else {
        $barang = DB::table('barang')->where('barcode', $penjualan->barcode)->first();

        $update_stok_barang = DB::table('barang')
        ->where('barcode', $penjualan->barcode)
        ->update(['stok' => DB::raw('stok + 1')]);
 
        $update_qty_penjualan = DB::table('penjualan')
        ->where('id', $penjualan->id)
        ->update([
         'qty' => DB::raw('qty - 1'),
         'total_harga' => DB::raw("total_harga - $barang->harga_jual"),
        ]);
 
        return redirect('/penjualan/' . $penjualan->kode_penjualan);
       }
    }


    public function hapus($id_penjualan)
    {
       //dd($id_penjualan);
       $penjualan = DB::table('penjualan')->where('id', $id_penjualan)->first();

       $update_stok_barang = DB::table('barang')
       ->where('barcode', $penjualan->barcode)
       ->update(['stok' => DB::raw("stok + $penjualan->qty")]);


       DB::table('penjualan')->where('id', $id_penjualan)->delete();

       return redirect('/penjualan/' . $penjualan->kode_penjualan);
    }

    public function simpan_transaksi(Request $request)
    {

        //dd($request);
       detail_penjualan::create($request->all());
        // echo json_encode()
        //dd($data);
        return response()->json([
            'success' => true,
            'message' => 'Data transaksi berhasil tersimpan',
        ]);
    }

    public function struk($kode_penjualan)
    {
        $penjualan = DB::table('penjualan')
        ->join('barang', 'penjualan.barcode','=', 'barang.barcode')
        ->select('penjualan.*', 'barang.*', 'penjualan.id as id_penjualan')
        ->where('penjualan.kode_penjualan', $kode_penjualan)
        ->get();
        $detail_penjualan = detail_penjualan::where('kode_penjualan', $kode_penjualan)->first();
       return view('penjualan.struk', compact('penjualan', 'detail_penjualan'));
    }
}
