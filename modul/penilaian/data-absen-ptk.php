<?php
require_once '../../config/db_connect.php';
function namahari($tanggal){
    $tgl=substr($tanggal,8,2);
    $bln=substr($tanggal,5,2);
    $thn=substr($tanggal,0,4);
    $info=date('w', mktime(0,0,0,$bln,$tgl,$thn));
    switch($info){
        case '0': return "Minggu"; break;
        case '1': return "Senin"; break;
        case '2': return "Selasa"; break;
        case '3': return "Rabu"; break;
        case '4': return "Kamis"; break;
        case '5': return "Jumat"; break;
        case '6': return "Sabtu"; break;
    };
};
$bulan=$_GET['bulan'];
$tahun=$_GET['tahun'];
$idptk=$_GET['idptk'];
?>
<table class="table table-bordered" id="temaTable">
								<thead>
									<tr>
										<th class="text-center">Tanggal</th>
										<th class="text-center">Absen Masuk</th>
										<th class="text-center">Absen Keluar</th>
										<th class="text-center">Telat</th>
										<th class="text-center">Pulang Cepat</th>
									</tr>
								</thead>
								<tbody>	
                                  <?php 
                                  $peg = $connect->query("select * from id_pegawai where ptk_id='$idptk'")->fetch_assoc();
								$idpeg=$peg['pegawai_id'];
                                  ?>
                                  <?php 
$hari = cal_days_in_month(CAL_GREGORIAN, $bulan, $tahun);
$telat=0;
$cepul=0;
for ($i=1; $i < $hari+1; $i++) { 
	if($i>9){
		$ab=$i;
	}else{
		$ab="0".$i;
	};
	$ttt=$tahun."-".$bulan."-".$ab;
  	if(namahari($ttt)==="Sabtu" || namahari($ttt)==="Minggu"){
?>
      <tr>
        <td style="background-color:red;color:white"><?=namahari($ttt);?>, <?=TanggalIndo($ttt);?></td>
        <td colspan="4" style="background-color:red;color:white">Hari Libur Sekolah</td>
      </tr>
<?php
    }else{
      $ceklibur=$connect->query("select * from harilibur where tanggal='$ttt'")->num_rows;
      if($ceklibur>0){
		  $libur=$connect->query("select * from harilibur where tanggal='$ttt'")->fetch_assoc();
?>
	  <tr>
        <td style="background-color:red;color:white"><?=namahari($ttt);?>, <?=TanggalIndo($ttt);?></td>
        <td colspan="4" style="background-color:red;color:white"><?=$libur['keterangan'];?></td>
      </tr>
<?php
      }else{
      $sql = "SELECT pegawai_id,
      DATE_FORMAT(tanggal,'%Y-%m-%d') tgl,
      min(left(RIGHT(tanggal, 8), 5)) jam1,
      MAX(left(right(tanggal, 8), 5)) jam2,
      if(LEAST(12600,trim(TIME_TO_SEC(TIMEDIFF(min(left(RIGHT(tanggal, 8), 5)), '07:00:00'))))>0,LEAST(12600,trim(TIME_TO_SEC(TIMEDIFF(min(left(RIGHT(tanggal, 8), 5)), '07:00:00'))))/60,'') diff1, 
      if(LEAST(14400,trim(TIME_TO_SEC(TIMEDIFF('15:45:00', MAX(left(right(tanggal, 8), 5))))))>0,LEAST(14400,trim(TIME_TO_SEC(TIMEDIFF('15:45:00', MAX(left(right(tanggal, 8), 5))))))/60,'') diff2
      FROM absensi_ptk where pegawai_id='$idpeg' and DATE_FORMAT(tanggal,'%Y-%m-%d')='$ttt' group by tgl";
      $query = $connect->query($sql);
      $row = $query->fetch_assoc();
      if($row['jam2']==$row['jam1']){
        $keluar='';
      }else{
        $keluar=$row['jam2'];    
      }
      $telat=$telat+$row['diff1'];
        $cepul=$cepul+$row['diff2'];
?>
      <tr>
        <td><?=namahari($ttt);?>, <?=TanggalIndo($ttt);?></td>
        <td><?=$row['jam1'];?></td>
        <td><?=$keluar;?></td>
        <td><?=$row['diff1'];?> <?php if(empty($row['diff1'])){}else{echo "Menit";} ?></td>
        <td><?=$row['diff2'];?> <?php if(empty($row['diff2'])){}else{echo "Menit";} ?></td>
      </tr>
<?php
    }
    }
}
?>
								</tbody>
                          <tfoot>
                            <tr>
        <td colspan="3" style="text-align:right">Total</td>
        <td><?=$telat;?> Menit</td>
        <td><?=$cepul;?> Menit</td>
      </tr>
                          </tfoot>
							</table>