<?php include "layout/head.php"; ?></head>
<body>
<?php include "layout/loader.php"; ?>
<div class="main-wrapper">
	<?php include "layout/header.php"; ?>
	<?php include "layout/sidebar.php"; ?>
	<div class="page-wrapper pagehead">
		<div class="content">
			<div class="page-header">
				<div class="page-title">
					<h4>Tambah Siswa</h4>
					<h6>Siswa Baru dan Pindahan</h6>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
				<form class="p-3" action="modul/siswa/tambah-siswa.php" autocomplete="off" method="POST" id="tambahPTK">
													<h4 class="mb-3 font-weight-semibold text-dark">Personal Information</h4>
													<div class="row">
														<div class="form-group col-md-4">
															<label for="inputCity">Nama Lengkap</label>
															<input type="text" class="form-control" name="nama"  required>
														</div>
														<div class="form-group col-md-4 border-top-0 pt-0">
															<label for="inputZip">NIK</label>
															<input type="text" class="form-control" name="nik" >
														</div>
														<div class="form-group col-md-4 border-top-0 pt-0">
															<label for="inputZip">Status</label>
															<select class="select" name="status" id="status">
																
																<option value="99" >Calon Siswa Baru</option>
																
															</select>
														</div>
													</div>
													<div class="row">
														<div class="form-group col-md-4">
															<label for="inputZip">Tempat Lahir</label>
															<input type="text" class="form-control" name="tempat"  required>
														</div>
														<div class="form-group col-md-5 border-top-0 pt-0">
															<label for="inputZip">Tanggal Lahir</label>
															<div class="input-group">
																<span class="input-group-text">
																	<i class="fas fa-calendar-alt"></i>
																</span>
																<input type="text" id="tanggal" name="tanggal" class="form-control"  required>
															</div>
														</div>
														<div class="form-group col-md-3 border-top-0 pt-0">
															<label for="inputCity">Jenis Kelamin</label>
															<select name="jk" class="select">
																<option value="L" >Laki-laki</option>
																<option value="P" >Perempuan</option>
															</select>
														</div>
													</div>
													<div class="row">
														<div class="form-group col-md-4">
															<label for="inputCity">NIS</label>
															<input type="text" class="form-control" name="nis" >
														</div>
														<div class="form-group col-md-4 border-top-0 pt-0">
															<label for="inputZip">NISN</label>
															<input type="text" class="form-control" name="nisn" >
														</div>
														<div class="form-group col-md-4 border-top-0 pt-0">
															<label for="inputZip">Agama</label>
															<select class="select" name="agama" id="agama">
																<?php 
																$sql2 = "select * from agama";
																$query2 = $connect->query($sql2);
																while($nk=$query2->fetch_assoc()){
																?>
																<option value="<?=$nk['id_agama'];?>" ><?=$nk['nama_agama'];?></option>
																<?php };?>
															</select>
														</div>
													</div>
													<div class="row">
														<div class="form-group col">
															<label for="inputAddress">Alamat</label>
															<input type="text" class="form-control" name="alamat" ">
														</div>
													</div>
													<div class="row">
														<div class="form-group col">
															<label for="inputAddress">Pendidikan Sebelumnya</label>
															<input type="text" class="form-control" name="pend_seb" >
														</div>
													</div>
													<div class="row">
														<div class="form-group col-md-6">
															<label for="inputCity">Nama Ayah</label>
															<input type="text" class="form-control" name="ayah" >
														</div>
														<div class="form-group col-md-6 border-top-0 pt-0">
															<label for="inputZip">Nama Ibu</label>
															<input type="text" class="form-control" name="ibu" >
														</div>
													</div>
													<?php 
													//$jns_ptk = $connect->query("select * from jenis_ptk where jenis_ptk_id='$level'")->fetch_assoc();
													//$status_ptk = $connect->query("select * from status_kepegawaian where status_kepegawaian_id='$status'")->fetch_assoc();
													?>
													<div class="row">
														<div class="form-group col-md-6">
															<label for="inputCity">Pekerjaan Ayah</label>
															<select class="select" name="pek_ayah">
																<?php 
																$sql21 = "select * from pekerjaan";
																$query21 = $connect->query($sql21);
																while($po1=$query21->fetch_assoc()){
																?>
																<option value="<?=$po1['id_pekerjaan'];?>" ><?=$po1['nama_pekerjaan'];?></option>
																<?php } ?>
															</select>
														</div>
														<div class="form-group col-md-6 border-top-0 pt-0">
															<label for="inputZip">Pekerjaan Ibu</label>
															<select class="select" name="pek_ibu">
																<?php 
																$sql21 = "select * from pekerjaan";
																$query21 = $connect->query($sql21);
																while($po1=$query21->fetch_assoc()){
																?>
																<option value="<?=$po1['id_pekerjaan'];?>" ><?=$po1['nama_pekerjaan'];?></option>
																<?php } ?>
															</select>
														</div>
													</div>
                                                    <div class="row">
														<div class="form-group col">
															<label for="inputAddress">Nomor Whatsapp</label>
															<input type="text" class="form-control" name="no_wa" >
														</div>
													</div>
													<div class="row">
														<div class="form-group col">
															<label for="inputAddress">Alamat Orang Tua</label>
															<input type="text" class="form-control" name="jalan" >
														</div>
													</div>
													<div class="row">
														<div class="form-group col-md-6">
															<label for="inputCity">Desa/Kelurahan</label>
															<select name="kelurahan" id="kelurahan">
																<option>Pilih Desa/kelurahan</option>
															</select>
														</div>
														<div class="form-group col-md-6 border-top-0 pt-0">
															<label for="inputZip">Kecamatan</label>
															<select name="kecamatan" id="kecamatan">
																<option>Pilih Kecamatan</option>
															</select>
														</div>
													</div>
													<div class="row">
														<div class="form-group col-md-6">
															<label for="inputCity">Kabupaten</label>
															<select name="kabupaten" id="kabupaten">
																<option>Pilih Kabupaten</option>
															</select>
														</div>
														<div class="form-group col-md-6 border-top-0 pt-0">
															<label for="inputZip">Provinsi</label>
															<select name="provinsi" id="provinsi">
																<option>Pilih Provinsi</option>
																<?php 
																$sql21 = "select * from provinsi";
																$query21 = $connect->query($sql21);
																while($nk=$query21->fetch_assoc()){
																?>
																<option value="<?=$nk['id_prov'];?>"><?=$nk['nama'];?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12 text-end mt-3">
															<a href="<?=base_url();?>siswa-baru" class="btn btn-info">Kembali</a>
															<button type="submit" class="btn btn-primary">Simpan</button>
														</div>
													</div>

												</form>
				</div>
			</div>
		</div>
	</div>
</div>
<?php include "layout/script.php";?>
<script src="<?=base_url();?>ajax/tambah-siswa.js"></script>