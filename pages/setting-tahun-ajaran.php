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
					<h4>Status Server</h4>
					<h6>Tahun Ajaran, Semester, dan Perawatan</h6>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<div class="row">
						<form class="p-3" action="modul/setting/update-server.php" autocomplete="off" method="POST" id="ubahForm">
						<div class="col-lg-3 col-sm-6 col-12">
							<div class="form-group">
								<label>Tahun Ajaran <span class="manitory">*</span></label>
								<div class="input-group mb-3">
                                  <select class="select" id="ptapel" name="ptapel">
									<option>Pilih Tahun Ajaran</option>
									<?php 
									$sql4 = "select * from tapel order by nama_tapel asc";
									$query4 = $connect->query($sql4);
									$ak=0;
									while($nk=$query4->fetch_assoc()){
										if($tapel==$nk['nama_tapel']){
											$stt="selected";
										}else{
											$stt='';
										};
										echo '<option value="'.$nk['nama_tapel'].'" '.$stt.'>'.$nk['nama_tapel'].'</option>';
									}	
									?>
								</select>
                              <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#tambahTema" id="addTemaModalBtn"><i class="fa fa-plus"></i></button>
                              </div>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6 col-12">
							<div class="form-group">
								<label>Semester</label>
								<select class="select" id="psmt" name="psmt">
									<option value="0">Pilih Semester</option>
									<option value="1" <?php if($smt==1) echo "selected"; ?>>Semester 1</option>
									<option value="2" <?php if($smt==2) echo "selected"; ?>>Semester 2</option>
								</select>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6 col-12">
							<div class="form-group">
								<label>Perawatan <span class="manitory">*</span></label>
								<select class="select" id="pstatus" name="pstatus">
									<option>Pilih Perawatan</option>
									<option value="0" <?php if($maintenis==0) echo "selected"; ?>>Tidak</option>
									<option value="1" <?php if($maintenis==1) echo "selected"; ?>>Ya</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<button type="submit" class="btn btn-submit me-2">Simpan</button>
								<a href="javascript:void(0);" class="btn btn-cancel">Cancel</a>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
  
  <div class="modal" id="tambahTema" tabindex="-1" role="dialog">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Tahun Ajaran</h5>
													<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<form id="createTemaForm" method="POST" action="modul/setting/tambahtapel.php" class="form">
													<div class="modal-body">
														<div class="form-group form-group-default">
															<label>Tahun Ajaran</label>
															<input type="text" name="nama_tapel" autocomplete=off class="form-control" placeholder="Tahun Ajaran">
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
<?php include "layout/script.php";?>
<script src="<?=base_url();?>ajax/setting-tahun-ajaran.js"></script>