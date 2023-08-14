<?php include "layout/head.php"; ?>
</head>
<body>
<?php include "layout/loader.php"; ?>
<div class="main-wrapper">
	<?php include "layout/header.php"; ?>
	<?php include "layout/sidebar.php"; ?>
	<div class="page-wrapper pagehead">
		<div class="content">
		<?php 
		if($tipe==''){
		?>
			<div class="page-header">
				<div class="page-title">
					<h4>Daftar Pengguna</h4>
					<h6></h6>
					<input type="hidden" id="idptks" value="<?=$tipe;?>" />
				</div>
				<div class="page-btn">
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<input type="hidden" name="tapel" id="tapel" class="form-control" value="<?=$tapel;?>" placeholder="Username">
					<input type="hidden" name="smt" id="smt" class="form-control" value="<?=$smt;?>" placeholder="Username">
					
						<div class="row">
								<div class="col-lg-2 col-sm-6 col-12">
									<div class="form-group">
										<select class="select" id="stst" name="stst">
											<option value="1">Verifikasi</option>
											<option value="0">Pending</option>
										</select>
									</div>
								</div>
								<div class="col-lg-3 col-sm-6 col-12">
									<div class="form-group">
										
									</div>
								</div>
								<div class="col-lg-3 col-sm-6 col-12">
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
										<th>Pengguna</th>
										<th>Nama Lengkap</th>
										<th>Level</th>
										<th>Aksi</th>
									</tr>
								</thead>
								<tbody>				
								</tbody>
							</table>
					</div>
					<!-- Modal -->
									<div class="modal fade" id="tempatkan" tabindex="-1" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Tempatkan di Kelas?</h5>
													<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<form id="penempatanForm" method="POST" action="modul/siswa/penempatan.php" class="form">
													<div class="tempatkan-data"></div>
												</form>
											</div>
										</div>
									</div>
									<div class="modal" id="mutasikan" tabindex="-1" role="dialog">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Mutasikan Siswa?</h5>
													<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<form id="mutasiForm" method="POST" action="modul/siswa/mutasi.php" class="form">
													<div class="mutasikan-data"></div>
												</form>
											</div>
										</div>
									</div>
					

				</div>
			</div>
		</div>
	</div>
		<?php 
		}else{ 
			$idr=$tipe;
						$infouser = $connect->query("select * from pengguna where id='$idr'")->fetch_assoc();
						$idn = $infouser['ptk_id'];
						$infoptk = $connect->query("select * from ptk where ptk_id='$idn'")->fetch_assoc();
		?>
			<div class="page-header">
				<div class="page-title">
					<h4><?=$infoptk['nama'];?></h4>
					<h6>Info Pengguna</h6>
					<input type="hidden" id="idptks" value="<?=$tipe;?>" />
					<input type="hidden" id="urls" value="<?=base_url();?>" />
				</div>
				<div class="page-btn">
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<form class="p-3" action="<?=base_url();?>modul/kepegawaian/ubah-password.php" autocomplete="off" method="POST" id="updatePTK">
													<h4 class="mb-3 font-weight-semibold text-dark">Personal Information</h4>
													<div class="row">
														<div class="form-group col-md-6">
															<label for="inputCity">Nama Pengguna</label>
															<input type="text" class="form-control" name="pengguna" value="<?=$infouser['username'];?>" required>
															<input type="hidden" class="form-control" name="ptkid" value="<?=$infoptk['ptk_id'];?>" required>
															<input type="hidden" class="form-control" name="idu" value="<?=$infouser['id'];?>" required>
														</div>
														<div class="form-group col-md-6 border-top-0 pt-0">
															<label for="inputZip">Kata Sandi</label>
															<input type="password" class="form-control" name="katasandi">
														</div>
													</div>
													<div class="row">
														<div class="col-md-12 text-end mt-3">
															<a href="<?=base_url();?>pengguna" class="btn btn-info">Kembali</a>
															<button type="submit" class="btn btn-primary">Update Password</button>
														</div>
													</div>

												</form>
				</div>
			</div>
		<?php } ?>
</div>
<?php include "layout/script.php";?>
<script src="<?=base_url();?>ajax/pengguna.js"></script>
