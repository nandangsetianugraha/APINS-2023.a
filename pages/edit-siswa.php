<?php $data="Edit Siswa";?>
<?php include "layout/head.php"; 
$bln=isset($_GET['bln']) ? $_GET['bln'] : date("m");
$thn=isset($_GET['thn']) ? $_GET['thn'] : date("Y");
$bulan = array("Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember");
?>

<link rel="stylesheet" href="<?=base_url();?>assets/css/croppie.css" />
</head>

<body class="preload-active aside-active aside-mobile-minimized aside-desktop-maximized">
	<!-- BEGIN Preload -->
	<?php include "layout/loader.php"; ?>
	<!-- END Preload -->
	<!-- BEGIN Page Holder -->
	<div class="holder">
		<!-- BEGIN Aside -->
		<?php include "layout/aside.php";?>
		<!-- END Aside -->
		<!-- BEGIN Page Wrapper -->
		<div class="wrapper ">
			<!-- BEGIN Header -->
			<?php include "layout/header.php";?>
			<!-- END Header -->
			<!-- BEGIN Page Content -->
			<div class="content">
				<div class="container-fluid g-5">
					<div class="row">
						<div class="col-12">
							<!-- BEGIN Portlet -->
							<?php if($level<>11){ ?>
							<div class="alert alert-outline-secondary">
								<div class="alert-icon">
									<i class="fa fa-wrench"></i>
								</div>
								<div class="alert-content">Hanya Admin!!</div>
							</div>
							<?php }else{ ?>
							<?php if($tipe==''){ ?>
							<?php }else{ 
							$idsis=$tipe;
							$cek = $connect->query("select * from siswa where peserta_didik_id='$idsis'")->num_rows;
							if($cek>0){
								$pn = $connect->query("select * from siswa where peserta_didik_id='$idsis'")->fetch_assoc();
							?>
							<div class="portlet">
								<div class="portlet-header portlet-header-bordered">
									<h3 class="portlet-title"><?=$pn['nama'];?></h3>
									<div class="portlet-addon">
									
									</div>
									<input type="hidden" name="tapel" id="tapel" class="form-control" value="<?=$tapel;?>" placeholder="Username">
									<input type="hidden" name="smt" id="smt" class="form-control" value="<?=$smt;?>" placeholder="Username">
								</div>
								<div class="portlet-body">
									<div id="dip">
										<div id="image_demo" style="width:350px; margin-top:30px"></div>
										<button class="btn btn-success crop_image">Crop & Upload Image</button>
									</div>
									<div class="row" id="dip2">
										<div class="col-md-3">
											<b id="uploaded_image"><img src="<?=base_url();?>images/siswa/<?=$pn['avatar'];?>" width="100%" alt="avatar" id="blah"></b>
											<div class="profileupload">
												<input type="file" accept="image/*" name="upload_image" id="upload_image">
											</div>
										</div>
										<div class="col-md-9">
											<div class="portlet" id="portlet1-profile">
												<div class="portlet-body">
													<form class="row g-3" action="<?=base_url();?>modul/siswa/update-siswa.php" autocomplete="off" method="POST" id="ubahForm">
													
														<div class="form-group col-md-6">
															<label for="inputCity">Nama Lengkap</label>
															<input type="text" class="form-control" name="nama"  value="<?=$pn['nama'];?>" required>
															<input type="hidden" class="form-control" name="ptkid" id="idpt" value="<?=$pn['peserta_didik_id'];?>" required>
														</div>
														<div class="form-group col-md-6 border-top-0 pt-0">
															<label for="inputZip">NIK</label>
															<input type="text" class="form-control" name="nik" value="<?=$pn['nik'];?>">
														</div>
													
														<div class="form-group col-md-4">
															<label for="inputZip">Tempat Lahir</label>
															<input type="text" class="form-control" name="tempat" value="<?=$pn['tempat'];?>" required>
														</div>
														<div class="form-group col-md-5 border-top-0 pt-0">
															<label for="inputZip">Tanggal Lahir</label>
															<div class="input-group">
																<span class="input-group-text">
																	<i class="fas fa-calendar-alt"></i>
																</span>
																<input type="text" id="tanggal" name="tanggal" class="form-control" value="<?=$pn['tanggal'];?>" required>
															</div>
														</div>
														<div class="form-group col-md-3 border-top-0 pt-0">
															<label for="inputCity">Jenis Kelamin</label>
															<select name="jeniskelamin" class="form-select">
																<option value="L" <?php if($pn['jk']=='L') echo 'selected';?>>Laki-laki</option>
																<option value="P" <?php if($pn['jk']=='P') echo 'selected';?>>Perempuan</option>
															</select>
														</div>
													
														<div class="form-group col-md-4">
															<label for="inputCity">NIS</label>
															<input type="text" class="form-control" name="nis" value="<?=$pn['nis'];?>">
														</div>
														<div class="form-group col-md-4 border-top-0 pt-0">
															<label for="inputZip">NISN</label>
															<input type="text" class="form-control" name="nisn" value="<?=$pn['nisn'];?>">
														</div>
														<div class="form-group col-md-4 border-top-0 pt-0">
															<label for="inputZip">Agama</label>
															<select class="form-select" name="agama" id="agama">
																<?php 
																$sql2 = "select * from agama";
																$query2 = $connect->query($sql2);
																while($nk=$query2->fetch_assoc()){
																?>
																<option value="<?=$nk['id_agama'];?>" ><?=$nk['nama_agama'];?></option>
																<?php };?>
															</select>
														</div>
													
														<div class="form-group col-12">
															<label for="inputAddress">Alamat</label>
															<input type="text" class="form-control" name="alamat" value="<?=$pn['alamat'];?>">
														</div>
													
														<div class="form-group col-12">
															<label for="inputAddress">Pendidikan Sebelumnya</label>
															<input type="text" class="form-control" name="pend_seb" value="<?=$pn['pend_sebelum'];?>">
														</div>
													
														<div class="form-group col-md-6">
															<label for="inputCity">Nama Ayah</label>
															<input type="text" class="form-control" name="ayah" value="<?=$pn['nama_ayah'];?>">
														</div>
														<div class="form-group col-md-6 border-top-0 pt-0">
															<label for="inputZip">Nama Ibu</label>
															<input type="text" class="form-control" name="ibu" value="<?=$pn['nama_ibu'];?>">
														</div>
													
													<?php 
													//$jns_ptk = $connect->query("select * from jenis_ptk where jenis_ptk_id='$level'")->fetch_assoc();
													//$status_ptk = $connect->query("select * from status_kepegawaian where status_kepegawaian_id='$status'")->fetch_assoc();
													?>
														<div class="form-group col-md-6">
															<label for="inputCity">Pekerjaan Ayah</label>
															<select class="form-select" name="pek_ayah">
																<?php 
																$sql21 = "select * from pekerjaan";
																$query21 = $connect->query($sql21);
																while($po1=$query21->fetch_assoc()){
																?>
																<option value="<?=$po1['id_pekerjaan'];?>" <?php if($pn['pek_ayah']==$po1['id_pekerjaan']) echo 'selected'; ?>><?=$po1['nama_pekerjaan'];?></option>
																<?php } ?>
															</select>
														</div>
														<div class="form-group col-md-6 border-top-0 pt-0">
															<label for="inputZip">Pekerjaan Ibu</label>
															<select class="form-select" name="pek_ibu">
																<?php 
																$sql21 = "select * from pekerjaan";
																$query21 = $connect->query($sql21);
																while($po1=$query21->fetch_assoc()){
																?>
																<option value="<?=$po1['id_pekerjaan'];?>" <?php if($pn['pek_ibu']==$po1['id_pekerjaan']) echo 'selected'; ?>><?=$po1['nama_pekerjaan'];?></option>
																<?php } ?>
															</select>
														</div>
														<div class="form-group col-4">
															<label for="inputAddress">Nomor HP/Whatsapp</label>
															<input type="text" name="no_wa" class="form-control" id="inputmask-2" value="<?=$pn['no_wa'];?>">
														</div>
														<div class="form-group col-8">
															<label for="inputAddress">Alamat Orang Tua</label>
															<input type="text" class="form-control" name="jalan" value="<?=$pn['jalan'];?>">
														</div>
														<div class="form-group col-md-6">
															<label for="inputCity">Desa/Kelurahan</label>
															<select class="form-select" name="kelurahan" id="kelurahan">
																<option>Pilih Desa/kelurahan</option>
																<?php 
																$id_desa=$pn['kelurahan'];
																$id_kec=$pn['kecamatan'];
																$id_kab=$pn['kabupaten'];
																$id_prov=$pn['provinsi'];
																$sql21 = "select * from desa where id_kecamatan='$id_kec'";
																$query21 = $connect->query($sql21);
																while($nk=$query21->fetch_assoc()){
																?>
																<option value="<?=$nk['id'];?>" <?php if($id_desa==$nk['id']){echo "selected";}; ?>><?=$nk['nama'];?></option>
																<?php } ?>
															</select>
														</div>
														<div class="form-group col-md-6 border-top-0 pt-0">
															<label for="inputZip">Kecamatan</label>
															<select class="form-select" name="kecamatan" id="kecamatan">
																<option>Pilih Kecamatan</option>
																<?php 
																$sql21 = "select * from kecamatan where id_kabupaten='$id_kab'";
																$query21 = $connect->query($sql21);
																while($nk=$query21->fetch_assoc()){
																?>
																<option value="<?=$nk['id'];?>" <?php if($id_kec==$nk['id']){echo "selected";}; ?>><?=$nk['nama'];?></option>
																<?php } ?>
															</select>
														</div>
														<div class="form-group col-md-6">
															<label for="inputCity">Kabupaten</label>
															<select class="form-select" name="kabupaten" id="kabupaten">
																<option>Pilih Kabupaten</option>
																<?php 
																$sql21 = "select * from kabupaten where id_provinsi='$id_prov'";
																$query21 = $connect->query($sql21);
																while($nk=$query21->fetch_assoc()){
																?>
																<option value="<?=$nk['id'];?>" <?php if($id_kab==$nk['id']){echo "selected";}; ?>><?=$nk['nama'];?></option>
																<?php } ?>
															</select>
														</div>
														<div class="form-group col-md-6 border-top-0 pt-0">
															<label for="inputZip">Provinsi</label>
															<select class="form-select" name="provinsi" id="provinsi">
																<option>Pilih Provinsi</option>
																<?php 
																$sql21 = "select * from provinsi";
																$query21 = $connect->query($sql21);
																while($nk=$query21->fetch_assoc()){
																?>
																<option value="<?=$nk['id_prov'];?>" <?php if($id_prov==$nk['id_prov']){echo "selected";}; ?>><?=$nk['nama'];?></option>
																<?php } ?>
															</select>
														</div>
														<div class="col-md-12 text-end mt-3">
															<a href="<?=base_url();?>rombel" class="btn btn-danger">Kembali</a>
															<button type="submit" class="btn btn-primary">Simpan</button>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<?php }else{ ?>
							<div class="alert alert-outline-secondary">
								<div class="alert-icon">
									<i class="fa fa-info"></i>
								</div>
								<div class="alert-content">Tidak ditemukan siswa!</div>
							</div>
							<?php }}} ?>
							<!-- END Portlet -->
						</div>
					</div>
				</div>
			</div>
			<!-- END Page Content -->
			<!-- BEGIN Footer -->
			<?php include "layout/footer.php";?>
			<!-- END Footer -->
		</div>
		<!-- END Page Wrapper -->
	</div>
	<!-- END Page Holder -->
	<!-- BEGIN Modal -->
	<div class="modal fade" id="uploadimageModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Upload & Crop Image</h4>
				</div>
				<div class="modal-body">
					<div id="image_demo" style="width:350px; margin-top:30px"></div>
					
				</div>
				<div class="modal-footer">
					<button class="btn btn-success crop_image">Crop & Upload Image</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="tambah-pengguna">
		<div class="modal-dialog">
			<div class="modal-content">
				<form class="form-horizontal" action="modul/kepegawaian/add-user.php" autocomplete="off" method="POST" id="adduser">
				<div class="fetched-data1"></div>
				</form>
			</div>
		</div>
	</div>
	<!-- END Modal -->
	<?php include "layout/offcanvas-todo.php"; ?>
	<?php include "layout/script.php"; ?>
	<script src="<?=base_url();?>assets/js/croppie.js"></script>
	<script>
	var TabelRombel;
	$('#tanggal').datepicker({
		format: 'yyyy-mm-dd',
		autoclose:true
	});
	$("#inputmask-2").inputmask({ mask: "999999999999" });
	$("#dip").hide(); 
	$("#dip2").show(); 
	var idptk = $('#idpt').val();
	toastr.options = {
			"closeButton": false,
			"debug": true,
			"newestOnTop": true,
			"progressBar": false,
			"positionClass": "toast-top-full-width",
			"preventDuplicates": true,
			"onclick": null,
			"showDuration": 300,
			"hideDuration": 1000,
			"timeOut": 2000,
			"extendedTimeOut": 500,
			"showEasing": "swing",
			"hideEasing": "swing",
			"showMethod": "fadeIn",
			"hideMethod": "fadeOut"
		};
	$image_crop = $('#image_demo').croppie({
		enableExif: true,
		viewport: {
		  width:200,
		  height:200,
		  type:'square' //circle
		},
		boundary:{
		  width:300,
		  height:300
		}
	});
	$('#upload_image').on('change', function(){
		var reader = new FileReader();
		reader.onload = function (event) {
		  $image_crop.croppie('bind', {
			url: event.target.result
		  }).then(function(){
			console.log('jQuery bind complete');
		  });
		}
		reader.readAsDataURL(this.files[0]);
		$("#dip").show(); 
		$("#dip2").hide(); 
	  });

	  $('.crop_image').click(function(event){
		$image_crop.croppie('result', {
		  type: 'canvas',
		  size: 'viewport'
		}).then(function(response){
		  $.ajax({
			url:"<?=base_url();?>images/uploadfoto-siswa.php?idp="+idptk,
			type: "POST",
			data:{"image": response},
			success:function(data)
			{
			  $("#dip").hide(); 
			  $("#dip2").show(); 
			  $('#uploaded_image').html(data);
			  toastr.success("Sukses");
			}
		  });
		})
	  });
	$('#provinsi').change(function(){
			//Mengambil value dari option select provinsi kemudian parameternya dikirim menggunakan ajax
			var prov = $('#provinsi').val();
			$.ajax({
				type : 'GET',
				url : '../config/kabupaten.php',
				data :  'prov_id=' + prov,
				success: function (data) {
					//jika data berhasil didapatkan, tampilkan ke dalam option select kabupaten
					$("#kabupaten").html(data);
				}
			});
	});
	
	$('#kabupaten').change(function(){
			//Mengambil value dari option select provinsi kemudian parameternya dikirim menggunakan ajax
			var kab = $('#kabupaten').val();
			$.ajax({
				type : 'GET',
				url : '../config/kecamatan.php',
				data :  'id_kabupaten=' + kab,
				success: function (data) {
					//jika data berhasil didapatkan, tampilkan ke dalam option select kabupaten
					$("#kecamatan").html(data);
				}
			});
	});

	$('#kecamatan').change(function(){
			//Mengambil value dari option select provinsi kemudian parameternya dikirim menggunakan ajax
			var desa = $('#kecamatan').val();
			$.ajax({
				type : 'GET',
				url : '../config/desa.php',
				data :  'id_kecamatan=' + desa,
				success: function (data) {
					//jika data berhasil didapatkan, tampilkan ke dalam option select kabupaten
					$("#kelurahan").html(data);
					// alert($('#provinsi option:selected').text() + $('#kabupaten option:selected').text() + $('#kecamatan option:selected').text() + $('#desa option:selected').text());
				}
			});
	});
	$("#ubahForm").unbind('submit').bind('submit', function() {
			var form = $(this);
			//submi the form to server
			$.ajax({
				url : form.attr('action'),
				type : form.attr('method'),
				data : form.serialize(),
				dataType : 'json',
				beforeSend: function(){	
					$('#portlet1-profile').block({ message: '\n<div class="spinner-grow text-success"></div>\n<h1 class="blockui blockui-title">Tunggu sebentar...</h1>\n'});
				},
				success:function(response) {
					$('#portlet1-profile').unblock();
					if(response.success == true) {
						toastr.success(response.messages);
						//setTimeout(function () {window.open("./","_self");},1000)
						//setTimeout(function () {window.open("./","_self");},1000)
						// reset the form
					} else {
						toastr.error(response.messages);
					}  // /else
				} // success  
			}); // ajax subit 				
			return false;
		}); // /submit form for create member
	</script>
</body>
</html>
