-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 06 Jul 2019 pada 10.44
-- Versi Server: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_panjatek`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id_adm` int(5) NOT NULL,
  `nama_adm` varchar(50) NOT NULL,
  `tmptlahir_adm` varchar(50) NOT NULL,
  `tgllahir_adm` varchar(20) NOT NULL,
  `telp_adm` varchar(15) NOT NULL,
  `jk_adm` varchar(15) NOT NULL,
  `user_adm` varchar(50) NOT NULL,
  `pass_adm` varchar(50) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_adm`, `nama_adm`, `tmptlahir_adm`, `tgllahir_adm`, `telp_adm`, `jk_adm`, `user_adm`, `pass_adm`) VALUES
(1, 'Administrator', 'Bekasi', '1990-07-17', '0899899989', 'Laki-Laki', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE IF NOT EXISTS `guru` (
  `id_guru` int(5) NOT NULL,
  `nip` varchar(6) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tmptlahir` varchar(50) NOT NULL,
  `tgllahir` varchar(20) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `jk_guru` varchar(15) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `keterangan` varchar(50) NOT NULL,
  `id_adm` int(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id_guru`, `nip`, `nama`, `tmptlahir`, `tgllahir`, `telp`, `jk_guru`, `password`, `keterangan`, `id_adm`) VALUES
(48, '0989', 'kjk', 'kj', '2019-12-31', '98', 'Laki-Laki', '0989', 'kj', 1),
(46, '12345', 'Haryanto', 'Jakrta', '1990-05-20', '08192819189', 'Laki-Laki', '12345', 'Guru TKJ', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `identitas`
--

CREATE TABLE IF NOT EXISTS `identitas` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kode` varchar(200) NOT NULL,
  `id_adm` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `identitas`
--

INSERT INTO `identitas` (`id`, `nama`, `alamat`, `kode`, `id_adm`) VALUES
(1, 'Admin', 'Bekasi', '3d3aa013608d010779b40f3512cce2a9f08d0381dbb07a53592e11ad226651c04ecf160abcf8b1dbd1895bf6eccb511e4e377799697c4bbba82c6bcbabe20119', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE IF NOT EXISTS `kelas` (
  `id_kelas` int(5) NOT NULL,
  `kelas` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kelas`) VALUES
(11, 'XI Teknik Komputer dan Jaringan 2018/2019');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas_ujian`
--

CREATE TABLE IF NOT EXISTS `kelas_ujian` (
  `id_ujian` int(5) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas_ujian`
--

INSERT INTO `kelas_ujian` (`id_ujian`, `id_kelas`, `aktif`) VALUES
(1, 11, 'N'),
(3, 11, 'N'),
(2, 11, 'N'),
(4, 11, 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE IF NOT EXISTS `nilai` (
  `id_nilai` int(10) NOT NULL,
  `id_siswa` varchar(20) NOT NULL,
  `id_ujian` int(5) NOT NULL,
  `acak_soal` text NOT NULL,
  `jawaban` text NOT NULL,
  `sisa_waktu` varchar(10) NOT NULL,
  `jml_benar` int(5) NOT NULL,
  `nilai` varchar(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_siswa`, `id_ujian`, `acak_soal`, `jawaban`, `sisa_waktu`, `jml_benar`, `nilai`) VALUES
(3, '2', 4, '5', '1', '89:54', 1, '100');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE IF NOT EXISTS `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tmpt_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_adm` int(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nis`, `nama`, `tmpt_lahir`, `tgl_lahir`, `jk`, `password`, `id_kelas`, `id_adm`) VALUES
(2, '0022259775', 'Ajeng Zahra Firdausi', 'Bekasi', '2000-01-05', 'Perempuan', '0022259775', 11, 1),
(3, '0022215413', 'Aldi Nurkholik', 'Bekasi', '2000-05-04', 'Laki-Laki', '0022215413', 11, 1),
(4, '0020932651', 'Arief Priananda Tunggal', 'Bekasi', '2000-04-15', 'Laki-Laki', '0020932651', 11, 1),
(5, '0022215436', 'Ariyanto Arif Wicaksono', 'Semarang', '2000-06-17', 'Laki-Laki', '0022215436', 11, 1),
(6, '0022259754', 'Birul Alim', 'Bekasi', '2000-01-25', 'Laki-Laki', '0022259754', 11, 1),
(7, '0022285803', 'Ela Febrianti', 'Jakarta', '2000-02-05', 'Perempuan', '0022285803', 11, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `soal`
--

CREATE TABLE IF NOT EXISTS `soal` (
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `soal`
--

INSERT INTO `soal` (`id_soal`, `id_ujian`, `soal`, `pilihan_1`, `pilihan_2`, `pilihan_3`, `pilihan_4`, `pilihan_5`, `kunci`, `urut`) VALUES
(1, 1, '<p>Test Soal</p>', '<p>a</p>', '<p>b</p>', '<p>c</p>', '<p>d</p>', '<p>e</p>', 1, 0),
(2, 3, '<p>sjdklsjfsk</p>', '<p>a</p>', '<p>b</p>', '<p>c</p>', '<p>d</p>', '<p>e</p>', 1, 0),
(3, 3, '<p>2</p>', '<p>2</p>', '<p>2</p>', '<p>2</p>', '<p>2</p>', '<p>2</p>', 2, 0),
(4, 1, '<p>asdkjadsk</p>', '<p>llkasldk</p>', '<p>lsdk</p>', '<p>ldk</p>', '<p>aslkd</p>', '<p>asdk</p>', 2, 0),
(5, 4, '<p>q</p>', '<p>q</p>', '<p>q</p>', '<p>q</p>', '<p>q</p>', '<p>q</p>', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ujian`
--

CREATE TABLE IF NOT EXISTS `ujian` (
  `id_ujian` int(5) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` int(5) NOT NULL,
  `jml_soal` int(3) NOT NULL,
  `id_guru` int(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ujian`
--

INSERT INTO `ujian` (`id_ujian`, `nama_mapel`, `tanggal`, `waktu`, `jml_soal`, `id_guru`) VALUES
(1, 'Teknologi Layanan Jaringan', '2019-06-03', 90, 10, 46),
(2, 'sfksdjf', '2019-06-05', 60, 1, 46),
(3, 'test', '2019-06-25', 10, 2, 46),
(4, 'testing', '2019-07-06', 90, 100, 46);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_adm`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `identitas`
--
ALTER TABLE `identitas`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id_siswa`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_adm` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `identitas`
--
ALTER TABLE `identitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ujian`
--
ALTER TABLE `ujian`
  MODIFY `id_ujian` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
