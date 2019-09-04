-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2018 at 09:31 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-learninglagi`
--

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(5) NOT NULL,
  `kelas` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kelas`) VALUES
(47, 'XI TKJ 2'),
(46, 'XI TKJ 1'),
(48, 'XI TKJ 3'),
(49, 'X TKJ 1'),
(50, 'X TKJ 2'),
(51, 'X TKJ 3'),
(52, 'XII TKJ 1'),
(53, 'XII TKJ 2'),
(54, 'XII TKJ 3');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_ujian`
--

CREATE TABLE `kelas_ujian` (
  `id_ujian` int(5) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_ujian`
--

INSERT INTO `kelas_ujian` (`id_ujian`, `id_kelas`, `aktif`) VALUES
(84, 22, 'N'),
(86, 46, 'N'),
(1, 51, 'Y'),
(84, 21, 'N'),
(84, 1, 'N'),
(1, 50, 'Y'),
(83, 22, 'N'),
(83, 21, 'N'),
(84, 43, 'N'),
(84, 28, 'N'),
(77, 21, 'Y'),
(77, 1, 'N'),
(77, 22, 'N'),
(77, 28, 'N'),
(77, 43, 'N'),
(1, 49, 'Y'),
(86, 47, 'N'),
(85, 21, 'Y'),
(83, 28, 'N'),
(88, 22, 'Y'),
(88, 21, 'N'),
(86, 48, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(10) NOT NULL,
  `nus` varchar(20) NOT NULL,
  `id_ujian` int(5) NOT NULL,
  `acak_soal` text NOT NULL,
  `jawaban` text NOT NULL,
  `sisa_waktu` varchar(10) NOT NULL,
  `jml_benar` int(5) NOT NULL,
  `nilai` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `nus`, `id_ujian`, `acak_soal`, `jawaban`, `sisa_waktu`, `jml_benar`, `nilai`) VALUES
(1, '1415100898', 86, '55,59,52,65,67,64,70,68,51,62,61,57,53,63,56,58,54,69,60,66', '3,2,4,4,3,3,5,4,1,1,3,5,3,0,0,3,0,0,0,2', '00:02', 3, '15'),
(2, '1415100896', 86, '52,57,62,59,60,66,70,53,68,64,61,65,55,54,69,56,58,67,51,63', '2,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,3,2,1', '119:30', 1, '5'),
(3, '1415100897', 86, '68,66,64,51,61,58,57,60,62,65,55,59,54,52,70,67,53,56,63,69', '2,1,2,0,0,2,4,3,5,0,2,4,5,5,0,2,2,3,0,4', '119:10', 2, '10'),
(4, '1516101336', 88, '72,71', '4,5', '119:11', 1, '50'),
(5, '18010107', 1, '22,10,24,26,16,3,30,8,29,19,21,1,2,5,4,18,14,20,6,28,9,11,27,15,23,13,12,25,7,17', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '120:00', 0, ''),
(6, '18010136', 1, '16,1,23,17,11,25,30,29,2,27,18,26,12,20,4,7,28,3,9,19,6,8,21,13,10,22,5,24,14,15', '0,3,0,0,1,0,4,0,4,0,2,0,3,1,0,0,4,4,5,0,2,2,4,1,3,0,4,0,3,3', '118:14', 4, '13.33');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nus` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nus`, `nama`, `password`, `id_kelas`, `status`) VALUES
('18010101', 'Abiyu Parasyakir', 'ca9605f9b8c9df7bc973a30ed457278d', 49, 'off'),
('18010102', 'Adam Ruswandi', '3a3d6521d9b5814215d03b5b7d21b56c', 49, 'off'),
('18010103', 'Ade Febriyanto', 'c412a59e4898ac853fc4760a93fdb635', 49, 'off'),
('18010104', 'Ahmad Fauzan', 'e2633cdb1f161d49d5b5f7a548b8e03c', 49, 'off'),
('18010105', 'Andika Tino Nugroho', '90f925316a3fe0b70afbb4c9298a3536', 49, 'off'),
('18010106', 'Ayu Agustin Effendy', '2e96854e118996f11d7c7c3687395d23', 49, 'off'),
('18010107', 'Bayu Maulana Nur', '7db8742948ee2a4a67999d26941bfa01', 49, 'off'),
('18010108', 'Fauzan Isra ', '21ed0dd1c5f8ca47e88a681381c55f20', 49, 'off'),
('18010109', 'Hilda Indriati', '5b815544e12ae22b4e946718d7ded6f6', 49, 'off'),
('18010110', 'Icha Ayu Ningtyas', '77ca09f477016c8496bbb7eb5624f914', 49, 'off'),
('18010111', 'Ika Yulia Sari', '2afd8bbd802a609781a0c3cc84908f2f', 49, 'off'),
('18010112', 'Ilham Hakiki', '9e49790540e2b84109a6e05fe2e66a85', 49, 'off'),
('18010113', 'Jana Sri Wahyudi', 'f82a28067668643853bda62a8cd02a18', 49, 'off'),
('18010114', 'Krisna Aji', 'fad766ba3e5af678b6f5ec820a454efe', 49, 'off'),
('18010115', 'Manda Aulia', '39ffc58409a5bfa98aedab24e71dad3a', 49, 'off'),
('18010116', 'Mugi Prahesti', '71ad9bbc5e7609010782786a8834c354', 49, 'off'),
('18010117', 'Muhammad Yusuf', '89d29b60192d1138df19ad3521fe5a29', 49, 'off'),
('18010118', 'Muhammad Akbar Syah Putra', '3ab842b2269066bc193578c9ff2b4dee', 49, 'off'),
('18010119', 'Muhammad Fadhilah Kamarudin', 'ae40300d4df1e985b13e0166af4fa834', 49, 'off'),
('18010120', 'Muhammad Rafi Farhansyah', '6567068531a61d0ed85c6378dac4bc66', 49, 'off'),
('18010121', 'Muhammad Yusuf Hidayatullah', '2860d3f08970e92c82ff7afcc25edbb3', 49, 'off'),
('18010122', 'Muhammad Zidan Syah Pahlevi', 'c1486ced116040d640b3431d99b00450', 49, 'off'),
('18010123', 'Nur Fahmi', '068e2b1bbe2a15ecd51e6479b0f226eb', 49, 'off'),
('18010124', 'Nurul Haq', '42fe5ae15ed536a95cb498d387393b4e', 49, 'off'),
('18010126', 'Reza Pahlevi', '6b7f18f1f939115a1bd761ec64bd2c55', 49, 'off'),
('18010127', 'Rifky Eka Saputra', 'abffeb6cb7485620cfc6a2fc2f8f9468', 49, 'off'),
('18010128', 'Rizal Adi Warsongko', 'edc9266db9adb4ba63138139f59681cc', 49, 'off'),
('18010129', 'Salsabila', 'bed0a2483cb15142e9531508eb072c60', 49, 'off'),
('18010130', 'Satrio Muhammad Winahyu', 'b4e44155ed63e7493c148df2e0285134', 49, 'off'),
('18010131', 'Selviana Riski Rahma Putri', 'a66d287674f502004cd36d873f28a729', 49, 'off'),
('18010132', 'Septian Gilang Riyadi', '3ec2d7d10319d51a5d05f3d07add7a9e', 49, 'off'),
('18010133', 'Syahib Ababil', '134dbce302f636d9192ed3738d3e323b', 49, 'off'),
('18010134', 'Teguh Febriansyah', '3e1fb9fce81e0955747b954ddcee42ca', 49, 'off'),
('18010135', 'Tri Ferawati', '44c44bb3b87e4625edbfb08511b7c1fd', 49, 'off'),
('18010136', 'Vivekananda Damariati', 'd1e253b15b2d75cb37f587202104f80e', 49, 'off'),
('18020101', 'Achmad Fadli Fadilla', '7ec1257630d550f4acb407c9b498593e', 50, 'off'),
('18020102', 'Adhisya Danu Prayoga', '3a21a82de0af9f79d84d115baa46c20c', 50, 'off'),
('18020103', 'Ahmad Auliansyah Firdaus', '239b8219658d96eb00123d998a30b9f7', 50, 'off'),
('18020104', 'Alfian Nur Fadillah', 'bbc0eeef0e835461758ce5bebddbc51a', 50, 'off'),
('18020105', 'Arjuno Bagus Satrio Wicaksono Arifin', 'c63a8297ecc433b5df0e07cdebe21ae1', 50, 'off'),
('18020106', 'Dani Ahmad Fahrezi', 'f978deb986b3124836f126e5031a8209', 50, 'off'),
('18020107', 'Dani Firmansah', '99db9a32b702cd49d1c988bcef3909bf', 50, 'off'),
('18020108', 'Erzam Bayu Laksono', '752ccde006a8eff4dac712ffe92cac8e', 50, 'off'),
('18020109', 'Farlin Sanjaya', '330ef1b156ee92f359127dffef9f9640', 50, 'off'),
('18020110', 'Hermania Safitri', '17e030287b170d5b68264b03db85f43f', 50, 'off'),
('18020111', 'Irvan Dadi', '1ec0ee33eab0bcffc7b75cd098dc2926', 50, 'off'),
('18020112', 'Kahfan Samudra', 'fe2f5580f26fb29f8843a76a400ca0f2', 50, 'off'),
('18020113', 'Kevin Marcelino Prayogi', '2bd0d4074abd9a877dd1f9e0494e00e5', 50, 'off'),
('18020114', 'Muhammad Nanda Purnama Alam', '2261c9d6aa75b5ef50d169a744ae923b', 50, 'off'),
('18020115', 'Mario Alvians', '1eb4269a63b7a0e96e977d69ed7b3f29', 50, 'off'),
('18020116', 'Mawarresa Kusuma Nuralia', 'b2dea72f768cbf21117358e6adc909fb', 50, 'off'),
('18020117', 'Muhammad Fahmi Ali Akbar', 'c7f61f2dfd3a5d7fa799001a8bdf901e', 50, 'off'),
('18020118', 'Muhammad Risky ', 'e5ec3cc335e1cfc911e3741c63069bd7', 50, 'off'),
('18020119', 'Mufti Hakimudin', '4aaa3b0d9f5ef5ad68605d7207cd2934', 50, 'off'),
('18020120', 'Muhammad Albie Fauzan Akmatullah', '6b00230897d15f494f15f9e440f11161', 50, 'off'),
('18020121', 'Muhammad Al-Ghozi Sayyid', '93830ebd7e51da654600a163a1afe5c3', 50, 'off'),
('18020122', 'Muhammad Ammar Syakir', '6cc87c359d3f3c5c078fc1629d70e1a5', 50, 'off'),
('18020123', 'Muhammad Bayu Gunawan', '1c238897bfeedc5f491a6aa638f8823f', 50, 'off'),
('18020124', 'Nabilah Maulida', 'da4885a76c398829f155916297ef578f', 50, 'off'),
('18020125', 'Nur Hafsoh Azizah', '9fec8ffd2811bb52dc9394b3053a5154', 50, 'off'),
('18020126', 'Rian Alfaridzi', 'b19b993a9e87ab2e1dcb95e41606c981', 50, 'off'),
('18020127', 'Ridho Purdarana Dermawan', 'bc5248bec66e472f11f85710936fe03c', 50, 'off'),
('18020128', 'Rifqi Fadhillah Syah', 'd74996f8a53d02163d92ac8b27996724', 50, 'off'),
('18020129', 'Rino Pambudi Arto', '7751392c7f01ea2df1fce0174f1a3141', 50, 'off'),
('18020130', 'Rizki Pramudika', 'b4f451bee75a6ae73b36fee910e9a751', 50, 'off'),
('18020131', 'Ryno Pahlevi Al Ghiffari', 'e27c1eeb0903d3ad1f9f3ea3995842ac', 50, 'off'),
('18020132', 'Salsa Aprilia Ananda', 'b2ac9f961517354f711e66495ac6b5dc', 50, 'off'),
('18020133', 'Sandra Adetia Mulyani', '9933e31f85f750231b4df3bf8f7cc174', 50, 'off'),
('18020134', 'Seftian Rahmadi', '51b210d388ad1033d2a0ae286f906be4', 50, 'off'),
('18020135', 'Sofyan Thalib Subarja', '0ecb6f61668018486c7ae0c73fef41f2', 50, 'off'),
('18020136', 'Tiara Novita', '631c50a1dd538230c37f782c3d7b3d77', 50, 'off'),
('18030101', 'Achmad Muzaqi', '5b004076308d8ebcaccdfc1120da6774', 51, 'off'),
('18030102', 'Agung Wicaksono', '6e3037cb97d4ef8669862f0910595fec', 51, 'off'),
('18030103', 'Andika Badarudin', '6e4725e17410711357286f742cacbb05', 51, 'off'),
('18030104', 'Asef Irama', 'f439290d74f6ceab476d4fbc58871780', 51, 'off'),
('18030105', 'Aswar Al Hasyid', '4ae6a2c0413d7dce2b6f87dcfdcfe84e', 51, 'off'),
('18030106', 'Azanda Ibnu M. Fahri', '8625af362985c33b7525678f3536b1b1', 51, 'off'),
('18030107', 'Citra Febiayu Purwani', '1a80853e549e4fc9a8b90b2eb6b1cd13', 51, 'off'),
('18030108', 'Ebe Panca Prastya ', '9ed9b6174ec2dd7a7dd3f54bab3da3a2', 51, 'off'),
('18030109', 'Fadly Alamsyah', '21c4a6c188c7381b25124cf7bcfdc79c', 51, 'off'),
('18030110', 'Hernantyo Oktavia Rahman', '5ff6929ab497bdf731201f928ca27131', 51, 'off'),
('18030111', 'Indah Maulidya', 'aff2f2fc36ca7a0ad068477106e12ba3', 51, 'off'),
('18030112', 'Ipah', '2f0be09df53e1eda46d183246f49059d', 51, 'off'),
('18030113', 'Irfan Fasqlli', '37e3d65a52bd0cadb5704961c9e36f6e', 51, 'off'),
('18030114', 'khairul Alwan Albaldan', '937f391da95bc219be08f28344d44bcb', 51, 'off'),
('18030115', 'Meta Ariana', 'cb903947717e954ab0a4d094e0669a65', 51, 'off'),
('18030116', 'Miftahul Ulum', '4fd9c5b70535d6ed8602740ea9d7cff7', 51, 'off'),
('18030117', 'Mochtar Bimasyach', 'f0a8acb7f92d120589ceea124e1e681f', 51, 'off'),
('18030118', 'Muhammad Yusril', '350fab641992e79803a510a8bbb44f61', 51, 'off'),
('18030119', 'Muhammad Faisal', '822ac4eb45a81afd53e931c07ccd818a', 51, 'off'),
('18030120', 'Muhammad Farhan', '5612165bb835c6fb6ec4cabaefc5bd0b', 51, 'off'),
('18030121', 'Muhammad Figo Caesar', 'a4498889f54b37c2ef5a635f1c6ecb79', 51, 'off'),
('18030122', 'Muhammad Iqbal', 'dd1e3b8e846ea606ee1ecad1dc69bbfb', 51, 'off'),
('18030123', 'Novaldy Rizky Kurniawan', 'bbfefb1395cd7550ddac505759551ac3', 51, 'off'),
('18030124', 'Noviyanti Nur Ainni', '1e1e6439c3f610fc6b71c93f0542fd67', 51, 'off'),
('18030125', 'Nur Vatski Al Fajar', 'e18d3f4c21d5a5b3a150483549b42b64', 51, 'off'),
('18030126', 'Pipin Indah Sari', '409436a899fa3056d610f5f745caa1b6', 51, 'off'),
('18030127', 'Rama Muhammad Guntur', 'fc11bd63879e70a8e44d9f9ad16ee567', 51, 'off'),
('18030128', 'Restu Putra Astaman', '9c84f3cd65347242ccea61c066e8e060', 51, 'off'),
('18030129', 'Rian Wibowo', 'a8fcb89c05fdfbc9d91a5510ab7ac76c', 51, 'off'),
('18030130', 'Ruskandar Yoga Adistira', '1f49bcb800012cee91e71392fd44a6af', 51, 'off'),
('18030131', 'Samuel', '9116a7e7023a4e8e597df107416c4ff1', 51, 'off'),
('18030132', 'Septian Anggraini', 'e3ee06ab61b57abfed4f468f2407ec15', 51, 'off'),
('18030133', 'Vina Nurlela', '18beaebd9a719f99b7b2d6cfe6e19da0', 51, 'off');

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id_soal` int(5) NOT NULL,
  `id_ujian` int(5) NOT NULL,
  `soal` text NOT NULL,
  `pilihan_1` text NOT NULL,
  `pilihan_2` text NOT NULL,
  `pilihan_3` text NOT NULL,
  `pilihan_4` text NOT NULL,
  `pilihan_5` text NOT NULL,
  `kunci` int(2) NOT NULL,
  `urut` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id_soal`, `id_ujian`, `soal`, `pilihan_1`, `pilihan_2`, `pilihan_3`, `pilihan_4`, `pilihan_5`, `kunci`, `urut`) VALUES
(1, 1, 'Beberapa software web design yang sering dipakai antara lain', 'Microsoft Frontpage, Macromedia Fireworks, Mysql', 'Microsoft Frontpage, Macromedia Fireworks, Php', 'Macromedia Dreamweaver, Adobe ImageReady, ASP', 'Macromedia Dreamweaver, Adobe ImageReady, Corel Draw', 'Macromedia Dreamweaver, Microsoft Frontpage, Macromedia Fireworks.', 5, 0),
(2, 1, 'Fungsi dari tag HTML &lt;head&gt;&lt;/head&gt; adalah', 'Mendefinisikan judul yang hendak ditampilkan pada browser', 'Mendefinisikan bahwa teks yang berada diantara kedua tag tersebut adalah file HTML', 'Mendefinisikan head dalam sebuah file HTML.', 'Mendefinisikan teks yang hendak ditampilkan sebagai isi halaman web', 'Mendefinisikan &lt;&gt; dalam sebuah file HTML.', 3, 1),
(3, 1, 'Tag HTML yang berfungsi untuk mendefinisikan teks yang hendak ditampilkan sebagai isi halaman web adalah', '&lt;html&gt;&lt;/html&gt;', '&lt;head&gt;&lt;/head&gt;', '&lt;title&gt;&lt;/title&gt;', '&lt;body&gt;&lt;/body&gt;', '&lt;h1&gt;&lt;/h1&gt;', 4, 2),
(4, 1, 'Link ke suatu bagian di dokumen lain, misalnya : satu.html dilink ke suatu bagian di dua.html, tagnya adalah ', '&lt;a href=dua.html&gt; dua &lt;/a&gt;', 'a href= dua.html', '&lt;a href=&quot;dua.html&quot;&gt; dua &lt;/a&gt;', '&lt;href=&quot;dua.html&quot;&gt; dua &lt;/a&gt;', 'a href=&quot;dua.html&quot; dua &lt;/a&gt;', 4, 3),
(5, 1, 'HTML adalah kepanjangan dari ', 'Hyper Text Markup Language', 'Hiper Text Markup Language', 'Hipo Text MarkupLanguage', 'Hyper Text Multiple Land', 'Hipo Text Multiple Land', 1, 4),
(6, 1, 'Dibawah ini adalah bahasa untuk pemrograman web, kecuali ', 'HTML', 'XML', 'CSS', 'Javascript', 'Notepad', 5, 5),
(7, 1, 'Software untuk menulis bahasa HTML yang paling sederhana adalah', 'Ms Word', 'Ms Excel', 'Ms Powerpoint', 'Notepad', 'Ms Acces', 4, 6),
(8, 1, 'Untuk memberi warna latar belakang web diatur dengan mengubah nilai atribut ', 'Body', 'Title', 'Bgcolor', 'Fontcolor', 'Head', 3, 7),
(9, 1, 'Untuk memberi gambar pada belakang web diatur dengan mengubah nilai atribut ', 'Background', 'Body', 'Bgcolor', 'Fontcolor', 'Head', 1, 8),
(10, 1, 'Untuk mengatur paragraf pada web dapat digunakan tag ', '&lt;B&gt;', '&lt;I&gt;', '&lt;U&gt;', '&lt;P&gt;', '&lt;BR&gt;', 4, 9),
(11, 1, 'Untuk memisahkan baris pada web dapat digunakan tag ', '&lt;B&gt;', '&lt;I&gt;', '&lt;U&gt;', '&lt;P&gt;', '&lt;BR&gt;', 5, 10),
(12, 1, 'Untuk membuat garis horizontal didalam web dapat digunakan tag ', '&lt;BR&gt;', '&lt;P&gt;', '&lt;HR&gt;', '&lt;H1&gt;', '&lt;H6&gt;', 3, 11),
(13, 1, 'Untuk menformat teks dengan jenis tertentu seperti Verdana, atau Times New roman digunakan tag &lt;font&gt; dengan atribut', 'size', 'face', 'color', 'strike', 'width', 2, 12),
(14, 1, 'Manfaat atribut ALT dari tag IMG untuk ', 'Membuat sebuah definision list', 'Meloncat ke bagian (section) tertentu dalam halaman web', 'Membuat teks alternative bagi gambar yang ditampilkan', 'Membuat hyperlink ke sebuah file', 'Menentukan heading', 3, 13),
(15, 1, 'Untuk membuat order list, perintah HTML yang digunakan adalah ', '&lt;ul&gt; ............................&lt;/ul&gt;', '&lt;br&gt;............................&lt;/br&gt;', '&lt;ol&gt;............................&lt;/ol&gt;', '&lt;li&gt;.............................&lt;/li&gt;', '&lt;ls&gt;............................&lt;/ls&gt;', 3, 14),
(16, 1, 'Untuk membuat garis lurus horizontal di dalam web menggunakan tag ', '&lt;a href&gt;.......&lt;/a href&gt;', '&lt;p&gt;.......&lt;/p&gt;', '&lt;h&gt; ....... &lt;/h&gt;', '&lt;hr&gt;.......&lt;/hr&gt;', '&lt;br&gt;.......&lt;/br&gt;', 4, 15),
(17, 1, 'Untuk mengatur perataan paragraf menggunakan tag', 'align', 'right', 'bottom', 'center', 'left', 1, 16),
(18, 1, 'Untuk membuat teks tercetak miring menggunakan  tag', '&lt;i&gt;........&lt;/i&gt;', '&lt;u&gt;.......&lt;/u&gt;', '&lt;sup&gt;.......&lt;/sup&gt;', '&lt;b&gt;.......&lt;/b&gt;', '&lt;strike&gt;.......&lt;/strike&gt;', 1, 17),
(19, 1, '<p>Untuk membuat teks tercetak tebal menggunakan tag</p>\r\n<p><img src=\"../media/source/001.jpg\" alt=\"001\" /></p>', '<p>&lt;i&gt;........&lt;/i&gt;</p>\r\n<p><img src=\"../media/source/001.jpg\" alt=\"001\" /></p>', '<p>&lt;u&gt;.......&lt;/u&gt;</p>\r\n<p><img src=\"../media/source/001.jpg\" alt=\"001\" /></p>', '<p>&lt;sup&gt;.......&lt;/sup&gt;</p>\r\n<p><img src=\"../media/source/001.jpg\" alt=\"001\" /></p>', '<p>&lt;b&gt;.......&lt;/b&gt;</p>', '<p>&lt;strike&gt;.......&lt;/strike&gt;</p>', 4, 18),
(20, 1, 'Untuk membuat teks tercetak bergaris bawah menggunakan tag', '&lt;i&gt;........&lt;/i&gt;', '&lt;u&gt;.......&lt;/u&gt;', '&lt;sup&gt;.......&lt;/sup&gt;', '&lt;b&gt;.......&lt;/b&gt;', '&lt;strike&gt;.......&lt;/strike&gt;', 2, 19),
(21, 1, 'Untuk membuat teks tercoret menggunakan tag', '&lt;i&gt;........&lt;/i&gt;', '&lt;u&gt;.......&lt;/u&gt;', '&lt;sup&gt;.......&lt;/sup&gt;', '&lt;b&gt;.......&lt;/b&gt;', '&lt;strike&gt;.......&lt;/strike&gt;', 5, 20),
(22, 1, 'Untuk membuat perpangkatan menggunakan tag', '&lt;i&gt;........&lt;/i&gt;', '&lt;u&gt;.......&lt;/u&gt;', '&lt;sup&gt;.......&lt;/sup&gt;', '&lt;b&gt;.......&lt;/b&gt;', '&lt;strike&gt;.......&lt;/strike&gt;', 3, 21),
(23, 1, 'Untuk penulisan dengan menggunakan heading 5 dan perataan kanan kiri menggunakan tag', '&lt;h5 align=&quot;center&quot;&gt;.......&lt;/h5&gt;', '&lt;h5 align=&quot;left&quot;&gt;.......&lt;/h5&gt;', '&lt;h5 align=&quot;right&quot;&gt;.......&lt;/h5&gt;', '&lt;h5 align=&quot;rigth&quot;&gt;.......&lt;/h5&gt;', '&lt;h5 align=&quot;justify&quot;&gt;.......&lt;/h5&gt;', 2, 22),
(24, 1, 'Untuk penulisan dengan menggunakan heading 5 dan perataan kanan menggunakan tag', '&lt;h5 align=&quot;center&quot;&gt;.......&lt;/h5&gt;', '&lt;h5 align=&quot;left&quot;&gt;.......&lt;/h5&gt;', '&lt;h5 align=&quot;right&quot;&gt;.......&lt;/h5&gt;', '&lt;h5 align=&quot;rigth&quot;&gt;.......&lt;/h5&gt;', '&lt;h5 align=&quot;justify&quot;&gt;.......&lt;/h5&gt;', 3, 23),
(25, 1, 'Untuk menampilkan beberapa karakter misalnya â€œ&amp;&quot; tidak dapat ditampilkan begitu saja ke dalam web. Karakter tersebut harus ditulis dalam kode tertentu agar dapat ditampilkan dengan baik dalam web. Kode untuk menampilkan Â± adalah', '&amp;AElig', '&amp;plusmn', '&amp;eacute', '&amp;aelig', '&amp;plasmn', 2, 24),
(26, 1, 'Untuk memberikan penomoran bentuk bullet menggunakan list dengan type disc, square, dan circle menggunakan tag', '&lt;DD&gt;.......&lt;/DD&gt;', '&lt;DT&gt;.......&lt;/DT&gt;', '&lt;DL&gt;.......&lt;/DL&gt;', '&lt;OL&gt;.......&lt;/OL&gt;', '&lt;UL&gt;.......&lt;/UL&gt;', 5, 25),
(27, 1, 'Untuk memberikan penomoran menggunakan list dengan type a, A, I, dan i menggunakan tag', '&lt;DD&gt;.......&lt;/DD&gt;', '&lt;DT&gt;.......&lt;/DT&gt;', '&lt;DL&gt;.......&lt;/DL&gt;', '&lt;OL&gt;.......&lt;/OL&gt;', '&lt;UL&gt;.......&lt;/UL&gt;', 4, 26),
(28, 1, 'Untuk membuat definition list yang terdiri atas dua bagian yaitu, bagian tema dan definisinya. Tag yang digunakan untuk menandai sebuah tema adalah ', '&lt;DD&gt;.......&lt;/DD&gt;', '&lt;DT&gt;.......&lt;/DT&gt;', '&lt;DL&gt;.......&lt;/DL&gt;', '&lt;OL&gt;.......&lt;/OL&gt;', '&lt;UL&gt;.......&lt;/UL&gt;', 2, 27),
(29, 1, 'Untuk membuat definition list yang terdiri atas dua bagian yaitu, bagian tema dan definisinya. Tag yang digunakan untuk menandai sebuah definisi adalah ', '&lt;DD&gt;.......&lt;/DD&gt;', '&lt;DT&gt;.......&lt;/DT&gt;', '&lt;DL&gt;.......&lt;/DL&gt;', '&lt;OL&gt;.......&lt;/OL&gt;', '&lt;UL&gt;.......&lt;/UL&gt;', 3, 28),
(30, 1, 'Atribut yang digunakan untuk menentukan posisi gambar yang akan ditampilkan pada tag &lt;img&gt; adalah', 'alt', 'src', 'width', 'height', 'align', 2, 29),
(51, 86, 'Situs/web dimana kita bisa berinteraksi dengan user disebut ', 'Statis', 'Website', 'Web browser', 'Links', 'Dinamis', 2, 0),
(52, 86, 'Ekstensi penyimpanan pada HTML adalah ', 'Nama file.doc', 'Nama file.xls', 'Nama file.htm', 'Nama file. Ppt', 'Nama file.rtf', 3, 0),
(53, 86, 'Sintak dasar HTML adalah', '&lt;body&gt;.&lt;/body&gt;', '&lt;head&gt;&lt;/head&gt;', '&lt;html&gt;&lt;html&gt;', '&lt;html&gt;&lt;/html&gt;', '&lt;bgcolor&gt;.&lt;bgcolor&gt;', 4, 0),
(54, 86, 'Bentuk 3 tag HTML adalah.', 'Element, Attribute, Value', 'Body,head, bgcolor', 'Element, body, HTML', 'HTML, title, bgcolor', 'body, bg color, title', 1, 0),
(55, 86, 'Sebuah bentuk animasi text sederhana yang dapat diciptakan oleh HTML adalah', 'Heading', 'Formulir', 'Marquee', 'Paraghraph', 'Background', 3, 0),
(56, 86, 'Format gambar/image yang dimasukkan dalam web adalah ', 'PDF ', 'PPT ', 'Doc ', 'JPEG ', 'ZIP', 4, 0),
(57, 86, 'Menu untuk menambahkan musik, gambar, animasi dan lain-lain pada halaman wordpess kita ', 'Media', 'Link', 'Pages', 'Post', 'Comment', 1, 0),
(58, 86, 'Menu untuk mengelola komentar-komentar dari pengunjung wordpress adalah ', 'Media', 'Link', 'Pages', 'Post', 'Comment', 5, 0),
(59, 86, 'Menu untuk mengkonfigurasi pengaturan-pengaturan wordpress adalah ', 'Link', 'Setting', 'Pages', 'User', 'Plugin', 2, 0),
(60, 86, 'Menu untuk menambahkan kalender, jam digital dll yang diinstall (masukan) ke dalam wordpress adalah ', 'Link', 'Setting', 'Pages', 'User', 'Plugin', 5, 0),
(61, 86, 'Server yang berfungsi sebagai localhost pada wordpress offline adalah  ', 'Xampp', 'Php', 'Notepad ++', 'Windows', 'Http', 1, 0),
(62, 86, 'Bagian xampp yang merupakan tempat meletakkan berkas-berkas yang akan dijalankan adalah ', 'Htdoc', 'phpMyAdmin', 'Control Panel', 'MySQL', 'Http', 1, 0),
(63, 86, 'Bagian xampp yang berfungsi mengelola layanan (service) xampp seperti start atau stop adalah ', 'Htdoc', 'phpMyAdmin', 'Control Panel', 'MySQL', 'Http', 3, 0),
(64, 86, 'Bagian xampp yang berfungsi mengelola database MYSQL yang ada di komputer adalah ', 'Htdoc', 'phpMyAdmin', 'Control Panel', 'MySQL', 'Http', 2, 0),
(65, 86, 'Jika kita ingin merubah tema tampilan wordpress digunakan menu ', 'Media', 'Tools', 'Appearance', 'Design', 'Plugin', 3, 0),
(66, 86, 'Pengaturan site title dan tagline halaman wordpress kita termasuk dalam pengaturan ', 'Site identity', 'Tag', 'Menus', 'Categories', 'Content', 1, 0),
(67, 86, 'Proses mengirim file atau media dari komputer lokal ke server/jaringan internet disebut ', 'Upload', 'Download', 'Select', 'Send', 'Move', 1, 0),
(68, 86, 'Jika kita mengeksekusi file .html maka file tersebut akan berjalan pada', 'Firefox', 'Notepad++', 'Ms.word', 'Windows explorer', 'Transtool', 1, 0),
(69, 86, 'Kode HTML adalah case sensitive yang artinya ', 'Berpengaruh pada besar kecilnya huruf', 'Berpengaruh pada penggunaan tanda (;)', 'Berpengaruh pada penggunaan tanda &lt;/&gt;', 'Berpengaruh pada penggunaan tanda /', 'Tidak berpengaruh pada penulisan kode', 1, 0),
(70, 86, 'Untuk mengganti paragraph digunakan tag ', '&lt;h&gt;', '&lt;p&gt;', '&lt;br&gt;', '&lt;font&gt;', '&lt;hr&gt;', 1, 0),
(71, 88, '<p>jawabannya adalah apa ?</p>', '<p>a</p>', '<p>b</p>', '<p>c</p>', '<p>d</p>', '<p>e</p>', 5, 0),
(72, 88, '<p>zzzzzzzz</p>', '<p>a</p>', '<p>x</p>', '<p>1</p>', '', '<p>2</p>', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE `ujian` (
  `id_ujian` int(5) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `lama_ujian` int(5) NOT NULL,
  `jml_soal` int(3) NOT NULL,
  `id_user` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ujian`
--

INSERT INTO `ujian` (`id_ujian`, `judul`, `nama_mapel`, `tanggal`, `lama_ujian`, `jml_soal`, `id_user`) VALUES
(1, 'Pemrograman Web X', 'Pemrograman Web', '2018-07-06', 120, 40, 3),
(81, 'Bahasa Inggris Kelas XI', 'Bahasa Inggris', '2016-07-04', 120, 50, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `level`) VALUES
(3, 'Bejo', 'bejo123', 'b9864018663e18d7a3ce2a9ae9cb8b4e', 'guru'),
(1, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 'Ahmad Syauqy', 'syauqy1310', '238f4a35f2fd45bce81a62d530dcb45f', 'operator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nus`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id_soal`);

--
-- Indexes for table `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id_ujian`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `ujian`
--
ALTER TABLE `ujian`
  MODIFY `id_ujian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
