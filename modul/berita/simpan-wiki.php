<?php
require_once '../../config/config.php';
  require_once '../../config/db_connect.php';
				$penulis = $_POST['penulis'];
				$tanggal=$_POST['tanggal'];
				$isi = $connect->real_escape_string($_POST['content']);
				$judul = strip_tags($connect->real_escape_string($_POST['judul']));
				$slug = preg_replace('/[^a-z0-9]+/i', '-', trim(strtolower($judul)));
				$sqls = "INSERT INTO wiki(penulis,tanggal,judul,slug,isi,images,view) VALUES('$penulis','$tanggal','$judul','$slug','$isi','lpmp.jpg','0')";
				$query1 = $connect->query($sqls);
				if($query1 === TRUE) {	
					header("location:../../wikipedia");
					exit();
				}else{
					header("location:../../wikipedia");
					exit();
				}
?>