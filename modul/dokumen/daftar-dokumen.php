<?php 
require_once '../../config/config.php';
require_once '../../config/db_connect.php';
$idptk=$_GET['ptkid'];
$output = array('data' => array());
if($idptk==0){
	$sql = "SELECT * FROM form_data order by submitted_on desc";
}else{
	$sql = "SELECT * FROM form_data where ptk_id='$idptk' order by submitted_on desc";
}
$querys = $connect->query($sql);
while ($row = $querys->fetch_assoc()) {
	$idd=$row['id'];
	$ptkids=$row['ptk_id'];
	$ups=$connect->query("select * from ptk where ptk_id='$ptkids'")->fetch_assoc();
	$tombol = '
	<button class="btn btn-icon btn-xs btn-danger" onclick="removeDokumen('.$idd.')"> <i class="fa fa-trash"></i></button>
	<a href="dokumen/uploads/'.$row['file_names'].'" class="btn btn-icon btn-xs btn-primary"><i class="fa-solid fa-download"></i></a>
	';
	
	$output['data'][] = array(
		$row['submitted_on'],
		$row['judul'],
		$row['file_names'],
		$ups['nama'],
		$tombol
	);
}

// database connection close
$connect->close();

echo json_encode($output);