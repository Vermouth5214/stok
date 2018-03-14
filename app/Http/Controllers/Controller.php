<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use View;
use App\Model\Setting;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

	public function _getData($column){
		$setting = Setting::where('name',$column)->get();
		return $setting[0]->value;
	}
	
	public function __construct() {
		$web_title = $this->_getData('title');
		$logo = url('img/logo.png');
		if ($this->_getData('logo') != ''){
			$logo = url($this->_getData('logo'));
		}
		$email_admin_notifikasi = $this->_getData('email_admin');
		$email_server_from = $this->_getData('email_server');
		$company_name = $this->_getData('company_name');
		$company_description = $this->_getData('company_description');
		
		$this->setting['web_title'] = $web_title;
		$this->setting['logo'] = $logo;
		$this->setting['email_admin_notifikasi'] = $email_admin_notifikasi;
		$this->setting['email_server_from'] = $email_server_from;
		$this->setting['company_name'] = $company_name;
		$this->setting['company_description'] = $company_description;
		
		View::share('setting', $this->setting);
	}
        
}