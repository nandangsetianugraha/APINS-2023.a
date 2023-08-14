<?php $data="Pemetaan Proyek";?>
<?php include "layout/head.php"; ?>
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
							<?php if($kurikulum=='Kurikulum 2013'){ ?>
							<div class="alert alert-outline-secondary">
								<div class="alert-icon">
									<i class="fa fa-wrench"></i>
								</div>
								<div class="alert-content">Khusus Kurikulum Merdeka!!</div>
							</div>
							<?php }else{ ?>
							<div class="portlet" id="status">
								<div class="portlet-header portlet-header-bordered">
									<h3 class="portlet-title">Pemetaan Proyek</h3>
									<div class="portlet-addon">
										    <?php if($level==96){?>
											<select id="kelas" name="kelas" class="form-select">
												<option value="0">Pilih Rombel</option>
												<?php 
												$sql4 = "select * from rombel where tapel='$tapel' and pai='$idku' and kurikulum='Kurikulum Merdeka' order by nama_rombel asc";
												$query4 = $connect->query($sql4);
												while($nk=$query4->fetch_assoc()){
														echo '<option value="'.$nk['nama_rombel'].'">Kelas '.$nk['nama_rombel'].'</option>';
												}	
												?>
											</select>
											<?php }elseif($level==95){ ?>
											<select id="kelas" name="kelas" class="form-select">
												<option value="0">Pilih Rombel</option>
												<?php 
												$sql4 = "select * from rombel where tapel='$tapel' and penjas='$idku' and kurikulum='Kurikulum Merdeka' order by nama_rombel asc";
												$query4 = $connect->query($sql4);
												while($nk=$query4->fetch_assoc()){
													echo '<option value="'.$nk['nama_rombel'].'">Kelas '.$nk['nama_rombel'].'</option>';
												}	
												?>
											</select>
											<?php }elseif($level==94){ ?>
											<select id="kelas" name="kelas" class="form-select">
												<option value="0">Pilih Rombel</option>
												<?php 
												$sql4 = "select * from rombel where tapel='$tapel' and inggris='$idku' and kurikulum='Kurikulum Merdeka' order by nama_rombel asc";
												$query4 = $connect->query($sql4);
												while($nk=$query4->fetch_assoc()){
													echo '<option value="'.$nk['nama_rombel'].'">Kelas '.$nk['nama_rombel'].'</option>';
												}	
												?>
											</select>
											<?php }elseif($level==11){ ?>
											<select id="kelas" name="kelas" class="form-select">
												<option value="0">Pilih Rombel</option>
												<?php 
												$sql4 = "select * from rombel where tapel='$tapel' and kurikulum='Kurikulum Merdeka' order by nama_rombel asc";
												$query4 = $connect->query($sql4);
												while($nk=$query4->fetch_assoc()){
													echo '<option value="'.$nk['nama_rombel'].'">Kelas '.$nk['nama_rombel'].'</option>';
												}	
												?>
											</select>
											<?php }elseif($level==98 or $level==97){ ?>
											<select id="kelas" name="kelas" class="form-select">
												<option value="0">Pilih Rombel</option>
												<option value="<?=$kelas;?>">Kelas <?=$kelas;?></option>
											</select>
											<?php }else{}; ?>
                                    </div>
									<input type="hidden" name="tapel" id="tapel" class="form-control" value="<?=$tapel;?>" placeholder="Username">
									<input type="hidden" name="smt" id="smt" class="form-control" value="<?=$smt;?>" placeholder="Username">
								</div>
								<div class="portlet-body">
									<div class="row">
										<div class="col-lg-8 col-sm-6">
											<?php if($level==98 or $level==97){ ?>
											<select class="form-select" id="proyek" name="proyek">
												<option value="0">Pilih Proyek</option>
												<?php 
												$sql4 = "select * from data_proyek where kelas='$kelas' and tapel='$tapel' and smt='$smt' order by id_proyek asc";
												$query4 = $connect->query($sql4);
												$ck=0;
												while($nk=$query4->fetch_assoc()){
												?>
												<option value="<?=$nk['id_proyek'];?>"><?=$nk['nama_proyek'];?></option>
												<?php
												};
												?>
											</select>
											<?php }else{ ?>
											<select class="form-select" id="proyek" name="proyek">
												<option value="0">Pilih Proyek</option>
											</select>
											<?php } ?>
										</div>
										<div class="col-lg-4 col-sm-6">
											<button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#info"><i class="fas fa-plus"></i>  Pemetaan</button>
										</div>
									</div>
									<hr>
									<!-- BEGIN Datatable -->
									<table id="datatable-1" class="table table-bordered table-striped table-hover">
										<thead>
											<tr>
												<th>Dimensi Penilaian</th>
												<th></th>
											</tr>
										</thead>
									</table>
									<!-- END Datatable -->
								</div>
							</div>
							<?php } ?>
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
	<div class="modal fade" id="info">
		<div class="modal-dialog">
			<div class="modal-content">
				<form class="form-horizontal" action="modul/proyek/tambahpeta.php" autocomplete="off" method="POST" id="buatproyek">
				<div class="fetched-data"></div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="edit-info">
		<div class="modal-dialog">
			<div class="modal-content">
				<form class="form-horizontal" action="modul/proyek/ubahproyek.php" autocomplete="off" method="POST" id="ubahproyek">
				<div class="fetched-data1"></div>
				</form>
			</div>
		</div>
	</div>
	<!-- END Modal -->
	<?php include "layout/offcanvas-todo.php"; ?>
	<?php include "layout/script.php"; ?>
	<script>
	var TabelRombel;
	$(document).ready(function(){
		var kelas = $('#kelas').val();
		var tapel = $('#tapel').val();
		var smt = $('#smt').val();
		var proyek = $('#proyek').val();
		TabelRombel = $("#datatable-1").DataTable({ 
			"destroy":true,
			"searching": true,
			"paging":true,
			"responsive":true,
			"ajax": "modul/proyek/peta-proyek.php?proyek="+proyek
		});
		$('#caridata').on( 'keyup', function () {
			TabelRombel.search( this.value ).draw();
		} );
		$('#kelas').change(function(){
				//Mengambil value dari option select provinsi kemudian parameternya dikirim menggunakan ajax
			var kelas = $('#kelas').val();
			var tapel = $('#tapel').val();
			var smt = $('#smt').val();
			var proyek = $('#proyek').val();
			$.ajax({
				type : 'GET',
				url : 'modul/proyek/proyek.php',
				data :  'kelas='+kelas+'&smt='+smt+'&tapel='+tapel,
				beforeSend: function()
				{	
					$('#status').block({ message: '\n<div class="spinner-grow text-success"></div>\n<h1 class="blockui blockui-title">Tunggu sebentar...</h1>\n'});
				},
				success: function (data) {
					//jika data berhasil didapatkan, tampilkan ke dalam option select mp
					$('#status').unblock();
					$("#proyek").html(data);
				}
			});
			TabelRombel = $("#datatable-1").DataTable({ 
				"destroy":true,
				"searching": true,
				"paging":true,
				"responsive":true,
				"ajax": "modul/proyek/peta-proyek.php?proyek="+proyek
			});
		});
		$('#proyek').change(function(){
			var kelas = $('#kelas').val();
			var tapel = $('#tapel').val();
			var smt = $('#smt').val();
			var proyek = $('#proyek').val();
			TabelRombel = $("#datatable-1").DataTable({ 
				"destroy":true,
				"searching": true,
				"paging":true,
				"responsive":true,
				"ajax": "modul/proyek/peta-proyek.php?proyek="+proyek
			});				
		});
		
		$('#info').on('show.bs.modal', function (e) {
            var kelas = $('#kelas').val();
			var mapel = $('#mp').val();
			var smt = $('#smt').val();
			var proyek = $('#proyek').val();
			if(kelas==0 || proyek==0){
				Swal.fire("Kesalahan","Isi Dahulu Kelas sama Mapelnya","error");
			}else{
			//menggunakan fungsi ajax untuk pengambilan data
				$.ajax({
					type : 'post',
					url : 'modul/proyek/m_peta.php',
					data :  'kelas='+ kelas+"&smt="+smt+"&tapel="+tapel+"&proyek="+proyek,
					beforeSend: function()
					{	
						$('#status').block({ message: '\n<div class="spinner-grow text-success"></div>\n<h1 class="blockui blockui-title">Tunggu sebentar...</h1>\n'});
					},
					success : function(data){
						$('#status').unblock();
						$('.fetched-data').html(data);//menampilkan data ke dalam modal
					}
				});
			}
		});
		$('#edit-info').on('show.bs.modal', function (e) {
            var rowid = $(e.relatedTarget).data('proyek');
			//menggunakan fungsi ajax untuk pengambilan data
			$.ajax({
				type : 'post',
				url : 'modul/proyek/e_proyek.php',
                data :  'rowid='+ rowid,
				beforeSend: function()
				{	
					$('#status').block({ message: '\n<div class="spinner-grow text-success"></div>\n<h1 class="blockui blockui-title">Tunggu sebentar...</h1>\n'});
				},
				success : function(data){
					$('#status').unblock();
					$('.fetched-data1').html(data);//menampilkan data ke dalam modal
				}
			});
		});
		$("#buatproyek").unbind('submit').bind('submit', function() {
			var form = $(this);
			//submi the form to server
			$.ajax({
				url : form.attr('action'),
				type : form.attr('method'),
				data : form.serialize(),
				dataType : 'json',
				beforeSend: function()
						{	
							$('#status').block({ message: '\n<div class="spinner-grow text-success"></div>\n<h1 class="blockui blockui-title">Tunggu sebentar...</h1>\n'});
						},
				success:function(response) {
					$("#info").modal('hide');
					$('#status').unblock();
					if(response.success == true) {
						const Toast = Swal.mixin({
						  toast: true,
						  position: 'top-right',
						  iconColor: 'white',
						  customClass: {
							popup: 'colored-toast'
						  },
						  showConfirmButton: false,
						  timer: 1500,
						  timerProgressBar: true
						})
						Toast.fire({
						  icon: 'success',
						  title: response.messages
						})
						var kelas = $('#kelas').val();
						var tapel = $('#tapel').val();
						var smt = $('#smt').val();
						$('#datatable-1').DataTable().ajax.reload();
						//$("#createKDFormk")[0].reset();
						// this function is built in function of datatables;
					} else {
						const Toast = Swal.mixin({
						  toast: true,
						  position: 'top-right',
						  iconColor: 'white',
						  customClass: {
							popup: 'colored-toast'
						  },
						  showConfirmButton: false,
						  timer: 1500,
						  timerProgressBar: true
						})
						Toast.fire({
						  icon: 'success',
						  title: response.messages
						})
					}  // /else
				} // success  
			}); // ajax subit 				
			return false;
		}); // /submit form for Tujuan
		
		$("#ubahproyek").unbind('submit').bind('submit', function() {
			var form = $(this);

			$.ajax({
				url: form.attr('action'),
				type: form.attr('method'),
				data: form.serialize(),
				dataType: 'json',
				success:function(response) {
					$("#edit-info").modal('hide');
					if(response.success == true) {
						const Toast = Swal.mixin({
						  toast: true,
						  position: 'top-right',
						  iconColor: 'white',
						  customClass: {
							popup: 'colored-toast'
						  },
						  showConfirmButton: false,
						  timer: 1500,
						  timerProgressBar: true
						})
						Toast.fire({
						  icon: 'success',
						  title: response.messages
						})
						var kelas = $('#kelas').val();
						var tapel = $('#tapel').val();
						var smt = $('#smt').val();
						var mp = $('#mp').val();
						TabelRombel.ajax.reload(null, false);
					} else {
						Swal.fire("Kesalahan","Masih ada TP yang terdaftar pada LM ini!","error");
					}
				} // /success
			}); // /ajax
			return false;
		});
	});	
		
	
	function removePeta(id = null) {
		if(id) {
			// click on remove button
			
			Swal.fire({
			  title: 'Yakin dihapus?',
			  text: "Apakah anda yakin menghapus Pemetaan Proyek ini?",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Ya, Hapus!'
			}).then((result) => {
			  if (result.isConfirmed) {
				$.ajax({
						url: 'modul/proyek/hapus-peta.php',
						type: 'post',
						data: {member_id : id},
						dataType: 'json',
						success:function(response) {
							if(response.success == true) {						
								// refresh the table
								var kelas = $('#kelas').val();
								var tapel = $('#tapel').val();
								var smt = $('#smt').val();
								var proyek = $('#proyek').val();
								TabelRombel.ajax.reload(null, false);
							} else {
								Swal.fire("Kesalahan",response.messages,"error");
							}
						}
					});
			  }
			})
			
		} else {
			Swal.fire("Kesalahan","Error Sistem","error");
		}
	}
		
	</script>
</body>
</html>
