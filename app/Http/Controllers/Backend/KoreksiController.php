<?php

namespace App\Http\Controllers\Backend;

use Session;
use App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Model\Barang;
use App\Model\Stok;
use Illuminate\Support\Facades\Redirect;
use View;
 
class KoreksiController extends Controller {
	public function koreksi_total(Request $request) {
		return view ('backend.koreksi.koreksi_total');
	}
	
    public function koreksi_total_update(Request $request)
    {
        $barang = Barang::where('active', '!=', 0)->orderBy('id', 'ASC')->get();
        foreach ($barang as $detail):
            $sum = Stok::where('id_barang', '=', $detail->id)->sum('jumlah');
            $res = Barang::find($detail->id);
            $res->stok_total = $res->stok_awal + $sum;
            $res->save();
        endforeach;
        return Redirect::to('/backend/koreksi-stok-total/')->with('success', "Data saved successfully")->with('mode', 'success');
    }
}