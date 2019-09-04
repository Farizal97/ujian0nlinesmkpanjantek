<?php
// setting nama host dan database pada hosting 
$host	= "localhost";
$user	= "root";
$pass	= "";
$db	= "ujianonline";

//Menggunakan objek mysqli untuk membuat koneksi dan menyimpanya dalam variabel $mysqli	
$mysqli = new mysqli($host, $user, $pass, $db);

//setting url website
$url_website = "http://localhost/ujianonline";
$folder_website = "/ujianonline";

//Menentukan timezone 
date_default_timezone_set('Asia/Jakarta'); 
?>
