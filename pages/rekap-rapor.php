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
					<h4>Rekap Rapor</h4>
					<h6></h6>
					<input type="hidden" name="tapel" id="tapel" class="form-control" value="<?=$tapel;?>" placeholder="Username">
										<input type="hidden" name="smt" id="smt" class="form-control" value="<?=$smt;?>" placeholder="Username">
				</div>
				<div class="page-btn">
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					
					<div class="row">
								<div class="col-lg-3 col-sm-6 col-12">
									<div class="form-group">
										<?php if($level==96){?>
										<select class="select" id="kelas" name="kelas">
											<option value="0">Pilih Rombel</option>
											<?php 
											$sql4 = "select * from rombel where tapel='$tapel' and pai='$idku' and kurikulum='Kurikulum 2013' order by nama_rombel asc";
											$query4 = $connect->query($sql4);
											while($nk=$query4->fetch_assoc()){
												
											?>
											<option value="<?=$nk['nama_rombel'];?>"><?=$nk['nama_rombel'];?></option>
											<?php };?>
										</select>
										<?php }elseif($level==95){ ?>
										<select class="select" id="kelas" name="kelas">
											<option value="0">Pilih Rombel</option>
											<?php 
											$sql4 = "select * from rombel where tapel='$tapel' and penjas='$idku' and kurikulum='Kurikulum 2013' order by nama_rombel asc";
											$query4 = $connect->query($sql4);
											while($nk=$query4->fetch_assoc()){
												
											?>
											<option value="<?=$nk['nama_rombel'];?>"><?=$nk['nama_rombel'];?></option>
											<?php };?>
										</select>
										<?php }elseif($level==94){ ?>
										<select class="select" id="kelas" name="kelas">
											<option value="0">Pilih Rombel</option>
											<?php 
											$sql4 = "select * from rombel where tapel='$tapel' and inggris='$idku' and kurikulum='Kurikulum 2013' order by nama_rombel asc";
											$query4 = $connect->query($sql4);
											while($nk=$query4->fetch_assoc()){
												
											?>
											<option value="<?=$nk['nama_rombel'];?>"><?=$nk['nama_rombel'];?></option>
											<?php };?>
										</select>
										<?php }elseif($level==11){ ?>
										<select class="select" id="kelas" name="kelas">
											<option value="0">Pilih Rombel</option>
											<?php 
											$sql4 = "select * from rombel where tapel='$tapel' and kurikulum='Kurikulum 2013' order by nama_rombel asc";
											$query4 = $connect->query($sql4);
											while($nk=$query4->fetch_assoc()){
												
											?>
											<option value="<?=$nk['nama_rombel'];?>"><?=$nk['nama_rombel'];?></option>
											<?php };?>
										</select>
										<?php }else{ ?>
										<select class="select" id="kelas" name="kelas">
											<option value="0">Pilih Rombel</option>
											<option value="<?=$kelas;?>"><?=$kelas;?></option>
										</select>
										<?php }; ?>
									</div>
								</div>
								<div class="col-lg-3 col-sm-6 col-12">
									<div class="form-group">
										<select class="select" id="jns" name="jns">
											<option value="0">Pilih Rapor</option>
										</select>
										
									</div>
								</div>
								<div class="col-lg-3 col-sm-6 col-12">
									<div class="form-group">
										<button class="btn btn-sm btn-primary btn-icon" id="cetakT"><i class="fas fa-print"></i> Rekap Rapor</button>
									</div>
								</div>
								<div class="col-lg-3 col-sm-6 col-12">
									<div class="form-group">

									</div>
								</div>
							</div>
							
									<div class="table-responsive">
										<table class="table table-bordered table-striped" id="kt_table_users">
								<thead>
									<tr>
										<th class="text-center">Nama Siswa</th>
										<?php 
										$sql1 = "select * from mapel order by id_mapel asc";
										$query1 = $connect->query($sql1);
										while ($row1 = $query1->fetch_assoc()) {
										?>
										<th class="text-center"><?=$row1['kd_mapel'];?></th>
										<?php } ?>
										<th class="text-center">Jumlah</th>
										<th class="text-center">Rerata</th>
										<th class="text-center">Rank</th>
									</tr>
								</thead>
								<tbody>				
								</tbody>
							</table>
									 </div>
					<!-- Modal -->
					
					
					
				</div>
			</div>
		</div>
	</div>
</div>
<?php include "layout/script.php";?>
<script src="<?=base_url();?>ajax/rekap-rapor.js"></script>