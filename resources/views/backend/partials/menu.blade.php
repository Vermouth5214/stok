<!-- sidebar menu -->
<?php
	$segment =  Request::segment(2);
	$sub_segment =  Request::segment(3);
?>
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
	<div class="menu_section">
		<ul class="nav side-menu">
			<li class="{{ ($segment == 'dashboard' ? 'active' : '') }}">
				<a href="<?=url('backend/dashboard');?>"><i class="fa fa-dashboard"></i> Dashboard</a>
            </li>
            <li class="{{ ($segment == 'setting' ? 'active' : '') }}">
                <a href="<?=url('backend/setting');?>"><i class="fa fa-cog"></i>Setting</a>
            </li>
            <?php
                // SUPER ADMIN //
                if ($userinfo['user_level_id'] == 1):

            ?>
			<li class=" {{ ((($segment == 'setting') || ($segment == 'modules') || ($segment == 'access-control')) ? 'active' : '') }}">
				<a><i class="fa fa-cog"></i> System Admin <span class="fa fa-chevron-down"></span></a>
				<ul class="nav child_menu" style="{{ ((($segment == 'setting') || ($segment == 'modules') || ($segment == 'access-control')) ? 'display : block' : '') }}">
					<li class="{{ ($segment == 'setting' ? 'active' : '') }}">
						<a href="<?=url('backend/setting');?>">General Setting</a>
					</li>
					<li class="{{ ($segment == 'modules' ? 'active' : '') }}">
						<a href="<?=url('backend/modules');?>">Modules</a>
					</li>
					<li class="{{ ($segment == 'access-control' ? 'active' : '') }}">
						<a href="<?=url('backend/access-control');?>">Access Control</a>
					</li>
				</ul>
			</li>
			<li class=" {{ ((($segment == 'users-level') || ($segment == 'users-user')) ? 'active' : '') }}">
				<a><i class="fa fa-users"></i> Membership <span class="fa fa-chevron-down"></span></a>
				<ul class="nav child_menu">
					<li class="{{ ($segment == 'users-level' ? 'active' : '') }}">
						<a href="<?=url('backend/users-level');?>">Master User Level</a>
					</li>
					<li class="{{ ($segment == 'users-user' ? 'active' : '') }}">
						<a href="<?=url('backend/users-user');?>">Master User</a>
					</li>
				</ul>
			</li>
			<li class="{{ ($segment == 'media-library' ? 'active' : '') }}">
				<a href="<?=url('backend/media-library');?>"><i class="fa fa-picture-o"></i> Media Library</a>
            </li>
            <?php
                endif;
            ?>
			<li class="{{ ($segment == 'supplier' ? 'active' : '') }}">
				<a href="<?=url('backend/supplier');?>"><i class="fa fa-suitcase"></i> Master Supplier</a>
            </li>
			<li class="{{ ($segment == 'barang' ? 'active' : '') }}">
				<a href="<?=url('backend/barang');?>"><i class="fa fa-file"></i> Master Barang</a>
            </li>
			<li class="{{ ($segment == 'inden' ? 'active' : '') }}">
				<a href="<?=url('backend/inden');?>"><i class="fa fa-shopping-cart"></i> Daftar Inden</a>
			</li>
			<li class="{{ ($segment == 'purchase-order' ? 'active' : '') }}">
				<a href="<?=url('backend/purchase-order');?>"><i class="fa fa-shopping-cart"></i> Purchase Order</a>
			</li>
			<li class="{{ ($segment == 'penjualan' ? 'active' : '') }}">
				<a href="<?=url('backend/penjualan');?>"><i class="fa fa-credit-card"></i> Penjualan</a>
			</li>
			<li class="{{ ($segment == 'koreksi-stok-total' ? 'active' : '') }}">
                <a href="<?=url('backend/koreksi-stok-total');?>"><i class="fa fa-cogs"></i> Koreksi Stok Total</a>
            </li>
		</ul>
	</div>
</div>

