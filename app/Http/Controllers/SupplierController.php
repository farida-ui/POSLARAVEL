<?php

namespace App\Http\Controllers;

use App\supplier;
use Illuminate\Http\Request;
//use Illuminate\Support\Facades\DB;

class SupplierController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $title = 'Supplier';
        $supplier = supplier::orderBy('id','desc')->get();
        return view('supplier.index', compact('title', 'supplier'));
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
        //dd
        supplier::create($request->all());
        return redirect('/supplier')->with('success', 'Data supplier berhasil tersimpan');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\supplier  $supplier
     * @return \Illuminate\Http\Response
     */
    public function show(supplier $supplier)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\supplier  $supplier
     * @return \Illuminate\Http\Response
     */
    public function edit(supplier $supplier)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\supplier  $supplier
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $supplier = supplier::find($id);
        $supplier->nama = $request->editnama;
        $supplier->keterangan = $request->editketerangan;
        $supplier->save();
        return redirect('/supplier')->with('success', 'Data supplier berhasil terupdate');  
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\supplier  $supplier
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $supplier = supplier::find($id);
        $supplier->delete();
        //DB::table('supplier')->where('id', $id)->delete();
        return redirect('/supplier')->with('success', 'Data supplier berhasil terhapus');
    }
}
