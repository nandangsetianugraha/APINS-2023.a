<?php 

require_once '../../function/db_connect.php';
//if form is submitted
if($_POST) {	
		$validator['success'] = false;
		$validator['messages'] = "Tidak Boleh Kosong Datanya!";
	}else{
			$sql = "update tunggakan_lain set tarif='$tarif' where id='$idr'";
			$validator['success'] = true;
			$validator['messages'] = "Tarif berhasil diperbaharui!";		
	};
	
	// close the database connection
	$connect->close();

	echo json_encode($validator);

}