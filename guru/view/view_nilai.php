<script type="text/javascript" src="script/script_nilai.js"> </script>

<?php
session_start();
if(empty($_SESSION['user']) or empty($_SESSION['pass'])){
   header('location: ../login.php');
}

//Memanggil library yang diperlukan
include "../../library/config.php";
include "../../library/function_view.php";
include "../../library/function_date.php";
include "../../library/function_form.php";

create_title("check", "Hasil Ujian");
create_button("primary", "export", "Export", "btn-add", "export_nilai()");

$ru = mysqli_fetch_array(mysqli_query($mysqli, "SELECT * FROM ujian WHERE id_ujian='$_GET[ujian]'"));
$kls = mysqli_fetch_array(mysqli_query($mysqli, "SELECT * FROM kelas WHERE id_kelas='$_GET[kelas]'"));
echo 
'<hr/>
<div class="alert alert-info">
<table width="100% no-ajax">
   <tr>
      <td>Tanggal</td><td>:<b> ' .tgl_indonesia($ru['tanggal']).' </b></td>
   </tr>
   <tr>
      <td>Nama Mapel</td><td>:<b> '.$ru['nama_mapel'].'</b></td>
      <td width="15%"></td>
      <td>Jml. Soal</td><td>:<b> '.$ru['jml_soal'].'</b></td>
   </tr>
   <tr>
      <td>Kelas</td><td>:<b> '.$kls['kelas'].'</b></td>
      <td width="15%"></td>
      <td></td>
   </tr>
</table>
<input type="hidden" id="id_ujian" value="'.$_GET['ujian'].'">
<input type="hidden" id="id_kelas" value="'.$_GET['kelas'].'">
</div>
<hr/>';	  
create_table(array("NIS", "Nama Siswa", "Jml. Benar", "Nilai"));
?>
