-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2019 at 07:47 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pelaporan`
--

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id_info` int(11) NOT NULL,
  `judul_info` varchar(255) NOT NULL,
  `foto_info` varchar(255) NOT NULL,
  `desk_info` text NOT NULL,
  `kat_info` varchar(30) NOT NULL,
  `tgl_info` datetime NOT NULL,
  `author_info` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id_info`, `judul_info`, `foto_info`, `desk_info`, `kat_info`, `tgl_info`, `author_info`) VALUES
(1, 'Kunjungan Kerja Dinas Perhubun', 'http://dishub.mojokertokota.go.id/assets/upload/berita/be45e-kunjungan-dishub-kab-sintang-04-12-2018-.jpeg', 'Dinas Perhubungan Kota Mojokerto menerima kunjungan kerja dari Dinas Perhubungan Kabupaten Sintang Propinsi Kalimantan Barat pada hari Selasa, 4 Desember 2018. Kunjungan kerja diterima langsung oleh Kepala Dinas Perhubungan Kota Mojokerto Gaguk Tri Prasetyo, ATD, MM. Kunjungan kerja kali ini dalam rangka diskusi untuk pengembangan wawasan terkait penyelenggaraan ANDALALIN (Analisa Dampak Lalu Lintas) dan penyelenggaraan Angkutan Sekolah Gratis di Kota Mojokerto.\n\nSejak tahun 2016 Dinas Perhubungan Kota Mojokerto telah menyelenggarakan Angkutan Sekolah Gratis yang bekerja sama dengan beberapa Angkutan Kota Mojokerto sebagai penyedia armada Angkutan Sekolah Gratis. Kemudian pada tahun 2017 Dinas Perhubungan Kota Mojokerto memperoleh bus bantuan dari Kementerian Perhubungan sebanyak 2 unit. Dan pada tahun yang sama Dinas Perhubungan Kota Mojokerto memiliki 3 unit mobil minibus untuk armada Angkutan Sekolah Gratis, ditambah dengan 1 unit mobil minibus bantuan CSR Bank Jatim Cab. Mojokerto.', 'News', '2018-12-04 00:00:00', 'Admin'),
(2, 'Kegiatan Penertiban Juru Parkir di Pasar Tanjung Anyar', 'http://dishub.mojokertokota.go.id/assets/upload/berita/6441a-dal-op2.jpeg', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(4, 'a', 'b', 'c', 'd', '2009-01-10 00:00:00', 'asu'),
(5, 'Kegiatan Penertiban Juru Parkir di Pasar Tanjung Anyar', 'http://dishub.mojokertokota.go.id/assets/upload/berita/6441a-dal-op2.jpeg', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(6, 'asddasd', 'uploads\\6dfd4779ae254aef757a004bda800b27', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(7, 'asddasd', 'uploads\\function toISOString() { [native code] }undefined', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(8, 'asddasd', 'uploads\\2019-05-19T083614396Z - undefined', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(9, 'asddasd', 'uploads\\2019-05-19T083803301Z', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(10, 'asddasd', 'uploads\\2019-05-19T085725091Zjpeg', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(11, 'asddasd', 'uploads\\2019-05-19T085851371Z.png', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(12, 'asddasd', 'uploads\\2019-05-19T085937507Z.jpeg', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(13, 'asddasd', 'uploads\\info\\2019-05-19T092245459Z.jpeg', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(14, 'asddasd', 'uploads\\info\\2019-05-19T092406334Z.jpeg', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(15, 'asddasd', 'uploads\\2019-05-19T092952079Z.jpeg', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(16, 'asddasd', 'uploads\\2019-05-19T093051658Z.jpeg', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(17, 'asddasd', 'uploads\\2019-05-19T130037972Z.png', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(18, 'asddasd', 'uploads\\2019-05-19T130507917Z.png', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(19, 'asddasd', 'uploads\\2019-05-19T130608149Z.png', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(20, 'asddasd', 'uploads\\2019-05-19T130736740Z.jpeg', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin'),
(21, 'asddasd', 'uploads\\info\\2019-05-19T131102518Z.png', 'Sebagai salah satu upaya menjaga ketertiban parkir tepi jalan umum di Kota Mojokerto, Dinas Perhubungan Kota Mojokerto dalam hal ini Bidang Pengendalian Operasi dan Perparkiran melaksanakan kegiatan penertiban parkir tepi jalan umum yang dilaksanakan pada hari Selasa, tanggal 26 Juni 2018, di kawasan Jalan Residen Pamuji tepatnya di depan Pasar Tanjung Anyar Kota Mojokerto. ', 'News', '2018-06-26 00:00:00', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `izin`
--

CREATE TABLE `izin` (
  `id_izin` int(11) NOT NULL,
  `id_user_izin` int(11) NOT NULL,
  `kode_izin` varchar(255) NOT NULL,
  `surat_izin` varchar(255) NOT NULL,
  `ktp_izin` varchar(255) NOT NULL,
  `desk_izin` text NOT NULL,
  `tgl_izin` datetime NOT NULL,
  `status_izin` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `izin`
--

INSERT INTO `izin` (`id_izin`, `id_user_izin`, `kode_izin`, `surat_izin`, `ktp_izin`, `desk_izin`, `tgl_izin`, `status_izin`) VALUES
(1, 29, 'IZN-0001', '/uploads/izin/2019-05-29T050717764Z.jpeg', '/uploads/izin/2019-05-29T050717779Z.jpeg', 'testing bos', '2019-05-29 12:07:18', 'Menunggu');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int(11) NOT NULL,
  `id_lapor_komentar` int(11) NOT NULL,
  `id_user_komentar` int(11) NOT NULL,
  `desk_komentar` varchar(70) NOT NULL,
  `tgl_komentar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id_komentar`, `id_lapor_komentar`, `id_user_komentar`, `desk_komentar`, `tgl_komentar`) VALUES
(4, 37, 26, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmo', '2019-05-24 10:19:30'),
(5, 37, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmo', '2019-05-25 11:10:40');

-- --------------------------------------------------------

--
-- Table structure for table `kritiksaran`
--

CREATE TABLE `kritiksaran` (
  `id_kritiksaran` int(11) NOT NULL,
  `id_user_kritiksaran` int(11) NOT NULL,
  `rate_kritiksaran` varchar(15) NOT NULL,
  `desk_kritiksaran` varchar(50) NOT NULL,
  `tgl_kritiksaran` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kritiksaran`
--

INSERT INTO `kritiksaran` (`id_kritiksaran`, `id_user_kritiksaran`, `rate_kritiksaran`, `desk_kritiksaran`, `tgl_kritiksaran`) VALUES
(1, 1, 'Puas', 'oyi', '2019-05-29 13:40:54'),
(2, 29, 'Tidak Puas', 'aw', '2019-05-29 13:46:09'),
(3, 29, 'Netral', 'harusnya kurang', '2019-05-29 13:46:50');

-- --------------------------------------------------------

--
-- Table structure for table `lapor`
--

CREATE TABLE `lapor` (
  `id_lapor` int(11) NOT NULL,
  `kode_lapor` varchar(255) NOT NULL,
  `id_user_lapor` int(11) NOT NULL,
  `judul_lapor` varchar(255) DEFAULT NULL,
  `kat_lapor` varchar(255) NOT NULL,
  `foto_lapor` varchar(150) NOT NULL,
  `desk_lapor` text NOT NULL,
  `lat_lapor` double NOT NULL,
  `long_lapor` double NOT NULL,
  `lokasi_lapor` varchar(255) NOT NULL,
  `vote_lapor` int(11) DEFAULT NULL,
  `tgl_lapor` datetime NOT NULL,
  `status_lapor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lapor`
--

INSERT INTO `lapor` (`id_lapor`, `kode_lapor`, `id_user_lapor`, `judul_lapor`, `kat_lapor`, `foto_lapor`, `desk_lapor`, `lat_lapor`, `long_lapor`, `lokasi_lapor`, `vote_lapor`, `tgl_lapor`, `status_lapor`) VALUES
(3, 'LAPOR-0003', 1, '', 'Infrastruktur', '/uploads/lapor/2019-05-20T180209536Z.jpeg', 'waw3', -7.486465453888889, 112.43383026111111, 'Jl. Karimun Jawa, Mojokerto Kota 61321, Indonesia', 0, '2019-05-21 01:02:09', ''),
(4, 'LPR-0001', 1, '', 'Lalu Lintas', '/uploads/lapor/2019-05-21T160406395Z.jpeg', 'asd', -7.968372821666667, 112.61672973611111, 'Jalan Bondowoso Dalam, Malang Kota 65115, Indonesia', 0, '2019-05-21 23:04:06', 'Menunggu'),
(5, 'LPR-0002', 1, '', 'Lalu Lintas', '/uploads/lapor/2019-05-21T160452129Z.jpeg', 'sadasd', -7.968372821666667, 112.61672973611111, 'Jalan Bondowoso Dalam, Malang Kota 65115, Indonesia', 0, '2019-05-21 23:04:52', 'Menunggu'),
(6, 'LPR-0003', 1, '', 'Lalu Lintas', '/uploads/lapor/2019-05-21T160606893Z.jpeg', 'asddsfgds', -7.486465453888889, 112.43383026111111, 'Jl. Karimun Jawa, Mojokerto Kota 61321, Indonesia', 0, '2019-05-21 23:06:06', 'Menunggu'),
(7, 'LPR-0004', 1, '', 'Lalu Lintas', '/uploads/lapor/2019-05-21T160637186Z.jpeg', 'asd', -7.968372821666667, 112.61672973611111, 'Jalan Bondowoso Dalam, Malang Kota 65115, Indonesia', 0, '2019-05-21 23:06:37', 'Menunggu'),
(8, 'LPR-0005', 1, '', 'Lalu Lintas', '/uploads/lapor/2019-05-21T160659437Z.jpeg', 'SDF', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', 0, '2019-05-21 23:06:59', 'Menunggu'),
(9, 'LPR-0006', 1, '', 'Pengendalian Operasi', '/uploads/lapor/2019-05-21T160907819Z.jpeg', 'saddf', 35.74092255361183, 139.2403295546325, 'Japan, Japan', 0, '2019-05-21 23:09:07', 'Menunggu'),
(10, 'LPR-0007', 1, '', 'Pengendalian Operasi', '/uploads/lapor/2019-05-21T161146777Z.jpeg', 'sda', 35.74092255361183, 139.2403295546325, 'Japan, Japan', 0, '2019-05-21 23:11:46', 'Menunggu'),
(11, 'LPR-0008', 1, '', 'Angkutan Umum', '/uploads/lapor/2019-05-21T161730280Z.jpeg', 'asdd', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', 0, '2019-05-21 23:17:30', 'Menunggu'),
(12, 'LPR-0009', 1, '', 'Angkutan Umum', '/uploads/lapor/2019-05-21T162555213Z.jpeg', 'sadasd', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', 0, '2019-05-21 23:25:55', 'Menunggu'),
(13, 'LPR-0010', 1, '', 'Lalu Lintas', '/uploads/lapor/2019-05-21T162756209Z.jpeg', 'j', -7.968372821666667, 112.61672973611111, 'Jalan Bondowoso Dalam, Malang Kota 65115, Indonesia', 0, '2019-05-21 23:27:56', 'Menunggu'),
(14, 'LPR-0011', 1, '', 'Angkutan Umum', '/uploads/lapor/2019-05-22T051936396Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', NULL, '2019-05-22 12:19:36', 'Menunggu'),
(15, 'LPR-0012', 1, '', 'Angkutan Umum', '/uploads/lapor/2019-05-22T052051559Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', NULL, '2019-05-22 12:20:51', 'Menunggu'),
(16, 'LPR-0013', 1, '', 'Angkutan Umum', '/uploads/lapor/2019-05-22T052307022Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', NULL, '2019-05-22 12:23:07', 'Menunggu'),
(17, 'LPR-0014', 1, '', 'Angkutan Umum', '/uploads/lapor/2019-05-22T052351541Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', NULL, '2019-05-22 12:23:51', 'Menunggu'),
(18, 'LPR-0015', 1, '', 'Angkutan Umum', '/uploads/lapor/2019-05-22T052558587Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', NULL, '2019-05-22 12:25:58', 'Menunggu'),
(19, 'LPR-0016', 1, '', 'Angkutan Umum', '/uploads/lapor/2019-05-22T052700089Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', NULL, '2019-05-22 12:27:00', 'Menunggu'),
(20, 'LPR-0017', 1, '', 'Angkutan Umum', '/uploads/lapor/2019-05-22T052743289Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', NULL, '2019-05-22 12:27:43', 'Menunggu'),
(21, 'LPR-0018', 1, '', 'Angkutan Umum', '/uploads/lapor/2019-05-22T052916517Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', NULL, '2019-05-22 12:29:16', 'Menunggu'),
(22, 'LPR-0019', 1, '', 'Angkutan Umum', '/uploads/lapor/2019-05-22T053021548Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', NULL, '2019-05-22 12:30:21', 'Menunggu'),
(23, 'LPR-0020', 1, '', 'Angkutan Umum', '/uploads/lapor/2019-05-22T053445152Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', NULL, '2019-05-22 12:34:45', 'Menunggu'),
(24, 'LPR-0021', 1, '', 'Angkutan Umum', '/uploads/lapor/2019-05-22T053457620Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', NULL, '2019-05-22 12:34:57', 'Menunggu'),
(25, 'LPR-0022', 1, '', 'Angkutan Umum', '/uploads/lapor/2019-05-22T053800579Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', NULL, '2019-05-22 12:38:00', 'Menunggu'),
(26, 'LPR-0023', 1, '', 'Angkutan Umum', '/uploads/lapor/2019-05-22T054457741Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', NULL, '2019-05-22 12:44:58', 'Menunggu'),
(27, 'LPR-0024', 1, '', 'Lalu Lintas', '/uploads/lapor/2019-05-22T070318463Z.jpeg', 'asdads', -7.962206840277778, 112.61051940916666, 'Jalan Bendungan Nawangan, Malang Kota 65145, Indonesia', 0, '2019-05-22 14:03:18', 'Menunggu'),
(28, 'LPR-0025', 1, '', 'Pengendalian Operasi', '/uploads/lapor/2019-05-22T070507623Z.jpeg', 'sad', 35.74092255361183, 139.2403295546325, 'Japan, Japan', 0, '2019-05-22 14:05:08', 'Menunggu'),
(29, 'LPR-0026', 1, '', 'Pengendalian Operasi', '/uploads/lapor/2019-05-22T070640136Z.jpeg', 'sad', -7.968372821666667, 112.61672973611111, 'Jalan Bondowoso Dalam, Malang Kota 65115, Indonesia', 0, '2019-05-22 14:06:40', 'Menunggu'),
(30, 'LPR-0027', 1, '', 'Pengendalian Operasi', '/uploads/lapor/2019-05-22T071126547Z.jpeg', 'sad', -7.968372821666667, 112.61672973611111, 'Jalan Bondowoso Dalam, Malang Kota 65115, Indonesia', 0, '2019-05-22 14:11:26', 'Menunggu'),
(31, 'LPR-0028', 1, '', 'Pengendalian Operasi', '/uploads/lapor/2019-05-22T071309983Z.jpeg', 'sad', -7.968372821666667, 112.61672973611111, 'Jalan Bondowoso Dalam, Malang Kota 65115, Indonesia', 0, '2019-05-22 14:13:10', 'Menunggu'),
(32, 'LPR-0029', 1, '', 'Lalu Lintas', '/uploads/lapor/2019-05-22T071404877Z.jpeg', 'sda', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', 0, '2019-05-22 14:14:04', 'Menunggu'),
(33, 'LPR-0030', 1, '', 'Lalu Lintas', '/uploads/lapor/2019-05-22T071440263Z.jpeg', 'sad', -7.962206840277778, 112.61051940916666, 'Jalan Bendungan Nawangan, Malang Kota 65145, Indonesia', 0, '2019-05-22 14:14:40', 'Menunggu'),
(34, 'LPR-0031', 1, '', 'Lalu Lintas', '/uploads/lapor/2019-05-22T071545776Z.jpeg', 'asd', -7.486465453888889, 112.43383026111111, 'Jl. Karimun Jawa, Mojokerto Kota 61321, Indonesia', 0, '2019-05-22 14:15:46', 'Menunggu'),
(35, 'LPR-0032', 26, '', 'Lalu Lintas', '/uploads/lapor/2019-05-22T075619847Z.jpeg', 'testing tenan', -7.962206840277778, 112.61051940916666, 'Jalan Bendungan Nawangan, Malang Kota 65145, Indonesia', 0, '2019-05-22 14:56:20', 'Proses'),
(36, 'LPR-0033', 26, '', 'Infrastruktur', '/uploads/lapor/2019-05-24T030714727Z.jpeg', 'banjir bro', -7.7055320738888895, 113.47743225083333, 'Probolinggo Kabupaten 67291, Indonesia', 0, '2019-05-24 10:07:15', 'Menunggu'),
(37, 'LPR-0034', 26, '', 'Perparkiran', '/uploads/lapor/2019-05-24T040819604Z.jpeg', 'banjir maneh broo', -7.704733848333333, 113.47746276833334, 'Probolinggo Kabupaten 67291, Indonesia', 0, '2019-05-24 11:08:20', 'Menunggu'),
(38, 'LPR-0035', 26, NULL, 'Infrastruktur', '/uploads/lapor/2019-05-25T205329555Z.jpeg', 'Pc mantul', -7.962206363611111, 112.61051940916666, 'Jalan Bendungan Nawangan, Malang Kota 65145, Indonesia', 0, '2019-05-26 03:53:31', 'Menunggu'),
(39, 'LPR-0036', 26, NULL, 'Infrastruktur', '/uploads/lapor/2019-05-26T091932713Z.jpeg', 'Sampaaah', -7.9600157736111115, 112.60550689694443, 'Jalan Bendungan Sigura Gura Barat, Malang Kota 65146, Indonesia', 0, '2019-05-26 16:19:34', 'Menunggu'),
(41, 'LPR-0037', 28, NULL, 'Infrastruktur', '/uploads/lapor/2019-05-27T083529795Z.jpeg', 'pantai kotoooorrr', -7.7039432525, 113.47815704333334, 'Probolinggo Kabupaten 67291, Indonesia', 0, '2019-05-27 15:35:30', 'Menunggu'),
(44, 'LPR-0038', 28, NULL, 'Lalu Lintas', '/uploads/lapor/2019-05-27T092444134Z.jpeg', 'waaaaaaannnnjjjjiiiinngggggg', -7.704733848333333, 113.47746276833334, 'Probolinggo Kabupaten 67291, Indonesia', 0, '2019-05-27 16:24:44', 'Menunggu'),
(45, 'LPR-0039', 29, NULL, 'Lalu Lintas', '/uploads/lapor/2019-05-29T162109447Z.jpeg', 'tes', -7.704733848333333, 113.47746276833334, 'Probolinggo Kabupaten 67291, Indonesia', 0, '2019-05-29 23:21:09', 'Menunggu'),
(46, 'LPR-0040', 29, NULL, 'Angkutan Umum', '/uploads/lapor/2019-05-29T162244453Z.png', 'sdsad', -7.4856785531497945, 112.43030548095705, 'Jalan Pekayon, Mojokerto Kabupaten 61361, Indonesia', 0, '2019-05-29 23:22:44', 'Menunggu'),
(47, 'LPR-0041', 29, NULL, 'Pengendalian Operasi', '/', 'sad', 35.74092255361183, 139.2403295546325, 'Japan, Japan', 0, '2019-05-29 23:29:33', 'Menunggu'),
(48, 'LPR-0042', 29, NULL, 'Layanan', '/uploads/lapor/2019-05-29T163322716Z.png', 'asd', -7.486189148006921, 112.43768692016603, 'Mojokerto Kabupaten 61363, Indonesia', 0, '2019-05-29 23:33:22', 'Menunggu'),
(49, 'LPR-0043', 29, NULL, 'Pengendalian Operasi', '/uploads/lapor/2019-05-29T163402368Z.jpeg', 'asdasd', -7.486465453888889, 112.43383026111111, 'Jl. Karimun Jawa, Mojokerto Kota 61321, Indonesia', 0, '2019-05-29 23:34:02', 'Menunggu'),
(50, 'LPR-0044', 29, NULL, 'Infrastruktur', '/uploads/lapor/2019-05-29T163705358Z.jpeg', 'asdsad', -7.485197210575539, 112.4143409729004, 'Mojokerto Kota 61328, Indonesia', 0, '2019-05-29 23:37:05', 'Menunggu'),
(51, 'LPR-0045', 29, NULL, 'Infrastruktur', '/uploads/lapor/2019-05-29T163936640Z.jpeg', 'sadasdd', 35.74092255361183, 139.2403295546325, 'Japan, Japan', 0, '2019-05-29 23:39:36', 'Menunggu'),
(52, 'LPR-0046', 29, NULL, 'Lalu Lintas', '/uploads/lapor/2019-05-29T164527489Z.jpeg', 'hbj', 35.74092255361183, 139.2403295546325, 'Japan, Japan', 0, '2019-05-29 23:45:27', 'Menunggu'),
(53, 'LPR-0047', 29, NULL, 'Lalu Lintas', '/uploads/lapor/2019-05-29T164828067Z.jpeg', 'fgdfg', 35.74092255361183, 139.2403295546325, 'Japan, Japan', 0, '2019-05-29 23:48:28', 'Menunggu'),
(54, 'LPR-0048', 29, NULL, 'Infrastruktur', '/', 'gfhfg', -7.489622351022603, 112.44558334350587, 'Mojokerto Kabupaten 61363, Indonesia', 0, '2019-05-29 23:51:32', 'Menunggu'),
(55, 'LPR-0049', 29, NULL, 'Infrastruktur', '/', 'rtytry', -7.704733848333333, 113.47746276833334, 'Probolinggo Kabupaten 67291, Indonesia', 0, '2019-05-29 23:52:51', 'Menunggu'),
(56, 'LPR-0050', 29, NULL, 'Perparkiran', '/', 't', 35.74092255361183, 139.2403295546325, 'Japan, Japan', 0, '2019-05-30 00:03:33', 'Menunggu'),
(57, 'LPR-0051', 29, NULL, 'Angkutan Umum', '/', 'g', -7.487920379243461, 112.43717193603517, 'Mojokerto Kabupaten 61361, Indonesia', 0, '2019-05-30 00:04:34', 'Menunggu'),
(58, 'LPR-0052', 29, NULL, 'Infrastruktur', '/', 'k', -7.485878004337021, 112.43202209472658, 'Jalan Bawean, Mojokerto Kota 61321, Indonesia', 0, '2019-05-30 00:07:39', 'Menunggu'),
(59, 'LPR-0053', 29, NULL, 'Infrastruktur', '/uploads/lapor/2019-05-29T172138081Z.jpeg', 'hgj', -7.9543209075000005, 112.61422729472221, 'Jalan Kampus Universitas Brawijaya, Malang Kota 65145, Indonesia', 0, '2019-05-30 00:21:38', 'Menunggu');

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE `survey` (
  `id_survey` int(11) NOT NULL,
  `id_user_survey` int(11) NOT NULL,
  `tgl_survey` datetime NOT NULL,
  `isi_survey` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `alamat_user` varchar(150) NOT NULL,
  `tgl_lahir_user` date NOT NULL,
  `telp_user` varchar(15) NOT NULL,
  `foto_user` varchar(255) DEFAULT NULL,
  `email_user` varchar(50) NOT NULL,
  `pass_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `alamat_user`, `tgl_lahir_user`, `telp_user`, `foto_user`, `email_user`, `pass_user`) VALUES
(1, 'NRKNRK brooo', 'Candi', '1990-12-12', '1243245435', '/uploads/user/2019-05-19T174742226Z.jpeg', 'nrk2112@nrk.com', 'sjdhkldslfnsdfl'),
(3, 'NRK', 'Candi', '1990-12-12', '1243245435', '', 'nrk@nrk.com', 'sjdhkldslfnsdfl'),
(5, 'NRK22', 'Candi', '1990-12-12', '1243245435', '', 'nrk@nrk.com', 'sjdhkldslfnsdfl'),
(6, 'NRKNRK', 'Candi', '1990-12-12', '1243245435', '', 'nrk2@nrk.com', 'sjdhkldslfnsdfl'),
(7, 'NRKNRK', 'Candi', '1990-12-12', '1243245435', '', 'nrk2213323@nrk.com', 'sjdhkldslfnsdfl'),
(8, 'NRKNRK', 'Candi', '1990-12-12', '1243245435', '', 'nrk2213323@nrk.com', 'sjdhkldslfnsdfl'),
(9, 'NRKNRK', 'Candi', '1990-12-12', '1243245435', '', 'nrk2213323@nrk.com', 'sjdhkldslfnsdfl'),
(10, 'NRKNRK', 'Candi', '1990-12-12', '1243245435', '', 'nrk2213323@nrk.com', 'sjdhkldslfnsdfl'),
(12, 'NRKNRK', 'Candi', '1990-12-12', '1243245435', '', 'nrk2213323@nrk.com', 'sjdhkldslfnsdfl'),
(13, 'NRKNRK', 'Candi', '1990-12-12', '1243245435', '', 'nrk2213323@nrk.com', 'sjdhkldslfnsdfl'),
(14, 'NRKNRK', 'Candi', '1990-12-12', '1243245435', '', 'nrk22133231@nrk.com', 'sjdhkldslfnsdfl'),
(15, 'NRKNRK', 'Candi', '1990-12-12', '1243245435', '', 'nrk221332312@nrk.com', 'sjdhkldslfnsdfl'),
(16, 'NRKNRK', 'Candi', '1990-12-12', '1243245435', '', 'nrk2112@nrk.com', 'sjdhkldslfnsdfl'),
(17, 'NRKNRK brooo', 'Candi', '1990-12-12', '1243245435', '', 'nrk2111@nrk.com', 'sjdhkldslfnsdfl'),
(18, 'nizarrk', 'Candi', '1990-12-12', '1243245435', '', 'nizar@nizar.com', '$2b$10$kTPUQSSYhvOMm2YmT3mR6ufh1BdMyvleHj4NaJo8g8c'),
(20, 'nizarrk bro', 'Candi', '1990-12-12', '1243245435', '/uploads/user/2019-05-19T131658588Z.png', 'niezar.rk@gmail.com', '$2b$10$q2mS4IZKmHqcfURkt0boGeRhsDKO8/LPP4vxBXlkanfZ3S5sgKKvi'),
(21, 'nizarrk yoi', 'Candi23', '1990-12-12', '1243245435', 'uploads\\user\\2019-05-19T131658588Z.png', 'niezar.rk@gmail.comm', '$2b$10$MzCEhJZj/tlnCmRxgBjZ0OX4oZhUgsM.jFinu7OvYhUDK5GyRbTfG'),
(22, 'nizarrk yoi', 'Candi23', '1990-12-12', '1243245435', 'NRK-PCuploads\\user\\2019-05-19T172133218Z.jpeg', 'niezarr.rk@gmail.comm', '$2b$10$c.p3EzOzFV0SxfhKa9er.eVaBK.XRMTSHNeGWjA6fATaFPBL1Vhfi'),
(23, 'nizarrk yoi', 'Candi23', '1990-12-12', '1243245435', 'http://localhost:3000uploads\\user\\2019-05-19T172824463Z.jpeg', 'niezarsr.rk@gmail.comm', '$2b$10$5k/w8UyGP7MGueB3lAqvUeQoBFdMgF3YdY2DA6NhoDJyGLYBjVUxm'),
(24, 'nizarrk yoi', 'Candi23', '1990-12-12', '1243245435', 'http://localhost:3000/uploads\\user\\2019-05-19T173224499Z.jpeg', 'niezarsdsar.rk@gmail.comm', '$2b$10$dOdxpRPRVJcOgus2IOILBe4ky68.acDtJYy.56Gw.Mm1BwLNJxppe'),
(25, 'nizarrk yoi', 'Candi23', '1990-12-12', '1243245435', 'http://localhost:3000/uploads/user/2019-05-19T174742226Z.jpeg', 'niezarswdsar.rk@gmail.comm', '$2b$10$kj4NxFa.fhU/GyDiH5vqgedyRpl/HRtOmEkcVtra3y5uFZKCG/.eC'),
(26, 'Nizar Rahman K', 'Jl. Candi 2A 454 Sukun Malang', '1995-11-05', '081233763055', '/uploads/user/2019-05-22T072126644Z.jpeg', 'nizarkusworo@gmail.com', '$2b$10$RSSbqeuV5UmqzIS5KYXIO.4fch8hcNqvZXKOXhK/r0IkTLeV4di.6'),
(27, 'NRKNRK', 'sadsa', '2014-04-30', '213', '/uploads/user/defaultuser.jpg', 'nrknrk@nrk.com', '$2b$10$kvxEkqg1tUB20horxniMieYm7sV./uLM6iQccVIc85QoykXJLICXe'),
(28, 'NRK Channel', 'Youtube', '2014-04-30', '098776643', '/uploads/user/2019-05-27T081659046Z.png', 'nrk@channel.com', '$2b$10$x5KkXSS.X2w7ehooEaFhOOPzcwRhGRQe5PI7cXDGdGOJeMTzdokKm'),
(29, 'Rahman K', 'Jl. Candi 2A 454 Karang Besuki Sukun', '1990-01-01', '089786466543', '/uploads/user/2019-05-28T130117896Z.jpeg', 'rk@gmail.com', '$2b$10$oORYgdtBDZSEOYR8Npzwu.qDaigx8lV7KRV.zYH1J.tCFMH6Vyyyq');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id_info`);

--
-- Indexes for table `izin`
--
ALTER TABLE `izin`
  ADD PRIMARY KEY (`id_izin`),
  ADD KEY `id_user_izin` (`id_user_izin`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`),
  ADD KEY `id_lapor_komentar` (`id_lapor_komentar`),
  ADD KEY `id_user_komentar` (`id_user_komentar`);

--
-- Indexes for table `kritiksaran`
--
ALTER TABLE `kritiksaran`
  ADD PRIMARY KEY (`id_kritiksaran`),
  ADD KEY `id_user_kritiksaran` (`id_user_kritiksaran`);

--
-- Indexes for table `lapor`
--
ALTER TABLE `lapor`
  ADD PRIMARY KEY (`id_lapor`),
  ADD KEY `id_user_lapor` (`id_user_lapor`);

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`id_survey`),
  ADD KEY `id_user_survey` (`id_user_survey`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `izin`
--
ALTER TABLE `izin`
  MODIFY `id_izin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kritiksaran`
--
ALTER TABLE `kritiksaran`
  MODIFY `id_kritiksaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lapor`
--
ALTER TABLE `lapor`
  MODIFY `id_lapor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `id_survey` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `izin`
--
ALTER TABLE `izin`
  ADD CONSTRAINT `izin_ibfk_1` FOREIGN KEY (`id_user_izin`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`id_lapor_komentar`) REFERENCES `lapor` (`id_lapor`),
  ADD CONSTRAINT `komentar_ibfk_2` FOREIGN KEY (`id_user_komentar`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `kritiksaran`
--
ALTER TABLE `kritiksaran`
  ADD CONSTRAINT `kritiksaran_ibfk_1` FOREIGN KEY (`id_user_kritiksaran`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `lapor`
--
ALTER TABLE `lapor`
  ADD CONSTRAINT `lapor_ibfk_1` FOREIGN KEY (`id_user_lapor`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `survey`
--
ALTER TABLE `survey`
  ADD CONSTRAINT `survey_ibfk_1` FOREIGN KEY (`id_user_survey`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
