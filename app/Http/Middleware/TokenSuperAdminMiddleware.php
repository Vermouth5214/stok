<?php

namespace App\Http\Middleware;

use Cache;
use Closure;
use Session;
use App\Model\User;
use App\Helpers\API;

class TokenSuperAdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(!Session::get('token')) {
            return redirect('/backend/login');
        }else{
			$userinfo = Session::get('userinfo');
			//SUPER ADMIN
        	if($userinfo['user_level_id'] !=1){
                return redirect('/backend');
            }
        }
        return $next($request);
    }
}