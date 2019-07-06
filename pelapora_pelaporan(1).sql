-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 06, 2019 at 10:44 AM
-- Server version: 10.1.40-MariaDB-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pelapora_pelaporan`
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
(3, 'Periksa Kendaraan Sebelum Perjalanan Mudik', '/uploads/info/2019-06-10T155108307Z.jpeg', 'Hayoo, siapa di sini yang mau mudik menggunakan mobil pribadi? Nah, #MinHub ingetin supaya periksa kondisi kendaraan sebelum perjalanan panjang. Pastikan mobilmu dalam kondisi layak. Karena, bakal ribet kalau mobilmu rusak di jalan, bisa-bisa menganggu cerita seru lebaran kalian.\r\n\r\nKalau kamu jago soal mesin, bisa deh kamu utak-atik sendiri. Periksa mulai dari ruang mesin, starter mobil, aki, suara mesin, hingga gas buang, usahakan servis di bengkel terpercaya ya.\r\n\r\nYuk, periksa kendaraan kalian biar mudik jadi menyenangkan!', 'test', '2019-06-10 22:51:08', '');

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
(1, 26, 'IZN-0001', '/uploads/izin/2019-07-01T064230210Z.jpeg', '/uploads/izin/2019-07-01T064230213Z.jpeg', '/uploads/izin/2019-07-01T064230215Z.jpeg', 'Road race', 'Jl. Benteng Pancasila', '2019-07-01', '2019-07-01', '15:00:00', '23:00:00', '2019-07-01 13:42:30', 'Menunggu', NULL),
(2, 32, 'IZN-0002', '/uploads/izin/2019-07-02T005211571Z.jpeg', '/uploads/izin/2019-07-02T005211573Z.jpeg', '/uploads/izin/2019-07-02T005211573Z.jpeg', 'Bazaar / Pasar malam dan sejenisnya', 'Jl. Tes', '2019-07-02', '2019-07-02', '07:51:00', '15:51:00', '2019-07-02 07:52:11', 'Menunggu', NULL),
(3, 33, 'IZN-0003', '/uploads/izin/2019-07-02T005709630Z.jpeg', '/uploads/izin/2019-07-02T005709638Z.jpeg', '/uploads/izin/2019-07-02T005709639Z.jpeg', 'Orkes / konser musik dan sejenisnya', 'Jl. Test', '2019-07-02', '2019-07-02', '07:56:00', '15:56:00', '2019-07-02 07:57:09', 'Menunggu', NULL);

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
(5, 2, 'Tidak mudah', '1'),
(6, 2, 'Kurang mudah', '2'),
(7, 2, 'Mudah ', '3'),
(8, 2, 'Sangat mudah', '4'),
(9, 3, 'Tidak cepat', '1'),
(10, 3, 'Kurang cepat', '2'),
(11, 3, 'Cepat', '3'),
(12, 3, 'Sangat cepat', '4'),
(13, 4, 'Sangat mahal', '1'),
(14, 4, 'Cukup mahal', '2'),
(15, 4, 'Murah', '3'),
(16, 4, 'Gratis', '4'),
(21, 20, 'Tidak kompeten', '1'),
(22, 20, 'Kurang kompeten', '2'),
(23, 20, 'Kompeten', '3'),
(24, 20, 'Sangat kompeten', '4'),
(49, 27, 'Tidak ada', '1'),
(50, 27, 'Ada tapi tidak berfungsi', '2'),
(51, 27, 'Berfungsi tapi kurang baik', '3'),
(52, 27, 'dikelola dengan baik', '4'),
(53, 28, 'Buruk', '1'),
(54, 28, 'Cukup', '2'),
(55, 28, 'Baik', '3'),
(56, 28, 'Sangat Baik', '4'),
(341, 124, 'Sesuai', '1'),
(342, 124, 'Kurang sesuai', '2'),
(343, 124, 'Tidak sesuai', '3'),
(344, 124, 'Sangat sesuai', '4');

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
(5, 2, 'Tidak mudah', '1'),
(6, 2, 'Kurang mudah', '2'),
(7, 2, 'Mudah ', '3'),
(8, 2, 'Sangat mudah', '4'),
(9, 3, 'Tidak cepat', '1'),
(10, 3, 'Kurang cepat', '2'),
(11, 3, 'Cepat', '3'),
(12, 3, 'Sangat cepat', '4'),
(13, 4, 'Sangat mahal', '1'),
(14, 4, 'Cukup mahal', '2'),
(15, 4, 'Murah', '3'),
(16, 4, 'Gratis', '4'),
(21, 20, 'Tidak kompeten', '1'),
(22, 20, 'Kurang kompeten', '2'),
(23, 20, 'Kompeten', '3'),
(24, 20, 'Sangat kompeten', '4'),
(25, 21, 'Tidak sopan dan ramah', '1'),
(26, 21, 'Kurang sopan dan ramah', '2'),
(27, 21, 'Sopan dan ramah', '3'),
(28, 21, 'Sangat sopan dan ramah', '4'),
(49, 27, 'Tidak ada', '1'),
(50, 27, 'Ada tapi tidak berfungsi', '2'),
(51, 27, 'Berfungsi tapi kurang baik', '3'),
(52, 27, 'dikelola dengan baik', '4'),
(53, 28, 'Buruk', '1'),
(54, 28, 'Cukup', '2'),
(55, 28, 'Baik', '3'),
(56, 28, 'Sangat Baik', '4'),
(341, 124, 'Sesuai', '1'),
(342, 124, 'Kurang sesuai', '2'),
(343, 124, 'Tidak sesuai', '3'),
(344, 124, 'Sangat sesuai', '4');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int(11) NOT NULL,
  `id_lapor_komentar` int(11) NOT NULL,
  `id_user_komentar` int(11) NOT NULL,
  `desk_komentar` varchar(255) NOT NULL,
  `tgl_komentar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id_komentar`, `id_lapor_komentar`, `id_user_komentar`, `desk_komentar`, `tgl_komentar`) VALUES
(1, 4, 33, 'Test komentar', '2019-07-02 07:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `kritiksaran`
--

CREATE TABLE `kritiksaran` (
  `id_kritiksaran` int(11) NOT NULL,
  `id_user_kritiksaran` int(11) NOT NULL,
  `rate_kritiksaran` varchar(15) NOT NULL,
  `desk_kritiksaran` text NOT NULL,
  `tgl_kritiksaran` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kritiksaran`
--

INSERT INTO `kritiksaran` (`id_kritiksaran`, `id_user_kritiksaran`, `rate_kritiksaran`, `desk_kritiksaran`, `tgl_kritiksaran`) VALUES
(1, 1, 'Puas', 'oyi', '2019-05-29 13:40:54'),
(2, 29, 'Tidak Puas', 'aw', '2019-05-29 13:46:09'),
(3, 29, 'Netral', 'harusnya kurang', '2019-05-29 13:46:50'),
(4, 20, 'Puas', 'Yxgkuy', '2019-05-31 18:05:32'),
(5, 33, 'Puas', 'Puas dengan pelayanan', '2019-07-02 07:57:51');

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
(1, 'LPR-0001', 29, 'Layanan', '/uploads/lapor/2019-06-30T052026397Z.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse egestas et massa id maximus. Integer leo sem, scelerisque et luctus a, mollis quis velit. Nullam maximus porta nisi eget congue. Aliquam efficitur ante non vestibulum rhoncus. ', -7.482332190117735, 112.44626998901369, 'Jalan Lombok, Mojokerto Kabupaten 61364, Indonesia', 'Mojoanyar', '2019-06-30 12:20:26', 'Menunggu', NULL),
(2, 'LPR-0002', 20, 'Pengendalian Operasi', '/uploads/lapor/2019-06-30T054547511Z.jpeg', 'Donec laoreet ultrices massa, in iaculis mauris gravida commodo', -7.485452508360648, 112.42996215820314, 'Jalan Pekayon, Mojokerto Kota 61321, Indonesia', 'Prajurit Kulon', '2019-06-30 12:45:47', 'Menunggu', NULL),
(3, 'LPR-0003', 26, 'Infrastruktur', '/uploads/lapor/2019-06-30T073054599Z.jpeg', 'Nullam molestie erat sit amet augue hendrerit elementum. Mauris placerat diam diam, id suscipit erat ultrices in. Nulla facilisi. Proin blandit finibus ligula, at congue ante maximus sed.', -7.478207669274366, 112.4472999572754, 'Jalan Raya Meri, Mojokerto Kota 61315, Indonesia', 'Magersari', '2019-06-30 14:30:54', 'Menunggu', NULL),
(4, 'LPR-0004', 20, 'Perparkiran', '/uploads/lapor/2019-06-30T074646498Z.jpeg', 'volutpat bibendum lacus. Quisque mollis maximus arcu a porta. Maecenas faucibus dolor laoreet neque suscipit, sit amet convallis enim eleifend. Proin convallis, risus sit amet volutpat commodo, nisl mi vulputate nisl, et egestas lacus elit eget odio.', -7.487715610315916, 112.43511199951173, 'Perumahan Bumi Permai, Mojokerto Kabupaten 61361, Indonesia', 'Sooko', '2019-06-30 14:46:46', 'Selesai', NULL),
(6, 'LPR-0005', 33, 'Infrastruktur', '/uploads/lapor/2019-07-02T005556175Z.jpeg', 'Rambu rusak di jalan xxxx mohon segera ditindak lanjuti', -7.488375125478815, 112.43785858154298, 'Jalan Wijaya Kusuma, Mojokerto Kabupaten 61361, Indonesia', 'Sooko', '2019-07-02 07:55:56', 'Menunggu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notifikasi` int(11) NOT NULL,
  `id_user_notifikasi` int(11) NOT NULL,
  `id_user_notifikator` int(11) NOT NULL,
  `kode_notifikasi` int(11) DEFAULT NULL,
  `tipe_notifikasi` varchar(255) NOT NULL,
  `desk_notifikasi` text NOT NULL,
  `tgl_notifikasi` datetime NOT NULL,
  `status_notifikasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id_notifikasi`, `id_user_notifikasi`, `id_user_notifikator`, `kode_notifikasi`, `tipe_notifikasi`, `desk_notifikasi`, `tgl_notifikasi`, `status_notifikasi`) VALUES
(1, 30, 29, 1, 'Laporan Keluhan', 'Laporan keluhan baru telah masuk', '2019-06-30 12:20:26', 'Tidak Aktif'),
(2, 30, 20, 2, 'Laporan Keluhan', 'Laporan keluhan baru telah masuk', '2019-06-30 12:45:47', 'Aktif'),
(3, 30, 26, 3, 'Laporan Keluhan', 'Laporan keluhan baru telah masuk', '2019-06-30 14:30:54', 'Aktif'),
(4, 30, 20, 4, 'Laporan Keluhan', 'Laporan keluhan baru telah masuk', '2019-06-30 14:46:46', 'Aktif'),
(6, 30, 26, 1, 'Izin Penggunaan Jalan', 'Izin penggunaan jalan baru telah masuk', '2019-07-01 13:42:30', 'Aktif'),
(7, 20, 30, 4, 'Laporan Keluhan', 'Laporan LPR-0004 telah Diproses', '2019-07-01 17:57:27', 'Aktif'),
(8, 20, 30, 4, 'Laporan Keluhan', 'Laporan LPR-0004 telah Selesai', '2019-07-01 20:28:11', 'Aktif'),
(9, 30, 32, 2, 'Izin Penggunaan Jalan', 'Izin penggunaan jalan baru telah masuk', '2019-07-02 07:52:11', 'Aktif'),
(11, 30, 33, 6, 'Laporan Keluhan', 'Laporan keluhan baru telah masuk', '2019-07-02 07:55:56', 'Aktif'),
(12, 30, 33, 3, 'Izin Penggunaan Jalan', 'Izin penggunaan jalan baru telah masuk', '2019-07-02 07:57:09', 'Aktif');

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
(27, 'Bagaimana pendapat Saudara tentang penanganan pengaduan, saran dan masukan?'),
(28, 'Bagaimana pendapat Saudara tentang kualitas sarana dan prasarana?'),
(124, 'Bagaimana pendapat Saudara tentang kesesuaian persyaratan pelayanan dengan jenis pelayanannya?');

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
(16, 26, 124, 342, '2019-06-14 21:30:14'),
(25, 29, 2, 7, '2019-06-23 20:25:47'),
(26, 29, 3, 11, '2019-06-23 20:25:47'),
(27, 29, 4, 15, '2019-06-23 20:25:47'),
(28, 29, 27, 52, '2019-06-23 20:25:47'),
(29, 29, 20, 24, '2019-06-23 20:25:47'),
(30, 29, 21, 28, '2019-06-23 20:25:47'),
(31, 29, 124, 344, '2019-06-23 20:25:47'),
(32, 29, 28, 55, '2019-06-23 20:25:47'),
(33, 33, 3, 12, '2019-07-02 07:57:34'),
(34, 33, 20, 24, '2019-07-02 07:57:34'),
(35, 33, 4, 16, '2019-07-02 07:57:34'),
(36, 33, 27, 52, '2019-07-02 07:57:34'),
(37, 33, 2, 8, '2019-07-02 07:57:34'),
(38, 33, 28, 56, '2019-07-02 07:57:34'),
(39, 33, 21, 28, '2019-07-02 07:57:34'),
(40, 33, 124, 344, '2019-07-02 07:57:34');

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
  `status_trayek` varchar(255) NOT NULL,
  `tgl_trayek` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trayek`
--

INSERT INTO `trayek` (`id_trayek`, `nama_trayek`, `rute_trayek`, `latlng_trayek`, `jarak_trayek`, `status_trayek`, `tgl_trayek`) VALUES
(1, 'Line A', 'Terminal Kertajaya – Jl. Jaya Negara – Jl. Pahlawan – Jl. Gajah Mada – Jl. Res. Pamuji – Jl. Letkol Sumarjo – Jl. Ahmad Yani – Jl. Alon-alon – Jl. Hayam Wuruk – Jl. Mayjen Sungkono – Jl. Raya Ijen – Jl. Batok – Jl. Penanggungan – Jl. Semeru – Gelora A. Yani – Jl. Murbey – Jl. Durian – Jl. Sawunggaling – Jl. Gajah Mada – Jl. Taman Siswa – Jl. Pahlawan – Jl. Jaya Negara – Terminal Kertajaya. ', '[{\"lat\":-7.452517861857495,\"lng\":112.42996215820314},{\"lat\":-7.478559415715679,\"lng\":112.44249343872072},{\"lat\":-7.500004234888372,\"lng\":112.42292404174806},{\"lat\":-7.500855197998499,\"lng\":112.45262145996095},{\"lat\":-7.431581372043807,\"lng\":112.46412277221681},{\"lat\":-7.431411152586045,\"lng\":112.4388885498047},{\"lat\":-7.442305064839945,\"lng\":112.42893218994142},{\"lat\":-7.449964684914415,\"lng\":112.44506835937501},{\"lat\":-7.4494540477403275,\"lng\":112.42893218994142}]', 17.708, 'Aktif', '0000-00-00'),
(2, 'Line B', 'Terminal Kertajaya – Jl. Jaya Negara – Jl. R. Wijaya – Jl. RA. Basuni – Jl. KH. Usman – Jl. Surodinawan – Jl. Prajurit Kulon – Jl. Tribuana Tungga Dewi – Jl. Brawijaya – Jl. Hayam Wuruk – Jl. Letkol Sumarjo – Jl. Res. Pamuji – Jl. Gajah Mada – Jl. Pahlawan – Jl. Tropodo – Jl. Meri – Jl. Kuwung – Terminal Kertajaya.', '[{\"lat\":-7.440602908875531,\"lng\":112.44232177734375},{\"lat\":-7.485537607589138,\"lng\":112.44541168212892},{\"lat\":-7.478559415715679,\"lng\":112.42258071899415},{\"lat\":-7.436177272464475,\"lng\":112.42858886718751},{\"lat\":-7.434815529206579,\"lng\":112.45399475097658}]', 14.29, 'Aktif', '0000-00-00');

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
  `pass_user` varchar(255) NOT NULL,
  `is_admin` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `alamat_user`, `tgl_lahir_user`, `telp_user`, `foto_user`, `email_user`, `pass_user`, `is_admin`) VALUES
(1, 'NRKNRK brooo', 'Candi', '1990-12-12', '1243245435', '/uploads/user/2019-05-19T174742226Z.jpeg', 'nrk2112@nrk.com', 'sjdhkldslfnsdfl', NULL),
(20, 'nizarrk', 'Candi', '1990-12-12', '1243245435', '/uploads/user/2019-05-19T131658588Z.png', 'niezar.rk@gmail.com', '$2b$10$q2mS4IZKmHqcfURkt0boGeRhsDKO8/LPP4vxBXlkanfZ3S5sgKKvi', NULL),
(26, 'Nizar Rahman K', 'Jl. Candi 2A 454 Sukun Malang', '1995-11-05', '081233763055', '/uploads/user/2019-06-23T150716245Z.jpeg', 'nizarkusworo@gmail.com', '$2b$10$RSSbqeuV5UmqzIS5KYXIO.4fch8hcNqvZXKOXhK/r0IkTLeV4di.6', NULL),
(27, 'NRKNRK', 'Malang', '2014-04-30', '213', '/uploads/user/defaultuser.jpg', 'nrknrk@nrk.com', '$2b$10$kvxEkqg1tUB20horxniMieYm7sV./uLM6iQccVIc85QoykXJLICXe', NULL),
(28, 'NRK Channel', 'Youtube', '2014-04-30', '098776643', '/uploads/user/2019-05-27T081659046Z.png', 'nrk@channel.com', '$2b$10$x5KkXSS.X2w7ehooEaFhOOPzcwRhGRQe5PI7cXDGdGOJeMTzdokKm', NULL),
(29, 'Rahman k', 'Jl. Candi 2A 454 Karang Besuki Sukun', '1990-01-01', '089786466543', '/uploads/user/2019-06-23T034953007Z.jpeg', 'rk@gmail.com', '$2b$10$0O.UJ9cDM..McDczckPQ1eEvqDIfoEc1TQbX4BOLv542aQydxNdym', NULL),
(30, 'Admin', 'admin', '2019-06-04', 'admin', '/uploads/user/2019-05-28T125209196Z.png', 'admin', '$2a$10$DUVlcI6XwN.F21JRJBAMt.Ss4xxdfNfyNYD54G2iOOyLCvCLLcNQW', 'true'),
(31, 'Robi dwi setiawan', 'Mt haryono', '2000-08-27', '081331625837', '/uploads/user/defaultuser.jpg', 'robi_dwisetiawan@yahoo.com', '$2b$10$0oYXuDXWFz5zQoB1yXVZsuY8d.9ayoVw/u3yST5E.L5Y5jScv.UFa', NULL),
(32, 'User dummy tes', 'Dummy', '1993-04-09', '08525525', '/uploads/user/defaultuser.jpg', 'user@dummy.com', '$2b$10$wyHFz3W31NOnByi8IJVQFeeJikqfTmOtBmgNWRjYEbE1MhCHEBe2C', NULL),
(33, 'User testing', 'Testing', '1964-04-21', '0852369852', '/uploads/user/2019-07-02T005818412Z.jpeg', 'usertest@user.com', '$2b$10$MeIhOqhgDx8YyhaRbmfX6e0RTEZ0aTWh3wPBhuPfn0UDaakeCJvEO', NULL);

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
(1, 4, 33, '2019-07-02 07:54:44'),
(2, 6, 33, '2019-07-02 07:56:03');

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
  ADD KEY `kode_notifikasi` (`kode_notifikasi`);

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
  MODIFY `id_izin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jawaban`
--
ALTER TABLE `jawaban`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=517;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kritiksaran`
--
ALTER TABLE `kritiksaran`
  MODIFY `id_kritiksaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lapor`
--
ALTER TABLE `lapor`
  MODIFY `id_lapor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id_notifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  MODIFY `id_pertanyaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `id_survey` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `trayek`
--
ALTER TABLE `trayek`
  MODIFY `id_trayek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `vote`
--
ALTER TABLE `vote`
  MODIFY `id_vote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `notifikasi_ibfk_1` FOREIGN KEY (`id_user_notifikasi`) REFERENCES `user` (`id_user`);

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
