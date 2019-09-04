<?php
session_start();
include "library/config.php";
include "library/function_antiinjection.php";

$username = antiinjeksi($_POST['username']);
$password = antiinjeksi(md5($_POST['password']));

$cekuser = mysqli_query($mysqli, "SELECT * FROM siswa WHERE nus='$username' AND password='$password'");
$jmluser = mysqli_num_rows($cekuser);
$data = mysqli_fetch_array($cekuser);
if($jmluser > 0){
   if($data['status'] == "off"){
     $_SESSION['username']     = $data['nus'];
     $_SESSION['namalengkap']  = $data['nama'];
     $_SESSION['password']     = $data['password'];
     $_SESSION['nus']          = $data['nus'];
     $_SESSION['kelas']        = $data['id_kelas'];

     mysqli_query($mysqli, "UPDATE siswa SET status='login' WHERE nus='$data[nus]'");
     echo "ok";
   }else{
      echo "Siswa sedang <b>Login</b>. Hubungi operator untuk mereset login!";
   }
}else{
   echo "<b>Username</b> atau <b>password</b> tidak terdaftar!";
}
?>