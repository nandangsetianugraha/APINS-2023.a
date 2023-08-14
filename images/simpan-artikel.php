<?php
  require_once '../function/functions.php';
  require_once '../function/db_connect.php';
  date_default_timezone_set('Asia/Jakarta');
 
  $temps = "berita/";
 
  $judul   = addslashes($_POST['judul']);
  $idptk          = $_POST['idptk'];
  $tanggal = date("Y-m-d");
  $slug = preg_replace('/[^a-z0-9]+/i', '-', trim(strtolower($_POST['judul'])));
  $isi          = addslashes($_POST['konten']);
  $gambar = $_FILES['filed']['name'];
  $ektensi = ['jpg', 'png', 'jpeg'];
  if (!empty($gambar)){
	//$file = $_FILES['filed']['name'];
    $temp = $_FILES['filed']['tmp_name'];
    $ext = explode('.', $gambar);
    $ext = strtolower(end($ext));
	$dest = 'berita/';
	if (in_array($ext, $ektensi)) {
		$path = $dest . $file;
		$upload = move_uploaded_file($temp, 'berita/'.$gambar);
		if ($upload) { 
			$query = "INSERT INTO berita(penulis,tanggal,judul,slug,isi,images) VALUES('$idptk','$tanggal','$judul','$slug','$isi','$gambar')";
			$query1 = $connect->query($query);
			echo "OK";
		}else{
			echo "Gagal Upload";
		};
	};
  } else {
	$query = "INSERT INTO berita(penulis,tanggal,judul,slug,isi,images) VALUES('$idptk','$tanggal','$judul','$slug','$isi','default.jpg')";
    $query1 = $connect->query($query);
    if($query1 === TRUE) {
		echo "OK";
	}else{
		echo "Gagal Tulis";
	};
  }
?>