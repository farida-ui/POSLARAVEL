<?php

namespace App\Http\Controllers;

use App\barang;
//use App\Imports\barangImport;
//use Maatwebsite\Excel\Facades\Excel;
use App\supplier;
use Illuminate\Http\Request;

class BarangController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $title = 'Barang';
        $barang = barang::orderBy('id','desc')->get();
        return view('barang.index', compact('title', 'barang'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $title = 'Barang';
        $supplier = supplier::all();
        return view('barang.create', compact('title', 'supplier'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       barang::create($request->all());
       return redirect('/barang')->with('succes', 'Data barang berhasil tersimpan');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\barang  $barang
     * @return \Illuminate\Http\Response
     */
    public function show(barang $barang)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\barang  $barang
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $title = 'Barang';
        $supplier = supplier::all();
        $barang = barang::find($id); 
        return view('barang.edit', compact('title', 'supplier', 'barang'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\barang  $barang
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //dd($request->all());
        $barang = barang::find($id);
        $barang->supplier_id = $request->supplier_id;
        $barang->barcode = $request->barcode;
        $barang->nama = $request->nama;
        $barang->satuan = $request->satuan;
        $barang->stok = $request->stok;
        $barang->harga_beli = $request->harga_beli;
        $barang->harga_jual = $request->harga_jual;
        $barang->profit = $request->profit;
        $barang->save();
        return redirect('/barang')->with('success', 'Data barang berhasil terupdate');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\barang  $barang
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $barang = barang::find($id);
        $barang->delete();
        return redirect('/barang')->with('success', 'Data barang berhasil terhapus');
    }

    /*public function import(Request $request) 
    {
        $request->validate(
            [
                'file' => 'mimes:xls,xlsx,csv'
            ]
        );
      $file = $request->file('file');
      Excel::import(new barangImport, $file);
        
        return redirect('/barang')->with('success', 'Data barang berhasil terimport');
    }*/
}
