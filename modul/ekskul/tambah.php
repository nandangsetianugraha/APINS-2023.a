<?php
include("../../function/db.php");
$smt=$_POST['smt'];
$tapel=$_POST['tapel'];
$idr=$_POST['rowid'];
$cek="SELECT * FROM siswa WHERE peserta_didik_id='$idr'";
$hasil=mysqli_query($koneksi,$cek);
$bio=mysqli_fetch_array($hasil);
$ids=$bio['peserta_didik_id'];
?>
						<div class="modal-body">