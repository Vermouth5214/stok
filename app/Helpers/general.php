<?php

use Illuminate\Support\Facades\Cache;
use App\Model\User;
use App\Model\AccessControl;


function getUserAccess($id){
	$access_control = AccessControl::with('module')->where('user_level_id', $id)->get();
	$role = [];
	foreach ($access_control as $data):
		$role[$data->user_level_id][$data->module->slug] = $data->content;
	endforeach;
	return $role;
}

function getMediaCount($id){
	$total = 0;
	$count_user = User::where('avatar_id',$id)->count();
		
	$total = $count_user; 
	return $total;
}
