<?php
	$breadcrumb = [];
	$breadcrumb[0]['title'] = 'Dashboard';
	$breadcrumb[0]['url'] = url('backend/dashboard');
	$breadcrumb[1]['title'] = 'Setting';
	$breadcrumb[1]['url'] = url('backend/setting');
?>

<!-- LAYOUT -->
@extends('backend.layouts.main')

<!-- TITLE -->
@section('title', 'General Setting')

<!-- CONTENT -->
@section('content')
	<div class="page-title">
		<div class="title_left" style="width : 100%">
			<h3>General Setting</h3>
		</div>
	</div>
	<div class="clearfix"></div>
	@include('backend.elements.breadcrumb',array('breadcrumb' => $breadcrumb))
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_content">
					@include('backend.elements.notification')
					{{ Form::open(['url' => 'backend/setting', 'method' => 'POST','class' => 'form-horizontal', 'files' => true]) }}
						{!! csrf_field() !!}
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Company Name</label>
							<div class="col-sm-9 col-xs-12">
								<input type="text" class="form-control" name="7" placeholder="Company Name" autocomplete="off" value="<?=$setting['company_name']?>" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Company Description</label>
							<div class="col-sm-9 col-xs-12">
								<textarea type="text" class="form-control" name="8" rows=5><?=$setting['company_description']?> </textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Website Title</label>
							<div class="col-sm-9 col-xs-12">
								<input type="text" class="form-control" name="1" placeholder="Title" autocomplete="off" value="<?=$setting['web_title']?>" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Website Logo</label>
							<div class="col-sm-4 col-xs-12">
								<input type="file" name="logo" data-plugin="dropify" data-default-file="<?=$setting['logo'];?>"/>
								<input type="hidden" name="default_logo" value=<?=$setting['logo']?>>
								<br/>
								<img src="<?=$setting['logo']?>" class="img-responsive" width=100>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Email Admin</label>
							<div class="col-sm-9 col-xs-12">
								<textarea type="text" class="form-control" name="3" rows=5><?=$setting['email_admin_notifikasi']?> </textarea>
								<span class="text-help">
											If there is more than one email, use enter as delimiter<br/>
											Example :<br/>
											email_1<br/>
											email_2
								</span>
							</div>
						</div>
						<br/>
						<div class="form-group">
							<div class="col-xs-12 col-sm-9 col-sm-offset-3">
								<button type="submit" class="btn btn-primary btn-block">Submit </button>
							</div>
						</div>
					{{ Form::close() }}
				</div>
			</div>
		</div>
	</div>
@endsection

<!-- CSS -->
@section('css')
	
@endsection

<!-- JAVASCRIPT -->
@section('script')
	
@endsection