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
					<h4>Berita Acara</h4>
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
										<div class="input-group">
											<span class="input-group-text">
												<i class="fas fa-calendar-alt"></i>
											</span>
											<input type="text" id="tanggal1" value="<?=date('Y-m-d');?>" class="form-control"  required>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-sm-6 col-12">
									<div class="form-group">
										<button class="btn btn-primary btn-icon" data-bs-toggle="modal" data-bs-target="#tambahBAP" id="addBAPModalBtn"><i class="fas fa-edit"></i> Isi Berita Acara</button>
									</div>
								</div>
								<div class="col-lg-4 col-sm-6 col-12">
									<div class="form-group">
										
									</div>
								</div>
							</div>
						
					<div class="table-responsive">
										<table id="Raportku" class="table table-bordered">
								<thead>
								    <tr>
										<th>Hari</th>
										<th>Mata Pelajaran</th>
										<th>Kelas</th>
										<th>Waktu</th>
										<th>Pengawas</th>
										<th></th>
									</tr>
								</thead>
								<tbody>	
																
								</tbody>
							</table>
					</div>
					<!-- Modal -->
									<div class="modal fade" id="tambahBAP" tabindex="-1" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<form class="form" action="modul/ulangan/tambahbap.php" method="POST" id="createbapForm">
                        <div class="modal-body">
							<div class="row">
							  <div class="form-group col-md-8 col-12">
								<label>Jenis Penilaian</label>
								<select class="select" id="penilaian" name="penilaian">
									<option value="Penilaian Harian">Penilaian Harian (PH)</option>
									<option value="Penilaian Tengah Semester">Penilaian Tengah Semester (PTS)</option>
                                  	<option value="Sumatif Tengah Semester">Sumatif Tengah Semester (STS)</option>
									<option value="Penilaian Akhir Semester">Penilaian Akhir Semester (PAS)</option>
                                  	<option value="Sumatif Akhir Semester">Sumatif Akhir Semester (SAS)</option>
									<option value="Penilaian Akhir Tahun">Penilaian Akhir Tahun (PAT)</option>
                                  	<option value="Sumatif Akhir Tahun">Sumatif Akhir Tahun (SAT)</option>
								</select>
							  </div>
							  <div class="form-group col-md-4 col-12">
								<label>Kelas</label>
								<select class="select" id="kelas" name="kelas">
                                  	<option value="0">Pilih Kelas</option>
								<?php 
								$sql3 = "select * from rombel where tapel='$tapel' order by nama_rombel asc";
								$query3 = $connect->query($sql3);
								while($nk=$query3->fetch_assoc()){
								?>
									<option value="<?=$nk['nama_rombel'];?>">Kelas <?=$nk['nama_rombel'];?></option>
								<?php };?>
								</select>
							  </div>
							</div>
							<div class="row">
							  <div class="form-group col-md-4 col-12">
								<label>Tanggal</label>
								<input type="text" name="tanggal" id="tanggal" value="<?=date('Y-m-d');?>" class="form-control"  required>
							  </div>
							  <div class="form-group col-md-4 col-12">
								<label>Waktu Mulai</label>
								<input type="text" name="jam1" class="form-control">
								<input type="hidden" name="tapel" class="form-control" value="<?=$tapel;?>">
								<input type="hidden" name="smt" class="form-control" value="<?=$smt;?>">
							  </div>
							  <div class="form-group col-md-4 col-12">
								<label>Waktu Selesai</label>
								<input type="text" name="jam2" class="form-control">
							  </div>
							</div>
							<div class="form-group form-group-default">
								<label>Mata Pelajaran</label>
								<input id="mapel" name="mapel" type="text" class="form-control" value="">
							</div>
							<div class="row">
							  <div class="form-group col-md-6 col-12">
								<label>Pengawas 1</label>
								<input type="text" id="pengawas1" name="pengawas1" class="form-control">
							  </div>
							  <div class="form-group col-md-6 col-12">
								<label>Pengawas 2</label>
								<input type="text" id="pengawas2" name="pengawas2" class="form-control">
							  </div>
							</div>
							<div class="form-group form-group-default">
								<label>Jumlah Tidak Hadir</label>
								<input id="jum_absen" type="text" name="jum_absen" autocomplete=off class="form-control">
							</div>
							<div class="form-group form-group-default">
								<label>Nomor Peserta Tidak Hadir (pisahkan dengan tanda koma)</label>
								<input id="nomor_absen" type="text" name="nomor_absen" autocomplete=off class="form-control">
							</div>
							<div class="form-group form-group-default">
								<label>Catatan</label>
								<input id="catatan" type="text" name="catatan" autocomplete=off class="form-control" placeholder="Catatan">
							</div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-info btn-border btn-round btn-sm" data-dismiss="modal">Tutup</button>
                            <button type="submit" class="btn btn-info btn-border btn-round btn-sm">Simpan</button>
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
<script src="<?=base_url();?>assets/js/timepicker.js"></script>
<script type="text/javascript" language="javascript" class="init">
	var Raportku;
	$(document).ready(function() {
		$('#tanggal').datepicker({
			format: 'yyyy-mm-dd',
			autoclose:true
		});
		$('#tanggal1').datepicker({
			format: 'yyyy-mm-dd',
			autoclose:true
		});
		var tapel = $('#tapel').val();
		var smt = $('#smt').val();
		Raportku = $("#Raportku").DataTable({
			"destroy":true,
			"searching": true,
			"paging":true,
			"ajax": "modul/ulangan/berita-acara.php?tapel="+tapel+"&smt="+smt,
			"order": []
		});
      	$('#kelas').change(function(){
			//Mengambil value dari option select kd kemudian parameternya dikirim menggunakan ajax
			var kelas=$('#kelas').val();
			var tapel = $('#tapel').val();
			var smt = $('#smt').val();
			$.ajax({
				type : 'GET',
				url : 'modul/ulangan/getguru.php',
				data :  'kelas=' +kelas+'&smt='+smt+'&tapel='+tapel,
				success: function (data) {

					//jika data berhasil didapatkan, tampilkan ke dalam option select mp
					$("#pengawas1").val(data);
					//$("#KDPeng").html('<div class="alert alert-info alert-dismissible"><h4><i class="icon fa fa-info"></i> Informasi</h4>Silahkan Pilih Mata Pelajaran</div>');
					//$("#KDKet").html('<div class="alert alert-info alert-dismissible"><h4><i class="icon fa fa-info"></i> Informasi</h4>Silahkan Pilih Mata Pelajaran</div>');
				}
			});
          	$.ajax({
				type : 'GET',
				url : 'modul/ulangan/getguru1.php',
				data :  'kelas=' +kelas+'&smt='+smt+'&tapel='+tapel,
				success: function (data) {

					//jika data berhasil didapatkan, tampilkan ke dalam option select mp
					$("#pengawas2").val(data);
					//$("#KDPeng").html('<div class="alert alert-info alert-dismissible"><h4><i class="icon fa fa-info"></i> Informasi</h4>Silahkan Pilih Mata Pelajaran</div>');
					//$("#KDKet").html('<div class="alert alert-info alert-dismissible"><h4><i class="icon fa fa-info"></i> Informasi</h4>Silahkan Pilih Mata Pelajaran</div>');
				}
			});
		});
		$( "#cetakT" ).click(function() {
			var kelas=$('#kelas').val();
			var tapel=$('#tapel').val();
			var smt=$('#smt').val();
			if(kelas == 0){
				swal('Pilih Kelas Dahulu', {buttons: false,timer: 1000,});
			}else{
				window.open('cetak/penyerahanraport.php?kelas='+kelas+'&tapel='+tapel+'&smt='+smt,' _blank');
			}
		});
		$("#addBAPModalBtn").on('click', function() {
			// reset the form 
			$("#createbapForm")[0].reset();
			
			// submit form
			$("#createbapForm").unbind('submit').bind('submit', function() {

				$(".text-danger").remove();

				var form = $(this);

				

					//submi the form to server
					$.ajax({
						url : form.attr('action'),
						type : form.attr('method'),
						data : form.serialize(),
						dataType : 'json',
						success:function(response) {

							// remove the error 
							$(".form-group").removeClass('has-error').removeClass('has-success');

							if(response.success == true) {
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
								toastr["success"](response.messages);
								//swal(response.messages, {buttons: false,timer: 2000,});
								// reset the form
								$("#tambahBAP").modal('hide');

								// reload the datatables
								Raportku.ajax.reload(null, false);
								$("#createbapForm")[0].reset();
								// this function is built in function of datatables;

							} else {
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
								toastr["error"](response.messages)
								//swal(response.messages, {buttons: false,timer: 3000,});
								
							}  // /else
						} // success  
					}); // ajax subit 				
				


				return false;
			}); // /submit form for create member
		}); // /add modal
	});
</script>
