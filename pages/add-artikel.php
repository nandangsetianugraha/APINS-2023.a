<?php include "layout/head.php"; ?>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
</head>
<body>
<?php include "layout/loader.php"; ?>
<div class="main-wrapper">
	<?php include "layout/header.php"; ?>
	<?php include "layout/sidebar.php"; ?>
  <input type="hidden" value="<?=base_url();?>" id="urls">
 	<div class="page-wrapper pagehead">
		<div class="content">
			<div class="page-header">
				<div class="page-title">
					<h4>Artikel Website</h4>
					<h6></h6>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<div class="row">
						<form action="" method="post">
						<div class="col-lg-3 col-sm-6 col-12">
							<div class="form-group">
								<label>Tanggal <span class="manitory">*</span></label>
								<div class="input-group">
									<span class="input-group-text">
										<i class="fas fa-calendar-alt"></i>
									</span>
									<input type="text" id="tanggal" name="tanggal" value="<?=date('Y-m-d');?>" class="form-control"  required>
									<input type="hidden" name="penulis" id="penulis" value="<?=$bioku['ptk_id'];?>">
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-sm-12 col-12">
							<div class="form-group">
								<label>Judul <span class="manitory">*</span></label>
								<input type="text" class="form-control" name="judul" id="judul" required>
							</div>
						</div>
						<div class="col-lg-12 col-sm-12 col-12">
							<div class="form-group">
								<label>Isi <span class="manitory">*</span></label>
								<div id="deskripsiSoal" name="deskripsiSoal" style="min-height:100%; height:auto"></div>
								<textarea id="summernote"></textarea>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<button type="submit" id="save" class="btn btn-submit me-2">Simpan</button>
								<a href="javascript:void(0);" class="btn btn-cancel">Cancel</a>
							</div>
						</div>
                      </form>
					</div>
				</div>
			</div>
			
			
			<!--Modal-->
									
			
			
		</div>
	</div>
</div>
<?php include "layout/script.php";?>
<!--<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>-->

<!--
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckbox.io/ckbox/1.3.2-rc.0/ckbox.js"></script>
-->
<script src="https://cdn.ckeditor.com/ckeditor5/22.0.0/classic/ckeditor.js"></script>
<script>
		$(document).ready(function() {
	     
             ClassicEditor
                    .create(document.querySelector('#summernote'))
                    .catch(error => {
                        console.error(error);
                    });
			
        });
$('#tanggal').datepicker({
	format: 'yyyy-mm-dd',
	autoclose:true
});
//CKEDITOR.replace('konten');

        </script>