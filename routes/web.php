<?php

use App\Http\Controllers\AppFormulaireController;
use App\Models\Vehicule;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();
Route::middleware(['auth'])->group(function () {
    Route::get('/',[AppFormulaireController::class, 'gotoView'])->name('home');
    Route::post('/store',[AppFormulaireController::class, 'store'])->name('vehicule.store');
    Route::get('/print/{code}', function ($code) {
        $vehiculeInfo = Vehicule::where("code", $code)->first();
        $qrcodeData = [
            'code'=>$vehiculeInfo->code,
            'serie'=>$vehiculeInfo->serie,
            'plaque'=>$vehiculeInfo->plaque,
            'chassis'=>$vehiculeInfo->chassis,
        ];
        return view('printing.qrcode', ['code'=> $code, 'qrcode_data'=>json_encode($qrcodeData)]);
    });
 });