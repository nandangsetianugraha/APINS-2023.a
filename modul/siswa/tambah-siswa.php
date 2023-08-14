<?php 

include("../../config/db_connect.php");
function random_str(
    int $length = 64,
    string $keyspace = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
): string {
    if ($length < 1) {
        throw new \RangeException("Length must be a positive integer");
    }
    $pieces = [];
    $max = mb_strlen($keyspace, '8bit') - 1;
    for ($i = 0; $i < $length; ++$i) {
        $pieces []= $keyspace[random_int(0, $max)];
    }
    return implode('', $pieces);
};
//if form is submitted
if($_POST) {	

	$validator = array('success' => false, 'messages' => array());
	$nis=strip_tags($connect->real_escape_string($_POST['nis']));
	$nisn=strip_tags($connect->real_escape_string($_POST['nisn']));
	$nama=strip_tags($connect->real_escape_string($_POST['nama']));
	$jk=$_POST['jk'];
	$tempat=strip_tags($connect->real_escape_string($_POST['tempat']));
	$tanggal=$_POST['tanggal'];
	$nik=strip_tags($connect->real_escape_string($_POST['nik']));
	$agama=$_POST['agama'];
	$no_wa=$_POST['no_wa'];
	$pend=strip_tags($connect->real_escape_string($_POST['pend_seb']));
	$alamat=strip_tags($connect->real_escape_string($_POST['alamat']));
	$ayah=strip_tags($connect->real_escape_string($_POST['ayah']));
	$ibu=strip_tags($connect->real_escape_string($_POST['ibu']));
	$pek_ayah=$_POST['pek_ayah'];
	$pek_ibu=$_POST['pek_ibu'];
	//$=$_POST[''];
	//$=$_POST[''];
	$jalan=strip_tags($connect->real_escape_string($_POST['jalan']));
	$kelurahan=$_POST['kelurahan'];
	$kecamatan=$_POST['kecamatan'];
	$kabupaten=$_POST['kabupaten'];
	$provinsi=$_POST['provinsi'];
	$id_pd1=random_str(8);
	$id_pd2=random_str(4);
	$id_pd3=random_str(4);
	$id_pd4=random_str(4);
	$id_pd5=random_str(12);
	$id_pd=$id_pd1.'-'.$id_pd2.'-'.$id_pd3.'-'.$id_pd4.'-'.$id_pd5;
	if(empty($nama) || empty($tanggal)){
		$validator['success'] = false;
		$validator['messages'] = "Nama dan tanggal lahir tidak boleh kosong!";
	}else{
			$sql1 = "INSERT INTO siswa(peserta_didik_id,nis,nisn,nama,jk,tempat,tanggal,nik,agama,pend_sebelum,alamat,nama_ayah,nama_ibu,no_wa,pek_ayah,pek_ibu,jalan,kelurahan,kecamatan,kabupaten,provinsi,avatar,status,nasabah_id) VALUES('$id_pd','$nis','$nisn','$nama','$jk','$tempat','$tanggal','$nik','$agama','$pend','$alamat','$ayah','$ibu','$no_wa','$pek_ayah','$pek_ibu','$jalan','$kelurahan','$kecamatan','$kabupaten','$provinsi','avatar.png','1','0')";
			$query1 = $connect->query($sql1);
			if($query1 === TRUE) {			
				$validator['success'] = true;
				$validator['messages'] = "Penambahan Siswa atas nama $nama berhasil!";		
			} else {		
				$validator['success'] = false;
				$validator['messages'] = "Ada yang error nih???";
			};
		
	};
	
	// close the database connection
	$connect->close();

	echo json_encode($validator);

}