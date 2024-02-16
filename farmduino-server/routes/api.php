 <?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AIController;
use App\Http\Controllers\ArduinoController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\NewPasswordController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\LogController;
use App\Http\Controllers\PlantController;
use App\Http\Controllers\TickerController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\WeatherController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::group(["prefix" => "v1.0.0"], function () {

    Route::post('/register', [RegisterController::class, "register"]);
    Route::post('/login', [LoginController::class, "login"]);
    Route::post('/check-color', [NewPasswordController::class, "checkColor"]);
    Route::post('/data', [ArduinoController::class, "recieveData"]);

    Route::controller(AuthController::class)->group(function () {
        Route::get('/user-data', [ArduinoController::class, "userReceiveData"]);
        Route::get('/user-last-data', [ArduinoController::class, "userReceiveLastData"]);
        Route::post('/change-email', [UserController::class, "changeEmail"]);
        Route::post('/change-password', [NewPasswordController::class, "newPassword"]);
        Route::get('/weather', [WeatherController::class, "getWeather"]);
        Route::get('/ticker-elements', [TickerController::class, "getTickerElements"]);
        Route::get('/user-logs', [LogController::class, "listUserLogs"]);
        Route::get('/plant-image', [PlantController::class, "getPlantImage"]);
        Route::get('/ai', [AIController::class, "askAI"]);
    });

    Route::group(['middleware' => 'admin.role', 'prefix' => 'admin'], function () {
        Route::get('/logs', [LogController::class, "listUserLogs"]);
        Route::get('/users', [AdminController::class, "listUsers"]);
        Route::get('/user-sensor-data', [AdminController::class, "listUserSensorData"]);
        Route::post('/add-ticker-element', [TickerController::class, "addTickerElement"]);
    });
});
