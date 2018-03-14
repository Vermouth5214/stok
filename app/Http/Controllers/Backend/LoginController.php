<?php
namespace App\Http\Controllers\Backend;

use Session;
use App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use App\Http\Validator\UserValidator;
use DB;
use App\Model\User;
use App\Model\Token;

 
class LoginController extends Controller {
	private function generateToken($email)
	{
		$userToken = Hash::make($email . Carbon::now());
		$tokenExp = Carbon::now()->addHours(getenv('TOKEN_EXPIRED'));
		return ['token' => $userToken, 'expired' => $tokenExp];
	}

	private function login(Request $request)
	{
		$data = [
			'request' => $request->all(),
			'response' => [
				'message' => 'An error occured',
				'error' => [],
			],
			'status' => false,
		];

		$validator = UserValidator::login($request->all());

		if( ! $validator['status']) {
			$data['response']['message'] = 'Validation error.';
			$data['response']['error'] = $validator['error'];
			return $data;
		} 

		if( ! empty($request->input('email'))) {
			$user = User::where('email', $request->input('email'))->first();
		} elseif( ! empty($request->input('username'))) {
			$user = User::where('username', $request->input('username'))->first();
		} else {
			$data['message'] = 'Validation error.';
			return $data;
		}

		// Check password
		if( ! Hash::check($request->input('password'), $user->password)) {
			$data['response']['message'] = 'Username / Password not found.';
			$data['response']['error'] = array(['Username / Password not found']);
			return $data;    	
		} else {
			$userToken = $this->generateToken($user->email);
			// Update last_activity and token
			$token = Token::where('user_id',$user->id)->first();
			if(!$token){
				$token = new Token;
				$token->user_id = $user->id;
			}
			$token->token = $userToken['token'];
			$token->token_expired = $userToken['expired'];
			$token->save();
			
			$last_activity = User::find($user->id);
			$last_activity->last_activity = date('Y-m-d H:i:s');
			$last_activity->save();
			
			$infos = User::with('level', 'avatar')->where(['id' => $user->id])->first();

			if(isset($infos)) {
				$info['user_id'] = $infos->id;                              
				$info['user_level_id'] = $infos->level->id;                
				$info['firstname'] = $infos->firstname;
				$info['lastname'] = $infos->lastname;
				$info['email'] = $infos->email;
				$info['active'] = $infos->active;
				$info['register_datetime'] = $infos->register_datetime;            
				$info['created_at'] = $infos->created_at->toDateTimeString();            
				$info['updated_at'] = $infos->updated_at->toDateTimeString();            
				$info['level'] = $infos->level->name;
				$info['username'] = $infos->username;          
				$info['avatar'] = $infos->avatar->url;          
				$info['last_activity'] = $infos->last_activity;     

				$data['status'] = true;
				$data['response']['data']['token'] = $userToken['token'];            
				$data['response']['data']['userinfo'] = $info;            
				$data['response']['message'] = 'Login success.';
			} else {
				$data['response']['message'] = 'No result.';
				$data['response']['data'] = $infos;   
				return $data;      
			}
		}
		return $data;
	}
	
	public function index(Request $request) {
		if($request->isMethod('GET')){
			if(Session::get('userinfo') == ""){
	            return view ('backend.login');
	        }
	        else{
	            return redirect('/backend/dashboard');
	        }
		}
	
		if($request->isMethod('POST')){
			$response = $this->login( $request );
			if ($response['status']) {
				Session::put ('token',$response['response']['data']['token']);
				Session::put ('userinfo',$response['response']['data']['userinfo'] );
				$return = array(
					'status' => true,
					'message' => "Login Success"
				);
				return new JsonResponse($return,200);
			}else{
				$return = array(
					'status' => false,
					'message' => $response['response']['error']
				);
				return new JsonResponse($return, 200);
			}
		}
		return view ('backend.login');
	}

	public function logout(Request $request) {
		$data = [
			'request' => $request->all(),
			'response' => [
				'message' => 'An error occured',
				'error' => [],
			],
			'status' => false,
		];  
		$userinfo = Session::get('userinfo');
		if(Token::where(['user_id' => $userinfo['user_id']])->delete()) {
			$data['status'] = true;
			$data['response']['message'] = 'Logout success.';
			$request->session()->flush();
		} else {
			$data['response']['message'] = 'Logout failed';
		}
        return redirect('/backend/login');
	}	

}