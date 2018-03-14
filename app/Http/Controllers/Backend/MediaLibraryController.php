<?php
namespace App\Http\Controllers\Backend;

use Session;
use Illuminate\Http\Request;
use App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use App\Helpers\UploadHandler;
use App\Model\MediaLibrary;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Redirect;
use Datatables;


class MediaLibraryController extends Controller {
	public function index(Request $request) {
		return view ('backend.medialibrary.index');
	}
	
	public function popup_media($from = null, $id_count = null) {
		return view ('backend.medialibrary.view')->with('from', $from)->with('id_count', $id_count);
	}

	public function upload(Request $request) {
		$userinfo = Session::get('userinfo');
		$upload_handler = new UploadHandler;
		$info = $upload_handler->post();
		if(isset($info[0]->name) && (!isset($info[0]->error)))
		{
			$data = new MediaLibrary();
			$name = substr($info[0]->name, 0 , strripos($info[0]->name, '.'));
			$path_parts = pathinfo($info[0]->name);
			$name = $path_parts['filename'];
			$type = $path_parts['extension'];
			$data->name = $name;
			$data->type = $type;
			$data->url = "upload/img/".$name.".".$type;
			$data->size = $info[0]->size;
			$data->user_created = $userinfo['user_id'];
			$data->save();
		}
	}

	public function trash(Request $request) {
		array_map('unlink', glob("upload/img/thumbnails/trash/*"));
	}

	public function destroy(Request $request, $id){
		$count = getMediaCount($id);
		if ($count > 0){
			Session::flash('success', 'This image is currently associated with the following database(s)');
			Session::flash('mode', 'danger');
			return new JsonResponse(["status"=>true]);
		} else {
			$data = MediaLibrary::find($id);
			if ($data->delete()){
				unlink('upload/img/'.$data->name.'.'.$data->type);
				unlink('upload/img/thumbnails/'.$data->name.'.'.$data->type);
			}
			Session::flash('success', 'Data deleted successfully');
			Session::flash('mode', 'success');
			return new JsonResponse(["status"=>true]);
		}		
	}
	
	public function datatable() {
		$medialibrary = MediaLibrary::where('id','>',0);
	
        return Datatables::of($medialibrary)
			->addColumn('action', function ($medialibrary) {
				$userinfo = Session::get('userinfo');
				$access_control = Session::get('access_control');
				$segment =  \Request::segment(2);
				$url = url('backend/media-library/'.$medialibrary->id);

				if (!empty($access_control)) {
					if ($access_control[$userinfo['user_level_id']][$segment] == "a"){
						return "<button data-url='".$url."' onclick='deleteData(this)' class='btn btn-danger'><i class='fa fa-trash-o'></i></button>";
					}
				} else {
					return "";
				}
            })			
            ->make(true);		
	}	
}