<?php 

require_once '../../function/db_connect.php';

$tapel=$_GET['tapel'];

$kelas=$_GET['kelas'];

$mpid=$_GET['mp'];

$ab=substr($kelas, 0, 1);

$output = array('data' => array());



$sql="select * from penempatan where rombel='$kelas' and tapel='$tapel' and smt='$smt' order by nama asc";

$query = $connect->query($sql);

while($s=$query->fetch_assoc()) {

	$idp=$s['peserta_didik_id'];

	$adam41=$connect->query("select * from raport where id_pd='$idp' and kelas=4 and smt=1 and mapel='$mpid'")->num_rows;
	if($adam41>0){
	$m41=$connect->query("select * from raport where id_pd='$idp' and kelas=4 and smt=1 and mapel='$mpid'")->fetch_assoc();
	$n41=$m41['nilai'];
	}else{
		$n41=0;
	};
	$adam42=$connect->query("select * from raport where id_pd='$idp' and kelas=4 and smt=2 and mapel='$mpid'")->num_rows;
	if($adam42>0){
	$m42=$connect->query("select * from raport where id_pd='$idp' and kelas=4 and smt=2 and mapel='$mpid'")->fetch_assoc();
	$n42=$m42['nilai'];
	}else{
		$n42=0;
	};
	$adam51=$connect->query("select * from raport where id_pd='$idp' and kelas=5 and smt=1 and mapel='$mpid'")->num_rows;
	if($adam51>0){
	$m51=$connect->query("select * from raport where id_pd='$idp' and kelas=5 and smt=1 and mapel='$mpid'")->fetch_assoc();
	$n51=$m51['nilai'];
	}else{
		$n51=0;
	};
	$adam52=$connect->query("select * from raport where id_pd='$idp' and kelas=5 and smt=2 and mapel='$mpid'")->num_rows;
	if($adam52>0){
	$m52=$connect->query("select * from raport where id_pd='$idp' and kelas=5 and smt=2 and mapel='$mpid'")->fetch_assoc();
	$n52=$m52['nilai'];
	}else{
		$n52=0;
	};
	$adam61=$connect->query("select * from raport where id_pd='$idp' and kelas=6 and smt=1 and mapel='$mpid'")->num_rows;
	if($adam61>0){
	$m61=$connect->query("select * from raport where id_pd='$idp' and kelas=6 and smt=1 and mapel='$mpid'")->fetch_assoc();
	$n61=$m61['nilai'];
	}else{
		$n61=0;
	};
	$adam62=$connect->query("select * from raport where id_pd='$idp' and kelas=6 and smt=2 and mapel='$mpid'")->num_rows;
	if($adam62>0){
	$m62=$connect->query("select * from raport where id_pd='$idp' and kelas=6 and smt=2 and mapel='$mpid'")->fetch_assoc();
	$n62=$m62['nilai'];
	}else{
		$n62=0;
	};
	$mrt=$connect->query("select AVG(nilai) AS rata from raport where id_pd='$idp' and (kelas>3 and kelas<7) and mapel='$mpid'")->fetch_assoc();
	$l41='
		<span contenteditable="true" data-old_value="'.$n41.'"  onBlur="saveUA(this,\'nilai\',\''.$idp.'\',\'4\',\'1\',\''.$mpid.'\')" onClick="highlightEdit(this);">'.$n41.'</span>
		';
	$l42='
		<span contenteditable="true" data-old_value="'.$n42.'"  onBlur="saveUA(this,\'nilai\',\''.$idp.'\',\'4\',\'2\',\''.$mpid.'\')" onClick="highlightEdit(this);">'.$n42.'</span>
		';
	$l51='
		<span contenteditable="true" data-old_value="'.$n51.'"  onBlur="saveUA(this,\'nilai\',\''.$idp.'\',\'5\',\'1\',\''.$mpid.'\')" onClick="highlightEdit(this);">'.$n51.'</span>
		';
	$l52='
		<span contenteditable="true" data-old_value="'.$n52.'"  onBlur="saveUA(this,\'nilai\',\''.$idp.'\',\'5\',\'2\',\''.$mpid.'\')" onClick="highlightEdit(this);">'.$n52.'</span>
		';
	$l61='
		<span contenteditable="true" data-old_value="'.$n61.'"  onBlur="saveUA(this,\'nilai\',\''.$idp.'\',\'6\',\'1\',\''.$mpid.'\')" onClick="highlightEdit(this);">'.$n61.'</span>
		';
	$l62='
		<span contenteditable="true" data-old_value="'.$n62.'"  onBlur="saveUA(this,\'nilai\',\''.$idp.'\',\'6\',\'2\',\''.$mpid.'\')" onClick="highlightEdit(this);">'.$n62.'</span>
		';
	$output['data'][] = array(
		$s['nama'],
		$l41,$l42,$l51,$l52,$l61,$l62,ROUND($mrt['rata'],0)
	);
};
$connect->close();
echo json_encode($output);