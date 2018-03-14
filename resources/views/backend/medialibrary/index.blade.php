<?php
	$breadcrumb = [];
	$breadcrumb[0]['title'] = 'Dashboard';
	$breadcrumb[0]['url'] = url('backend/dashboard');
	$breadcrumb[1]['title'] = 'Media Library';
	$breadcrumb[1]['url'] = url('backend/media-library');
?>

<!-- LAYOUT -->
@extends('backend.layouts.main')

<!-- TITLE -->
@section('title', 'Media Library')

<!-- CONTENT -->
@section('content')
	<div class="page-title">
		<div class="title_left">
			<h3>Media Library</h3>
		</div>
		<div class="title_right">
			<div class="col-md-4 col-sm-4 col-xs-8 form-group pull-right top_search">
				<?php
					$userinfo = Session::get('userinfo');
					$access_control = Session::get('access_control');
					if (!empty($access_control)) :
						if ($access_control[$userinfo['user_level_id']]["media-library"] == "a"):
				?>
				<a href="<?=url('/backend/media-library/popup-media/0/0');?>" class="btn-index btn btn-primary btn-block popup_media" title="Add"><i class="fa fa-plus"></i></a>
				<?php
						endif;
					endif;
				?>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	@include('backend.elements.breadcrumb',array('breadcrumb' => $breadcrumb))
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_content">
					@include('backend.elements.notification')
                    <table class="table table-striped table-hover table-bordered dt-responsive nowrap datatable-media-library" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>ID</th>
								<th>Image</th>
								<th>Nama</th>
								<th>Tipe</th>
								<th>Ukuran</th>
								<th>Actions</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>					
	</div>

@endsection

@section('script')
	<script type="text/javascript">
		$(document).ready(function() {
			$(".popup_media").colorbox({
				'width'				: '75%',
				'height'			: '90%',
				'maxWidth'			: '75%',
				'maxHeight'			: '90%',
				'transition'		: 'elastic',
				'scrolling'			: false,

				onComplete			: function() { 
													$( ".tab-content" ).height(0.75 * $( "#cboxLoadedContent" ).height());
													$( ".table-content" ).height($( ".tab-content" ).height()-60);
													$( ".fancybox-inner" ).css('overflow','hidden');
												 },

				onClosed			: function() { 
										$.ajax({
											type: "GET",
											url: "<?=url('backend/media-library/trash');?>",
											success: function(){}
										});
										$('.datatable-media-library').dataTable().fnDestroy();
										$('.datatable-media-library tbody').empty();
										$('.datatable-media-library').dataTable({
											processing: true,
											serverSide: true,
											ajax: "<?=url('backend/media-library/datatable');?>",
											columns: [
												{data: 'id', name: 'id'},
												{data:  'url', render: function ( data, type, row ) {
													url = "<?=url('/')?>";
													var lastPart = data.split("/").pop();
													return "<a class='gallery' target='blank' href='"+url+'/'+data+"'><img width=50px src='"+url+'/upload/img/thumbnails/'+lastPart+"' class='img-responsive'></a>";
												}, orderable: false, searchable: false},				
												{data: 'name', name: 'name'},
												{data: 'type', name: 'type'},
												{data: 'size', name: 'size'},
												{data: 'action', name: 'action', orderable: false, searchable: false}
											],
											responsive: true
										});
									  },
												 
			});
		})
	</script>

	<script>
		$('.datatable-media-library').dataTable({
			processing: true,
			serverSide: true,
			ajax: "<?=url('backend/media-library/datatable');?>",
			columns: [
				{data: 'id', name: 'id'},
				{data:  'url', render: function ( data, type, row ) {
					url = "<?=url('/')?>";
					var lastPart = data.split("/").pop();
					return "<a class='gallery' target='blank' href='"+url+'/'+data+"'><img width=50px src='"+url+'/upload/img/thumbnails/'+lastPart+"' class='img-responsive'></a>";
                }, orderable: false, searchable: false},				
				{data: 'name', name: 'name'},
				{data: 'type', name: 'type'},
				{data: 'size', name: 'size'},
				{data: 'action', name: 'action', orderable: false, searchable: false}
			],
			responsive: true
		});
	</script>	
	
	@include('backend.partials.colorbox')
@endsection