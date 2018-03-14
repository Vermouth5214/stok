<?php 

namespace App\Http\Validator;

use Carbon\Carbon;
use App\Model\User;
use App\Model\Token;

class TokenValidator
{
	public static function check($token)
	{
		$token = Token::where(['token' => $token])->first();
		if($token) {
			$user = User::find($token->user_id);
			return ['token'=>$token,'user'=>$user];
		} else {
			return false;
		}
	}

	public static function validate($token)
	{
		$token = Token::select('token_expired')->where(['token' => $token])->first();
		
		if($token) {
			$now = Carbon::now();
			$tokenExpired = Carbon::parse($token->token_expired);
			$compare = $now->gt($tokenExpired);

			if($now->lt($tokenExpired)) {
				return true;
			}
		}
		return false;
	}

}