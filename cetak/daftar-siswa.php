<?php
require_once('fpdf/fpdf.php');
require_once('../config/db_connect.php');
function namahari($tanggal){
    
		//fungsi mencari namahari
		//format $tgl YYYY-MM-DD
		//harviacode.com
		
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
		
	}
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
	}

class PDF extends FPDF{
function Header(){
   global $connect;
	$kelas=$_GET['kelas'];
	$tapel=$_GET['tapel'];
	$smt=$_GET['smt'];
   $this->SetTextColor(0,0,0);
   $this->SetFont('Arial','B','12');
   $this->Ln(0);
   $this->Cell(16,0.5, $this->Image('logo.jpg', $this->GetX(), $this->GetY(),1.7,1.7,0,0), 0, 0, 'L', false );
    $this->Cell(0.3,0.5,'',0,0,'L',0);
    //$this->Cell(1.4,0.5, $this->Image($gambar2, $this->GetX(), $this->GetY(),2.2,1.7,0,0),0, 0, 'R', false );
    $this->Ln(0);
   $this->Cell(19,1,'DAFTAR SISWA KELAS '.$kelas,0,0,'C');
	$this->Ln(0.5);
   $this->Ln(0.5);

   $this->Cell(19,0,'SD ISLAM AL-JANNAH',0,0,'C');
   $this->Ln(0.5);
   $this->Cell(19,0,'TAHUN PELAJARAN '.$tapel,0,0,'C');
   $this->Ln(1);

   $this->SetFont('Arial','','9');
   $this->Cell(4,0.5,'KOTA/KABUPATEN',0,0,'L');
   $this->Cell(0.3,0.5,':',0,0,'L');
   $this->Cell(7.5,0.5,'INDRAMAYU','B',0,'L');
   $this->Cell(0.3,0.5,'',0,0,'L');
   $this->Cell(1.3,0.5,'KODE',0,0,'L');
   $this->Cell(0.3,0.5,':',0,0,'L');
   $this->Cell(3,0.5,'18','B',0,'L');

   $this->Ln(0.5);
   $this->Cell(4,0.5,'SEKOLAH/MADRASAH',0,0,'L');
   $this->Cell(0.3,0.5,':',0,0,'L');
   $this->Cell(7.5,0.5,'SD ISLAM AL-JANNAH','B',0,'L');
   $this->Cell(0.3,0.5,'',0,0,'L');
   $this->Cell(1.3,0.5,'KODE',0,0,'L');
   $this->Cell(0.3,0.5,':',0,0,'L');
   $this->Cell(3,0.5,'0879','B',0,'L');

   $this->Ln(0.5);
   $this->Cell(4,0.5,'KELAS',0,0,'L');
   $this->Cell(0.3,0.5,':',0,0,'L');
   $this->Cell(7.5,0.5,$kelas,'B',0,'L');
   $this->Cell(0.3,0.5,'',0,0,'L');
   $this->Cell(1.3,0.5,'',0,0,'L');
   $this->Cell(0.3,0.5,'',0,0,'L');
   $this->Cell(3,0.5,'',0,0,'L');
   $this->Ln(0.5);
   
   $this->SetFont('Arial','B','8');
   $this->SetFillColor(192,192,192);
   $this->Ln(1);
   $this->SetTextColor(0,0,0);
   $this->Cell(1,1,'No','LTB',0,'C',1);
   $this->Cell(3,1,'NISN','LTB',0,'C',1);
   $this->Cell(7,1,'Nama Peserta','LTB',0,'C',1);
   $this->Cell(5,1,'Tempat Tanggal Lahir','LTBR',0,'C',1);
   $this->Cell(3,1,'Nomor HP','LTBR',0,'C',1);
   $this->Ln(1);

  }
  function Footer(){
    global $connect;
   $this->SetY(-2,5);
   $this->Cell(0,1,'Daftar Siswa - Halaman : '. $this->PageNo(),0,0,'R');
  }
 }


$i = 0;
$kelas=$_GET['kelas'];
	$tapel=$_GET['tapel'];
	$smt=$_GET['smt'];
$querys = $connect->query("select * from penempatan where rombel='$kelas' and tapel='$tapel' and smt='$smt' order by nama asc");

    while ($mL = $querys->fetch_assoc()) {
	  $idp = $mL['peserta_didik_id'];
	  $siswa = $connect->query("select * from siswa where peserta_didik_id='$idp'")->fetch_assoc();
      $namaLengkap = $siswa['nama'];
	  $cell[$i][0]=$siswa['nisn'];
	  $cell[$i][1]=$namaLengkap;
      $cell[$i][2]=$siswa['tempat'].", ".TanggalIndo($siswa['tanggal']);
      $cell[$i][3]=$siswa['no_wa'];
      $cell[$i][4]="";
      $i++;
    }


   //$pdf = new PDF('P','cm',array(21.5,33));
   $pdf = new PDF('P','cm','A4');
   $pdf->AliasNbPages();
   $pdf->AddPage();
   //$pdf->SetFont('Arial','','9');
   $pdf->SetTextColor(0,0,0);
   $pdf->SetTitle("Daftar Hadir Peserta ~ APINS");
   $pdf->SetAuthor("APINS");
   $pdf->SetCreator("Nandang");
   $pdf->SetKeywords("APINS");
   $pdf->SetSubject("APINS");
	
    $jumlahpeserta=$connect->query("select * from penempatan where rombel='$kelas' and tapel='$tapel' and smt='$smt'")->num_rows;
   $pdf->SetFont('Arial','','8');
if($jumlahpeserta<20){
  $lebar=1.3;
}else{
  $lebar=1.2;
}
   for($j=0;$j<$i;$j++){
     $no = $j+1;
     $noo = $no . ".";
    $pdf->Cell(1,$lebar,$noo,'LB',0,'C');
    $pdf->Cell(3,$lebar,$cell[$j][0],'LB',0,'L');
    $pdf->Cell(7,$lebar,$cell[$j][1],'LBR',0,'L');

    if ($j % 2 == 0) {
    $pdf->Cell(3,$lebar,$cell[$j][2],'B',0,'L');
    $pdf->Cell(2,$lebar," ",'BR',0,'L');
      } else {
    $pdf->Cell(2,$lebar,$cell[$j][2],'B',0,'L');
    $pdf->Cell(3,$lebar," ",'BR',0,'L');
    }
    $pdf->Cell(3,$lebar,$cell[$j][3],'BR',0,'L');
    $pdf->Ln();
   }
   //$ket1 = F_GetKeterangan();
   //$ket2 = F_GetKeterangan2();
   //$ket3 = F_GetKeterangan3();
   //$proktor = F_GetNamaPengawas1();
   


   

   $pdf->Output();
 ?>
