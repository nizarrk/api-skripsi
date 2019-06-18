-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2019 at 02:57 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.35

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
(1, 'Pemeriksaan Bus Terminal Kertajaya', '/uploads/info/2019-06-10T154427441Z.jpeg', 'Kegiatan ramp check/ pemeriksaan kendaraan bermotor di Terminal Kertajaya Mojokerto. Kegiatan ini dalam rangka persiapan Angkutan Lebaran 2019 dengan melakukan pemeriksaan kendaraan penumpang seperti bus agar laik jalan. Pemeriksaan ini tidak hanya pemeriksaan fisik kendaraan namun juga pemeriksaan kelengkapan administrasi kendaraan.', 'tes', '2019-06-10 22:44:27', ''),
(2, 'Pengecatan Marka Raden Wijaya', '/uploads/info/2019-06-12T052142170Z.jpeg', 'Kegiatan pengecatan marka zebra cross di Jalan Raden Wijaya Kota Mojokerto.\r\nKawan Dishub, gunakan zebra cross saat menyeberang jalan dan apabila berkendara agar memdahulukan penyeberang jalan.', 'waw2', '0000-00-00 00:00:00', ''),
(3, 'Periksa Kendaraan Sebelm Perjalanan Mudik', '/uploads/info/2019-06-10T155108307Z.jpeg', 'Hayoo, siapa di sini yang mau mudik menggunakan mobil pribadi? Nah, #MinHub ingetin supaya periksa kondisi kendaraan sebelum perjalanan panjang. Pastikan mobilmu dalam kondisi layak. Karena, bakal ribet kalau mobilmu rusak di jalan, bisa-bisa menganggu cerita seru lebaran kalian.\r\n\r\nKalau kamu jago soal mesin, bisa deh kamu utak-atik sendiri. Periksa mulai dari ruang mesin, starter mobil, aki, suara mesin, hingga gas buang, usahakan servis di bengkel terpercaya ya.\r\n\r\nYuk, periksa kendaraan kalian biar mudik jadi menyenangkan!', 'test', '2019-06-10 22:51:08', '');

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
  `kk_izin` varchar(255) NOT NULL,
  `kegiatan_izin` text NOT NULL,
  `lokasi_izin` text NOT NULL,
  `tgl_mulai_izin` date NOT NULL,
  `tgl_selesai_izin` date NOT NULL,
  `jam_mulai_izin` time NOT NULL,
  `jam_selesai_izin` time NOT NULL,
  `tgl_izin` datetime NOT NULL,
  `status_izin` varchar(255) NOT NULL,
  `pesan_tolak_izin` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `izin`
--

INSERT INTO `izin` (`id_izin`, `id_user_izin`, `kode_izin`, `surat_izin`, `ktp_izin`, `kk_izin`, `kegiatan_izin`, `lokasi_izin`, `tgl_mulai_izin`, `tgl_selesai_izin`, `jam_mulai_izin`, `jam_selesai_izin`, `tgl_izin`, `status_izin`, `pesan_tolak_izin`) VALUES
(2, 26, 'IZN-0001', '/uploads/izin/2019-06-13T122256068Z.jpeg', '/uploads/izin/2019-06-13T122256129Z.png', '/uploads/izin/2019-06-13T122256167Z.png', 'we', '0', '2019-06-13', '2019-06-13', '19:19:00', '19:19:00', '2019-06-13 19:23:02', 'Ditolak', 'aw'),
(3, 26, 'IZN-0002', '/uploads/izin/2019-06-13T133340557Z.png', '/uploads/izin/2019-06-13T133340579Z.jpeg', '/uploads/izin/2019-06-13T133340621Z.png', '', '0', '2019-06-13', '2019-06-13', '20:33:00', '20:33:00', '2019-06-13 20:33:43', 'Proses', NULL),
(4, 26, 'IZN-0003', '/uploads/izin/2019-06-13T133531958Z.png', '/uploads/izin/2019-06-13T133531974Z.png', '/uploads/izin/2019-06-13T133532000Z.jpeg', 'awyeah', '0', '2019-06-13', '2019-06-13', '20:35:00', '20:35:00', '2019-06-13 20:35:35', 'Ditolak', NULL),
(5, 26, 'IZN-0004', '/uploads/izin/2019-06-13T134045171Z.png', '/uploads/izin/2019-06-13T134045181Z.png', '/uploads/izin/2019-06-13T134045201Z.png', 'Bazaar / Pasar malam dan sejenisnya', 'tes', '2019-06-13', '2019-06-13', '20:40:00', '20:40:00', '2019-06-13 20:40:52', 'Selesai', NULL),
(6, 26, 'IZN-0005', '/uploads/izin/2019-06-13T134205620Z.png', '/uploads/izin/2019-06-13T134205622Z.jpeg', '/uploads/izin/2019-06-13T134205637Z.png', 'test', 'waw', '2019-06-13', '2019-06-25', '20:41:00', '20:41:00', '2019-06-13 20:42:07', 'Proses', NULL),
(7, 29, 'IZN-0006', '/uploads/izin/2019-06-13T134407027Z.jpeg', '/uploads/izin/2019-06-13T134407091Z.jpeg', '/uploads/izin/2019-06-13T134407662Z.jpeg', 'Road race', 'Jl. Benteng pancasila', '2019-06-13', '2019-06-13', '20:43:00', '22:15:00', '2019-06-13 20:44:11', 'Selesai', NULL),
(8, 26, 'IZN-0007', '/uploads/izin/2019-06-14T110020476Z.jpeg', '/uploads/izin/2019-06-14T110021109Z.jpeg', '/uploads/izin/2019-06-14T110021619Z.jpeg', 'Orkes / konser musik dan sejenisnya', 'Jl. Surodinawan', '2019-06-14', '2019-06-15', '17:59:00', '23:59:00', '2019-06-14 18:00:24', 'Proses', 'lokasi tidak jelas'),
(9, 20, 'IZN-0008', '/uploads/izin/2019-06-14T111751354Z.png', '/uploads/izin/2019-06-14T111751362Z.png', '/uploads/izin/2019-06-14T111751391Z.png', 'Sirkus', 'sad', '2019-06-14', '2019-06-14', '18:17:00', '18:17:00', '2019-06-14 18:17:57', 'Ditolak', 'lokasi tidak jelas');

-- --------------------------------------------------------

--
-- Table structure for table `jawaban`
--

CREATE TABLE `jawaban` (
  `id_jawaban` int(11) NOT NULL,
  `id_pertanyaan_jawaban` int(11) NOT NULL,
  `jawaban` text NOT NULL,
  `kode_jawaban` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jawaban`
--

INSERT INTO `jawaban` (`id_jawaban`, `id_pertanyaan_jawaban`, `jawaban`, `kode_jawaban`) VALUES
(5, 2, 'Tidak mudah', 'A'),
(6, 2, 'Kurang mudah', 'B'),
(7, 2, 'Mudah ', 'C'),
(8, 2, 'Sangat mudah', 'D'),
(9, 3, 'Tidak cepat', 'A'),
(10, 3, 'Kurang cepat', 'B'),
(11, 3, 'Cepat', 'C'),
(12, 3, 'Sangat cepat', 'D'),
(13, 4, 'Sangat mahal', 'A'),
(14, 4, 'Cukup mahal', 'B'),
(15, 4, 'Murah', 'C'),
(16, 4, 'Gratis', 'D'),
(21, 20, 'Tidak kompeten', 'A'),
(22, 20, 'Kurang kompeten', 'B'),
(23, 20, 'Kompeten', 'C'),
(24, 20, 'Sangat kompeten', 'D'),
(25, 21, 'Tidak sopan dan ramah', 'A'),
(26, 21, 'Kurang sopan dan ramah', 'B'),
(27, 21, 'Sopan dan ramah', 'C'),
(28, 21, 'Sangat sopan dan ramah', 'D'),
(49, 27, 'Tidak ada', 'A'),
(50, 27, 'Ada tapi tidak berfungsi', 'B'),
(51, 27, 'Berfungsi tapi kurang baik', 'C'),
(52, 27, 'dikelola dengan baik', 'D'),
(53, 28, 'Buruk', 'A'),
(54, 28, 'Cukup', 'B'),
(55, 28, 'Sangat Baik', 'C'),
(56, 28, 'Baik', 'D'),
(341, 124, 'Sesuai', 'A'),
(342, 124, 'Kurang sesuai', 'B'),
(343, 124, 'Tidak sesuai', 'C'),
(344, 124, 'Sangat sesuai', 'D'),
(345, 125, 'a', 'A'),
(346, 125, 'aaa', 'B'),
(347, 125, 'aaaa', 'C'),
(348, 125, 'aaa', 'D'),
(349, 126, 'A', 'A'),
(350, 126, 'B', 'B'),
(351, 126, 'C', 'C'),
(352, 126, 'D', 'D'),
(361, 133, 'a', 'A'),
(362, 133, 'b', 'B'),
(363, 133, 'c', 'C'),
(364, 133, 'd', 'D'),
(365, 134, 'a', 'A'),
(366, 134, 'b', 'B'),
(367, 134, 'c', 'C'),
(368, 134, 'd', 'D'),
(369, 135, 'a', 'A'),
(370, 135, 'b', 'B'),
(371, 135, 'c', 'C'),
(372, 135, 'deeeee', 'D'),
(377, 137, 'aa', 'A'),
(378, 137, 'bb', 'B'),
(379, 137, 'dd', 'D'),
(380, 137, 'cc', 'C'),
(385, 139, 'aaa', 'A'),
(386, 139, 'cc', 'C'),
(387, 139, 'bbb', 'B'),
(388, 139, 'dddddd', 'D'),
(429, 150, 'sdf', 'C'),
(430, 150, 'sdf', 'D'),
(431, 150, 'ds', 'A'),
(432, 150, 'ds', 'B'),
(433, 151, 'd', 'A'),
(434, 151, 'df', 'B'),
(435, 151, 'df', 'C'),
(436, 151, 'df', 'D'),
(457, 157, 'd', 'A'),
(458, 157, 'dsf', 'B'),
(459, 157, 'd', 'C'),
(460, 157, 'd', 'D'),
(461, 158, 'df', 'C'),
(462, 158, 're', 'B'),
(463, 158, '2', 'A'),
(464, 158, 'fd', 'D'),
(465, 159, 'sddf', 'A'),
(466, 159, 'dsf', 'B'),
(467, 159, 'sd', 'C'),
(468, 159, 'dsf', 'D'),
(469, 160, 'sdf', 'B'),
(470, 160, 'sd', 'A'),
(471, 160, 'sdf', 'C'),
(472, 160, 'dsf', 'D'),
(489, 165, 'gh', 'A'),
(490, 165, 'xd', 'C'),
(491, 165, 'gc', 'B'),
(492, 165, 'rd', 'D'),
(493, 166, 'jfj', 'A'),
(494, 166, 'fg', 'C'),
(495, 166, 'th', 'B'),
(496, 166, 'dh', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_survey`
--

CREATE TABLE `jawaban_survey` (
  `id_jawaban_survey` int(11) NOT NULL,
  `id_pertanyaan_survey_jawaban` int(11) NOT NULL,
  `jawaban_survey` text NOT NULL,
  `kode_jawaban` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jawaban_survey`
--

INSERT INTO `jawaban_survey` (`id_jawaban_survey`, `id_pertanyaan_survey_jawaban`, `jawaban_survey`, `kode_jawaban`) VALUES
(5, 2, 'Tidak mudah', 'A'),
(6, 2, 'Kurang mudah', 'B'),
(7, 2, 'Mudah ', 'C'),
(8, 2, 'Sangat mudah', 'D'),
(9, 3, 'Tidak cepat', 'A'),
(10, 3, 'Kurang cepat', 'B'),
(11, 3, 'Cepat', 'C'),
(12, 3, 'Sangat cepat', 'D'),
(13, 4, 'Sangat mahal', 'A'),
(14, 4, 'Cukup mahal', 'B'),
(15, 4, 'Murah', 'C'),
(16, 4, 'Gratis', 'D'),
(21, 20, 'Tidak kompeten', 'A'),
(22, 20, 'Kurang kompeten', 'B'),
(23, 20, 'Kompeten', 'C'),
(24, 20, 'Sangat kompeten', 'D'),
(25, 21, 'Tidak sopan dan ramah', 'A'),
(26, 21, 'Kurang sopan dan ramah', 'B'),
(27, 21, 'Sopan dan ramah', 'C'),
(28, 21, 'Sangat sopan dan ramah', 'D'),
(49, 27, 'Tidak ada', 'A'),
(50, 27, 'Ada tapi tidak berfungsi', 'B'),
(51, 27, 'Berfungsi tapi kurang baik', 'C'),
(52, 27, 'dikelola dengan baik', 'D'),
(53, 28, 'Buruk', 'A'),
(54, 28, 'Cukup', 'B'),
(55, 28, 'Sangat Baik', 'C'),
(56, 28, 'Baik', 'D'),
(341, 124, 'Sesuai', 'A'),
(342, 124, 'Kurang sesuai', 'B'),
(343, 124, 'Tidak sesuai', 'C'),
(344, 124, 'Sangat sesuai', 'D');

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
(5, 37, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmo', '2019-05-25 11:10:40'),
(8, 67, 29, 'ngeriiii', '2019-06-02 16:56:06'),
(9, 67, 29, 'iyo ta gak?', '2019-06-02 16:56:52'),
(11, 67, 20, 'Iyo sam hp mantul iku', '2019-06-02 16:59:32'),
(21, 67, 20, 'Wadidaw', '2019-06-02 20:05:30'),
(22, 67, 29, 'sek sam error terus e piye', '2019-06-02 22:13:47'),
(23, 67, 20, 'Oyi sam', '2019-06-02 22:14:08'),
(24, 66, 29, 'mantul sam', '2019-06-03 11:40:00'),
(25, 67, 29, 'wes kenek a sam? he sam', '2019-06-03 12:00:53'),
(27, 67, 20, 'Wes sam, lancar jaya', '2019-06-03 13:19:02'),
(28, 67, 29, 'alhamdulillah', '2019-06-03 14:05:36'),
(29, 67, 20, 'Suwun sam', '2019-06-03 14:11:12'),
(31, 67, 29, 'podo podo sam', '2019-06-03 15:23:40'),
(33, 67, 20, 'Oyisam', '2019-06-03 15:57:28'),
(37, 66, 26, 'Sam', '2019-06-03 21:56:08'),
(38, 67, 26, 'Ono opo iki rek? ', '2019-06-03 21:56:51'),
(42, 67, 26, 'Halo', '2019-06-03 22:00:22'),
(43, 64, 29, 'halo', '2019-06-03 22:03:43'),
(44, 65, 29, 'tes', '2019-06-03 22:29:21'),
(45, 69, 20, 'Lokasi dimana? ', '2019-06-10 14:53:31'),
(46, 69, 29, 'Seberang sungai dinoyo', '2019-06-10 14:56:47');

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
(3, 29, 'Netral', 'harusnya kurang', '2019-05-29 13:46:50'),
(4, 20, 'Puas', 'Yxgkuy', '2019-05-31 18:05:32');

-- --------------------------------------------------------

--
-- Table structure for table `lapor`
--

CREATE TABLE `lapor` (
  `id_lapor` int(11) NOT NULL,
  `kode_lapor` varchar(255) NOT NULL,
  `id_user_lapor` int(11) NOT NULL,
  `kat_lapor` varchar(255) NOT NULL,
  `foto_lapor` varchar(150) NOT NULL,
  `desk_lapor` text NOT NULL,
  `lat_lapor` double NOT NULL,
  `long_lapor` double NOT NULL,
  `lokasi_lapor` varchar(255) NOT NULL,
  `lokasi_kec_lapor` varchar(255) NOT NULL,
  `tgl_lapor` datetime NOT NULL,
  `status_lapor` varchar(255) NOT NULL,
  `pesan_tolak_lapor` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lapor`
--

INSERT INTO `lapor` (`id_lapor`, `kode_lapor`, `id_user_lapor`, `kat_lapor`, `foto_lapor`, `desk_lapor`, `lat_lapor`, `long_lapor`, `lokasi_lapor`, `lokasi_kec_lapor`, `tgl_lapor`, `status_lapor`, `pesan_tolak_lapor`) VALUES
(3, 'LAPOR-0003', 1, 'Infrastruktur', '/uploads/lapor/2019-05-20T180209536Z.jpeg', 'waw3', -7.486465453888889, 112.43383026111111, 'Jl. Karimun Jawa, Mojokerto Kota 61321, Indonesia', '0', '2019-05-21 01:02:09', '', NULL),
(4, 'LPR-0001', 1, 'Lalu Lintas', '/uploads/lapor/2019-05-21T160406395Z.jpeg', 'asd', -7.968372821666667, 112.61672973611111, 'Jalan Bondowoso Dalam, Malang Kota 65115, Indonesia', '0', '2019-05-21 23:04:06', 'Menunggu', NULL),
(5, 'LPR-0002', 1, 'Lalu Lintas', '/uploads/lapor/2019-05-21T160452129Z.jpeg', 'sadasd', -7.968372821666667, 112.61672973611111, 'Jalan Bondowoso Dalam, Malang Kota 65115, Indonesia', '0', '2019-05-21 23:04:52', 'Menunggu', NULL),
(6, 'LPR-0003', 1, 'Lalu Lintas', '/uploads/lapor/2019-05-21T160606893Z.jpeg', 'asddsfgds', -7.486465453888889, 112.43383026111111, 'Jl. Karimun Jawa, Mojokerto Kota 61321, Indonesia', '0', '2019-05-21 23:06:06', 'Menunggu', NULL),
(7, 'LPR-0004', 1, 'Lalu Lintas', '/uploads/lapor/2019-05-21T160637186Z.jpeg', 'asd', -7.968372821666667, 112.61672973611111, 'Jalan Bondowoso Dalam, Malang Kota 65115, Indonesia', '0', '2019-05-21 23:06:37', 'Menunggu', NULL),
(8, 'LPR-0005', 1, 'Lalu Lintas', '/uploads/lapor/2019-05-21T160659437Z.jpeg', 'SDF', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-21 23:06:59', 'Menunggu', NULL),
(9, 'LPR-0006', 1, 'Pengendalian Operasi', '/uploads/lapor/2019-05-21T160907819Z.jpeg', 'saddf', 35.74092255361183, 139.2403295546325, 'Japan, Japan', '0', '2019-05-21 23:09:07', 'Menunggu', NULL),
(10, 'LPR-0007', 1, 'Pengendalian Operasi', '/uploads/lapor/2019-05-21T161146777Z.jpeg', 'sda', 35.74092255361183, 139.2403295546325, 'Japan, Japan', '0', '2019-05-21 23:11:46', 'Menunggu', NULL),
(11, 'LPR-0008', 1, 'Angkutan Umum', '/uploads/lapor/2019-05-21T161730280Z.jpeg', 'asdd', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-21 23:17:30', 'Menunggu', NULL),
(12, 'LPR-0009', 1, 'Angkutan Umum', '/uploads/lapor/2019-05-21T162555213Z.jpeg', 'sadasd', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-21 23:25:55', 'Menunggu', NULL),
(13, 'LPR-0010', 1, 'Lalu Lintas', '/uploads/lapor/2019-05-21T162756209Z.jpeg', 'j', -7.968372821666667, 112.61672973611111, 'Jalan Bondowoso Dalam, Malang Kota 65115, Indonesia', '0', '2019-05-21 23:27:56', 'Menunggu', NULL),
(14, 'LPR-0011', 1, 'Angkutan Umum', '/uploads/lapor/2019-05-22T051936396Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-22 12:19:36', 'Menunggu', NULL),
(15, 'LPR-0012', 1, 'Angkutan Umum', '/uploads/lapor/2019-05-22T052051559Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-22 12:20:51', 'Menunggu', NULL),
(16, 'LPR-0013', 1, 'Angkutan Umum', '/uploads/lapor/2019-05-22T052307022Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-22 12:23:07', 'Menunggu', NULL),
(17, 'LPR-0014', 1, 'Angkutan Umum', '/uploads/lapor/2019-05-22T052351541Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-22 12:23:51', 'Menunggu', NULL),
(18, 'LPR-0015', 1, 'Angkutan Umum', '/uploads/lapor/2019-05-22T052558587Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-22 12:25:58', 'Menunggu', NULL),
(19, 'LPR-0016', 1, 'Angkutan Umum', '/uploads/lapor/2019-05-22T052700089Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-22 12:27:00', 'Menunggu', NULL),
(20, 'LPR-0017', 1, 'Angkutan Umum', '/uploads/lapor/2019-05-22T052743289Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-22 12:27:43', 'Menunggu', NULL),
(21, 'LPR-0018', 1, 'Angkutan Umum', '/uploads/lapor/2019-05-22T052916517Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-22 12:29:16', 'Menunggu', NULL),
(22, 'LPR-0019', 1, 'Angkutan Umum', '/uploads/lapor/2019-05-22T053021548Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-22 12:30:21', 'Menunggu', NULL),
(23, 'LPR-0020', 1, 'Angkutan Umum', '/uploads/lapor/2019-05-22T053445152Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-22 12:34:45', 'Menunggu', NULL),
(24, 'LPR-0021', 1, 'Angkutan Umum', '/uploads/lapor/2019-05-22T053457620Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-22 12:34:57', 'Menunggu', NULL),
(25, 'LPR-0022', 1, 'Angkutan Umum', '/uploads/lapor/2019-05-22T053800579Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-22 12:38:00', 'Menunggu', NULL),
(26, 'LPR-0023', 1, 'Angkutan Umum', '/uploads/lapor/2019-05-22T054457741Z.jpeg', 'waw', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-22 12:44:58', 'Menunggu', NULL),
(27, 'LPR-0024', 1, 'Lalu Lintas', '/uploads/lapor/2019-05-22T070318463Z.jpeg', 'asdads', -7.962206840277778, 112.61051940916666, 'Jalan Bendungan Nawangan, Malang Kota 65145, Indonesia', '0', '2019-05-22 14:03:18', 'Menunggu', NULL),
(28, 'LPR-0025', 1, 'Pengendalian Operasi', '/uploads/lapor/2019-05-22T070507623Z.jpeg', 'sad', 35.74092255361183, 139.2403295546325, 'Japan, Japan', '0', '2019-05-22 14:05:08', 'Menunggu', NULL),
(29, 'LPR-0026', 1, 'Pengendalian Operasi', '/uploads/lapor/2019-05-22T070640136Z.jpeg', 'sad', -7.968372821666667, 112.61672973611111, 'Jalan Bondowoso Dalam, Malang Kota 65115, Indonesia', '0', '2019-05-22 14:06:40', 'Menunggu', NULL),
(30, 'LPR-0027', 1, 'Pengendalian Operasi', '/uploads/lapor/2019-05-22T071126547Z.jpeg', 'sad', -7.968372821666667, 112.61672973611111, 'Jalan Bondowoso Dalam, Malang Kota 65115, Indonesia', '0', '2019-05-22 14:11:26', 'Menunggu', NULL),
(31, 'LPR-0028', 1, 'Pengendalian Operasi', '/uploads/lapor/2019-05-22T071309983Z.jpeg', 'sad', -7.968372821666667, 112.61672973611111, 'Jalan Bondowoso Dalam, Malang Kota 65115, Indonesia', '0', '2019-05-22 14:13:10', 'Menunggu', NULL),
(32, 'LPR-0029', 1, 'Lalu Lintas', '/uploads/lapor/2019-05-22T071404877Z.jpeg', 'sda', 37.906995676610464, 139.03450559106886, '116, Japan, Japan', '0', '2019-05-22 14:14:04', 'Menunggu', NULL),
(33, 'LPR-0030', 1, 'Lalu Lintas', '/uploads/lapor/2019-05-22T071440263Z.jpeg', 'sad', -7.962206840277778, 112.61051940916666, 'Jalan Bendungan Nawangan, Malang Kota 65145, Indonesia', '0', '2019-05-22 14:14:40', 'Menunggu', NULL),
(34, 'LPR-0031', 1, 'Lalu Lintas', '/uploads/lapor/2019-05-22T071545776Z.jpeg', 'asd', -7.486465453888889, 112.43383026111111, 'Jl. Karimun Jawa, Mojokerto Kota 61321, Indonesia', '0', '2019-05-22 14:15:46', 'Menunggu', NULL),
(35, 'LPR-0032', 26, 'Lalu Lintas', '/uploads/lapor/2019-05-22T075619847Z.jpeg', 'testing tenan', -7.962206840277778, 112.61051940916666, 'Jalan Bendungan Nawangan, Malang Kota 65145, Indonesia', '0', '2019-05-22 14:56:20', 'Proses', NULL),
(36, 'LPR-0033', 26, 'Infrastruktur', '/uploads/lapor/2019-05-24T030714727Z.jpeg', 'banjir bro', -7.7055320738888895, 113.47743225083333, 'Probolinggo Kabupaten 67291, Indonesia', '0', '2019-05-24 10:07:15', 'Menunggu', NULL),
(37, 'LPR-0034', 26, 'Perparkiran', '/uploads/lapor/2019-05-24T040819604Z.jpeg', 'banjir maneh broo', -7.704733848333333, 113.47746276833334, 'Probolinggo Kabupaten 67291, Indonesia', '0', '2019-05-24 11:08:20', 'Menunggu', NULL),
(38, 'LPR-0035', 26, 'Infrastruktur', '/uploads/lapor/2019-05-25T205329555Z.jpeg', 'Pc mantul', -7.962206363611111, 112.61051940916666, 'Jalan Bendungan Nawangan, Malang Kota 65145, Indonesia', '0', '2019-05-26 03:53:31', 'Menunggu', NULL),
(39, 'LPR-0036', 26, 'Infrastruktur', '/uploads/lapor/2019-05-26T091932713Z.jpeg', 'Sampaaah', -7.9600157736111115, 112.60550689694443, 'Jalan Bendungan Sigura Gura Barat, Malang Kota 65146, Indonesia', '0', '2019-05-26 16:19:34', 'Menunggu', NULL),
(41, 'LPR-0037', 28, 'Infrastruktur', '/uploads/lapor/2019-05-27T083529795Z.jpeg', 'pantai kotoooorrr', -7.7039432525, 113.47815704333334, 'Probolinggo Kabupaten 67291, Indonesia', '0', '2019-05-27 15:35:30', 'Menunggu', NULL),
(44, 'LPR-0038', 28, 'Lalu Lintas', '/uploads/lapor/2019-05-27T092444134Z.jpeg', 'waaaaaaannnnjjjjiiiinngggggg', -7.704733848333333, 113.47746276833334, 'Probolinggo Kabupaten 67291, Indonesia', '0', '2019-05-27 16:24:44', 'Menunggu', NULL),
(45, 'LPR-0039', 29, 'Lalu Lintas', '/uploads/lapor/2019-05-29T162109447Z.jpeg', 'tes', -7.704733848333333, 113.47746276833334, 'Probolinggo Kabupaten 67291, Indonesia', '0', '2019-05-29 23:21:09', 'Menunggu', NULL),
(46, 'LPR-0040', 29, 'Angkutan Umum', '/uploads/lapor/2019-05-29T162244453Z.png', 'sdsad', -7.4856785531497945, 112.43030548095705, 'Jalan Pekayon, Mojokerto Kabupaten 61361, Indonesia', '0', '2019-05-29 23:22:44', 'Menunggu', NULL),
(47, 'LPR-0041', 29, 'Pengendalian Operasi', '/', 'sad', 35.74092255361183, 139.2403295546325, 'Japan, Japan', '0', '2019-05-29 23:29:33', 'Menunggu', NULL),
(48, 'LPR-0042', 29, 'Layanan', '/uploads/lapor/2019-05-29T163322716Z.png', 'asd', -7.486189148006921, 112.43768692016603, 'Mojokerto Kabupaten 61363, Indonesia', '0', '2019-05-29 23:33:22', 'Menunggu', NULL),
(49, 'LPR-0043', 29, 'Pengendalian Operasi', '/uploads/lapor/2019-05-29T163402368Z.jpeg', 'asdasd', -7.486465453888889, 112.43383026111111, 'Jl. Karimun Jawa, Mojokerto Kota 61321, Indonesia', '0', '2019-05-29 23:34:02', 'Menunggu', NULL),
(50, 'LPR-0044', 29, 'Infrastruktur', '/uploads/lapor/2019-05-29T163705358Z.jpeg', 'asdsad', -7.485197210575539, 112.4143409729004, 'Mojokerto Kota 61328, Indonesia', '0', '2019-05-29 23:37:05', 'Menunggu', NULL),
(51, 'LPR-0045', 29, 'Infrastruktur', '/uploads/lapor/2019-05-29T163936640Z.jpeg', 'sadasdd', 35.74092255361183, 139.2403295546325, 'Japan, Japan', '0', '2019-05-29 23:39:36', 'Menunggu', NULL),
(52, 'LPR-0046', 29, 'Lalu Lintas', '/uploads/lapor/2019-05-29T164527489Z.jpeg', 'hbj', 35.74092255361183, 139.2403295546325, 'Japan, Japan', '0', '2019-05-29 23:45:27', 'Menunggu', NULL),
(53, 'LPR-0047', 29, 'Lalu Lintas', '/uploads/lapor/2019-05-29T164828067Z.jpeg', 'fgdfg', 35.74092255361183, 139.2403295546325, 'Japan, Japan', '0', '2019-05-29 23:48:28', 'Menunggu', NULL),
(54, 'LPR-0048', 29, 'Infrastruktur', '/', 'gfhfg', -7.489622351022603, 112.44558334350587, 'Mojokerto Kabupaten 61363, Indonesia', '0', '2019-05-29 23:51:32', 'Menunggu', NULL),
(55, 'LPR-0049', 29, 'Infrastruktur', '/', 'rtytry', -7.704733848333333, 113.47746276833334, 'Probolinggo Kabupaten 67291, Indonesia', '0', '2019-05-29 23:52:51', 'Menunggu', NULL),
(56, 'LPR-0050', 29, 'Perparkiran', '/', 't', 35.74092255361183, 139.2403295546325, 'Japan, Japan', '0', '2019-05-30 00:03:33', 'Menunggu', NULL),
(57, 'LPR-0051', 29, 'Angkutan Umum', '/', 'g', -7.487920379243461, 112.43717193603517, 'Mojokerto Kabupaten 61361, Indonesia', '0', '2019-05-30 00:04:34', 'Menunggu', NULL),
(58, 'LPR-0052', 29, 'Infrastruktur', '/', 'k', -7.485878004337021, 112.43202209472658, 'Jalan Bawean, Mojokerto Kota 61321, Indonesia', '0', '2019-05-30 00:07:39', 'Menunggu', NULL),
(59, 'LPR-0053', 29, 'Infrastruktur', '/uploads/lapor/2019-05-29T172138081Z.jpeg', 'hgj', -7.9543209075000005, 112.61422729472221, 'Jalan Kampus Universitas Brawijaya, Malang Kota 65145, Indonesia', '0', '2019-05-30 00:21:38', 'Menunggu', NULL),
(60, 'LPR-0054', 20, 'Layanan', '/uploads/lapor/2019-05-31T060954543Z.jpeg', 'Tes', -7.486884593888889, 112.43370819083334, 'Mojokerto Kota 61321, Indonesia', '0', '2019-05-31 13:09:55', 'Menunggu', NULL),
(61, 'LPR-0055', 20, 'Infrastruktur', '/uploads/lapor/2019-05-31T062656657Z.jpeg', 'Hehe', -7.476630463210514, 112.43167877197267, 'Jalan Majapahit, Mojokerto Kota 61322, Indonesia', '0', '2019-05-31 13:10:47', 'Menunggu', NULL),
(62, 'LPR-0056', 26, 'Lalu Lintas', '/uploads/lapor/2019-05-31T062656657Z.jpeg', 'sad', -7.962209166666667, 112.61053466666667, 'Jalan Bendungan Nawangan, Malang Kota 65145, Indonesia', '0', '2019-05-31 13:26:56', 'Menunggu', NULL),
(63, 'LPR-0057', 29, 'Infrastruktur', '', 'hehe', -7.4847717139348635, 112.4273443222046, 'Jalan Raya R. A. Basuni, Mojokerto Kabupaten 61361, Indonesia', '0', '2019-05-31 15:17:59', 'Ditolak', 'tidak ada foto'),
(64, 'LPR-0058', 29, 'Pengendalian Operasi', '/uploads/lapor/2019-05-31T090423810Z.jpeg', 'asdsads', -7.458645425790822, 112.46000289916994, 'Jalan Raya Surabaya, Mojokerto Kota 61316, Indonesia', '0', '2019-05-31 16:04:24', 'Menunggu', NULL),
(65, 'LPR-0059', 29, 'Layanan', '/uploads/lapor/2019-05-31T090752296Z.jpeg', 'sdasad', -7.962209166666667, 112.61053466666667, 'Jalan Bendungan Nawangan, Malang Kota 65145, Indonesia', '0', '2019-05-31 16:07:53', 'Ditolak', 'deskripsi tidak jelas'),
(66, 'LPR-0060', 29, 'Layanan', '/uploads/lapor/2019-05-31T091032023Z.jpeg', 'adsdd', -7.481623025892601, 112.4359703063965, 'Jalan Raden Wijaya, Mojokerto Kota 61321, Indonesia', '0', '2019-05-31 16:10:32', 'Ditolak', 'deskripsi tidak jelas'),
(67, 'LPR-0061', 29, 'Lalu Lintas', '/uploads/lapor/2019-05-31T091202222Z.jpeg', 'Honor 8X', -7.487069390861869, 112.44009017944337, 'Jalan Jaya Negara, Mojokerto Kabupaten 61363, Indonesia', '0', '2019-05-31 16:12:02', 'Menunggu', NULL),
(68, 'LPR-0062', 29, 'Perparkiran', '/uploads/lapor/2019-06-10T074857524Z.jpeg', 'Simpus', -7.486882686388889, 112.43369293194445, 'Mojokerto Kabupaten 61361, Indonesia', '0', '2019-06-10 14:48:58', 'Menunggu', NULL),
(69, 'LPR-0063', 29, 'Infrastruktur', '/uploads/lapor/2019-06-10T074955208Z.jpeg', 'Tes', -7.9600157736111115, 112.60550689694443, 'Jalan Bendungan Sigura Gura Barat, Malang Kota 65146, Indonesia', '0', '2019-06-10 14:49:56', 'Selesai', NULL),
(70, 'LPR-0064', 26, 'Angkutan Umum', '/uploads/lapor/2019-06-15T105627361Z.jpeg', 'Test distrik', -7.44451784732906, 112.43173599024888, 'Mojokerto Kabupaten 61351, Indonesia', 'Gedek', '2019-06-15 17:56:27', 'Menunggu', NULL),
(71, 'LPR-0065', 26, 'Layanan', '/uploads/lapor/2019-06-15T105719924Z.jpeg', 'Kopine larang lur', -7.474758238132547, 112.43013381958008, 'Kedung Kwali Gang 7, Mojokerto Kota 61322, Indonesia', 'Prajurit Kulon', '2019-06-15 17:57:21', 'Menunggu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notifikasi` int(11) NOT NULL,
  `id_user_notifikasi` int(11) NOT NULL,
  `id_user_notifikator` int(11) NOT NULL,
  `id_lapor_notifikasi` int(11) DEFAULT NULL,
  `tipe_notifikasi` varchar(255) NOT NULL,
  `desk_notifikasi` text NOT NULL,
  `tgl_notifikasi` datetime NOT NULL,
  `status_notifikasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id_notifikasi`, `id_user_notifikasi`, `id_user_notifikator`, `id_lapor_notifikasi`, `tipe_notifikasi`, `desk_notifikasi`, `tgl_notifikasi`, `status_notifikasi`) VALUES
(6, 29, 26, 66, 'Komentar', 'Anda mendapat komentar baru pada laporan LPR-0060', '2019-06-03 21:56:08', 'Aktif'),
(7, 29, 26, 67, 'Komentar', 'Anda mendapat komentar baru pada laporan LPR-0061', '2019-06-03 21:56:51', 'Aktif'),
(12, 29, 26, 67, 'Komentar', 'Anda mendapat komentar baru pada laporan LPR-0061', '2019-06-03 22:00:22', 'Aktif'),
(19, 29, 20, 67, 'Komentar', 'Anda mendapat komentar baru pada laporan LPR-0061', '2019-06-03 22:41:31', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan`
--

CREATE TABLE `pertanyaan` (
  `id_pertanyaan` int(11) NOT NULL,
  `pertanyaan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pertanyaan`
--

INSERT INTO `pertanyaan` (`id_pertanyaan`, `pertanyaan`) VALUES
(2, 'Bagaimana pemahaman Saudara tentang kemudahan prosedur pelayanan di unit ini?'),
(3, 'Bagaimana pendapat Saudara tentang kecepatan waktu dalam memberikan pelayanan?'),
(4, 'Bagaimana pendapat Saudara tentang kewajaran biaya/tarif dalam pelayanan?'),
(20, 'Bagaimana pendapat Saudara tentang kompetensi/kemampuan petugas dalam pelayanan?'),
(21, 'Bagaimana pendapat Saudara perilaku petugas dalam pelayanan terkait kesopanan dan keramahan?'),
(27, 'Bagaimana pendapat Saudara tentang penanganan pengaduan, saran dan masukan?'),
(28, 'Bagaimana pendapat Saudara tentang kualitas sarana dan prasarana?'),
(124, 'Bagaimana pendapat Saudara tentang kesesuaian persyaratan pelayanan dengan jenis pelayanannya?'),
(125, 'aaaaa'),
(126, 'soal'),
(133, 'tes1'),
(134, 'tes2'),
(135, 'tes3'),
(137, 'tes4'),
(139, 'tes5'),
(150, 'tes6'),
(151, 'tes7'),
(157, 'tes8'),
(158, 'tes9'),
(159, 'tes9'),
(160, 'tes10'),
(165, 'tes11'),
(166, 'tes12');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan_survey`
--

CREATE TABLE `pertanyaan_survey` (
  `id_pertanyaan_survey` int(11) NOT NULL,
  `pertanyaan_survey` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pertanyaan_survey`
--

INSERT INTO `pertanyaan_survey` (`id_pertanyaan_survey`, `pertanyaan_survey`) VALUES
(2, 'Bagaimana pemahaman Saudara tentang kemudahan prosedur pelayanan di unit ini?'),
(3, 'Bagaimana pendapat Saudara tentang kecepatan waktu dalam memberikan pelayanan?'),
(4, 'Bagaimana pendapat Saudara tentang kewajaran biaya/tarif dalam pelayanan?'),
(20, 'Bagaimana pendapat Saudara tentang kompetensi/kemampuan petugas dalam pelayanan?'),
(21, 'Bagaimana pendapat Saudara perilaku petugas dalam pelayanan terkait kesopanan dan keramahan?'),
(27, 'Bagaimana pendapat Saudara tentang penanganan pengaduan, saran dan masukan?'),
(28, 'Bagaimana pendapat Saudara tentang kualitas sarana dan prasarana?'),
(124, 'Bagaimana pendapat Saudara tentang kesesuaian persyaratan pelayanan dengan jenis pelayanannya?');

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE `survey` (
  `id_survey` int(11) NOT NULL,
  `id_user_survey` int(11) NOT NULL,
  `id_pertanyaan_survey` int(11) NOT NULL,
  `id_jawaban_survey` int(11) NOT NULL,
  `tgl_survey` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` (`id_survey`, `id_user_survey`, `id_pertanyaan_survey`, `id_jawaban_survey`, `tgl_survey`) VALUES
(1, 20, 2, 6, '2019-06-14 21:23:29'),
(2, 20, 3, 9, '2019-06-14 21:23:29'),
(3, 20, 28, 55, '2019-06-14 21:23:29'),
(4, 20, 124, 344, '2019-06-14 21:23:29'),
(5, 20, 4, 13, '2019-06-14 21:23:29'),
(6, 20, 27, 52, '2019-06-14 21:23:29'),
(7, 20, 21, 27, '2019-06-14 21:23:29'),
(8, 20, 20, 23, '2019-06-14 21:23:29'),
(9, 26, 2, 5, '2019-06-14 21:30:14'),
(10, 26, 3, 10, '2019-06-14 21:30:14'),
(11, 26, 4, 13, '2019-06-14 21:30:14'),
(12, 26, 20, 22, '2019-06-14 21:30:14'),
(13, 26, 21, 25, '2019-06-14 21:30:14'),
(14, 26, 27, 50, '2019-06-14 21:30:14'),
(15, 26, 28, 54, '2019-06-14 21:30:14'),
(16, 26, 124, 342, '2019-06-14 21:30:14');

-- --------------------------------------------------------

--
-- Table structure for table `trayek`
--

CREATE TABLE `trayek` (
  `id_trayek` int(11) NOT NULL,
  `nama_trayek` varchar(255) NOT NULL,
  `rute_trayek` text NOT NULL,
  `latlng_trayek` text NOT NULL,
  `jarak_trayek` float DEFAULT NULL,
  `status_trayek` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trayek`
--

INSERT INTO `trayek` (`id_trayek`, `nama_trayek`, `rute_trayek`, `latlng_trayek`, `jarak_trayek`, `status_trayek`) VALUES
(1, 'Line A', 'Terminal Kertajaya – Jl. Jaya Negara – Jl. Pahlawan – Jl. Gajah Mada – Jl. Res. Pamuji – Jl. Letkol Sumarjo – Jl. Ahmad Yani – Jl. Alon-alon – Jl. Hayam Wuruk – Jl. Mayjen Sungkono – Jl. Raya Ijen – Jl. Batok – Jl. Penanggungan – Jl. Semeru – Gelora A. Yani – Jl. Murbey – Jl. Durian – Jl. Sawunggaling – Jl. Gajah Mada – Jl. Taman Siswa – Jl. Pahlawan – Jl. Jaya Negara – Terminal Kertajaya. ', '[{\"lat\":-7.452517861857495,\"lng\":112.42996215820314},{\"lat\":-7.478559415715679,\"lng\":112.44249343872072},{\"lat\":-7.500004234888372,\"lng\":112.42292404174806},{\"lat\":-7.500855197998499,\"lng\":112.45262145996095},{\"lat\":-7.431581372043807,\"lng\":112.46412277221681},{\"lat\":-7.431411152586045,\"lng\":112.4388885498047},{\"lat\":-7.442305064839945,\"lng\":112.42893218994142},{\"lat\":-7.449964684914415,\"lng\":112.44506835937501},{\"lat\":-7.4494540477403275,\"lng\":112.42893218994142}]', 17.708, 'Aktif'),
(2, 'Line B', 'Terminal Kertajaya – Jl. Jaya Negara – Jl. R. Wijaya – Jl. RA. Basuni – Jl. KH. Usman – Jl. Surodinawan – Jl. Prajurit Kulon – Jl. Tribuana Tungga Dewi – Jl. Brawijaya – Jl. Hayam Wuruk – Jl. Letkol Sumarjo – Jl. Res. Pamuji – Jl. Gajah Mada – Jl. Pahlawan – Jl. Tropodo – Jl. Meri – Jl. Kuwung – Terminal Kertajaya.', '[{\"lat\":-7.440602908875531,\"lng\":112.44232177734375},{\"lat\":-7.485537607589138,\"lng\":112.44541168212892},{\"lat\":-7.478559415715679,\"lng\":112.42258071899415},{\"lat\":-7.436177272464475,\"lng\":112.42858886718751},{\"lat\":-7.434815529206579,\"lng\":112.45399475097658}]', 14.29, 'Aktif'),
(4, 'tes2', 'tes2brow', '[{\"lat\":-7.477708409072105,\"lng\":112.44575500488283},{\"lat\":-7.472432130858507,\"lng\":112.42670059204103},{\"lat\":-7.455751864620126,\"lng\":112.42824554443361},{\"lat\":-7.444517857718139,\"lng\":112.45090484619142}]', 6.84, 'Aktif');

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
(20, 'nizarrk', 'Candi', '1990-12-12', '1243245435', '/uploads/user/2019-05-19T131658588Z.png', 'niezar.rk@gmail.com', '$2b$10$q2mS4IZKmHqcfURkt0boGeRhsDKO8/LPP4vxBXlkanfZ3S5sgKKvi'),
(21, 'nizarrk yoi', 'Candi23', '1990-12-12', '1243245435', 'uploads\\user\\2019-05-19T131658588Z.png', 'niezar.rk@gmail.comm', '$2b$10$MzCEhJZj/tlnCmRxgBjZ0OX4oZhUgsM.jFinu7OvYhUDK5GyRbTfG'),
(22, 'nizarrk yoi', 'Candi23', '1990-12-12', '1243245435', 'NRK-PCuploads\\user\\2019-05-19T172133218Z.jpeg', 'niezarr.rk@gmail.comm', '$2b$10$c.p3EzOzFV0SxfhKa9er.eVaBK.XRMTSHNeGWjA6fATaFPBL1Vhfi'),
(23, 'nizarrk yoi', 'Candi23', '1990-12-12', '1243245435', 'http://localhost:3000uploads\\user\\2019-05-19T172824463Z.jpeg', 'niezarsr.rk@gmail.comm', '$2b$10$5k/w8UyGP7MGueB3lAqvUeQoBFdMgF3YdY2DA6NhoDJyGLYBjVUxm'),
(24, 'nizarrk yoi', 'Candi23', '1990-12-12', '1243245435', 'http://localhost:3000/uploads\\user\\2019-05-19T173224499Z.jpeg', 'niezarsdsar.rk@gmail.comm', '$2b$10$dOdxpRPRVJcOgus2IOILBe4ky68.acDtJYy.56Gw.Mm1BwLNJxppe'),
(25, 'nizarrk yoi', 'Candi23', '1990-12-12', '1243245435', 'http://localhost:3000/uploads/user/2019-05-19T174742226Z.jpeg', 'niezarswdsar.rk@gmail.comm', '$2b$10$kj4NxFa.fhU/GyDiH5vqgedyRpl/HRtOmEkcVtra3y5uFZKCG/.eC'),
(26, 'Nizar Rahman K', 'Jl. Candi 2A 454 Sukun Malang', '1995-11-05', '081233763055', '/uploads/user/2019-05-22T072126644Z.jpeg', 'nizarkusworo@gmail.com', '$2b$10$RSSbqeuV5UmqzIS5KYXIO.4fch8hcNqvZXKOXhK/r0IkTLeV4di.6'),
(27, 'NRKNRK', 'sadsa', '2014-04-30', '213', '/uploads/user/defaultuser.jpg', 'nrknrk@nrk.com', '$2b$10$kvxEkqg1tUB20horxniMieYm7sV./uLM6iQccVIc85QoykXJLICXe'),
(28, 'NRK Channel', 'Youtube', '2014-04-30', '098776643', '/uploads/user/2019-05-27T081659046Z.png', 'nrk@channel.com', '$2b$10$x5KkXSS.X2w7ehooEaFhOOPzcwRhGRQe5PI7cXDGdGOJeMTzdokKm'),
(29, 'Rahman K', 'Jl. Candi 2A 454 Karang Besuki Sukun', '1990-01-01', '089786466543', '/uploads/user/2019-05-28T130117896Z.jpeg', 'rk@gmail.com', '$2b$10$0O.UJ9cDM..McDczckPQ1eEvqDIfoEc1TQbX4BOLv542aQydxNdym');

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE `vote` (
  `id_vote` int(11) NOT NULL,
  `id_lapor_vote` int(11) NOT NULL,
  `id_user_vote` int(11) NOT NULL,
  `tgl_vote` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vote`
--

INSERT INTO `vote` (`id_vote`, `id_lapor_vote`, `id_user_vote`, `tgl_vote`) VALUES
(1, 67, 26, '2019-06-20 11:28:24'),
(2, 66, 26, '2019-06-12 11:27:21'),
(4, 64, 29, '2019-06-02 13:26:04'),
(21, 63, 29, '2019-06-02 15:01:34'),
(32, 66, 20, '2019-06-02 15:07:29'),
(37, 67, 20, '2019-06-02 16:26:30'),
(42, 67, 29, '2019-06-02 16:33:10'),
(43, 61, 20, '2019-06-03 13:26:19'),
(44, 60, 26, '2019-06-03 21:59:34'),
(45, 69, 20, '2019-06-10 14:53:44'),
(47, 68, 26, '2019-06-18 10:02:59');

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
-- Indexes for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD PRIMARY KEY (`id_jawaban`),
  ADD KEY `id_pertanyaan` (`id_pertanyaan_jawaban`);

--
-- Indexes for table `jawaban_survey`
--
ALTER TABLE `jawaban_survey`
  ADD PRIMARY KEY (`id_jawaban_survey`),
  ADD KEY `id_pertanyaan_survey_jawaban` (`id_pertanyaan_survey_jawaban`);

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
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id_notifikasi`),
  ADD KEY `id_user_notifikasi` (`id_user_notifikasi`),
  ADD KEY `id_user_notifikator` (`id_user_notifikator`),
  ADD KEY `id_lapor_notifikasi` (`id_lapor_notifikasi`);

--
-- Indexes for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD PRIMARY KEY (`id_pertanyaan`);

--
-- Indexes for table `pertanyaan_survey`
--
ALTER TABLE `pertanyaan_survey`
  ADD PRIMARY KEY (`id_pertanyaan_survey`);

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`id_survey`),
  ADD KEY `id_user_survey` (`id_user_survey`),
  ADD KEY `id_pertanyaan_survey` (`id_pertanyaan_survey`),
  ADD KEY `id_jawaban_survey` (`id_jawaban_survey`);

--
-- Indexes for table `trayek`
--
ALTER TABLE `trayek`
  ADD PRIMARY KEY (`id_trayek`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id_vote`),
  ADD KEY `id_lapor_vote` (`id_lapor_vote`),
  ADD KEY `id_user_vote` (`id_user_vote`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `izin`
--
ALTER TABLE `izin`
  MODIFY `id_izin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jawaban`
--
ALTER TABLE `jawaban`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=497;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `kritiksaran`
--
ALTER TABLE `kritiksaran`
  MODIFY `id_kritiksaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lapor`
--
ALTER TABLE `lapor`
  MODIFY `id_lapor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id_notifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  MODIFY `id_pertanyaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `id_survey` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `trayek`
--
ALTER TABLE `trayek`
  MODIFY `id_trayek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `vote`
--
ALTER TABLE `vote`
  MODIFY `id_vote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `izin`
--
ALTER TABLE `izin`
  ADD CONSTRAINT `izin_ibfk_1` FOREIGN KEY (`id_user_izin`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD CONSTRAINT `jawaban_ibfk_1` FOREIGN KEY (`id_pertanyaan_jawaban`) REFERENCES `pertanyaan` (`id_pertanyaan`);

--
-- Constraints for table `jawaban_survey`
--
ALTER TABLE `jawaban_survey`
  ADD CONSTRAINT `jawaban_survey_ibfk_1` FOREIGN KEY (`id_pertanyaan_survey_jawaban`) REFERENCES `pertanyaan_survey` (`id_pertanyaan_survey`);

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
-- Constraints for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `notifikasi_ibfk_1` FOREIGN KEY (`id_user_notifikasi`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `notifikasi_ibfk_2` FOREIGN KEY (`id_lapor_notifikasi`) REFERENCES `lapor` (`id_lapor`);

--
-- Constraints for table `survey`
--
ALTER TABLE `survey`
  ADD CONSTRAINT `survey_ibfk_1` FOREIGN KEY (`id_user_survey`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `survey_ibfk_2` FOREIGN KEY (`id_pertanyaan_survey`) REFERENCES `pertanyaan_survey` (`id_pertanyaan_survey`),
  ADD CONSTRAINT `survey_ibfk_3` FOREIGN KEY (`id_jawaban_survey`) REFERENCES `jawaban_survey` (`id_jawaban_survey`);

--
-- Constraints for table `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `vote_ibfk_1` FOREIGN KEY (`id_user_vote`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `vote_ibfk_2` FOREIGN KEY (`id_lapor_vote`) REFERENCES `lapor` (`id_lapor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
