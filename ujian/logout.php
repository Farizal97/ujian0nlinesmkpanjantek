<?php
  session_start();
  include "library/config.php";
  mysqli_query($mysqli, "UPDATE siswa SET status='off' WHERE nus='$_SESSION[nus]'");
  
  session_destroy();
  echo "<script>
   alert('Anda keluar dari ujian!'); 
   window.location = 'login.php';
   </script>";
?>
