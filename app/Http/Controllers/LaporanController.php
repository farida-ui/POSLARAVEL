<?php

namespace App\Http\Controllers;
use App\penjualan;
use PDF;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LaporanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $penjualan = penjualan::orderBy('id', 'desc')->get();
        return view('laporan', compact('penjualan'));
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function pdf()
    {

       $penjualan = penjualan::select('*')->join('users', 'penjualan.user_id', '=', 'users.id')
        //->join('detail_penjualan', 'penjualan.kode_penjualan', '=', 'detail_penjualan.kode_penjualan')->get();
        ->join('barang', 'penjualan.barcode', '=', 'barang.barcode')
        ->get();
        //$pdf = PDF::loadView('laporan_pdf', $penjualan);
        //return $pdf->download('Laporan penjualan.pdf');
        $pdf = PDF::loadView('laporan_pdf', compact('penjualan'))->setPaper('A4', 'potrait');
        return $pdf->stream();
        //return view('laporan_pdf', compact('penjualan'));

    }

    public function pertanggal(Request $request)
    {
       //dd($request->all());
       $tanggal_awal = $request->tanggal_awal . '00:00:00';
       $tanggal_akhir = $request->tanggal_akhir . '23:59:59';


       $tanggal1 = $request->tanggal_awal;
       $tanggal2 = $request->tanggal_akhir;


    //    $penjualan = DB::table('penjualan')
    //    ->join('users', 'penjualan.user_id', '=', 'users.id')
    //    ->join('barang', 'penjualan.barcode', '=', 'barang.barcode')
    //    ->select('penjualan.*', 'users.*', 'barang.*')
    //    ->whereBetween('penjualan.created_at', [$tanggal_awal, $tanggal_akhir])
    //    ->get();

       $penjualan = penjualan::select('*')
                    ->join('users', 'penjualan.user_id', '=', 'users.id')
                    ->join('barang', 'penjualan.barcode', '=', 'barang.barcode')
                    ->whereBetween('penjualan.created_at', [$tanggal1, $tanggal2])
                    ->get();

       // $penjualan = DB::select("SELECT * FROM penjualan p INNER JOIN users u on u.id = p.user_id 
       // INNER JOIN barang b on b.barcode = p.barcode
       // WHERE p.created_at BETWEEN '$tanggal1' AND '$tanggal2'
       // ");

       // dd($penjualan);
        //return view('laporan_pdf_pertanggal', compact('penjualan', 'tanggal1', 'tanggal2'));
      $pdf = PDF::loadView('laporan_pdf_pertanggal', compact('penjualan', 'tanggal1', 'tanggal2'));
      return $pdf->download('Laporan penjualan' . $tanggal1 .'-' .$tanggal2 .'.pdf');
    }
}
