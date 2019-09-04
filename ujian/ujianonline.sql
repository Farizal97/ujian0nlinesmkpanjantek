-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2018 at 07:57 AM
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
(1, 51, 'N'),
(84, 21, 'N'),
(84, 1, 'N'),
(1, 50, 'N'),
(83, 22, 'N'),
(83, 21, 'N'),
(84, 43, 'N'),
(84, 28, 'N'),
(77, 21, 'Y'),
(77, 1, 'N'),
(77, 22, 'N'),
(77, 28, 'N'),
(77, 43, 'N'),
(81, 21, 'N'),
(1, 49, 'N'),
(86, 47, 'N'),
(85, 21, 'Y'),
(83, 28, 'N'),
(81, 22, 'N'),
(88, 22, 'Y'),
(88, 21, 'N'),
(86, 48, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(10) NOT NULL,
  `nis` varchar(20) NOT NULL,
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

INSERT INTO `nilai` (`id_nilai`, `nis`, `id_ujian`, `acak_soal`, `jawaban`, `sisa_waktu`, `jml_benar`, `nilai`) VALUES
(1, '1415100898', 86, '55,59,52,65,67,64,70,68,51,62,61,57,53,63,56,58,54,69,60,66', '3,2,4,4,3,3,5,4,1,1,3,5,3,0,0,3,0,0,0,2', '00:02', 3, '15'),
(2, '1415100896', 86, '52,57,62,59,60,66,70,53,68,64,61,65,55,54,69,56,58,67,51,63', '2,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,3,2,1', '119:30', 1, '5'),
(3, '1415100897', 86, '68,66,64,51,61,58,57,60,62,65,55,59,54,52,70,67,53,56,63,69', '2,1,2,0,0,2,4,3,5,0,2,4,5,5,0,2,2,3,0,4', '119:10', 2, '10'),
(4, '1516101336', 88, '72,71', '4,5', '119:11', 1, '50');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nis` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `password`, `id_kelas`, `status`) VALUES
('18010101', 'Abiyu Parasyakir', 'ca9605f9b8c9df7bc973a30ed457278d', 49, 'off'),
('18010102', 'Adam Ruswandi', '3a3d6521d9b5814215d03b5b7d21b56c', 49, 'off'),
('18010103', 'Ade Febriyanto', 'c412a59e4898ac853fc4760a93fdb635', 49, 'off'),
('18010104', 'Ahmad Fauzan', 'e2633cdb1f161d49d5b5f7a548b8e03c', 49, 'off'),
('18010105', 'Andika Tino Nugroho', '90f925316a3fe0b70afbb4c9298a3536', 49, 'off'),
('18010106', 'Ayu Agustin Effendy', '2e96854e118996f11d7c7c3687395d23', 49, 'off'),
('18010107', 'Bayu Maulana Nur', '7db8742948ee2a4a67999d26941bfa01', 49, 'off');

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
  `waktu` int(5) NOT NULL,
  `jml_soal` int(3) NOT NULL,
  `id_user` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ujian`
--

INSERT INTO `ujian` (`id_ujian`, `judul`, `nama_mapel`, `tanggal`, `waktu`, `jml_soal`, `id_user`) VALUES
(1, 'Pemrograman Web X', 'Pemrograman Web', '2016-08-03', 120, 40, 3),
(88, 'Semangat bang', 'Entahlah', '2018-04-27', 120, 40, 3),
(83, 'Struktur Organisasi', 'KKM 15', '2016-06-28', 90, 30, 4),
(84, 'Pendidikan Agama Islam', 'Pendidikan Agama Islam', '2016-06-28', 90, 50, 4),
(81, 'Bahasa Inggris Kelas XI', 'Bahasa Inggris', '2016-07-04', 120, 50, 2),
(85, 'Bahasa Indonesia Kls XI', 'Bahasa Indonesia', '2016-08-10', 90, 40, 2),
(86, 'Pemrograman Web XI', 'Pemrograman Web', '2016-08-10', 120, 50, 3);

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
  ADD PRIMARY KEY (`nis`);

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
  MODIFY `id_nilai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
