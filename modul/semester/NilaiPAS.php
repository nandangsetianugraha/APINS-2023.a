<?php 
require_once '../../function/db_connect.php';
$tapel=$_GET['tapel'];
$smt=$_GET['smt'];
$kelas=$_GET['kelas'];
$ab=substr($kelas,0,1);
$peta=$_GET['peta'];
$mpid=$_GET['mp'];
$ada=0;
if($tapel_aktif==$tapel and $smt_aktif==$smt){
	$edit=true;
}else{
	$edit=false;
};
$sql11="select * from kd where kelas='$ab' and mapel='$mpid' group by kd";
$query11 = $connect->query($sql11);
while($h=$query11->fetch_assoc()) {
    $kdn=$h['kd'];
    $ckkm1=$connect->query("select * from kkmku where kelas='$ab' and tapel='$tapel' and mapel='$mpid' and kd='$kdn' and jenis='1'")->num_rows;
    $ckkm2=$connect->query("select * from kkmku where kelas='$ab' and tapel='$tapel' and mapel='$mpid' and kd='$kdn' and jenis='2'")->num_rows;
    $ckkm3=$connect->query("select * from kkmku where kelas='$ab' and tapel='$tapel' and mapel='$mpid' and kd='$kdn' and jenis='3'")->num_rows;
    if($ckkm1>0){$ada=$ada;}else{$ada=$ada+1;};
    if($ckkm2>0){$ada=$ada;}else{$ada=$ada+1;};
    if($ckkm3>0){$ada=$ada;}else{$ada=$ada+1;};
};
if($ada>0){
	$boleh=false;
}else{
	$boleh=true;
};
$mpm=$connect->query("select * from mapel where id_mapel='$mpid'")->fetch_assoc();
if($mpid==0){
	echo "<div class='alert alert-info alert-dismissible'><h4><i class='icon fa fa-info'></i> Informasi</h4>Silahkan Pilih Mata Pelajaran</div>";
}else{
	if($boleh==false){
		?>
		<div class="error-page">
			<div class="error-content text-center" style="margin-left: 0;">
				<h3><i class="fa fa-info-circle text-danger"></i> Kesalahan </h3>
				<p>Belum Mengisi KKM <?=$mpm['nama_mapel'];?> Kelas <?=$ab;?>, silahkan isi terlebih dahulu dan lengkapi KKM <?=$mpm['nama_mapel'];?> Kelas <?=$ab;?>.</p>
			</div>
		</div>
	<?php 
	}else{	
		?>

		<div class="table-responsive no-padding">
		<table class="table table-bordered table-hover">
									<thead>
									   <tr>
											<th>Nama Siswa</th>
											<?php 
											$sqlk = "select * from pemetaan where kelas='$ab' and smt='$smt' and kd_aspek='3' and mapel='$mpid' group by nama_peta order by nama_peta asc";
											$queryk = $connect->query($sqlk);
											while($sk=$queryk->fetch_assoc()) {
											?>
											<th><?=$sk['nama_peta'];?></th>
											<?php }; ?>
										</tr>
									</thead>
									<tbody>	
		<?php 
		$sql="select * from penempatan where rombel='$kelas' and tapel='$tapel' and smt='$smt' order by nama asc";
		$query = $connect->query($sql);
		while($s=$query->fetch_assoc()) {
          	$idp=$s['peserta_didik_id'];
          	$siswa = $connect->query("select * from siswa where peserta_didik_id='$idp'")->fetch_assoc();
            if(file_exists($_SERVER{'DOCUMENT_ROOT'} . "/images/siswa/".$siswa['avatar'])){
                $avatarm=$siswa['avatar'];
            }else{
                $avatarm="user-default.png";
            };
		?>
		<tr>
			<td><?=$s['nama'];?></td>
		<?php 
			$sqlt = "select * from pemetaan where kelas='$ab' and smt='$smt' and kd_aspek='3' and mapel='$mpid' group by nama_peta order by nama_peta asc";
			$queryt = $connect->query($sqlt);
			while($su=$queryt->fetch_assoc()) {
				$kdp=$su['nama_peta'];
				$sql1 = "select * from nats where id_pd='$idp' and smt='$smt' and tapel='$tapel' and mapel='$mpid' and kd='$kdp'";
				$query1 = $connect->query($sql1);
				$adanilai=$query1->num_rows;
				if($adanilai>0){
					$m=$query1->fetch_assoc();
					$nPTS=number_format($m['nilai'],0);
				}else{
					$nPTS='';
				};
				if($edit){
					$nkd='
					<span class="input form-control form-control-sm" contenteditable="true" data-old_value="'.$nPTS.'"  onBlur="saveUA(this,\'nilai\',\''.$idp.'\',\''.$kelas.'\',\''.$smt.'\',\''.$tapel.'\',\''.$mpid.'\',\''.$kdp.'\')" onClick="highlightEdit(this);">'.$nPTS.'</span>
					';
				}else{
					$nkd=$nPTS;
				};
		?>
			<td><?=$nkd;?></td>
		<?php 
			}
		?>
		</tr>
		<?php
		};
		?>
																	
									</tbody>
								</table>
								</div>
<?php };};?>