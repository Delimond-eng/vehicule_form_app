<?php

use App\Http\Controllers\AppFormulaireController;
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
Route::get('/',[AppFormulaireController::class, 'gotoView'])->name('home');
Route::post('/store',[AppFormulaireController::class, 'store'])->name('vehicule.store');
Route::get('/print/{code}', function ($code) {
    return view('printing.qrcode', ['code'=> $code]);
});