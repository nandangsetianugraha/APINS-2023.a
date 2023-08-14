<?php 
require_once '../../function/db_connect.php';
function TanggalIndo($tanggal)
{
	$bulan = array ('Januari',
				'Februari',
				'Maret',
				'April',
				'Mei',
				'Juni',
				'Juli',
				'Agustus',
				'September',
				'Oktober',
				'November',
				'Desember'
			);
	$split = explode('-', $tanggal);
	return $split[2] . ' ' . $bulan[ (int)$split[1]-1 ] . ' ' . $split[0];
};
$output = array('data' => array());
$smt=$_GET['smt'];
$tapel=$_GET['tapel'];

	$sql = "select * from penempatan where tapel='$tapel' and smt='$smt' order by rombel asc";
	$query = $connect->query($sql);
	while ($row = $query->fetch_assoc()) {
		$idp=$row['peserta_didik_id'];
		//$ids=$row['id'];
		//$nis=$row['nis'];
		$siswa = $connect->query("select * from siswa where peserta_didik_id='$idp'")->fetch_assoc();
		$nis=$siswa['nis'];
		$ids=$siswa['id'];
		$nkelas=$row['rombel'];
		if(file_exists("https://apins.sdi-aljannah.web.id/images/siswa/".$siswa['avatar'])){
			$avatarm=$siswa['avatar'];
		}else{
			$avatarm="user-default.png";
		};
		$actionButton = '
			<button class="btn btn-sm btn-danger" data-pdid="'.$idp.'" data-nis="'.$nis.'" id="getQR"><i class="fas fa-barcode"></i></button>
			<button class="btn btn-sm btn-danger" data-pdid="'.$ids.'" data-kelas="'.$nkelas.'" id="cetakDepan"><i class="fas fa-print"></i></button>
			';
		$tgl=ucfirst(strtolower($siswa['tempat'])).", ".TanggalIndo($siswa['tanggal']);
		$namasis=$siswa['nama'];
		$output['data'][] = array(
			"<img alt='image' src='https://apins.sdi-aljannah.web.id/images/siswa/".$avatarm."' class='rounded-circle' width='35' data-toggle='tooltip' title='".$row['nama']."'> ".$siswa['nama'],
			$siswa['nis'],
			$siswa['nisn'],
			$tgl,
			$nkelas,
			$actionButton
		);
	}
// database connection close
$connect->close();

echo json_encode($output);