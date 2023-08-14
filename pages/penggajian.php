<?php include "layout/head.php"; ?>
</head>
<body>
<?php include "layout/loader.php"; ?>
<div class="main-wrapper">
	<?php include "layout/header.php"; ?>
	<?php include "layout/sidebar.php"; ?>
	<div class="page-wrapper pagehead">
		<div class="content">
			<div class="page-header">
				<div class="page-title">
					<h4>Penggajian Pegawai</h4>
					<h6></h6>
				</div>
				<div class="page-btn">
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<input type="hidden" name="tapel" id="tapel" class="form-control" value="<?=$tapel;?>" placeholder="Username">
					<input type="hidden" name="smt" id="smt" class="form-control" value="<?=$smt;?>" placeholder="Username">
					
						<div class="row">
								<div class="col-lg-4 col-sm-6 col-12">
									<div class="form-group">
										
									</div>
								</div>
								<div class="col-lg-4 col-sm-6 col-12">
									<div class="form-group">
										
									</div>
								</div>
								<div class="col-lg-4 col-sm-6 col-12">
									<div class="form-group">
										
									</div>
								</div>
							</div>
						
					<div class="table-responsive">
						<table class="table table-bordered table-striped" id="kt_table_users">
								<thead>
									<tr>
										<th>ID Peg</th>
										<th>Nama Pegawai</th>
										<th>Insentif/jam</th>
										<th>Transport</th>
										<th>Jabatan</th>
										<th>Tunj. Kepsek</th>
										<th>Kehadiran</th>
										<th>Ekskul</th>
									</tr>
								</thead>
								<tbody>				
								</tbody>
							</table>
					</div>
					<!-- Modal -->
									
					

				</div>
			</div>
		</div>
	</div>
</div>
<?php include "layout/script.php";?>
<script src="<?=base_url();?>ajax/penggajian.js"></script>
