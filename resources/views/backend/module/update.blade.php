<?php
	$breadcrumb = [];
	$breadcrumb[0]['title'] = 'Dashboard';
	$breadcrumb[0]['url'] = url('backend/dashboard');
	$breadcrumb[1]['title'] = 'Modules';
	$breadcrumb[1]['url'] = url('backend/modul');
	$breadcrumb[2]['title'] = 'Add';
	$breadcrumb[2]['url'] = url('backend/modules/create');
	if (isset($data)){
		$breadcrumb[2]['title'] = 'Edit';
		$breadcrumb[2]['url'] = url('backend/modules/'.$data[0]->id.'/edit');
	}
?>

<!-- LAYOUT -->
@extends('backend.layouts.main')

<!-- TITLE -->
@section('title')
	<?php
		$mode = "Create";
		if (isset($data)){
			$mode = "Edit";
		}
	?>
    Modules - <?=$mode;?>
@endsection

<!-- CONTENT -->
@section('content')
	<?php
		$name = old('name');
		$slug = old('slug');
		$active = 1;
		$method = "POST";
		$mode = "Create";
		$url = "backend/modules";
		if (isset($data)){
			$name = $data[0]->name;
			$slug = $data[0]->slug;
			$active = $data[0]->active;
			$method = "PUT";
			$mode = "Edit";
			$url = "backend/modules/".$data[0]->id;
		}
	?>
	<div class="page-title">
		<div class="title_left">
			<h3>Modules</h3>
		</div>
		<div class="title_right">
			<div class="col-md-4 col-sm-4 col-xs-8 form-group pull-right top_search">
				<a href="<?=url('/backend/modules');?>" class="btn-index btn btn-primary btn-block" title="Back"><i class="fa fa-arrow-left"></i></a>
			</div>
        </div>
        <div class="clearfix"></div>
		@include('backend.elements.breadcrumb',array('breadcrumb' => $breadcrumb))
	</div>
	<div class="clearfix"></div>
	<br/><br/>	
	<div class="row">
		<div class="col-xs-12">
			<div class="x_panel">
				<div class="x_content">
					{{ Form::open(['url' => $url, 'method' => $method,'class' => 'form-horizontal']) }}
						{!! csrf_field() !!}
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Name <span class="required">*</span></label>
							<div class="col-sm-7 col-xs-12">
								<input type="text" id="name" name="name" required="required" class="form-control" value="<?=$name;?>" autofocus>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">Slug <span class="required">*</span></label>
							<div class="col-sm-7 col-xs-12">
								<input type="text" id="name" name="slug" required="required" class="form-control" value="<?=$slug;?>">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Status </label>
							<div class="col-sm-5 col-xs-12">
								{{
								Form::select(
									'active',
									['1' => 'Active', '2' => 'Deactive'],
									$active,
									array(
										'class' => 'form-control',
									))
								}}								
							</div>
						</div>
						<div class="ln_solid"></div>
						<div class="form-group">
							<div class="col-sm-6 col-xs-12 col-sm-offset-3">
								<a href="<?=url('/backend/modules')?>" class="btn btn-warning">Cancel</a>
								<button type="submit" class="btn btn-primary">Submit </button>
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