<?php $data="Upload Dokumen";?>
<?php include "layout/head.php"; 
$bln=isset($_GET['bln']) ? $_GET['bln'] : date("m");
$thn=isset($_GET['thn']) ? $_GET['thn'] : date("Y");
$bulan = array("Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember");
?>
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
							
							<div class="portlet" id="status">
								
								<div class="portlet-body">
									<div class="statusMsg"></div>
									<!-- BEGIN Datatable -->
									<div class="row mb-2">
									<div class="col-lg-12">
										<form id="fupForm" enctype="multipart/form-data" autocomplete="off">
											<div class="form-group mb-2">
												<label for="name">Judul</label>
												<input type="hidden" class="form-control" id="idptk" name="idptk" value="<?=$idku;?>" required />
												<input type="text" class="form-control" id="judul" name="judul" placeholder="Deskripsi Dokumen" required />
											</div>
											<div class="form-group mb-2">
												<label for="file">Files</label>
												<input type="file" class="form-control" id="file" name="files[]" multiple />
											</div>
											<input type="submit" name="submit" class="btn btn-success submitBtn" value="SUBMIT"/>
										</form>
									</div>
									</div>
									<table id="datatable-1" class="table table-bordered table-striped table-hover">
										<thead>
											<tr>
												<th>Tanggal</th>
												<th>Judul</th>
												<th>Dokumen</th>
												<th>Uploader</th>
												<th></th>
											</tr>
										</thead>
									</table>
									<!-- END Datatable -->
								</div>
							</div>
							
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
				<form id="updateTemaForm" method="POST" action="modul/kepegawaian/ubah-level.php" class="form">
				<div class="fetched-data"></div>
				</form>
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
	<script>
	var TabelRombel;
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
$(document).ready(function(){
	var ptkid = $('#ptkid').val();
		var tapel = $('#tapel').val();
		var smt = $('#smt').val();
		<?php if($level==11){ ?>
		TabelRombel = $("#datatable-1").DataTable({ 
			"destroy":true,
			"searching": true,
			"paging":true,
			"responsive":true,
			"ajax": "modul/dokumen/daftar-dokumen.php?ptkid=0"
		});
		<?php }else{ ?>
		TabelRombel = $("#datatable-1").DataTable({ 
			"destroy":true,
			"searching": true,
			"paging":true,
			"responsive":true,
			"ajax": "modul/dokumen/daftar-dokumen.php?ptkid="+ptkid
		});
		<?php } ?>
    // Submit form data via Ajax
    $("#fupForm").on('submit', function(e){
        e.preventDefault();
        $.ajax({
            type: 'POST',
            url: 'dokumen/upload_dokumen.php',
            data: new FormData(this),
            dataType: 'json',
            contentType: false,
            cache: false,
            processData:false,
            beforeSend: function(){
                $('.submitBtn').attr("disabled","disabled");
                $('#fupForm').css("opacity",".5");
            },
            success: function(response){
                $('.statusMsg').html('');
                if(response.status == 1){
                    $('#fupForm')[0].reset();
                    $('.statusMsg').html('<p class="alert alert-success">'+response.message+'</p>');
                }else{
                    $('.statusMsg').html('<p class="alert alert-danger">'+response.message+'</p>');
                }
                $('#fupForm').css("opacity","");
                $(".submitBtn").removeAttr("disabled");
				TabelRombel.ajax.reload(null, false);
            }
        });
    });
	
    // File type validation
    var match = ['application/pdf', 'application/msword', 'application/vnd.ms-office', 'image/jpeg', 'image/png', 'image/jpg'];
    $("#file").change(function() {
        for(i=0;i<this.files.length;i++){
            var file = this.files[i];
            var fileType = file.type;
			
            if(!((fileType == match[0]) || (fileType == match[1]) || (fileType == match[2]) || (fileType == match[3]) || (fileType == match[4]) || (fileType == match[5]))){
                alert('Sorry, only PDF, DOC, JPG, JPEG, & PNG files are allowed to upload.');
                $("#file").val('');
                return false;
            }
        }
    });
});
	function removeDokumen(id = null) {
			if(id) {
				// click on remove button
				
				Swal.fire({
				  title: 'Yakin dihapus?',
				  text: "Apakah anda yakin menghapus Dokumen ini?",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Ya, Hapus!'
				}).then((result) => {
				  if (result.isConfirmed) {
					$.ajax({
							url: '<?=base_url();?>modul/dokumen/hapus-dokumen.php',
							type: 'post',
							data: {member_id : id},
							dataType: 'json',
							success:function(response) {
								if(response.success == true) {						
									// refresh the table
									toastr.success(response.messages);
									TabelRombel.ajax.reload(null, false);
								} else {
									toastr.error(response.messages);
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
