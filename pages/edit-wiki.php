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
					<h4>Edit Wikipedia</h4>
					<h6></h6>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<?php 
					if($tipe==''){
						
					}else{
						$idwiki=$tipe;
						$wikis = $connect->query("select * from wiki where id='$idwiki'")->fetch_assoc();
					?>
						<form class="p-3" action="<?=base_url();?>modul/berita/update-wiki.php" method="POST">
						<div class="col-lg-3 col-sm-6 col-12">
							<div class="form-group">
								<label>Tanggal <span class="manitory">*</span></label>
								<div class="input-group">
									<span class="input-group-text">
										<i class="fas fa-calendar-alt"></i>
									</span>
									<input type="text" id="tanggal" name="tanggal" value="<?=$wikis['tanggal'];?>" class="form-control"  required>
									<input type="hidden" name="penulis" value="<?=$wikis['penulis'];?>">
									<input type="hidden" name="idwiki" value="<?=$wikis['id'];?>">
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-sm-12 col-12">
							<div class="form-group">
								<label>Judul <span class="manitory">*</span></label>
								<input type="text" class="form-control" name="judul" value="<?=$wikis['judul'];?>" required>
							</div>
						</div>
						<div class="col-lg-12 col-sm-12 col-12">
							<div class="form-group">
								<label>Isi <span class="manitory">*</span></label>
								<textarea name="content" id="konten"><?=$wikis['isi'];?></textarea>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<button name="simpan" type="submit" class="btn btn-submit me-2">Simpan</button>
								<a href="javascript:void(0);" class="btn btn-cancel">Cancel</a>
							</div>
						</div>
						</form>
					<?php } ?>
				</div>
			</div>
			
			
			<!--Modal-->
									
			
			
		</div>
	</div>
</div>
<?php include "layout/script.php";?>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckbox.io/ckbox/1.3.2-rc.0/ckbox.js"></script>
<script>
$('#tanggal').datepicker({
	format: 'yyyy-mm-dd',
	autoclose:true
});
//CKEDITOR.replace('konten');


            ClassicEditor
                .create( document.querySelector( '#konten' ), {
                    ckbox: {
                        tokenUrl: 'https://95716.cke-cs.com/token/dev/1988ecdca9966fa57938471475eecefa9625e1fcf6fd709026b64ab66f9f?limit=10',
                    },
                    toolbar: [
                        'ckbox', 'imageUpload', '|', 'heading', '|', 'undo', 'redo', '|', 'bold', 'italic', '|',
                        'blockQuote', 'indent', 'link', '|', 'bulletedList', 'numberedList'
                    ],
                } )
                .catch( error => {
                    console.error( error );
                } );
        </script>