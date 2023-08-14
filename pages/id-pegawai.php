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
					<h4>ID Pegawai</h4>
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
								<div class="col-lg-4 col-sm-6 col-12">
									<div class="form-group">
										<button type="button" class="mb-1 mt-1 me-1 btn btn-sm btn-default" data-bs-toggle="modal" data-bs-target="#tambahTema" id="addTemaModalBtn"><i class="fas fa-sync"></i> Tambah ID Pegawai</button>
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
						<table class="table table-bordered table-striped" id="temaTable">
								<thead>
									<tr>
										<th width="20%">ID Pegawai</th>
										<th width="60%">Nama Pegawai</th>
										<th width="20%">Aksi</th>
									</tr>
								</thead>
								<tbody>				
								</tbody>
							</table>
					</div>
					<!-- Modal -->
									<div class="modal fade" id="editTema" tabindex="-1" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Edit ID Pegawai</h5>
													<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<form id="updateTemaForm" method="POST" action="modul/kepegawaian/update-idpegawai.php" class="form">
													<div class="tema-data"></div>
												</form>
											</div>
										</div>
									</div>
									
									<div class="modal" id="tambahTema" tabindex="-1" role="dialog">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Tambah ID Pegawai</h5>
													<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<form id="createTemaForm" method="POST" action="modul/kepegawaian/simpanID.php" class="form">
													<div class="modal-body">
														<div class="form-group form-group-default">
															<label for="output-device">ID Pegawai</label>
															<input type="text" class="form-control" id="idNasabah" name="idNasabah" placeholder="ID Pegawai" autocomplete=off>
														</div>
														<div class="form-group form-group-default">
															<label>Guru</label>
															<select id="idsis" class="form-control selectguru" style="width: 100%;" name="idsis">
																<option>Pilih Guru</option>
																<?php 
																$sql4 = "select * from ptk where status_keaktifan_id=1 order by nama asc";
																$query4 = $connect->query($sql4);
																while($nk=mysqli_fetch_array($query4)){
																?>
																<option value="<?php echo $nk['ptk_id']; ?>"><?=$nk['nama']; ?></option>
																<?php };?>
															</select>														
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
														<button type="submit" class="btn btn-primary" data-kt-users-modal-action="submit">Simpan
														</button>
													</div>
												</form>
											</div>
										</div>
									</div>
					

				</div>
			</div>
		</div>
	</div>
</div>
<?php include "layout/script.php";?>
<script src="<?=base_url();?>ajax/id-pegawai.js"></script>
