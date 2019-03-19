<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
$router = app('Dingo\Api\Routing\Router');
$router->version('v1', function (\Dingo\Api\Routing\Router $router) {
    $router->group([
        'namespace' => 'App\Http\Controllers',
    ], function (\Dingo\Api\Routing\Router $router) {

        $router->group([
            'middleware' => 'auth:api',
        ], function (\Dingo\Api\Routing\Router $router) {

            $router->post('logout', 'Auth\LoginController@logout');

            $router->get('/user', function (Request $request) {
                return $request->user();
            });
            $router->patch('settings/profile', 'Settings\ProfileController@update');
            $router->patch('settings/password', 'Settings\PasswordController@update');

        });
        $router->group(['middleware' => 'guest:api'], function (\Dingo\Api\Routing\Router $router) {
            $router->post('login', 'Auth\LoginController@login');
            $router->post('register', 'Auth\RegisterController@register');
            $router->post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail');
            $router->post('password/reset', 'Auth\ResetPasswordController@reset');

            $router->post('oauth/{driver}', 'Auth\OAuthController@redirectToProvider');
            $router->get('oauth/{driver}/callback', 'Auth\OAuthController@handleProviderCallback')->name('oauth.callback');
        });

    });


});





