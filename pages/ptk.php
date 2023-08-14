<link rel="stylesheet" href="<?=base_url();?>assets/css/croppie.css" />
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
					<h4>Daftar PTK</h4>
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
											<option value="1">Aktif</option>
											<option value="0">Mutasi Keluar</option>
											<option value="4">Mengundurkan Diri</option>
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
										<th></th>
										<th>Nama PTK</th>
										<th>Tempat Lahir</th>
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
													<h5 class="modal-title">Mutasikan PTK?</h5>
													<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<form id="mutasiForm" method="POST" action="modul/kepegawaian/mutasi.php" class="form">
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
			$idptk=$tipe;
			$infoptk = $connect->query("select * from ptk where ptk_id='$idptk'")->fetch_assoc();
			$idjns = $infoptk['jenis_ptk_id'];
			$jenis = $connect->query("select * from jenis_ptk where jenis_ptk_id='$idjns'")->fetch_assoc();
		?>
			<div class="page-header">
				<div class="page-title">
					<h4><?=$infoptk['nama'];?></h4>
					<h6>Biodata PTK</h6>
					<input type="hidden" id="idptks" value="<?=$tipe;?>" />
					<input type="hidden" id="urls" value="<?=base_url();?>" />
				</div>
				<div class="page-btn">
					<a href="<?=base_url();?>ptk" class="btn btn-rounded btn-outline-primary btn-sm">Kembali</a>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<div class="profile-set">
						<div class="profile-top">
							<div class="profile-content">
								<div class="profile-contentimg">
									<b id="uploaded_image"><img src="<?=base_url();?>images/ptk/<?=$infoptk['gambar'];?>" alt="avatar" id="blah"></b>
									<div class="profileupload">
										<input type="file" accept="image/*" name="upload_image" id="upload_image">
										<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/edit-set.svg" alt="img"></a>
									</div>
								</div>
								<div class="profile-contentname">
									<h2><?=$infoptk['nama'];?></h2>
									<h4><?=$jenis['jenis_ptk'];?></h4>
								</div>
							</div>
							<div class="ms-auto">
											
							</div>
						</div>
					</div>
					<form class="p-3" action="<?=base_url();?>modul/kepegawaian/update-biodata.php" autocomplete="off" method="POST" id="updatePTK">
													<h4 class="mb-3 font-weight-semibold text-dark">Personal Information</h4>
													<div class="row">
														<div class="form-group col-md-6">
															<label for="inputCity">Nama Lengkap</label>
															<input type="text" class="form-control" name="nama" value="<?=$infoptk['nama'];?>" required>
															<input type="hidden" class="form-control" name="ptkid" value="<?=$infoptk['ptk_id'];?>" required>
														</div>
														<div class="form-group col-md-6 border-top-0 pt-0">
															<label for="inputZip">Gelar</label>
															<input type="text" class="form-control" name="gelar" value="<?=$infoptk['gelar'];?>">
														</div>
													</div>
													<div class="row">
														<div class="form-group col-md-4">
															<label for="inputZip">Tempat Lahir</label>
															<input type="text" class="form-control" name="tempat" value="<?=$infoptk['tempat_lahir'];?>" required>
														</div>
														<div class="form-group col-md-5 border-top-0 pt-0">
															<label for="inputZip">Tanggal Lahir</label>
															<div class="input-group">
																<span class="input-group-text">
																	<i class="fas fa-calendar-alt"></i>
																</span>
																<input type="text" id="tanggal" name="tanggal" class="form-control" value="<?=$infoptk['tanggal_lahir'];?>" required>
															</div>
														</div>
														<div class="form-group col-md-3 border-top-0 pt-0">
															<label for="inputCity">Jenis Kelamin</label>
															<select name="jeniskelamin" class="select">
																<option value="L" <?php if($infoptk['jenis_kelamin']=='L') echo 'selected';?>>Laki-laki</option>
																<option value="P" <?php if($infoptk['jenis_kelamin']=='P') echo 'selected';?>>Perempuan</option>
															</select>
														</div>
													</div>
													<div class="row">
														<div class="form-group col-md-4">
															<label for="inputCity">NIK</label>
															<input type="text" class="form-control" name="nik" value="<?=$infoptk['nik'];?>">
														</div>
														<div class="form-group col-md-4 border-top-0 pt-0">
															<label for="inputZip">NIY/NIGK</label>
															<input type="text" class="form-control" name="niynigk" value="<?=$infoptk['niy_nigk'];?>">
														</div>
														<div class="form-group col-md-4 border-top-0 pt-0">
															<label for="inputZip">NUPTK</label>
															<input type="text" class="form-control" name="nuptk" value="<?=$infoptk['nuptk'];?>">
														</div>
													</div>
													<div class="row">
														<div class="form-group col">
															<label for="inputAddress">Alamat</label>
															<input type="text" class="form-control" name="alamat" value="<?=$infoptk['alamat_jalan'];?>">
														</div>
													</div>
													<div class="row">
														<div class="form-group col-md-6">
															<label for="inputCity">Nomor HP</label>
															<input type="text" class="form-control" name="noHP" value="<?=$infoptk['no_hp'];?>">
														</div>
														<div class="form-group col-md-6 border-top-0 pt-0">
															<label for="inputZip">Email</label>
															<input type="text" class="form-control" name="email" value="<?=$infoptk['email'];?>">
														</div>
													</div>
													<?php 
													//$jns_ptk = $connect->query("select * from jenis_ptk where jenis_ptk_id='$level'")->fetch_assoc();
													//$status_ptk = $connect->query("select * from status_kepegawaian where status_kepegawaian_id='$status'")->fetch_assoc();
													?>
													<div class="row">
														<div class="form-group col-md-6">
															<label for="inputCity">Jenis PTK</label>
															<select class="select" name="jenispegawai">
																<?php 
																$sql2 = "select * from jenis_ptk";
																$query2 = $connect->query($sql2);
																while($po=$query2->fetch_assoc()){
																?>
																<option value="<?=$po['jenis_ptk_id'];?>" <?php if($infoptk['jenis_ptk_id']==$po['jenis_ptk_id']) echo 'selected';?>><?=$po['jenis_ptk'];?></option>
																<?php } ?>
															</select>
														</div>
														<div class="form-group col-md-6 border-top-0 pt-0">
															<label for="inputZip">Status Kepegawaian</label>
															<select class="select" name="statuspegawai">
																<?php 
																$sql21 = "select * from status_kepegawaian";
																$query21 = $connect->query($sql21);
																while($po1=$query21->fetch_assoc()){
																?>
																<option value="<?=$po1['status_kepegawaian_id'];?>" <?php if($infoptk['status_kepegawaian_id']==$po1['status_kepegawaian_id']) echo 'selected';?>><?=$po1['nama'];?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12 text-end mt-3">
															<a href="<?=base_url();?>ptk" class="btn btn-info">Kembali</a>
															<button type="submit" class="btn btn-primary">Update</button>
														</div>
													</div>

												</form>
												<!--modal-->
												<div id="uploadimageModal" class="modal" role="dialog">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h4 class="modal-title">Upload & Crop Image</h4>
															</div>
															<div class="modal-body">
																<div id="image_demo" style="width:350px; margin-top:30px"></div>
																<button class="btn btn-success crop_image">Crop & Upload Image</button>
															</div>
															
														</div>
													</div>
												</div>
				</div>
			</div>
		<?php } ?>
</div>
<?php include "layout/script.php";?>
<script src="<?=base_url();?>assets/js/croppie.js"></script>
<script src="<?=base_url();?>ajax/ptk.js"></script>
<script>
var idptk = $('#idptks').val();
var urls = $('#urls').val();
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
    $('#uploadimageModal').modal('show');
  });

  $('.crop_image').click(function(event){
    $image_crop.croppie('result', {
      type: 'canvas',
      size: 'viewport'
    }).then(function(response){
      $.ajax({
        url:urls+"images/uploadfoto-ptk.php?idp="+idptk,
        type: "POST",
        data:{"image": response},
        success:function(data)
        {
          $('#uploadimageModal').modal('hide');
          $('#uploaded_image').html(data);
		  toastr.options = {
			  "closeButton": true,
			  "debug": false,
			  "newestOnTop": false,
			  "progressBar": false,
			  "positionClass": "toast-top-full-width",
			  "preventDuplicates": false,
			  "onclick": null,
			  "showDuration": "300",
			  "hideDuration": "1000",
			  "timeOut": "4000",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
			}
			toastr["success"]("Poto Profil berhasil diubah!");
        }
      });
    })
  });
</script>
