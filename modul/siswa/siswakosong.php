<?php 
$output = array('data' => array());
	if($pn>0){
	}else{
			$actionButton = '
		//$tgl=$row['tempat'].", ".TanggalIndo($row['tanggal']);
		$output['data'][] = array(
			$row['nama'],
			$actionButton
		);
	}
}
$connect->close();

echo json_encode($output);