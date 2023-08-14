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
					<h4>Artikel Website</h4>
					<h6><a href="add-artikel" class="btn btn-primary">
								Buat Artikel
							  </a></h6>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<?php 
							//$brt1=mysqli_query($koneksi, "select * from berita order by id desc");
							$jbrt1=$connect->query("select * from berita order by id desc")->num_rows;
							if($jbrt1>0){
							?>
							<div class="table-responsive">
								<table class="table table-sm table-striped" id="table-1">
									<thead>
										<tr>
											<th>Penulis</th>
											<th>Tanggal</th>
											<th>Artikel</th>
											<th>Isi</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
									<?php 
									$newpost=0;
									$sql = "select * from berita order by id desc";
									$query = $connect->query($sql);
									while ($pg1 = $query->fetch_assoc()) {
										$ptk_id=$pg1['penulis'];
										$namaadmin1=$connect->query("select * from ptk where ptk_id='$ptk_id'")->fetch_assoc();
										if(file_exists( $_SERVER{'DOCUMENT_ROOT'} . "/images/ptk/".$namaadmin1['gambar'])){
											$gbr=$namaadmin1['gambar'];
										}else{
											$gbr="user-default.png";
										};
										$newpost=$newpost+1;
									?>
									<tr>
										
										<td><img alt="image" class="mr-3 rounded-circle" width="70" src="<?=base_url();?>images/ptk/<?=$gbr;?>"></td>
										<td><?=TanggalIndo($pg1['tanggal']);?></td>
										<td><?=$pg1['judul'];?> [<?=$pg1['view'];?> Dilihat]</td>
										<td></td>
										<td><a href="#">Edit</a><a href="#" class="text-danger" data-toggle="modal" data-target="#hapusberitaModal" onclick="hapusBerita('5')">Trash</a>										
										</td>
									</tr>
									<?php } ?>
									</tbody>
								</table>
							</div>
							
							<?php }else{ ?>
							<div class="alert alert-info alert-dismissible">
								<h4><i class="icon fa fa-info-circle"></i> Informasi</h4>
								Belum Ada Artikel
							</div>
							<?php } ?>
				</div>
			</div>
			
			<!--Modal-->
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
	</div>
</div>
<?php include "layout/script.php";?>
<script type="text/javascript" src="<?=base_url();?>assets/plugins/tinymce/tinymce.min.js"></script>
<script>
$("#table-1").DataTable();
tinymce.init({
  selector: '#konten',
  plugins: [
    'advlist', 'autolink', 'link', 'image', 'lists', 'charmap', 'preview', 'anchor', 'pagebreak',
    'searchreplace', 'wordcount', 'visualblocks', 'code', 'fullscreen', 'insertdatetime', 'media',
    'table', 'emoticons', 'template', 'help'
  ],
  toolbar: 'undo redo | styles | bold italic | alignleft aligncenter alignright alignjustify | ' +
    'bullist numlist outdent indent | link image | print preview media fullscreen | ' +
    'forecolor backcolor emoticons | help',
  menu: {
    favs: { title: 'My Favorites', items: 'code visualaid | searchreplace | emoticons' }
  },
  menubar: 'favs file edit view insert format tools table help',
  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
});

        </script>