<?php 
require_once '../../function/db_connect.php';
$kelas=$_GET['kelas'];
$tapel=$_GET['tapel'];
$smt=$_GET['smt'];
$output = array('data' => array());
$sql = "select * from penempatan where rombel='$kelas' and tapel='$tapel' and smt='$smt' order by nama asc";
$query = $connect->query($sql);
while($s=$query->fetch_assoc()) {
	$idp=$s['peserta_didik_id'];
	$sql1 = "select * from nsp where id_pd='$idp' and kelas='$kelas' and smt='$smt' and tapel='$tapel' order by idNH desc";
	$query1 = $connect->query($sql1);
	$namapeta='<ul class="" id="mail-labels">';
	while($pn = $query1->fetch_assoc()){
		$jns=$pn['jns'];
		switch ($jns) {
			case 1:
				$nsos="Ketaatan Beribadah";
				break;
			case 2:
				$nsos="Berdoa";
				break;
			case 3:
				$nsos="Toleransi";
				break;
			case 4:
				$nsos="Bersyukur";
				break;
			default:
				$nsos="Kosong";
				break;
		};
		$actionButton = '
		<button class="btn btn-icon btn-primary btn-round btn-xs" data-toggle="modal" data-target="#removeNilaiModal" onclick="removeSpi('.$pn['idNH'].')"><i class="fa fa-trash"></i></button>';
		$namapeta.='
		
					<li class="media">
						<div class="media-body">
                          <div class="media-title">
						  <button class="btn btn-icon btn-sm btn-warning" data-toggle="modal" data-target="#removeNilaiModal" onclick="removeSpi('.$pn['idNH'].')"><i class="fas fa-trash"></i></button> '.$nsos.' ('.$pn['nilai'].')
						  </div>
                        </div>
						<div class="media-progressbar">
                          '.$pn['perilaku'].'
                        </div>
					</li>';
	};
	$namapeta.='</ul>';
	$tombol = '
		<div class="btn-group">
		<a class="btn btn-icon btn-sm btn-primary" data-toggle="modal" data-target="#tambahNilai" data-kelas="'.$kelas.'" data-tapel="'.$tapel.'" data-smt="'.$smt.'" data-pdid="'.$idp.'" id="getSosial"><i class="fa fa-plus-circle"></i></a>
		</div>';
	
	$output['data'][] = array(
		'<a href="#" class="btn btn-icon icon-left btn-primary" data-toggle="modal" data-target="#tambahNilai" data-kelas="'.$kelas.'" data-tapel="'.$tapel.'" data-smt="'.$smt.'" data-pdid="'.$idp.'" id="getSosial"><i class="far fa-edit"></i></a> '.$s['nama'],
		$namapeta
	);
};
$connect->close();
echo json_encode($output);