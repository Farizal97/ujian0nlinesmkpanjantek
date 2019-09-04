<?php
session_start();

if(empty($_SESSION['username']) or empty ($_SESSION['password'])){
   header('location: login.php');
}
?>

<div class="jumbotron">
   <div class="container text-center">
  	<marquee scrollmount="10"><h2>Selamat Datang <b> <?=$_SESSION['namalengkap'];?></b>!</h2></marquee>
<p>Anda Login sebagai <b> <?= $_SESSION['leveluser'];?></b></p>
   </div>
</div>
