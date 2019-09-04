<?php
session_start();
include "../../library/config.php";
include "../../library/function_date.php";

$query = mysqli_query($mysqli, "SELECT * FROM ujian WHERE id_user='$_SESSION[iduser]' ORDER BY tanggal");
$data = array();
$no = 1;
while($r = mysqli_fetch_array($query)){

//Membuat tombol edit soal		
   $qsoal = mysqli_query($mysqli, "SELECT * FROM soal WHERE id_ujian='$r[id_ujian]'");
   $btn_soal = '<a class="btn btn-primary btn-sm" onclick="show_soal('.$r['id_ujian'].')"><i class="glyphicon glyphicon-edit"></i> Edit &nbsp;&nbsp;<span class="label label-warning">'.mysqli_num_rows($qsoal).'</span></a>';

//Membuat tombol kelas untuk melihat nilai	
   $qkelas = mysqli_query($mysqli, "SELECT * FROM kelas t1, kelas_ujian t2 WHERE t1.id_kelas=t2.id_kelas AND t2.id_ujian='$r[id_ujian]'");
   $label = "";
   while($rk = mysqli_fetch_array($qkelas)){
      $jml = mysqli_num_rows(mysqli_query($mysqli, "SELECT * FROM nilai t1, siswa t2 WHERE t1.id_ujian='$rk[id_ujian]' AND t1.nus=t2.nus AND t2.id_kelas='$rk[id_kelas]'"));
      $label .= '<a class="btn btn-xs btn-info" style="margin-bottom: 5px" onclick="show_nilai('.$rk['id_kelas'].','.$rk['id_ujian'].')">'.$rk['kelas'].' &nbsp;&nbsp; <span class="label label-warning">'.$jml.'</span></a> ';
   }
		
   $row = array();
   $row[] = $no;
   $row[] = $r['judul'];
   $row[] = $r['nama_mapel'];
   $row[] = tgl_indonesia($r['tanggal']);
   $row[] = $r['jml_soal'];
   $row[] = $btn_soal;
   $row[] = $label;
   $data[] = $row;
   $no++;
}
	
$output = array("data" => $data);
echo json_encode($output);
?>