<?php require_once '../../config/config.php';require_once '../../config/db_connect.php';
$kelas=$_GET['kelas'];$peta=$_GET['aspek'];$mpid=$_GET['mp'];$output = array('data' => array());$sql = "select * from kd where kelas='$kelas' and aspek='$peta' and mapel='$mpid' order by kd asc";//$mapel=$connect->query("select * from ")->fetch_assoc()$query = $connect->query($sql);while($s=$query->fetch_assoc()) {	$ids=$s['id_kd'];	$actionButton = '	<button class="btn btn-effect-ripple btn-xs btn-primary" data-tema="'.$ids.'" data-bs-toggle="modal" data-bs-target="#edit-info"><i class="fa fa-edit"></i></button>	<button class="btn btn-effect-ripple btn-xs btn-danger" onclick="removeKD('.$s['id_kd'].')"> <i class="fa fa-trash"></i></button>	';
	$output['data'][] = array(		$s['kd'],		$s['nama_kd'],		$actionButton	);};//$output['messages']='KD Kelas '.$kelas.' Mata Pelajaran ';$connect->close();echo json_encode($output);