<?php
session_start();
include "../../library/config.php";
include "../../library/function_date.php";

$query = mysqli_query($mysqli, "SELECT * FROM ujian WHERE id_guru='$_SESSION[id]' ORDER BY tanggal");
$data = array();
$no = 1;
while($r = mysqli_fetch_array($query)){

//Membuat tombol edit soal		
   $qdiskusi = mysqli_query($mysqli, "SELECT * FROM diskusi WHERE id_ujian='$r[id_ujian]'");
   $qsoal = mysqli_query($mysqli, "SELECT * FROM soal WHERE id_ujian='$r[id_ujian]'");
   $btn_soal = '<a class="btn btn-primary btn-sm" onclick="show_soal('.$r['id_ujian'].')"><i class="glyphicon glyphicon-edit"></i> Edit &nbsp;&nbsp;<span class="label label-warning">'.mysqli_num_rows($qsoal).'</span></a>';
   $btn_diskusi = '<a class="btn btn-primary btn-sm" onclick="show_diskusi('.$r['id_ujian'].')"><i class="glyphicon glyphicon-eye-open"></i> Diskusi &nbsp;<span class="label label-warning">'.mysqli_num_rows($qdiskusi).'</span></a>';
   $materi="";
   if($r['materi']!=""){
	   $materi="Sudah Upload";
   }else{
	   $materi="Belum Upload";
   }
//Membuat tombol kelas untuk melihat nilai	
   $qkelas = mysqli_query($mysqli, "SELECT * FROM kelas t1, kelas_ujian t2 WHERE t1.id_kelas=t2.id_kelas AND t2.id_ujian='$r[id_ujian]'");
   $label = "";
   while($rk = mysqli_fetch_array($qkelas)){
      $jml = mysqli_num_rows(mysqli_query($mysqli, "SELECT * FROM nilai t1, siswa t2 WHERE t1.id_ujian='$rk[id_ujian]' AND t1.nis=t2.nis AND t2.id_kelas='$rk[id_kelas]'"));
      $label .= '<a class="btn btn-xs btn-info" style="margin-bottom: 5px" onclick="show_nilai('.$rk['id_kelas'].','.$rk['id_ujian'].')">'.$rk['kelas'].' &nbsp;&nbsp; <span class="label label-warning">'.$jml.'</span></a> ';
   }

//Membuat tombol kelas untuk melihat nilai	
   $qdiskusi = mysqli_query($mysqli, "SELECT * FROM kelas t1, kelas_ujian t2 WHERE t1.id_kelas=t2.id_kelas AND t2.id_ujian='$r[id_ujian]'");
   $labeldiskusi = "";
   while($rk = mysqli_fetch_array($qdiskusi)){
      $jmldiskusi = mysqli_num_rows(mysqli_query($mysqli, "SELECT * FROM diskusi WHERE id_ujian='$rk[id_ujian]' AND id_kelas='$rk[id_kelas]'"));
      $labeldiskusi .= '<a class="btn btn-xs btn-info" style="margin-bottom: 5px" onclick="show_diskusi('.$rk['id_kelas'].','.$rk['id_ujian'].')">'.$rk['kelas'].' &nbsp;&nbsp; <span class="label label-warning">'.$jmldiskusi.'</span></a> ';
   }   
   $row = array();
   $row[] = $no;
   $row[] = $r['nama_mapel'];
   $row[] = tgl_indonesia($r['tanggal']);
   $row[] = $r['jml_soal'];
   $row[] = $materi;
   $row[] = $btn_soal;
   $row[] = $label;
   $row[] = $labeldiskusi;
   $data[] = $row;
   $no++;
}
	
$output = array("data" => $data);
echo json_encode($output);
?>