<script type="text/javascript" src="script/script_klsujian.js"> </script>

<?php
session_start();
if(empty($_SESSION['username']) or empty($_SESSION['password']) or $_SESSION['leveluser']!="admin"){
	header('location: ../login.php');
}

//Include library yang diperlukan
include "../../library/config.php";
include "../../library/function_view.php";
include "../../library/function_form.php";

//Membuat judul
create_title("sort-by-attributes", "Manajemen Kelas Per Ujian");

//Membuat header dan footer tabel
create_table(array("Judul Ujian", "Kelas", "Aksi"));

//Membuat form edit data
open_form("modal_klsujian", "return save_data()");
   $qkelas = mysqli_query($mysqli, "SELECT * FROM kelas");
   $list = array();
   while($rk = mysqli_fetch_array($qkelas)){
      $list[] = array($rk['id_kelas'], $rk['kelas']);
   }
   create_checkbox("Kelas", "kelas", $list);	
close_form();
?>
