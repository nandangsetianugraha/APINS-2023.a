<?phpsession_start();$level = $_SESSION['level'];require_once '../../config/db_connect.php';
$kelas=$_GET['kelas'];$mpid=$_GET['mpid'];$smt=$_GET['smt'];$peta=$_GET['peta'];
$ab=substr($kelas,0,1);if($mpid==0){?>	<select class="form-select" id="tema" name="tema">		<option value="0">Pilih Tema</option>	</select><?php }else{	if($mpid==1 or ($ab>3 and $mpid==8) or ($ab>3 and $mpid==4) or ($ab>3 and $mpid==9) or ($ab>3 and $mpid==10) or ($ab>3 and $mpid==11)){		$sql4 = "select * from pemetaan where kelas='$ab' and smt='$smt' and kd_aspek='$peta' and mapel='$mpid' group by tema order by tema asc";		$query4 = $connect->query($sql4);		echo '<option value="0">Pilih Pembelajaran</option>';		while($s=$query4->fetch_assoc()){			echo "<option value='".$s['tema']."'>Pembelajaran ".$s['tema']."</option>";		}	}else{		$sql4 = "select * from pemetaan where kelas='$ab' and smt='$smt' and kd_aspek='$peta' and mapel='$mpid' group by tema order by tema asc";		$query4 = $connect->query($sql4);		echo '<option value="0">Pilih Tema</option>';		while($s=$query4->fetch_assoc()){			echo "<option value='".$s['tema']."'>Tema ".$s['tema']."</option>";		}	}};?>