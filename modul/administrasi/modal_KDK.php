<?php
require_once '../../function/db_connect.php';
$kelas=$_GET['kelas'];$ab=substr($kelas,0,1);$peta=$_GET['peta'];$mpid=$_GET['mp'];if($mpid==0){?><div class="alert alert-info alert-dismissible">											<h4><i class="icon fa fa-info"></i> Informasi</h4>											Silahkan Pilih Mata Pelajaran										</div><?php}else{	?>	<form class="form" action="modul/administrasi/tambahKDk.php" method="POST" id="createKDFormk">                        <div class="modal-body">							<div class="form-group form-group-default">								<label>Kelas</label>								<input type="text" name="kelask" class="form-control" value="<?php echo $ab;?>">							</div>							<div class="form-group form-group-default">								<label>Mata Pelajaran</label>								<input type="hidden" name="mapelk" class="form-control" value="<?php echo $mpid;?>">								<input type="hidden" name="aspekk" class="form-control" value="4">								<?php $nmp=$connect->query("select * from mapel where id_mapel='$mpid'")->fetch_assoc();?>								<input type="text" class="form-control" placeholder="Name" value="<?php echo $nmp['nama_mapel'];?>">							</div>							<div class="form-group form-group-default">								<label>Kompetensi Dasar</label>								<input type="text" name="kdk" autocomplete=off class="form-control" placeholder="Name" value="4.">							</div>							<div class="form-group form-group-default">								<label>Deskripsi KD</label>								<textarea name="deskripsik" class="form-control" aria-label="With textarea"></textarea>							</div>                        </div>                        <div class="modal-footer">                            <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Tutup</button>							<?php if($mpid==0){}else{ ?>                            <button type="submit" class="btn btn-danger waves-effect waves-light">Simpan</button>							<?php } ?>                        </div>						</form><?php}?>
