-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2023 at 04:17 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apins2023`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id_absen` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `smt` int(11) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `absensi` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `absensi_ptk`
--

CREATE TABLE `absensi_ptk` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `absen_config`
--

CREATE TABLE `absen_config` (
  `id` int(11) NOT NULL,
  `masuk1` varchar(8) NOT NULL,
  `masuk2` varchar(8) NOT NULL,
  `keluar1` varchar(8) NOT NULL,
  `keluar2` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `absen_config`
--

INSERT INTO `absen_config` (`id`, `masuk1`, `masuk2`, `keluar1`, `keluar2`) VALUES
(1, '06:00:00', '07:00:00', '12:00:00', '16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `agama`
--

CREATE TABLE `agama` (
  `id_agama` int(11) NOT NULL,
  `nama_agama` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `agama`
--

INSERT INTO `agama` (`id_agama`, `nama_agama`) VALUES
(1, 'Islam'),
(2, 'Kristen Protestan'),
(3, 'Katolik'),
(4, 'Hindu'),
(5, 'Budha'),
(6, 'Khong Hu Cu'),
(99, 'Lain-lain');

-- --------------------------------------------------------

--
-- Table structure for table `anak`
--

CREATE TABLE `anak` (
  `id_anak` int(11) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `status` varchar(2) NOT NULL,
  `jenjang` int(11) NOT NULL,
  `nisn` varchar(10) NOT NULL,
  `jk` varchar(1) NOT NULL,
  `tempat_lahir` varchar(25) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tahun_masuk` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `arbain`
--

CREATE TABLE `arbain` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `arbain`
--

INSERT INTO `arbain` (`id`, `nama`) VALUES
(1, 'ARBA\'IN 1'),
(2, 'ARBA\'IN 3'),
(3, 'ARBA\'IN 5'),
(4, 'ARBA\'IN 7'),
(5, 'ARBA\'IN 8'),
(6, 'ARBA\'IN 9'),
(7, 'ARBA\'IN 11'),
(8, 'ARBA\'IN 12'),
(9, 'ARBA\'IN 13'),
(10, 'ARBA\'IN 14'),
(11, 'ARBA\'IN 15'),
(12, 'ARBA\'IN 17'),
(13, 'ARBA\'IN 18'),
(14, 'ARBA\'IN 20'),
(15, 'ARBA\'IN 21');

-- --------------------------------------------------------

--
-- Table structure for table `aspek`
--

CREATE TABLE `aspek` (
  `kd_aspek` int(11) NOT NULL,
  `nama_aspek` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `aspek`
--

INSERT INTO `aspek` (`kd_aspek`, `nama_aspek`) VALUES
(1, 'Spiritual'),
(2, 'Sikap Sosial'),
(3, 'Pengetahuan'),
(4, 'Ketrampilan');

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `penulis` varchar(36) NOT NULL,
  `tanggal` date NOT NULL,
  `judul` text NOT NULL,
  `slug` varchar(250) NOT NULL,
  `isi` longtext NOT NULL,
  `images` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `view` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `berita_acara`
--

CREATE TABLE `berita_acara` (
  `id_bap` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `smt` int(11) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `mulai` varchar(5) NOT NULL,
  `selesai` varchar(5) NOT NULL,
  `mapel` varchar(50) NOT NULL,
  `pengawas1` varchar(50) NOT NULL,
  `pengawas2` varchar(50) NOT NULL,
  `absen` int(11) NOT NULL,
  `nomor_absen` varchar(50) NOT NULL,
  `catatan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bulan_spp`
--

CREATE TABLE `bulan_spp` (
  `id_bulan` int(11) NOT NULL,
  `bulan` varchar(12) NOT NULL,
  `bulan_pendek` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bulan_spp`
--

INSERT INTO `bulan_spp` (`id_bulan`, `bulan`, `bulan_pendek`) VALUES
(1, 'Juli', 'JUL'),
(2, 'Agustus', 'AGS'),
(3, 'September', 'SEP'),
(4, 'Oktober', 'OKT'),
(5, 'November', 'NOV'),
(6, 'Desember', 'DES'),
(7, 'Januari', 'JAN'),
(8, 'Februari', 'FEB'),
(9, 'Maret', 'MAR'),
(10, 'April', 'APR'),
(11, 'Mei', 'MEI'),
(12, 'Juni', 'JUN');

-- --------------------------------------------------------

--
-- Table structure for table `catatan`
--

CREATE TABLE `catatan` (
  `id_cat` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `catatan` varchar(250) NOT NULL,
  `titimangsa` date DEFAULT NULL,
  `walikelas` varchar(50) NOT NULL,
  `walikelas2` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_absensi`
--

CREATE TABLE `data_absensi` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `sakit` varchar(2) DEFAULT NULL,
  `ijin` varchar(2) DEFAULT NULL,
  `alfa` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_ekskul`
--

CREATE TABLE `data_ekskul` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `id_ekskul` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_kesehatan`
--

CREATE TABLE `data_kesehatan` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `tinggi` varchar(3) NOT NULL,
  `berat` varchar(3) NOT NULL,
  `pendengaran` varchar(100) NOT NULL,
  `penglihatan` varchar(100) NOT NULL,
  `gigi` varchar(100) NOT NULL,
  `lainnya` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_prestasi`
--

CREATE TABLE `data_prestasi` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `kesenian` varchar(100) DEFAULT NULL,
  `olahraga` varchar(100) DEFAULT NULL,
  `akademik` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_proyek`
--

CREATE TABLE `data_proyek` (
  `id_proyek` int(11) NOT NULL,
  `tema` int(11) NOT NULL,
  `fase` varchar(1) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `smt` int(11) NOT NULL,
  `nama_proyek` text NOT NULL,
  `deskripsi_proyek` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_register`
--

CREATE TABLE `data_register` (
  `peserta_didik_id` varchar(36) NOT NULL DEFAULT '',
  `jns_daftar` int(11) NOT NULL,
  `tgl_masuk` varchar(10) DEFAULT NULL,
  `asal_tk` int(1) DEFAULT NULL,
  `asal_ra` int(1) DEFAULT NULL,
  `mutasi` varchar(1) DEFAULT NULL,
  `tgl_mutasi` date DEFAULT NULL,
  `alasan` varchar(19) DEFAULT NULL,
  `ijazah` int(11) NOT NULL,
  `skhun` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `desa`
--

CREATE TABLE `desa` (
  `id` varchar(20) NOT NULL,
  `id_kecamatan` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `desa`
--

INSERT INTO `desa` (`id`, `id_kecamatan`, `nama`) VALUES
('3212010007', '3212010', 'Haurkolot'),
('3212010008', '3212010', 'Haurgeulis'),
('3212010009', '3212010', 'Sukajati'),
('3212010010', '3212010', 'Wanakaya'),
('3212010011', '3212010', 'Karangtumaritis'),
('3212010012', '3212010', 'Kertanegara'),
('3212010013', '3212010', 'Cipancuh'),
('3212010014', '3212010', 'Mekarjati'),
('3212010015', '3212010', 'Sidadadi'),
('3212010016', '3212010', 'Sumbermulya'),
('3212011001', '3212011', 'Bantarwaru'),
('3212011002', '3212011', 'Sanca'),
('3212011003', '3212011', 'Mekarjaya'),
('3212011004', '3212011', 'Gantar'),
('3212011005', '3212011', 'Situraja'),
('3212011006', '3212011', 'Baleraja'),
('3212011007', '3212011', 'Mekarwaru'),
('3212020001', '3212020', 'Sukaslamet'),
('3212020002', '3212020', 'Tanjungkerta'),
('3212020003', '3212020', 'Kroya'),
('3212020004', '3212020', 'Sumbon'),
('3212020005', '3212020', 'Sukamelang'),
('3212020006', '3212020', 'Temiyang'),
('3212020007', '3212020', 'Temiyangsari'),
('3212020008', '3212020', 'Jayamulya'),
('3212020009', '3212020', 'Sumberjaya'),
('3212030001', '3212030', 'Kedungdawa'),
('3212030002', '3212030', 'Babakanjaya'),
('3212030003', '3212030', 'Gabuskulon'),
('3212030004', '3212030', 'Sekarmulya'),
('3212030005', '3212030', 'Kedokangabus'),
('3212030006', '3212030', 'Rancamulya'),
('3212030007', '3212030', 'Rancahan'),
('3212030008', '3212030', 'Gabuswetan'),
('3212030009', '3212030', 'Drunten Wetan'),
('3212030010', '3212030', 'Drunten Kulon'),
('3212040003', '3212040', 'Loyang'),
('3212040004', '3212040', 'Amis'),
('3212040005', '3212040', 'Jatisura'),
('3212040006', '3212040', 'Jambak'),
('3212040007', '3212040', 'Cikedung'),
('3212040012', '3212040', 'Cikedung Lor'),
('3212040013', '3212040', 'Mundakjaya'),
('3212041001', '3212041', 'Cikawung'),
('3212041002', '3212041', 'Jatimunggul'),
('3212041003', '3212041', 'Jatimulya'),
('3212041004', '3212041', 'Plosokerep'),
('3212041005', '3212041', 'Rajasinga'),
('3212041006', '3212041', 'Karangasem'),
('3212041007', '3212041', 'Cibereng'),
('3212041008', '3212041', 'Kendayakan'),
('3212041009', '3212041', 'Manggungan'),
('3212050001', '3212050', 'Tunggulpayung'),
('3212050002', '3212050', 'Tugu'),
('3212050003', '3212050', 'Nunuk'),
('3212050004', '3212050', 'Tempel'),
('3212050005', '3212050', 'Pangauban'),
('3212050006', '3212050', 'Telagasari'),
('3212050007', '3212050', 'Langgengsari'),
('3212050008', '3212050', 'Tamansari'),
('3212050009', '3212050', 'Lelea'),
('3212050010', '3212050', 'Cempeh'),
('3212050011', '3212050', 'Tempelkulon'),
('3212060008', '3212060', 'Mulyasari'),
('3212060015', '3212060', 'Bangodua'),
('3212060016', '3212060', 'Beduyut'),
('3212060017', '3212060', 'Karanggetas'),
('3212060018', '3212060', 'Tegalgirang'),
('3212060019', '3212060', 'Wanasari'),
('3212060020', '3212060', 'Malangsari'),
('3212060021', '3212060', 'Rancasari'),
('3212061001', '3212061', 'Bodas'),
('3212061002', '3212061', 'Gadel'),
('3212061003', '3212061', 'Rancajawat'),
('3212061004', '3212061', 'Kerticala'),
('3212061005', '3212061', 'Sukamulya'),
('3212061006', '3212061', 'Karangkerta'),
('3212061007', '3212061', 'Cangko'),
('3212061008', '3212061', 'Pagedangan'),
('3212061009', '3212061', 'Sukaperna'),
('3212061010', '3212061', 'Sukadana'),
('3212061011', '3212061', 'Tukdana'),
('3212061012', '3212061', 'Lajer'),
('3212061013', '3212061', 'Mekarsari'),
('3212070006', '3212070', 'Bangkaloa Ilir'),
('3212070007', '3212070', 'Widasari'),
('3212070008', '3212070', 'Kalensari'),
('3212070010', '3212070', 'Bunder'),
('3212070011', '3212070', 'Ujungaris'),
('3212070012', '3212070', 'Kongsijaya'),
('3212070013', '3212070', 'Ujungjaya'),
('3212070014', '3212070', 'Ujungpendokjaya'),
('3212070015', '3212070', 'Leuwigede'),
('3212070016', '3212070', 'Kasmaran'),
('3212080007', '3212080', 'Tulungagung'),
('3212080008', '3212080', 'Jengkok'),
('3212080009', '3212080', 'Tegalwirangrong'),
('3212080010', '3212080', 'Manguntara'),
('3212080011', '3212080', 'Jambe'),
('3212080012', '3212080', 'Lemahayu'),
('3212080013', '3212080', 'Tenajar Kidul'),
('3212080014', '3212080', 'Kertasemaya'),
('3212080015', '3212080', 'Kliwed'),
('3212080016', '3212080', 'Tenajar'),
('3212080017', '3212080', 'Laranganjambe'),
('3212080018', '3212080', 'Tenajar Lor'),
('3212080019', '3212080', 'Sukawera'),
('3212170001', '3212170', 'Kiajaran Kulon'),
('3212170002', '3212170', 'Kijaran Wetan'),
('3212170003', '3212170', 'Lanjan'),
('3212170004', '3212170', 'Langut'),
('3212170005', '3212170', 'Larangan'),
('3212170006', '3212170', 'Waru'),
('3212170007', '3212170', 'Legok'),
('3212170008', '3212170', 'Bojongslawi'),
('3212170009', '3212170', 'Lohbener'),
('3212170010', '3212170', 'Pamayahan'),
('3212170011', '3212170', 'Sindangkerta'),
('3212170015', '3212170', 'Rambatan Kulon'),
('3212180001', '3212180', 'Ranjeng'),
('3212180002', '3212180', 'Krimun'),
('3212180003', '3212180', 'Puntang'),
('3212180004', '3212180', 'Pegagan'),
('3212180005', '3212180', 'Rajaiyang'),
('3212180006', '3212180', 'Jangga'),
('3212180007', '3212180', 'Jumbleng'),
('3212180008', '3212180', 'Pangkalan'),
('3212180010', '3212180', 'Losarang'),
('3212180011', '3212180', 'Muntur'),
('3212180012', '3212180', 'Santing'),
('3212180013', '3212180', 'Cemara Kulon'),
('3212190001', '3212190', 'Cemara Kulon'),
('3212190002', '3212190', 'Curug'),
('3212190003', '3212190', 'Pranti'),
('3212190004', '3212190', 'Wirakanan'),
('3212190005', '3212190', 'Karangmulya'),
('3212190006', '3212190', 'Karanganyar'),
('3212190007', '3212190', 'Wirapanjunan'),
('3212190008', '3212190', 'Parean Girang'),
('3212190009', '3212190', 'Bulak'),
('3212190010', '3212190', 'Ilir'),
('3212190011', '3212190', 'Soge'),
('3212190012', '3212190', 'Eretan Wetan'),
('3212190013', '3212190', 'Eretan Kulon'),
('3212200001', '3212200', 'Cipedang'),
('3212200002', '3212200', 'Sidamulya'),
('3212200003', '3212200', 'Margamulya'),
('3212200004', '3212200', 'Kertajaya'),
('3212200005', '3212200', 'Bongas'),
('3212200006', '3212200', 'Cipaat'),
('3212200007', '3212200', 'Kertamulya'),
('3212200008', '3212200', 'Plawangan');

-- --------------------------------------------------------

--
-- Table structure for table `deskripsi_k13`
--

CREATE TABLE `deskripsi_k13` (
  `id_raport` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `jns` varchar(5) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dimensi_proyek`
--

CREATE TABLE `dimensi_proyek` (
  `id_dimensi` int(11) NOT NULL,
  `nama_dimensi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dimensi_proyek`
--

INSERT INTO `dimensi_proyek` (`id_dimensi`, `nama_dimensi`) VALUES
(1, 'Beriman, bertakwa kepada Tuhan Yang Maha Esa, dan berakhlak mulia'),
(2, 'Berkebinekaan global'),
(3, 'Bergotong-royong'),
(4, 'Mandiri'),
(5, 'Bernalar kritis'),
(6, 'Kreatif');

-- --------------------------------------------------------

--
-- Table structure for table `doa`
--

CREATE TABLE `doa` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doa`
--

INSERT INTO `doa` (`id`, `nama`) VALUES
(1, 'AKAN TIDUR'),
(2, 'BANGUN TIDUR'),
(3, 'AKAN MAKAN'),
(4, 'SESUDAH MAKAN'),
(5, 'BERCERMIN'),
(6, 'SESUDAH WUDHU'),
(7, 'MENDOAKAN ORANG TUA'),
(8, 'MENJENGUK ORANG SAKIT'),
(9, 'MASUK MASJID'),
(10, 'KELUAR MASJID'),
(11, 'BELAJAR'),
(12, 'BERBUKA PUASA'),
(13, 'BERPAKAIAN'),
(14, 'MASUK KAMAR MANDI'),
(15, 'KELUAR KAMAR MANDI'),
(16, 'KELUAR RUMAH'),
(17, 'KEBAIKAN DUNIA AKHIRAT'),
(18, 'NAIK KENDARAAN'),
(19, 'BERSIN'),
(20, 'ADA ANGIN KENCANG'),
(21, 'KETIKA MARAH'),
(22, 'KETIKA KAGUM'),
(23, 'SESUDAH ADZAN'),
(24, 'ZIARAH KUBUR'),
(25, 'TURUN HUJAN'),
(26, 'MINTA HUJAN'),
(27, 'TERTIMPA MUSIBAH'),
(28, 'KETIKA MENDENGAR PETIR'),
(29, 'PENUTUP MAJELIS'),
(30, 'MOHON AMPUN'),
(31, 'KALIMAT TAYYIBAH'),
(32, 'MELEPAS PAKAIAN'),
(33, 'PEMBUKA HATI'),
(34, 'SYAYIDUL ISTIGFAR'),
(35, 'DZIKIR PAGI HARI 1'),
(36, 'DZIKIR PAGI HARI 2'),
(37, 'DZIKIR PAGI HARI 3');

-- --------------------------------------------------------

--
-- Table structure for table `doa_harian`
--

CREATE TABLE `doa_harian` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `surah` int(11) NOT NULL,
  `nilai` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ekskul`
--

CREATE TABLE `ekskul` (
  `id_ekskul` int(11) NOT NULL,
  `nama_ekskul` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ekskul`
--

INSERT INTO `ekskul` (`id_ekskul`, `nama_ekskul`) VALUES
(1, 'Praja Muda Karana (Pramuka)'),
(2, 'Tahfidz'),
(3, 'Dokter Kecil'),
(4, 'Karate'),
(5, 'Drumband'),
(6, 'Komputer');

-- --------------------------------------------------------

--
-- Table structure for table `elemen_proyek`
--

CREATE TABLE `elemen_proyek` (
  `id_elemen` int(11) NOT NULL,
  `dimensi` int(11) NOT NULL,
  `elemen` text NOT NULL,
  `sub_elemen` text NOT NULL,
  `fase` varchar(1) NOT NULL,
  `capaian` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `elemen_proyek`
--

INSERT INTO `elemen_proyek` (`id_elemen`, `dimensi`, `elemen`, `sub_elemen`, `fase`, `capaian`) VALUES
(1, 1, 'Akhlak beragama', 'Mengenal dan Mencintai Tuhan Yang Maha Esa', 'A', 'Mengenali sifat-sifat utama Tuhan bahwa Ia Maha Esa dan Ia adalah Sang Pencipta yang Maha Pengasih dan Maha Penyayang dan mengenali kebaikan dirinya sebagai cerminan sifat Tuhan'),
(2, 1, 'Akhlak beragama', 'Pemahaman Agama/ Kepercayaan', 'A', 'Mengenali unsur-unsur utama agama/kepercayaan (ajaran, ritual keagamaan, kitab suci, dan orang suci/ utusan Tuhan YME)'),
(3, 1, 'Akhlak beragama', 'Pelaksanaan Ritual Ibadah', 'A', 'Terbiasa melaksanakan ibadah sesuai ajaran agama/kepercayaannya'),
(4, 1, 'Akhlak pribadi', 'Integritas', 'A', 'Membiasakan bersikap jujur terhadap diri sendiri dan orang lain dan berani menyampaikan kebenaran atau fakta'),
(5, 1, 'Akhlak pribadi', 'Merawat Diri secara Fisik, Mental, dan Spiritual', 'A', 'Memiliki rutinitas sederhana yang diatur secara mandiri dan dijalankan sehari-hari serta menjaga kesehatan dan keselamatan/keamanan diri dalam semua aktivitas kesehariannya'),
(6, 1, 'Akhlak kepada manusia', 'Mengutamakan persamaan dengan orang lain dan menghargai perbedaan', 'A', 'Mengenali hal-hal yang sama dan berbeda yang dimiliki diri dan temannya dalam berbagai hal, serta memberikan respon secara positif'),
(7, 1, 'Akhlak kepada manusia', 'Berempati kepada orang lain', 'A', 'Mengidentifikasi emosi, minat dan kebutuhan orang- orang terdekat dan meresponnya secara positif'),
(8, 1, 'Akhlak kepada alam', 'Memahami Keterhubungan Ekosistem Bumi', 'A', 'Mengidentifikasi berbagai ciptaan Tuhan'),
(9, 1, 'Akhlak kepada alam', 'Menjaga Lingkungan Alam Sekitar', 'A', 'Membiasakan bersyukur atas lingkungan alam sekitar dan berlatih untuk menjaganya'),
(10, 1, 'Akhlak bernegara', 'Melaksanakan Hak dan Kewajiban sebagai Warga Negara Indonesia', 'A', 'Mengidentifikasi hak dan tanggung jawabnya di rumah, sekolah, dan lingkungan sekitar serta kaitannya dengan keimanan kepada Tuhan YME'),
(11, 2, 'Refleksi dan tanggung jawab terhadap pengalaman kebinekaan', 'Menyelaraskan perbedaan budaya', 'A', 'Mengidentifikasi perbedaan-perbedaan budaya yang konkrit di lingkungan sekitar'),
(12, 2, 'Mengenal dan menghargai budaya', 'Mendalami budaya dan identitas budaya', 'A', 'Mengidentifikasi dan mendeskripsikan ide-ide tentang dirinya dan beberapa macam kelompok di lingkungan sekitarnya'),
(13, 2, 'Mengenal dan menghargai budaya', 'Mengeksplorasi dan membandingkan pengetahuan budaya, kepercayaan, serta praktiknya', 'A', 'Mengidentifikasi dan mendeskripsikan praktik keseharian diri dan budayanya'),
(14, 2, 'Mengenal dan menghargai budaya', 'Menumbuhkan rasa menghormati terhadap keanekaragaman budaya', 'A', 'Mendeskripsikan pengalaman dan pemahaman hidup bersama-sama dalam kemajemukan'),
(15, 2, 'Komunikasi dan interaksi antar budaya', 'Berkomunikasi antar budaya', 'A', 'Mengenali bahwa diri dan orang lain menggunakan kata, gambar, dan bahasa tubuh yang dapat memiliki makna yang berbeda di lingkungan sekitarnya'),
(16, 2, 'Komunikasi dan interaksi antar budaya', 'Mempertimbangkan dan menumbuhkan berbagai perspektif', 'A', 'Mengekspresikan pandangannya terhadap topik yang umum dan mendengarkan sudut pandang orang lain yang berbeda dari dirinya dalam lingkungan keluarga dan sekolah'),
(17, 2, 'Refleksi dan tanggung jawab terhadap pengalaman kebinekaan', 'Refleksi terhadap pengalaman kebinekaan', 'A', 'Menyebutkan apa yang telah dipelajari tentang orang lain dari interaksinya dengan kemajemukan budaya di lingkungan sekolah dan rumah'),
(18, 2, 'Refleksi dan tanggung jawab terhadap pengalaman kebinekaan', 'Menghilangkan stereotip dan prasangka', 'A', 'mengenali perbedaan tiap orang atau kelompok dan menganggapnya sebagai kewajaran'),
(19, 2, 'Berkeadilan sosial', 'Aktif membangun masyarakat yang inklusif, adil, dan berkelanjutan', 'A', 'Menjalin pertemanan tanpa memandang perbedaan agama, suku, ras, jenis kelamin, dan perbedaan lainnya, dan mengenal masalah- masalah sosial, ekonomi, dan lingkungan di lingkungan sekitarnya'),
(20, 2, 'Berkeadilan sosial', 'Berpartisipasi dalam proses pengambilan keputusan bersama', 'A', 'Mengidentifikasi pilihan- pilihan berdasarkan kebutuhan dirinya dan orang lain ketika membuat keputusan'),
(21, 2, 'Berkeadilan sosial', 'Memahami peran individu dalam demokrasi', 'A', 'Mengidentifikasi peran, hak dan kewajiban warga dalam masyarakat demokratis'),
(22, 3, 'Kolaborasi', 'Kerja sama', 'A', 'Menerima dan melaksanakan tugas serta peran yang diberikan kelompok dalam sebuah kegiatan bersama'),
(23, 3, 'Kolaborasi', 'Komunikasi untuk mencapai tujuan bersama', 'A', 'Memahami informasi sederhana dari orang lain dan menyampaikan informasi sederhana kepada orang lain menggunakan kata- katanya sendiri'),
(24, 3, 'Kolaborasi', 'Saling ketergantungan positif	', 'A', 'Mengenali kebutuhan- kebutuhan diri sendiri yang memerlukan orang lain dalam pemenuhannya'),
(25, 3, 'Kolaborasi', 'Koordinasi Sosial', 'A', 'Melaksanakan aktivitas kelompok sesuai dengan kesepakatan bersama dengan bimbingan, dan saling mengingatkan adanya kesepakatan tersebut'),
(26, 3, 'Kepedulian', 'Tanggap terhadap lingkungan Sosial', 'A', 'Peka dan mengapresiasi orang- orang di lingkungan sekitar, kemudian melakukan tindakan sederhana untuk mengungkapkannya'),
(27, 3, 'Kepedulian', 'Persepsi sosial', 'A', 'Mengenali berbagai reaksi orang lain di lingkungan sekitar dan penyebabnya'),
(28, 3, 'Berbagi', 'Berbagi', 'A', 'Memberi dan menerima hal yang dianggap berharga dan penting kepada/dari orang-orang di lingkungan sekitar'),
(29, 4, 'Pemahaman diri dan situasi', 'Mengembangkan refleksi diri', 'A', 'Melakukan refleksi untuk mengidentifikasi kekuatan dan kelemahan, serta prestasi dirinya'),
(30, 4, 'Regulasi diri', 'Regulasi emosi', 'A', 'Mengidentifikasi perbedaan emosi yang dirasakannya dan situasi- situasi yang menyebabkan- nya; serta mengekspresi- kan secara wajar'),
(31, 4, 'Regulasi diri', 'Penetapan tujuan belajar, prestasi, dan pengembangan diri serta rencana strategis untuk mencapainya', 'A', 'Menetapkan target belajar dan merencanakan waktu dan tindakan belajar yang akan dilakukannya'),
(32, 4, 'Regulasi diri', 'Menunjukkan inisiatif dan bekerja secara mandiri', 'A', 'Berinisiatif untuk mengerjakan tugas-tugas rutin secara mandiri dibawah pengawasan dan dukungan orang dewasa'),
(33, 4, 'Regulasi diri', 'Mengembangkan pengendalian dan disiplin diri', 'A', 'Melaksanakan kegiatan belajar di kelas dan menyelesaikan tugas-tugas dalam waktu yang telah disepakati'),
(34, 4, 'Regulasi diri', 'Percaya diri, tangguh (resilient), dan adaptif', 'A', 'Berani mencoba dan adaptif menghadapi situasi baru serta bertahan mengerjakan tugas-tugas yang disepakati hingga tuntas'),
(35, 4, 'Pemahaman diri dan situasi', 'Mengenali kualitas dan minat diri serta tantangan yang dihadapi', 'A', 'Mengidentifikasi dan menggambarkan kemampuan, prestasi, dan ketertarikannya secara subjektif'),
(36, 5, 'Memperoleh dan memproses informasi dan gagasan', 'Mengajukan pertanyaan', 'A', 'Mengajukan pertanyaan untuk menjawab keingintahuannya dan untuk mengidentifikasi suatu permasalahan mengenai dirinya dan lingkungan sekitarnya'),
(37, 5, 'Memperoleh dan memproses informasi dan gagasan', 'Mengidentifikasi, mengklarifikasi, dan mengolah informasi dan gagasan', 'A', 'Mengidentifikasi dan mengolah informasi dan gagasan'),
(38, 5, 'Menganalisis dan mengevaluasi penalaran', 'Menganalisis dan mengevaluasi penalaran dan prosedurnya', 'A', 'Melakukan penalaran konkrit dan memberikan alasan dalam menyelesaikan masalah dan mengambil keputusan'),
(39, 5, 'Merefleksi dan mengevaluasi pemikirannya sendiri', 'Merefleksi dan mengevaluasi pemikirannya sendiri', 'A', 'Menyampaikan apa yang sedang dipikirkan secara terperinci'),
(40, 6, 'Menghasilkan gagasan yang orisinal', 'Menghasilkan gagasan yang orisinal', 'A', 'Menggabungkan beberapa gagasan menjadi ide atau gagasan imajinatif yang bermakna untuk mengekspresikan pikiran dan/atau perasaannya.'),
(41, 6, 'Menghasilkan karya dan tindakan yang orisinal', 'Menghasilkan karya dan tindakan yang orisinal', 'A', 'Mengeksplorasi dan mengekspresikan pikiran dan/atau perasaannya dalam bentuk karya dan/atau tindakan serta mengapresiasi karya dan tindakan yang dihasilkan'),
(42, 6, 'Memiliki keluwesan berpikir dalam mencari alternatif solusi permasalahan', 'Memiliki keluwesan berpikir dalam mencari alternatif solusi permasalahan', 'A', 'Mengidentifikasi gagasan-gagasan kreatif untuk menghadapi situasi dan permasalahan'),
(43, 1, 'Akhlak beragama', 'Mengenal dan Mencintai Tuhan Yang Maha Esa', 'B', 'Memahami sifat-sifat Tuhan utama lainnya dan mengaitkan sifat-sifat tersebut dengan konsep dirinya dan ciptaan- Nya'),
(44, 1, 'Akhlak beragama', 'Pemahaman Agama/ Kepercayaan', 'B', 'Mengenali unsur- unsur utama agama/kepercayaan (simbol-simbol keagamaan dan sejarah agama/ kepercayaan)'),
(45, 1, 'Akhlak beragama', 'Pelaksanaan Ritual Ibadah', 'B', 'Terbiasa melaksanakan ibadah wajib sesuai tuntunan agama/kepercayaan nya'),
(46, 1, 'Akhlak pribadi', 'Integritas', 'B', 'Membiasakan melakukan refleksi tentang pentingnya bersikap jujur dan berani menyampaikan kebenaran atau fakta'),
(47, 1, 'Akhlak pribadi', 'Merawat Diri secara Fisik, Mental, dan Spiritual', 'B', 'Mulai membiasakan diri untuk disiplin, rapi, membersihkan dan merawat tubuh, menjaga tingkah laku dan perkataan dalam semua aktivitas kesehariannya'),
(48, 1, 'Akhlak kepada manusia', 'Mengutamakan persamaan dengan orang lain dan menghargai perbedaan', 'B', 'Terbiasa mengidentifikasi hal- hal yang sama dan berbeda yang dimiliki diri dan temannya dalam berbagai hal serta memberikan respon secara positif.'),
(49, 1, 'Akhlak kepada manusia', 'Berempati kepada orang lain', 'B', 'Terbiasa memberikan apresiasi di lingkungan sekolah dan masyarakat'),
(50, 1, 'Akhlak kepada alam', 'Memahami Keterhubungan Ekosistem Bumi', 'B', 'Memahami keterhubungan antara satu ciptaan dengan ciptaan Tuhan yang lainnya'),
(51, 1, 'Akhlak kepada alam', 'Menjaga Lingkungan Alam Sekitar', 'B', 'Terbiasa memahami tindakan-tindakan yang ramah dan tidak ramah lingkungan serta membiasakan diri untuk berperilaku ramah lingkungan'),
(52, 1, 'Akhlak bernegara', 'Melaksanakan Hak dan Kewajiban sebagai Warga Negara Indonesia', 'B', 'Mengidentifikasi hak dan tanggung jawab orang-orang di sekitarnya serta kaitannya dengan keimanan kepada Tuhan YME.'),
(53, 2, 'Mengenal dan menghargai budaya', 'Mendalami budaya dan identitas budaya', 'B', 'Mengidentifikasi dan mendeskripsikan ide-ide tentang dirinya dan berbagai macam kelompok di lingkungan sekitarnya, serta cara orang lain berperilaku dan berkomunikasi dengannya.'),
(54, 2, 'Mengenal dan menghargai budaya', 'Mengeksplorasi dan membandingkan pengetahuan budaya, kepercayaan, serta praktiknya', 'B', 'Mengidentifikasi dan membandingkan praktik keseharian diri dan budayanya dengan orang lain di tempat dan waktu/era yang berbeda.'),
(55, 2, 'Mengenal dan menghargai budaya', 'Menumbuhkan rasa menghormati terhadap keanekaragaman budaya', 'B', 'Memahami bahwa kemajemukan dapat memberikan kesempatan untuk mendapatkan pengalaman dan pemahaman yang baru.'),
(56, 2, 'Komunikasi dan interaksi antar budaya', 'Berkomunikasi antar budaya', 'B', 'Mendeskripsikan penggunaan kata, tulisan dan bahasa tubuh yang memiliki makna yang berbeda di lingkungan sekitarnya dan dalam suatu budaya tertentu.'),
(57, 2, 'Komunikasi dan interaksi antar budaya', 'Mempertimbangkan dan menumbuhkan berbagai perspektif', 'B', 'Mengekspresikan pandangannya terhadap topik yang umum dan dapat mengidentifikasi sudut pandang orang lain. Mendengarkan dan membayangkan sudut pandang orang lain yang berbeda dari dirinya pada situasi di ranah sekolah, keluarga, dan lingkungan sekitar.'),
(58, 2, 'Refleksi dan tanggung jawab terhadap pengalaman kebinekaan', 'Refleksi terhadap pengalaman kebinekaan', 'B', 'Menyebutkan apa yang telah dipelajari tentang orang lain dari interaksinya dengan kemajemukan budaya di lingkungan sekitar.'),
(59, 2, 'Refleksi dan tanggung jawab terhadap pengalaman kebinekaan', 'Menghilangkan stereotip dan prasangka', 'B', 'Mengkonfirmasi dan mengklarifikasi stereotip dan prasangka yang dimilikinya tentang orang atau kelompokdi sekitarnya untuk mendapatkan pemahaman yang lebih baik'),
(60, 2, 'Refleksi dan tanggung jawab terhadap pengalaman kebinekaan', 'Menyelaraskan perbedaan budaya', 'B', 'Mengenali bahwa perbedaan budaya mempengaruhi pemahaman antarindividu.'),
(61, 2, 'Berkeadilan sosial', 'Aktif membangun masyarakat yang inklusif, adil, dan berkelanjutan', 'B', 'Mengidentifikasi cara berkontribusi terhadap lingkungan sekolah, rumah dan lingkungan sekitarnya yang inklusif, adil dan berkelanjutan'),
(62, 2, 'Berkeadilan sosial', 'Berpartisipasi dalam proses pengambilan keputusan bersama', 'B', 'Berpartisipasi menentukan beberapa pilihan untuk keperluan bersama berdasarkan kriteria sederhana'),
(63, 2, 'Berkeadilan sosial', 'Memahami peran individu dalam demokrasi', 'B', 'Memahami konsep hak dan kewajiban, serta implikasinya terhadap perilakunya.'),
(64, 3, 'Kolaborasi', 'Kerja sama', 'B', 'Menampilkan tindakan yang sesuai dengan harapan dan tujuan kelompok.'),
(65, 3, 'Kolaborasi', 'Komunikasi untuk mencapai tujuan bersama', 'B', 'Memahami informasi yang disampaikan (ungkapan pikiran, perasaan, dan keprihatinan) orang lain dan menyampaikan informasi secara akurat menggunakan berbagai simbol dan media'),
(66, 3, 'Kolaborasi', 'Saling ketergantungan positif', 'B', 'Menyadari bahwa setiap orang membutuhkan orang lain dalam memenuhi kebutuhannya dan perlunya saling membantu'),
(67, 3, 'Kolaborasi', 'Koordinasi Sosial', 'B', 'Menyadari bahwa dirinya memiliki peran yang berbeda dengan orang lain/temannya, serta mengetahui konsekuensi perannya terhadap ketercapaian tujuan.'),
(68, 3, 'Kepedulian', 'Tanggap terhadap lingkungan Sosial', 'B', 'Peka dan mengapresiasi orang-orang di lingkungan sekitar, kemudian melakukan tindakan untuk menjaga keselarasan dalam berelasi dengan orang lain.'),
(69, 3, 'Kepedulian', 'Persepsi sosial', 'B', 'Memahami berbagai alasan orang lain menampilkan respon tertentu'),
(70, 3, 'Berbagi', 'Berbagi', 'B', 'Memberi dan menerima hal yang dianggap penting dan berharga kepada/dari orang-orang di lingkungan sekitar baik yang dikenal maupun tidak dikenal.'),
(71, 4, 'Pemahaman diri dan situasi', 'Mengenali kualitas dan minat diri serta tantangan yang dihadapi', 'B', 'Mengidentifikasi kemampuan, prestasi, dan ketertarikannya serta tantangan yang dihadapi berdasarkan kejadian-kejadian yang dialaminya dalam kehidupan sehari-hari.'),
(72, 4, 'Pemahaman diri dan situasi', 'Mengembangka n refleksi diri', 'B', 'Melakukan refleksi untuk mengidentifikasi kekuatan, kelemahan, dan prestasi dirinya, serta situasi yang dapat mendukung dan menghambat pembelajaran dan pengembangan dirinya'),
(73, 4, 'Regulasi diri', 'Regulasi emosi', 'B', 'Mengetahui adanya pengaruh orang lain, situasi, dan peristiwa yang terjadi terhadap emosi yang dirasakannya; serta berupaya untuk mengekspresikan emosi secara tepat dengan mempertimbangkan perasaan dan kebutuhan orang lain disekitarnya'),
(74, 4, 'Regulasi diri', 'Penetapan tujuan belajar, prestasi, dan pengembanga n diri serta rencana strategis untuk mencapainya', 'B', 'Menjelaskan pentingnya memiliki tujuan dan berkomitmen dalam mencapainya serta mengeksplorasi langkah-langkah yang sesuai untuk mencapainya'),
(75, 4, 'Regulasi diri', 'Menunjukkan inisiatif dan bekerja secara mandiri', 'B', 'Mempertimbangka n, memilih dan mengadopsi berbagai strategi dan mengidentifikasi sumber bantuan yang diperlukan serta berinisiatif menjalankannya untuk mendapatkan hasil belajar yang diinginkan.'),
(76, 4, 'Regulasi diri', 'Mengembangka n pengendalian dan disiplin diri', 'B', 'Menjelaskan pentingnya mengatur diri secara mandiri dan mulai menjalankan kegiatan dan tugas yang telah sepakati secara mandiri'),
(77, 4, 'Regulasi diri', 'Percaya diri, tangguh (resilient), dan adaptif', 'B', 'Tetap bertahan mengerjakan tugas ketika dihadapkan dengan tantangan dan berusaha menyesuaikan strateginya ketika upaya sebelumnya tidak berhasil.'),
(78, 5, 'Memperoleh dan memproses informasi dan gagasan', 'Mengajukan pertanyaan', 'B', 'Mengajukan pertanyaan untuk mengidentifikasi suatu permasalahan dan mengkonfirmasi pemahaman terhadap suatu permasalahan mengenai dirinya dan lingkungan sekitarnya.'),
(79, 5, 'Memperoleh dan memproses informasi dan gagasan', 'Mengidentifikasi, mengklarifikasi, dan mengolah informasi dan gagasan', 'B', 'Mengumpulkan, mengklasifikasikan, membandingkan dan memilih informasi dan gagasan dari berbagai sumber.'),
(80, 5, 'Menganalisis dan mengevaluasi penalaran', 'Menganalisis dan mengevaluasi penalaran dan prosedurnya', 'B', 'Menjelaskan alasan yang relevan dalam penyelesaian masalah dan pengambilan keputusan'),
(81, 5, 'Merefleksi dan mengevaluasi pemikirannya sendiri', 'Merefleksi dan mengevaluasi pemikirannya sendiri', 'B', 'Menyampaikan apa yang sedang dipikirkan dan menjelaskan alasan dari hal yang dipikirkan'),
(82, 6, 'Menghasilkan gagasan yang orisinal', 'Menghasilkan gagasan yang orisinal', 'B', 'Memunculkan gagasan imajinatif baru yang bermakna dari beberapa gagasan yang berbeda sebagai ekspresi pikiran dan/atau perasaannya.'),
(83, 6, 'Menghasilkan karya dan tindakan yang orisinal', 'Menghasilkan karya dan tindakan yang orisinal', 'B', 'Mengeksplorasi dan mengekspresikan pikiran dan/atau perasaannya sesuai dengan minat dan kesukaannya dalam bentuk karya dan/atau tindakan serta mengapresiasi karya dan tindakan yang dihasilkan'),
(84, 6, 'Memiliki keluwesan berpikir dalam mencari alternatif solusi permasalahan', 'Memiliki keluwesan berpikir dalam mencari alternatif solusi permasalahan', 'B', 'Membandingkan gagasan-gagasan kreatif untuk menghadapi situasi dan permasalahan.'),
(85, 1, 'Akhlak beragama', 'Mengenal dan Mencintai Tuhan Yang Maha Esa', 'C', 'Memahami berbagai kualitas atau sifat-sifat Tuhan yang diutarakan dalam kitab suci agama masing-masing dan menghubungkan kualitas- kualitas positif Tuhan dengan sikap pribadinya, serta meyakini firman Tuhan sebagai kebenaran.'),
(86, 1, 'Akhlak beragama', 'Pemahaman Agama/ Kepercayaan', 'C', 'Memahami unsur-unsur utama agama/kepercayaan, dan mengenali peran agama/kepercayaan dalam kehidupan serta memahami ajaran moral agama.'),
(87, 1, 'Akhlak beragama', 'Pelaksanaan Ritual Ibadah', 'C', 'Melaksanakan ibadah secara rutin sesuai dengan tuntunan agama/kepercayaan, berdoa mandiri, merayakan, dan memahami makna hari- hari besarnya'),
(88, 1, 'Akhlak pribadi', 'Integritas', 'C', 'Berani dan konsisten menyampaikan kebenaran atau fakta serta memahami konsekuensi- konsekuensinya untuk diri sendiri'),
(89, 1, 'Akhlak pribadi', 'Merawat Diri secara Fisik, Mental, dan Spiritual', 'C', 'Memperhatikan kesehatan jasmani, mental, dan rohani dengan melakukan aktivitas fisik, sosial, dan ibadah.'),
(90, 1, 'Akhlak kepada manusia', 'Mengutamakan persamaan dengan orang lain dan menghargai perbedaan', 'C', 'Mengidentifikasi kesamaan dengan orang lain sebagai perekat hubungan sosial dan mewujudkannya dalam aktivitas kelompok. Mulai mengenal berbagai kemungkinan interpretasi dan cara pandang yang berbeda ketika dihadapkan dengan dilema.'),
(91, 1, 'Akhlak kepada manusia', 'Berempati kepada orang lain', 'C', 'Mulai memandang sesuatu dari perspektif orang lain serta mengidentifikasi kebaikan dan kelebihan orang sekitarnya.'),
(92, 1, 'Akhlak kepada alam', 'Memahami Keterhubungan Ekosistem Bumi', 'C', 'Memahami konsep harmoni dan mengidentifikasi adanya saling ketergantungan antara berbagai ciptaan Tuhan'),
(93, 1, 'Akhlak kepada alam', 'Menjaga Lingkungan Alam Sekitar', 'C', 'Mewujudkan rasa syukur dengan terbiasa berperilaku ramah lingkungan dan memahami akibat perbuatan tidak ramah lingkungan dalam lingkup kecil maupun besar.'),
(94, 1, 'Akhlak bernegara', 'Melaksanakan Hak dan Kewajiban sebagai Warga Negara Indonesia', 'C', 'Mengidentifikasi dan memahami peran, hak, dan kewajiban dasar sebagai warga negara serta kaitannya dengan keimanan kepada Tuhan YME dan secara sadar mempraktikkannya dalam kehidupan sehari-hari.'),
(95, 2, 'Mengenal dan menghargai budaya', 'Mendalami budaya dan identitas budaya', 'C', 'Mengidentifikasi dan mendeskripsikan keragaman budaya di sekitarnya; serta menjelaskan peran budaya dan Bahasa dalam membentuk identitas dirinya.'),
(96, 2, 'Mengenal dan menghargai budaya', 'Mengeksplorasi dan membandingkan pengetahuan budaya, kepercayaan, serta praktiknya', 'C', 'Mendeskripsikan dan membandingkan pengetahuan, kepercayaan, dan praktik dari berbagai kelompok budaya.'),
(97, 2, 'Mengenal dan menghargai budaya', 'Menumbuhkan rasa menghormati terhadap keanekaragaman budaya', 'C', 'Mengidentifikasi peluang dan tantangan yang muncul dari keragaman budaya di Indonesia.'),
(98, 2, 'Komunikasi dan interaksi antar budaya', 'Berkomunikasi antar budaya', 'C', 'Memahami persamaan dan perbedaan cara komunikasi baik di dalam maupun antar kelompok budaya.'),
(99, 2, 'Komunikasi dan interaksi antar budaya', 'Mempertimbangkan dan menumbuhkan berbagai perspektif', 'C', 'Membandingkan beragam perspektif untuk memahami permasalahan sehari- hari. Membayangkan dan mendeskripsikan situasi komunitas yang berbeda dengan dirinya ke dalam situasi dirinya dalam konteks lokal dan regional.'),
(100, 2, 'Refleksi dan tanggung jawab terhadap pengalaman kebinekaan', 'Refleksi terhadap pengalaman kebinekaan', 'C', 'Menjelaskan apa yang telah dipelajari dari interaksi dan pengalaman dirinya dalam lingkungan yang beragam.'),
(101, 2, 'Refleksi dan tanggung jawab terhadap pengalaman kebinekaan', 'Menghilangkan stereotip dan prasangka', 'C', 'Mengkonfirmasi dan mengklarifikasi stereotip dan prasangka yang dimilikinya tentang orang atau kelompok di sekitarnya untuk mendapatkan pemahaman yang lebih baik serta mengidentifikasi pengaruhnya terhadap individu dan kelompok di lingkungan sekitarnya'),
(102, 2, 'Refleksi dan tanggung jawab terhadap pengalaman kebinekaan', 'Menyelaraskan perbedaan budaya', 'C', 'Mencari titik temu nilai budaya yang beragam untuk menyelesaikan permasalahan bersama.'),
(103, 2, 'Berkeadilan sosial', 'Aktif membangun masyarakat yang inklusif, adil, dan berkelanjutan', 'C', 'Membandingkan beberapa tindakan dan praktik perbaikan lingkungan sekolah yang inklusif, adil, dan berkelanjutan, dengan mempertimbangkan dampaknya secara jangka panjang terhadap manusia, alam, dan masyarakat'),
(104, 2, 'Berkeadilan sosial', 'Berpartisipasi dalam proses pengambilan keputusan bersama', 'C', 'Berpartisipasi dalam menentukan kriteria yang disepakati bersama untuk menentukan pilihan dan keputusan untuk kepentingan bersama'),
(105, 2, 'Berkeadilan sosial', 'Memahami peran individu dalam demokrasi', 'C', 'Memahami konsep hak dan kewajiban, serta implikasinya terhadap perilakunya. Menggunakan konsep ini untuk menjelaskan perilaku diri dan orang sekitarnya'),
(106, 3, 'Kolaborasi', 'Kerja sama', 'C', 'Menunjukkan ekspektasi (harapan) positif kepada orang lain dalam rangka mencapai tujuan kelompok di lingkungan sekitar (sekolah dan rumah).'),
(107, 3, 'Kolaborasi', 'Komunikasi untuk mencapai tujuan bersama', 'C', 'Memahami informasi dari berbagai sumber dan menyampaikan pesan menggunakan berbagai simbol dan media secara efektif kepada orang lain untuk mencapai tujuan bersama'),
(108, 3, 'Kolaborasi', 'Saling ketergantungan positif', 'C', 'Menyadari bahwa meskipun setiap orang memiliki otonominya masing-masing, setiap orang membutuhkan orang lain dalam memenuhi kebutuhannya.'),
(109, 3, 'Kolaborasi', 'Koordinasi Sosial', 'C', 'Menyelaraskan tindakannya sesuai dengan perannya dan mempertimbangkan peran orang lain untuk mencapai tujuan bersama.'),
(110, 3, 'Kepedulian', 'Tanggap terhadap lingkungan Sosial', 'C', 'Tanggap terhadap lingkungan sosial sesuai dengan tuntutan peran sosialnya dan menjaga keselarasan dalam berelasi dengan orang lain.'),
(111, 3, 'Kepedulian', 'Persepsi sosial', 'C', 'Menerapkan pengetahuan mengenai berbagai reaksi orang lain dan penyebabnya dalam konteks keluarga, sekolah, serta pertemanan dengan sebaya.'),
(112, 3, 'Berbagi', 'Berbagi', 'C', 'Memberi dan menerima hal yang dianggap penting dan berharga kepada/dari orang-orang di lingkungan luas/masyarakat baik yang dikenal maupun tidak dikenal.'),
(113, 4, 'Pemahaman diri dan situasi', 'Mengenali kualitas dan minat diri serta tantangan yang dihadapi', 'C', 'Menggambarkan pengaruh kualitas dirinya terhadap pelaksanaan dan hasil belajar; serta mengidentifikasi kemampuan yang ingin dikembangkan dengan mempertimbangkan tantangan yang dihadapinya dan umpan balik dari orang dewasa'),
(114, 4, 'Pemahaman diri dan situasi', 'Mengembangka n refleksi diri', 'C', 'Melakukan refleksi untuk mengidentifikasi faktor-faktor di dalam maupun di luar dirinya yang dapat mendukung/mengham batnya dalam belajar dan mengembangkan diri; serta mengidentifikasi cara- cara untuk mengatasi kekurangannya.'),
(115, 4, 'Regulasi diri', 'Regulasi emosi', 'C', 'Memahami perbedaan emosi yang dirasakan dan dampaknya terhadap proses belajar dan interaksinya dengan orang lain; serta mencoba cara-cara yang sesuai untuk mengelola emosi agar dapat menunjang aktivitas belajar dan interaksinya dengan orang lain.'),
(116, 4, 'Regulasi diri', 'Penetapan tujuan belajar, prestasi, dan pengembanga n diri serta rencana strategis untuk mencapainya', 'C', 'Menilai faktor-faktor (kekuatan dan kelemahan) yang ada pada dirinya dalam upaya mencapai tujuan belajar, prestasi, dan pengembangan dirinya serta mencoba berbagai strategi untuk mencapainya.'),
(117, 4, 'Regulasi diri', 'Menunjukkan inisiatif dan bekerja secara mandiri', 'C', 'Memahami arti penting bekerja secara mandiri serta inisiatif untuk melakukannya dalam menunjang pembelajaran dan pengembangan dirinya'),
(118, 4, 'Regulasi diri', 'Mengembangka n pengendalian dan disiplin diri', 'C', 'Mengidentifikasi faktor-faktor yang dapat mempengaruhi kemampuan dalam mengelola diri dalam pelaksanaan aktivitas belajar dan pengembangan dirinya.'),
(119, 4, 'Regulasi diri', 'Percaya diri, tangguh (resilient), dan adaptif', 'C', 'Menyusun, menyesuaikan, dan mengujicobakan berbagai strategi dan cara kerjanya untuk membantu dirinya dalam penyelesaian tugas yang menantang'),
(120, 5, 'Memperoleh dan memproses informasi dan gagasan', 'Mengajukan pertanyaan', 'C', 'Mengajukan pertanyaan untuk membandingkan berbagai informasi dan untuk menambah pengetahuannya.'),
(121, 5, 'Memperoleh dan memproses informasi dan gagasan', 'Mengidentifikasi, mengklarifikasi, dan mengolah informasi dan gagasan', 'C', 'Mengumpulkan, mengklasifikasikan, membandingkan, dan memilih informasi dari berbagai sumber, serta memperjelas informasi dengan bimbingan orang dewasa.'),
(122, 5, 'Menganalisis dan mengevaluasi penalaran', 'Menganalisis dan mengevaluasi penalaran dan prosedurnya', 'C', 'Menjelaskan alasan yang relevan dan akurat dalam penyelesaian masalah dan pengambilan keputusan'),
(123, 5, 'Merefleksi dan mengevaluasi pemikirannya sendiri', 'Merefleksi dan mengevaluasi pemikirannya sendiri', 'C', 'Memberikan alasan dari hal yang dipikirkan, serta menyadari kemungkinan adanya bias pada pemikirannya sendiri'),
(124, 6, 'Menghasilkan gagasan yang orisinal', 'Menghasilkan gagasan yang orisinal', 'C', 'Mengembangkan gagasan yang ia miliki untuk membuat kombinasi hal yang baru dan imajinatif untuk mengekspresikan pikiran dan/atau perasaannya.'),
(125, 6, 'Menghasilkan karya dan tindakan yang orisinal', 'Menghasilkan karya dan tindakan yang orisinal', 'C', 'Mengeksplorasi dan mengekspresikan pikiran dan/atau perasaannya sesuai dengan minat dan kesukaannya dalam bentuk karya dan/atau tindakan serta mengapresiasi dan mengkritik karya dan tindakan yang dihasilkan'),
(126, 6, 'Memiliki keluwesan berpikir dalam mencari alternatif solusi permasalahan', 'Memiliki keluwesan berpikir dalam mencari alternatif solusi permasalahan', 'C', 'berupaya mencari solusi alternatif saat pendekatan yang diambil tidak berhasil berdasarkan identifikasi terhadap situasi');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filepkg`
--

CREATE TABLE `filepkg` (
  `id_penilaian` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `smt` int(11) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `nama_file` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formatif`
--

CREATE TABLE `formatif` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `lm` varchar(2) NOT NULL,
  `tp` varchar(10) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gajipokok`
--

CREATE TABLE `gajipokok` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `insentif` int(11) DEFAULT NULL,
  `transport` int(11) DEFAULT NULL,
  `tunj_walikelas` int(11) DEFAULT NULL,
  `tunj_kepsek` int(11) DEFAULT NULL,
  `tunj_kehadiran` int(11) DEFAULT NULL,
  `tunj_ekskul` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `judul` text NOT NULL,
  `link` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hadits`
--

CREATE TABLE `hadits` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hadits`
--

INSERT INTO `hadits` (`id`, `nama`) VALUES
(1, 'SHALAT'),
(2, 'SABAR DAN PEMAAF'),
(3, 'SENYUM SHADAQAH'),
(4, 'BERKATA BAIK'),
(5, 'SURGA DIBAWAH KAKI IBU'),
(6, 'KEUTAMAAN SALAM'),
(7, 'MEMUTUS SILATURRAHMI'),
(8, 'MASJID RUMAH MUSLIM'),
(9, 'WAJIB MENUNTUT ILMU'),
(10, 'MENUTUP AURAT'),
(11, 'KEBERSIHAN'),
(12, 'BERBUAT BAIK'),
(13, 'JANGAN SUKA MARAH'),
(14, 'ADAB MAKAN'),
(15, 'MALU SEBAGIAN IMAN'),
(16, 'KEUTAMAAN BELAJAR QUR\'AN'),
(17, 'ORANG MULIA'),
(18, 'ALLAH SUKA KEINDAHAN'),
(19, 'LARANGAN SOMBONG'),
(20, 'BERTERIMA KASIH KEPADA SESAMA'),
(21, 'MENCINTAI SAUDARA'),
(22, 'SESAMA MUSLIM BERSAUDARA'),
(23, 'SALING MEMBERI HADIAH'),
(24, 'MEMULIAKAN TAMU'),
(25, 'PENTINGNYA NIAT'),
(26, 'LARANGAN MEMBANGKANG');

-- --------------------------------------------------------

--
-- Table structure for table `hadits_arbain`
--

CREATE TABLE `hadits_arbain` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `surah` int(11) NOT NULL,
  `nilai` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hadits_pilihan`
--

CREATE TABLE `hadits_pilihan` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `surah` int(11) NOT NULL,
  `nilai` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hafalan`
--

CREATE TABLE `hafalan` (
  `id_hafalan` int(11) NOT NULL,
  `jenis_hafalan` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `arab` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `artinya` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hafalan`
--

INSERT INTO `hafalan` (`id_hafalan`, `jenis_hafalan`, `judul`, `slug`, `arab`, `artinya`) VALUES
(1, 2, 'Sholat', 'sholat', 'مَثَلُ الصَّلَوَاتِ الخَمْصِ كَمَثَلِ نَهَرٍا\r\n', 'Permisalan shalat yang lima waktu itu seperti sebuah sungai yang mengalir melimpah di dekat pintu rumah salah seorang di antara kalian. Ia mandi dari air sungai itu setiap hari lima kali.'),
(2, 2, 'Sabar dan Maaf', 'sabar-dan-maaf', 'اَفْضَلُ الْاِيْمَانَ اَلصَّبْرُ وَالسَّمَاحَةِ', 'seutama-utama iman adalah sabar dan pemaaf'),
(3, 1, 'Doa Meminta Hujan', 'doa-meminta-hujan', 'اَللّٰهُمَّ اسْقِ عِبَادَكَ وَبَهَائِمَكَ وَانْشُرْ رَحْمَتَكَ وَأَحْيِ بَلَدَكَ الْمَيِّتَ', ''),
(4, 1, 'Doa Akan Tidur', 'doa-akan-tidur', 'بِاسْمِكَ اللهُمَّ أَمُوتُ وَأَحْيَا', ''),
(5, 1, 'Doa Bangun Tidur', 'doa-bangun-tidur', 'اَلْحَمْدُ ِللهِ الَّذِى أَحْيَانَا بَعْدَمَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ', ''),
(6, 1, 'Doa Mau Makan', 'doa-mau-makan', 'اَللّٰهُمَّ بَارِكْ لَنَا فِيمَا رَزَقْتَنَا وَقِنَا عَذَابَ النَّارِ', ''),
(7, 1, 'Doa Sesudah Makan', 'doa-sesudah-makan', 'اَلْحَمْدُالِلّهِ الَّذِيْ أَطْعَمَنَاوَ سَقَانَاوَ جَعَلَنَا مِنَ الْمُسْلِمِيْنَ', ''),
(8, 1, 'Doa Bercermin', 'doa-bercermin', 'اَللَّهُمَّ كَمَا حَسَّنْتَ خَلْقِي فَحَسِّنْ خُلُقِي', ''),
(9, 1, 'Doa Sesudah Wudhu', 'doa-sesudah-wudhu', 'أَشْهَدُ أَنْ لاَ إِلَهَ إِلاَّ اللَّهُ وَحْدَهُ لاَ شَرِيكَ لَهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ. اللَّهُمَّ اجْعَلْنِى مِنَ التَّوَّابِينَ وَاجْعَلْنِى مِنَ الْمُتَطَهِّرِينَ', ''),
(10, 1, 'Doa Kedua Orang Tua', 'doa-kedua-orang-tua', 'اللَّهُمَّ اغْفِرْ لِى وَلِوَ الِدَىَّ وَارْ حَمْهُمَا كَمَا رَبَّيَا نِى صَغِيْرًا', ''),
(11, 1, 'Doa Menjenguk Orang Sakit', 'doa-menjenguk-orang-sakit', 'لاَ بَأْسَ طَهُورٌ إِنْ شَاءَ اللَّهُ', ''),
(12, 1, 'Doa Masuk Masjid', 'doa-masuk-masjid', 'اَللّهُمَّ افْتَحْ لِيْ اَبْوَابَ رَحْمَتِكَ', ''),
(13, 1, 'Doa Keluar Masjid', 'doa-keluar-masjid', 'اَللهُمَّ اِنِّى اَسْأَلُكَ مِنْ فَضْلِكَ', ''),
(14, 1, 'Doa Belajar', 'doa-belajar', 'رَبِّيْ زِدْنِي عِلْمًا نَافِعًا وَرْزُقْنِيْ فَهْمًا', ''),
(15, 1, 'Doa Berbuka Puasa', 'doa-berbuka-puasa', 'ذَهَبَ الظَّمَأُ وابْتَلَّتِ الْعُرُوقُ وثَبَتَ اْلأَجْرُ إِنْ شَاءَاللهُ', ''),
(16, 1, 'Doa Berpakaian', 'doa-berpakaian', 'اللّٰهُمَّ إِنِّي أَسْأَلُكَ مِنْ خَيْرِهِ وَخَيْرِ مَاهُوَلَهُ وَأَعُوْذُبِكَ مِنْ شَرِّهِ وَشَرِّ مَاهُوَلَهُ', ''),
(17, 1, 'Doa Masuk Kamar Mandi', 'doa-masuk-kamar-mandi', 'اَللّٰهُمَّ اِنِّيْ اَعُوْذُبِكَ مِنَ الْخُبُثِ وَالْخَبَآئِثِ', ''),
(18, 1, 'Doa Keluar Kamar Mandi', 'doa-keluar-kamar-mandi', 'غُفْرَانَكَ', ''),
(19, 1, 'Doa keluar Rumah', 'doa-keluar-rumah', 'بِسْمِ اللَّهِ تَوَكَّلْتُ عَلَى اللَّهِ لاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللَّهِ', ''),
(20, 1, 'Doa Kebaikan Dunia Akhirat', 'doa-kebaikan-dunia-akhirat', 'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ', ''),
(21, 1, 'Doa Naik Kendaraan', 'doa-naik-kendaraan', 'سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ . وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ', ''),
(22, 1, 'Doa Ketika Turun Hujan', 'doa-ketika-turun-hujan', 'اَللّٰهُمَّ صَيِّبًا نَافِعًا', ''),
(23, 1, 'Doa Ketika Mendengar Petir', 'doa-ketika-mendengar-petir', 'اَللّٰهُمَّ لَاتَقْتُلْنَا بَغَضَبِكَ وَلَا تَهْلِكْنَا بِعَذَابِكَ وَعَافِنَا ذٰلِكَ', ''),
(24, 1, 'Doa Ketika Ada Angin Kencang', 'doa-ketika-ada-angin-kencang', 'اللَّهُمَّ إِنِّى أَسْأَلُكَ خَيْرَهَا وَخَيْرَ مَا فِيهَا وَخَيْرَ مَا أُرْسِلَتْ بِهِ, وَأَعُوذُ بِكَ مِنْ شَرِّهَا وَشَرِّ مَا فِيهَا وَشَرِّ مَا أُرْسِلَتْ بِهِ', 'Ya Allah, sesungguhnya aku mohon kepada-Mu kebaikan angin ini, dan aku berlindung kepada-Mu dari kejelekannya.'),
(25, 1, 'Doa Ketika Marah', 'doa-ketika-marah', 'اَللّٰهُمَّ اغْفِرْلِىْ ذَنْبِىْ وَاذْهِبْ غَيْظَ قَلْبِىْ وَاَجِرْنِىْ مِنَ الشَّيْطَانِ', ''),
(26, 1, 'Doa Ketika Tertimpa Musibah', 'doa-ketika-tertimpa-musibah', 'إنّاَ لِلّٰهِ وإنَّا إِلَيْهِ رَاجِعُونَ اللَّهُمَّ أَجِرْنِي فِي مُصِيبَتِي وَأَخْلِفْ لِي خَيْراً مِنْهَا', ''),
(27, 1, 'Doa Ketika Kagum', 'doa-ketika-kagum', 'مَا شَاءَ اللَّهُ', ''),
(28, 1, 'Doa Sesudah Adzan', 'doa-sesudah-adzan', 'اَللّٰهُمَّ رَبَّ هَذِهِ الدَّعْوَةِ التَّآمَّةِ وَالصَّلاَةِ الْقَآئِمَةِ آتِ مُحَمَّدَانِ الْوَسِيْلَةَ وَالْفَضِيْلَةَ وَالشَّرَفَ وَالدَّرَجَةَ الْعَالِيَةَ الرَّفِيْعَةَ وَابْعَثْهُ مَقَامًامَحْمُوْدَانِ الَّذِىْ وَعَدْتَهُ اِنَّكَ لاَتُخْلِفُ الْمِيْعَادَ', 'Ya Allah, Rabb pemilik seruan yang sempurna ini (adzan), dan sholat yang ditekgakkan, berikan lah kepada Nabi Muhammad al-wasilah (kedudukan mulia di sisi-Mu) dan keutamaan, dirikan untuknya tempat terpuji seperti yang telah Engkau janjikan kepadanya.'),
(29, 1, 'Doa Ziarah Kubur', 'doa-ziarah-kubur', 'اَلسَّلَامُ عَلَيْكُمْ يَا أَهْلَ الدِّيَارِ مِنَ الْمُؤْمِنِيْنَ وَالْمُسْلِمِيْنَ وَإِنَّا إِنْ شَاءَ اللّٰهُ لَلاَحِقُوْنَ', ''),
(30, 2, 'Senyum Shodaqoh', 'senyum-shodaqoh', 'تَبَسَّمُكَ فِى وَجْه اَخِيْكَ صَدَقَةِ', 'Senyummu di hadapan saudaramu (sesama muslim) adalah bernilai sedekah'),
(31, 2, 'Berita Baik', 'berita-baik', 'قُلِ الْحَقَّ وَلَوْكَانَ مُرَّا', 'katakanlah kebenaran itu walaupun pahit.'),
(32, 2, 'Surga Di Bawah Kaki Ibu', 'surga-dibawah-kaki-ibu', 'اَلْجَنَّةُ تَحْتَ اَقْدَمِ الْاُمَّهَاتِ', 'Surga di bawah telapak kaki ibu'),
(33, 2, 'Keutamaan Salam', 'keutamaan-salam', 'اَفْشُوْ السَّلَامَ بَيْنَكُمْ', 'Sebarkanlah salam, niscaya kalian akan selamat'),
(34, 2, 'Memutus Silaturrahim', 'memutus-silaturrahim', 'لَايَدْخُلُ الْجَنَّةُ قَاطِعً. يَعْنِي قَاطِعَ رَحِمٍ', 'Tidak akan masuk surga pemutus tali persaudaraan'),
(35, 2, 'Masjid Rumah Muslim', 'masjid-rumah-muslim', 'اَلْمَسْجِدُ بَيْتُ كُلَّ مُؤْمِنٍ', 'Masjid adalah rumah tiap mu’min'),
(36, 2, 'Wajib Menuntut Ilmu', 'wajib-menuntut-ilmu', 'اُطْلُبُوْ الْعِلْمُ مِنَ الْمَهْدِ اِلَي الْلَحْدِ', 'Tuntutlah ilmu sejak dari buaian sampai liang lahat'),
(37, 2, 'Menutup Aurat', 'menutup-aurat', 'اِنَّا نَهِيْنَا اَنْ تُرَ عَوْرَاتُنَا', 'Sesungguhnya kita dilarang menampakkan aurot kita'),
(38, 2, 'Kebersihan', 'kebersihan', 'الطُّهُورُ شَطْرُ الإِيْمَانِ', 'Kebersihan adalah sebagian dari iman'),
(39, 2, 'Berbuat Baik', 'berbuat-baik', 'كُلُّ مَعْرُوْفٍ صَدَقَةٌ', 'Setiap perbuatan baik merupakan sedekah'),
(40, 2, 'Jangan Suka Marah', 'jangan-suka-marah', 'لَا تَغْضَبْ وَ لَكَ الْجَنَّةُ', 'Janganlah engkau marah, niscaya bagimu surga'),
(41, 2, 'Adab Makan', 'adab-makan', 'لَا يَشْرَبَنَ اَحَدُكُمْ قَائِمًا', 'Janganlah sekali-kali salah seorang di antara kalian minum sambil berdiri'),
(42, 2, 'Malu Sebagian Dari Iman', 'malu-sebagian-dari-iman', 'الْحَيَاءُ مِنَ الْإِيْمِانِ', 'Sesungguhnya Malu itu adalah sebagian daripada Iman'),
(43, 2, 'Keutamaan Alqur\'an', 'keutamaan-alquran', 'خَيْرُكُمْ مَنْ تَعَلَّمَ اْلقُرْآنَ وَعَلَّمَهُ', 'Sebaik-baik orang di antata kamu adalah orang yang belajar Alquran dan mengajarkannya.'),
(44, 2, 'Orang Mulia', 'orang-mulia', 'أَكْرَمُ النَّاسِ أَتْقَاهُمْ ', 'Orang yang paling mulia diantara kamu adalah yang paling bertakwa'),
(45, 2, 'Allah Suka Keindahan', 'allah-suka-keindahan', 'إِنَّ اللَّهَ جَمِيلٌ يُحِبُّ الْجَمَالَ', 'Sesungguhnya allah itu indah dan mencintai keindahan'),
(46, 2, 'Larangan Sombong', 'larangan-sombong', 'لَا يَدْخُلُ الْجَنَّةَ مَنْ كَانَ فِي قَلْبِهِ مِثْقَالَ ذَرَّةٍ مِنْ كِبْرٍ', 'Tidak akan masuk surga orang yang di dalam hatinya terdapat seberat biji (sawi) dari sifat kesombongan'),
(47, 2, 'Terima Kasih', 'terima-kasih', 'وَمَنْ لَمْ يَشْكُرِ النَّاسَ لَمْ يَشْكُرِ اللّٰهَ', 'Siapa yang tidak mensyukuri manusia maka dia tidak mensyukuri Allah'),
(48, 2, 'Mencintai Saudara', 'mencintai-saudara', 'لَا يُؤْمِنُ أَحَدُكُمْ حَتَّى يُحِبَّ لِأَخِيْهِ مَا يُحِبُّ لِنَفْسِهِ', 'Tidaklah sempurna iman seseorang di antara kalian, sampai ia mencintai untuk saudaranya sesuatu yang ia cintai untuk dirinya sendiri'),
(49, 2, 'Muslim Bersaudara', 'muslim-bersaudara', 'الْمُسْلِمُ أَخُو الْمُسْلِمِ لَا يَظْلِمُهُ وَلَا يُسْلِمُهُ', 'Seorang muslim itu saudara bagi muslim yang lainnya, tidak menzaliminya dan tidak membiarkannya (dizalimi).'),
(50, 2, 'Memuliakan Tamu', 'memuliakan-tamu', 'مَنْ كَانَ يُؤْمِنُ بِاللهِ وَالْيَوْمِ الآخِرِ فَلْيُكْرِمْ ضَيْفَهُ', 'Siapa yang beriman kepada Allah dan hari akhir maka muliakanlah tamunya');

-- --------------------------------------------------------

--
-- Table structure for table `harilibur`
--

CREATE TABLE `harilibur` (
  `id` int(11) NOT NULL,
  `tanggal_awal` date NOT NULL,
  `tanggal_akhir` date DEFAULT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hari_efektif`
--

CREATE TABLE `hari_efektif` (
  `id_hari` int(11) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `hari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `id_pegawai`
--

CREATE TABLE `id_pegawai` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `ptk_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ijazah`
--

CREATE TABLE `ijazah` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `nama` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ijin_ptk`
--

CREATE TABLE `ijin_ptk` (
  `id` int(11) NOT NULL,
  `tanggal_awal` date NOT NULL,
  `tanggal_akhir` date NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indikator`
--

CREATE TABLE `indikator` (
  `id_indikator` int(11) NOT NULL,
  `kd_komp` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `nama_indikator` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `indikator`
--

INSERT INTO `indikator` (`id_indikator`, `kd_komp`, `kd_indikator`, `nama_indikator`) VALUES
(1, 1, 1, 'Guru dapat mengidentifikasi karekteristik belajar setiap peserta didik di kelasnya'),
(2, 1, 2, 'Guru memastikan bahwa semua peserta didik mendapatkan kesempatan yang sama untuk berpartisipasi aktif dalam kegiatan pembelajaran'),
(3, 1, 3, 'Guru dapat mengatur kelas untuk memberikan kesempatan belajar yang sama pada semua peserta didik dengan kelainan fisik dan kemampuran belajar yang berbeda'),
(4, 1, 4, 'Guru mencoba mengetahui penyebab penyimpangan perilaku peserta didik untuk mencegah agar perilaku tersebut tidak merugikan peserta didik lainnya.'),
(5, 1, 5, 'Guru membantu mengembangkan potensi dan mengatasi kekurangan peserta didik'),
(6, 1, 6, 'Guru memperhatikan peserta didik dengan kelemahan fisik tertentu agar dapat mengikuti aktivitas pembelajaran, sehingga peserta didik termarginalkan (tersisih, diolok-olok, minder, dsb)'),
(7, 2, 1, 'Guru memberi kesempatan kepada peserta didik untuk menguasai materi pembelajaran sesuai usia dan kemampuan belajarnya melalui pengaturan proses pembelajaran dan aktivitas yang bervariasi'),
(8, 2, 2, 'Guru selalu memastikan tingkat pemahaman peserta didik terhadap materi pembelajaran tertentu dan menyesuaikan aktivitas pembelajaran berikutnya berdasarkan tingkat pemahaman tersebut'),
(9, 2, 3, 'Guru dapat menjelaskan alasan pelaksanaan kegiatan/aktivitas yang dilakukan, baik yang sesuai maupun yang berbeda dengan rencana, terkait keberhasilan pembelajaran'),
(10, 2, 4, 'Guru menggunakan berbagai teknik untuk memotivasi kemauan belajar peserta didik'),
(11, 2, 5, 'Guru merencanakan kegiatan pembelajaran yang saling terkait satu sama lain, dengan memperhatikan tujuan pembelajaran maupun proses belajar peserta didik.'),
(12, 2, 6, 'Guru memperhatikan respon peserta didik yang belum/kurang memahami materi pembelajaran yang diajarkan dan menggunakannya untuk memperbaiki rancangan pembelajaran berikutnya.'),
(13, 3, 1, 'Guru dapat menyusun silabus yang sesuai dengan kurikulum'),
(14, 3, 2, 'Guru merancang rencana pembelajaran yang sesuai dengan silabus untuk memahami materi ajar tertentu agar pesrta didik dapat mencapai kompetensi dasar yang ditetapkan.'),
(15, 3, 3, 'Guru mengikuti urutan materi pembelajaran dengan memperhatikan tujuan pembelajaran'),
(16, 3, 4, 'Guru memilih materi pembelajaran yang : a) sesuai dengan tujuan pembelajaran, b) tepat dan mutakhir, c) sesuai dengan usia dan tingkat kemampuan belajar peserta didik, dan d) dapat dilaksanakan di kelas, e) sesuai dengan konteks kehidupan sehari-hari peserta didik.'),
(17, 4, 1, 'Guru melaksanakan aktivitas pembelajaran sesuai dengan rancangan yang telah disusun secara lengkap dan pelaksanaan aktivitas tersebut mengindikasikan bahwa guru\r\nmengerti tentang tujuannya.'),
(18, 4, 2, 'Guru melaksanakan aktivitas pembelajaran yang bertujuan untuk membantu proses belajar peserta didik, bukan untuk menguji sehingga membuat peserta didik merasa tertekan.'),
(19, 4, 3, 'Guru mengkomunikasikan informasi baru (misalnya materi tambahan) sesuai dengan usia dan tingkat kemampuan belajar peserta didik'),
(20, 4, 4, 'Guru menyikapi kesalahan yang dilakukan peserta didik sebagai tahapan proses pembelajaran, bukan semata-mata kesalahan yang harus dikoreksi. Misalnya dengan mengetahui terlebih dahulu peserta didik yang lain yang setuju dan tidak setuju dengan jawaban tersebut, sebelum memberikan penjelasan tentang jawaban yang benar'),
(21, 4, 5, 'Guru melaksanakan kegiatan pembelajaran sesuai isi kurikulum dan mengkaitkannya dengan konteks kehidupan sehari-hari peserta didik.'),
(22, 4, 6, 'Guru melaksanakan aktivitas pembelajaran secara bervariasi dengan waktu yang cukup untuk kegiatan pembelajaran yang sesuai dengan usia dan tingkat kemampuan belajar dan memperhatikan peserta didik'),
(23, 4, 7, 'Guru mengelola kelas dengan efektif tanpa mendominasi atau sibuk dengan kegiatannya sendiri agar semua waktu peserta dapat termanfaatkan secara produktif'),
(24, 4, 8, 'Guru mampu menyesuaikan aktivitas pembelajaran yang dirancang dengan kondisi kelas.'),
(25, 4, 9, 'Guru memberikan banyak kesempatan kepada peserta didik untuk bertanya, mempraktekan dan berinteraksi dengan peserta didik lain.'),
(26, 4, 10, 'Guru mengatur pelaksanaan aktivitas pembelajaran secara sistematis untuk membantu proses belajar peserta didik. Sebagai contoh :  guru menambahkan informasi baru setelah mengevaluasi pemahaman peserta didik terhadap materi sebelumnya.'),
(27, 4, 11, 'Guru menggunakan alat bantu mengajar, dan/atau audiovisual (termasuk TIK) untuk meningkatkan motivasi belajar peserta didik dalam mencapai tujuan pembelajaran.'),
(28, 5, 1, 'Guru  menganalisis  hasil  belajar  berdasarkan  segala  bentuk penilaian terhadap setiap peserta didik untuk mengetahui tingkat kemajuan masingmasing.'),
(29, 5, 2, 'Guru merancang dan melaksanakan aktivitas pembelajaran yang mendorong peserta didik untuk belajar sesuai dengan kecakapan dan pola belajar masing-masing.'),
(30, 5, 3, 'Guru merancang dan melaksanakan aktivitas pembelajaran untuk memunculkan daya kreativitas dan kemampuan berfikir kritis peserta didik.'),
(31, 5, 4, 'Guru  secara  aktif  membantu  peserta  didik  dalam  proses pembelajaran  dengan  memberikan  perhatian  kepada  setiap individu.'),
(32, 5, 5, 'Guru dapat mengidentifikasi dengan benar tentang bakat, minat, potensi, dan kesulitan belajar masing-masing peserta didik.'),
(33, 5, 6, 'Guru memberikan kesempatan belajar kepada peserta didik sesuai dengan cara belajarnya masing-masing.'),
(34, 5, 7, 'Guru memusatkan perhatian pada interaksi dengan peserta didik dan mendorongnya untuk memahami dan menggunakan informasi yang disampaikan.'),
(35, 6, 1, 'Guru menggunakan pertanyaan untuk mengetahui pemahaman dan menjaga partisipasi peserta didik, termasuk memberikan pertanyaan terbuka yang menuntut peserta didik untuk menjawab dengan ide dan pengetahuan mereka.'),
(36, 6, 2, 'Guru  memberikan  perhatian  dan  mendengarkan  semua pertanyaan dan tanggapan peserta didik, tanpa menginterupsi, kecuali jika diperlukan untuk membantu atau mengklarifikasi pertanyaan/tanggapan tersebut.'),
(37, 6, 3, 'Guru menanggapinya pertanyaan peserta didik secara tepat, benar,  dan  mutakhir,  sesuai  tujuan  pembelajaran  dan  isi kurikulum, tanpa mempermalukannya.'),
(38, 6, 4, 'Guru menyajikan kegiatan pembelajaran yang dapat menumbuhkan kerja sama yang baik antar peserta didik.'),
(39, 6, 5, 'Guru mendengarkan dan memberikan perhatian terhadap semua jawaban peserta didik baik yang benar maupun yang dianggap salah untuk mengukur tingkat pemahaman peserta didik.'),
(40, 6, 6, 'Guru memberikan perhatian terhadap pertanyaan peserta didik dan  meresponnya  secara  lengkap  dan relevan untuk menghilangkan kebingungan pada peserta didik.'),
(41, 7, 1, 'Guru  menyusun  alat  penilaian  yang  sesuai  dengan  tujuan pembelajaran untuk mencapai kompetensi tertentu seperti yang tertulis dalam RPP.'),
(42, 7, 2, 'Guru melaksanakan penilaian dengan berbagai teknik dan jenis penilaian, selain penilaian formal yang dilaksanakan sekolah, dan mengumumkan hasil serta implikasinya kepada peserta didik, tentang tingkat pemahaman terhadap materi pembelajaran yang telah dan akan dipelajari.'),
(43, 7, 3, 'Guru  menganalisis  hasil  penilaian  untuk  mengidentifikasi topik/kompetensi dasar yang sulit sehingga diketahui kekuatan dan kelemahan masing-masing peserta didik untuk keperluan remedial dan pengayaan.'),
(44, 7, 4, 'Guru   memanfaatkan   masukan   dari   peserta   didik   dan merefleksikannya untuk meningkatkan pembelajaran selanjutnya, dan dapat membuktikannya melalui catatan, jurnal pembelajaran, rancangan pembelajaran, materi tambahan, dan sebagainya.'),
(45, 7, 5, 'Guru memanfatkan hasil penilaian sebagai bahan penyusunan rancangan pembelajaran yang akan dilakukan selanjutnya.'),
(46, 8, 1, 'Guru menghargai dan mempromosikan prinsip-prinsip Pancasila sebagai dasar ideologi dan etika bagi semua warga Indonesia.'),
(47, 8, 2, 'Guru mengembangkan kerjasama dan membina kebersamaan dengan teman sejawat tanpa memperhatikan perbedaan yang ada (misalnya: suku, agama, dan gender).'),
(48, 8, 3, 'Guru saling menghormati dan menghargai teman sejawat sesuai dengan kondisi dan keberadaan masing-masing.'),
(49, 8, 4, 'Guru  memiliki  rasa persatuan  dan  kesatuan sebagai  bangsa Indonesia.'),
(50, 8, 5, 'Guru mempunyai pandangan yang luas tentang keberagaman bangsa Indonesia (misalnya: budaya, suku, agama).'),
(51, 9, 1, 'Guru bertingkah laku sopan dalam berbicara, berpenampilan, dan berbuat terhadap semua  peserta didik, orang tua, dan teman sejawat.'),
(52, 9, 2, 'Guru mau membagi pengalamannya dengan teman sejawat, termasuk mengundang mereka untuk mengobservasi cara mengajarnya dan memberikan masukan.'),
(53, 9, 3, 'Guru mampu mengelola pembelajaran yang membuktikan bahwa guru dihormati oleh peserta didik, sehingga semua peserta didik selalu memperhatikan guru dan berpartisipasi aktif dalam proses pembelajaran.'),
(54, 9, 4, 'Guru bersikap dewasa dalam menerima masukan dari peserta didik dan memberikan kesempatan kepada peserta didik untuk berpartisipasi dalam proses pembelajaran.'),
(55, 9, 5, 'Guru berperilaku baik untuk mencitrakan nama baik sekolah.'),
(56, 10, 1, 'Guru mengawali dan mengakhiri pembelajaran dengan tepat waktu'),
(57, 10, 2, 'Jika guru harus meninggalkan kelas, guru mengaktifkan siswa dengan  melakukan produktif terkait  dengan mata  pelajaran, dan meminta guru piket atau guru lain untuk mengawasi kelas'),
(58, 10, 3, 'Guru memenuhi jam mengajar dan dapat melakukan semua kegiatan lain di luar jam mengajar berdasarkan ijin dan persetujuan pengelola sekolah'),
(59, 10, 4, 'Guru meminta ijin dan  memberitahu  lebih  awal,  dengan memberikan alasan dan bukti yang sah jika tidak menghadiri kegiatan yang telah direncanakan, termasuk proses pembelajaran di kelas'),
(60, 10, 5, 'Guru menyelesaikan semua tugas  administrasi dan non pembelajaran dengan tepat waktu sesuai standar yang ditetapkan.'),
(61, 10, 6, 'Guru memanfaatkan waktu luang selain mengajar untuk kegiatan yang produktif terkait dengan tugasnya.'),
(62, 10, 7, 'Guru memberikan kontribusi terhadap pengembangan sekolah dan mempunyai prestasi yang berdampak positif terhadap nama baik sekolah.'),
(63, 10, 8, 'Guru merasa bangga dengan profesinya sebagai guru.'),
(64, 11, 1, 'Guru  memperlakukan  semua  peserta  didik  secara  adil, memberikan perhatian dan bantuan sesuai kebutuhan masing-masing, tanpa memperdulikan faktor personal.'),
(65, 11, 2, 'Guru menjaga hubungan baik dan peduli dengan teman sejawat (bersifat inklusif), serta berkontribusi  positif terhadap semua diskusi formal dan informalterkait dengan pekerjaannya.'),
(66, 11, 3, 'Guru  sering  berinteraksi  dengan  peserta  didik  dan  tidak membatasi  perhatiannya  hanya  pada  kelompok  tertentu (misalnya: peserta didik yang pandai, kaya, berasal dari daerah yang sama dengan guru).'),
(67, 12, 1, 'Guru menyampaikan informasi tentang kemajuan, kesulitan, dan potensi peserta didik kepada orang tuanya, baik dalam pertemuan formal maupun tidak formal antara guru dan orang tua, teman sejawat, dan dapat menunjukkan buktinya.'),
(68, 12, 2, 'Guru ikut berperan aktif dalam kegiatan di luar pembelajaran yang diselenggarakan  oleh  sekolah  dan  masyarakat  dan  dapat memberikan bukti keikutsertaannya.'),
(69, 12, 3, 'Guru memperhatikan sekolah sebagai bagian dari masyarakat, berkomunikasi dengan masyarakat sekitar, serta berperan dalam  kegiatan sosial di masyarakat.'),
(70, 13, 1, 'Guru melakukan pemetaan standar kompetensi dan kompetensi dasar   untuk   mata   pelajaran   yang   diampunya,   untuk mengidentifikasi  materi  pembelajaran  yang  dianggap  sulit, melakukan perencanaan dan pelaksanaan pembelajaran, dan memperkirakan alokasi waktu yang diperlukan.'),
(71, 13, 2, 'Guru menyertakan informasi yang tepat dan mutakhir di dalam perencanaan dan pelaksanaan pembelajaran.'),
(72, 13, 3, 'Guru   menyusun   materi,   perencanaan   dan pelaksanaan pembelajaran yang berisi informasi yang tepat, mutakhir, dan yang membantu  peserta  didik  untuk  memahami  konsep  materi pembelajaran.'),
(73, 14, 1, 'Guru melakukan  evaluasi  diri  secara  spesifik,  lengkap, dan didukung dengan contoh pengalaman diri sendiri.'),
(74, 14, 2, 'Guru memiliki jurnal pembelajaran, catatan masukan dari kolega atau hasil penilaian proses pembelajaran sebagai bukti yang menggambarkan kinerjanya.'),
(75, 14, 3, 'Guru   memanfaatkan   bukti   gambaran   kinerjanya   untuk mengembangkan perencanaan dan pelaksanaan pembelajaran selanjutnya   dalam   program   Pengembangan   Keprofesian Berkelanjutan (PKB).'),
(76, 14, 4, 'Guru dapat mengaplikasikan pengalaman PKB dalam perencanaan, pelaksanaan, penilaian pembelajaran dan tindak lanjutnya.'),
(77, 14, 5, 'Guru melakukan  penelitian,  mengembangkan  karya  inovasi, mengikuti kegiatan ilmiah (misalnya seminar, konferensi), dan aktif dalam melaksanakan PKB.'),
(78, 14, 6, 'Guru dapat  memanfaatkan TIK dalam berkomunikasi dan pelaksanaan PKB');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `jenis` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwalku`
--

CREATE TABLE `jadwalku` (
  `jadwal_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(11) NOT NULL,
  `nama` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama`) VALUES
(1, 'kabupaten'),
(2, 'kota'),
(3, 'kelurahan'),
(4, 'desa'),
(1, 'kabupaten'),
(2, 'kota'),
(3, 'kelurahan'),
(4, 'desa');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_ptk`
--

CREATE TABLE `jenis_ptk` (
  `jenis_ptk_id` int(11) NOT NULL,
  `jenis_ptk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jenis_ptk`
--

INSERT INTO `jenis_ptk` (`jenis_ptk_id`, `jenis_ptk`) VALUES
(5, 'Tenaga Administrasi'),
(6, 'Guru Inklusi'),
(11, 'Operator Sekolah'),
(13, 'Guru Magang'),
(40, 'Pustakawan'),
(94, 'Guru Bahasa Inggris'),
(95, 'Guru Penjaskes'),
(96, 'Guru Pendidikan Agama'),
(97, 'Guru Pendamping'),
(98, 'Guru Kelas'),
(99, 'Kepala Sekolah');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_tunggakan`
--

CREATE TABLE `jenis_tunggakan` (
  `id_tunggakan` int(11) NOT NULL,
  `nama_tunggakan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jenis_tunggakan`
--

INSERT INTO `jenis_tunggakan` (`id_tunggakan`, `nama_tunggakan`) VALUES
(1, 'Infaq Bulanan'),
(2, 'Seragam Sekolah'),
(3, 'Buku Pelajaran'),
(4, 'Psikotest'),
(5, 'Uang Bangunan'),
(7, 'Biaya Pendaftaran'),
(8, 'Tunggakan Tahun Lalu'),
(9, 'PAS'),
(10, 'UJIAN MADRASAH'),
(11, 'Ujian Sekolah'),
(12, 'PAT'),
(14, 'Biaya Manasik Haji'),
(15, 'STUDY TOUR');

-- --------------------------------------------------------

--
-- Table structure for table `jenjang`
--

CREATE TABLE `jenjang` (
  `kd_jenjang` int(11) NOT NULL,
  `nama_jenjang` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jenjang`
--

INSERT INTO `jenjang` (`kd_jenjang`, `nama_jenjang`) VALUES
(0, ''),
(38, 'Guru Pertama, Penata Muda Tk. I, III/b'),
(42, 'Guru Pertama, Penata Muda, III/a'),
(81, 'Guru Muda, Penata, III/c');

-- --------------------------------------------------------

--
-- Table structure for table `jenjang_pendidikan`
--

CREATE TABLE `jenjang_pendidikan` (
  `id_jenjang` int(11) NOT NULL,
  `nama_jenjang` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jenjang_pendidikan`
--

INSERT INTO `jenjang_pendidikan` (`id_jenjang`, `nama_jenjang`) VALUES
(0, 'Belum Sekolah'),
(1, 'SD'),
(2, 'SMP'),
(3, 'SMA'),
(4, 'D1'),
(5, 'D2'),
(6, 'D3'),
(7, 'S1'),
(8, 'S2');

-- --------------------------------------------------------

--
-- Table structure for table `jns_daftar`
--

CREATE TABLE `jns_daftar` (
  `id_jns_daftar` int(11) NOT NULL,
  `nama_jns_daftar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jns_daftar`
--

INSERT INTO `jns_daftar` (`id_jns_daftar`, `nama_jns_daftar`) VALUES
(1, 'Siswa Baru'),
(2, 'Pindahan');

-- --------------------------------------------------------

--
-- Table structure for table `jns_mutasi`
--

CREATE TABLE `jns_mutasi` (
  `id_mutasi` int(11) NOT NULL,
  `nama_mutasi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jns_mutasi`
--

INSERT INTO `jns_mutasi` (`id_mutasi`, `nama_mutasi`) VALUES
(0, 'Mutasi Keluar'),
(1, 'Aktif'),
(3, 'Dikeluarkan'),
(4, 'Mengundurkan Diri'),
(5, 'Wafat'),
(6, 'Hilang'),
(7, 'Lulus'),
(17, 'Lainnya'),
(99, 'Calon Siswa Baru');

-- --------------------------------------------------------

--
-- Table structure for table `jns_tinggal`
--

CREATE TABLE `jns_tinggal` (
  `id_jns_tinggal` int(11) NOT NULL,
  `nama_jns_tinggal` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jns_tinggal`
--

INSERT INTO `jns_tinggal` (`id_jns_tinggal`, `nama_jns_tinggal`) VALUES
(1, 'Bersama Orang Tua'),
(2, 'Wali'),
(3, 'Kost'),
(4, 'Asrama'),
(5, 'Panti Asuhan'),
(9, 'Lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `juzamma`
--

CREATE TABLE `juzamma` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `juzamma`
--

INSERT INTO `juzamma` (`id`, `nama`) VALUES
(1, 'AL FATIHAH'),
(2, 'AN NAS'),
(3, 'AL FALAQ'),
(4, 'AL IKHLAS'),
(5, 'AL LAHAB'),
(6, 'AN NASR'),
(7, 'AL KAFIRUUN'),
(8, 'AL KAUTSAR'),
(9, 'AL MAUN'),
(10, 'AL QURAISY'),
(11, 'AL FIIL'),
(12, 'AL HUMAZAH'),
(13, 'AL \'ASR'),
(14, 'AT TAKATSUR'),
(15, 'AL QORIAH'),
(16, 'AL ADIYAT'),
(17, 'AL ZALZALAH'),
(18, 'AL BAYINAH'),
(19, 'AL QODR'),
(20, 'AL ALAQ'),
(21, 'AT TIN'),
(22, 'AL INSYIRAH'),
(23, 'AD DHUHA'),
(24, 'AL LAIL'),
(25, 'ASY SYAMS'),
(26, 'AL BALAD'),
(27, 'AL FAJR'),
(28, 'AL GHOSIYAH'),
(29, 'AL A\'LA'),
(30, 'AT TARIQ'),
(31, 'AL BURUUJ'),
(32, 'AL INSYIQOQ'),
(33, 'AL MUTAFFIFIN'),
(34, 'AL INFITAR'),
(35, 'AT TAKWIR'),
(36, 'ABATSA'),
(37, 'AN NAZI\'AT'),
(38, 'AN NABA');

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten`
--

CREATE TABLE `kabupaten` (
  `id` char(4) NOT NULL,
  `id_provinsi` char(20) NOT NULL,
  `nama` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kabupaten`
--

INSERT INTO `kabupaten` (`id`, `id_provinsi`, `nama`) VALUES
('3212', '32', 'Indramayu');

-- --------------------------------------------------------

--
-- Table structure for table `kd`
--

CREATE TABLE `kd` (
  `id_kd` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `aspek` int(11) NOT NULL,
  `mapel` int(11) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `nama_kd` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kd_sosial`
--

CREATE TABLE `kd_sosial` (
  `ids` int(11) NOT NULL,
  `komp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kd_sosial`
--

INSERT INTO `kd_sosial` (`ids`, `komp`) VALUES
(1, 'Jujur'),
(2, 'Disiplin'),
(3, 'Tanggung Jawab'),
(4, 'Santun'),
(5, 'Peduli'),
(6, 'Percaya Diri');

-- --------------------------------------------------------

--
-- Table structure for table `kd_spirit`
--

CREATE TABLE `kd_spirit` (
  `ids` int(11) NOT NULL,
  `komp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kd_spirit`
--

INSERT INTO `kd_spirit` (`ids`, `komp`) VALUES
(1, 'Ketaatan Beribadah'),
(2, 'Berdoa sebelum dan sesudah melakukan kegiatan'),
(3, 'Sikap Toleransi dalam beribadah'),
(4, 'Berprilaku Syukur');

-- --------------------------------------------------------

--
-- Table structure for table `keahlian`
--

CREATE TABLE `keahlian` (
  `idke` int(11) NOT NULL,
  `keahlian` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `keahlian`
--

INSERT INTO `keahlian` (`idke`, `keahlian`) VALUES
(1, 'Guru Kelas SD'),
(2, 'Guru Mata Pelajaran');

-- --------------------------------------------------------

--
-- Table structure for table `keb_khusus`
--

CREATE TABLE `keb_khusus` (
  `id_keb_khusus` int(11) NOT NULL,
  `nama_keb_khusus` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `keb_khusus`
--

INSERT INTO `keb_khusus` (`id_keb_khusus`, `nama_keb_khusus`) VALUES
(0, 'Tidak'),
(2, 'Netra'),
(3, 'Rungu'),
(4, 'Grahita Ringan'),
(5, 'Grahita Sedang'),
(6, 'Daksa Ringan'),
(7, 'Daksa Sedang'),
(8, 'Laras'),
(9, 'Wicara'),
(10, 'Tuna ganda'),
(11, 'Hiper aktif'),
(12, 'Cerdas istimewa'),
(13, 'Bakat istimewa'),
(14, 'Kesulitan belajar'),
(15, 'Narkoba'),
(16, 'Indigo'),
(17, 'Down Sindrome'),
(18, 'Autis'),
(19, 'Terpencil/Terbelakang (Bencana alam/sosial)'),
(21, 'Tidak mampu ekonomi');

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `id` char(10) NOT NULL,
  `id_kabupaten` char(10) NOT NULL,
  `nama` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`id`, `id_kabupaten`, `nama`) VALUES
('3212010', '3212', ' Haurgeulis'),
('3212011', '3212', ' Gantar'),
('3212020', '3212', ' Kroya'),
('3212030', '3212', ' Gabuswetan'),
('3212040', '3212', ' Cikedung'),
('3212041', '3212', ' Terisi'),
('3212050', '3212', ' Lelea'),
('3212060', '3212', ' Bangodua'),
('3212061', '3212', ' Tukdana'),
('3212070', '3212', ' Widasari'),
('3212080', '3212', ' Kertasemaya'),
('3212081', '3212', ' Sukagumiwang'),
('3212090', '3212', ' Krangkeng'),
('3212100', '3212', ' Karangampel'),
('3212101', '3212', ' Kedokan Bunder'),
('3212110', '3212', ' Juntinyuat'),
('3212120', '3212', ' Sliyeg'),
('3212130', '3212', ' Jatibarang'),
('3212140', '3212', ' Balongan'),
('3212150', '3212', ' Indramayu'),
('3212160', '3212', ' Sindang'),
('3212161', '3212', ' Cantigi'),
('3212162', '3212', ' Pasekan'),
('3212170', '3212', ' Lohbener'),
('3212171', '3212', ' Arahan'),
('3212180', '3212', ' Losarang'),
('3212190', '3212', ' Kandanghaur'),
('3212200', '3212', ' Bongas'),
('3212210', '3212', ' Anjatan'),
('3212220', '3212', ' Sukra'),
('3212221', '3212', ' Patrol');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id_keg` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` int(11) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `nilai` varchar(1) NOT NULL,
  `ket` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kelulusan`
--

CREATE TABLE `kelulusan` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `nopes` varchar(21) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kip`
--

CREATE TABLE `kip` (
  `id_kip` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `no_kip` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kkm`
--

CREATE TABLE `kkm` (
  `id_kkm` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kkmku`
--

CREATE TABLE `kkmku` (
  `id_kkm` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `mapel` int(11) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `jenis` int(11) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `id_komentator` varchar(36) NOT NULL,
  `isi_komen` text NOT NULL,
  `tanggal_komen` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kompetensi`
--

CREATE TABLE `kompetensi` (
  `kd_komp` int(11) NOT NULL,
  `nama_komp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kompetensi`
--

INSERT INTO `kompetensi` (`kd_komp`, `nama_komp`) VALUES
(1, 'Mengenal Karakteristik Peserta Didik'),
(2, 'Menguasai teori belajar dan prinsip-prinsip pembelajaran yang mendidik'),
(3, 'Pengembangan Kurikulum'),
(4, 'Kegiatan Pembelajaran yang Mendidik'),
(5, 'Memahami dan mengembangkan potensi'),
(6, 'Komunikasi dengan peserta didik'),
(7, 'Penilaian dan evaluasi'),
(8, 'Bertindak sesuai dengan norma agama, hukum, sosial dan kebudayaan nasional Indonesia'),
(9, 'Menunjukkan pribadi yang dewasa dan teladan'),
(10, 'Etos  kerja,  tanggung  jawab  yang  tinggi,  dan  rasa  bangga menjadi guru'),
(11, 'Bersikap inklusif, bertindak objektif, serta tidak  Diskriminatif'),
(12, 'Komunikasi dengan sesama guru, tenaga pendidikan, orang tua peserta didik, dan masyarakat'),
(13, 'Penguasaan materi struktur konsep dan pola pikir keilmuan yang mendukung mata pelajaran yang diampu'),
(14, 'Mengembangkan keprofesian melalui tindakan reflektif');

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi`
--

CREATE TABLE `konfigurasi` (
  `id_conf` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `semester` int(11) NOT NULL,
  `maintenis` int(11) NOT NULL,
  `nama_sekolah` varchar(100) NOT NULL,
  `alamat_sekolah` varchar(100) NOT NULL,
  `image_login` varchar(200) NOT NULL,
  `versi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `konfigurasi`
--

INSERT INTO `konfigurasi` (`id_conf`, `tapel`, `semester`, `maintenis`, `nama_sekolah`, `alamat_sekolah`, `image_login`, `versi`) VALUES
(1, '2023/2024', 1, 0, 'SD Islam Al-Jannah', 'Jl. Raya Gabuswetan No. 1 Desa Gabuswetan Kec. Gabuswetan Indramayu', 'aljannah.png', '2023.c');

-- --------------------------------------------------------

--
-- Table structure for table `kurikulum`
--

CREATE TABLE `kurikulum` (
  `id_kurikulum` int(11) NOT NULL,
  `nama_kurikulum` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kurikulum`
--

INSERT INTO `kurikulum` (`id_kurikulum`, `nama_kurikulum`) VALUES
(1, 'KTSP'),
(2, 'Kurikulum 2013'),
(3, 'Kurikulum Merdeka');

-- --------------------------------------------------------

--
-- Table structure for table `lingkup_materi`
--

CREATE TABLE `lingkup_materi` (
  `id_lm` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `mapel` int(11) NOT NULL,
  `lm` varchar(2) NOT NULL,
  `nama_lm` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `logDate` datetime NOT NULL DEFAULT current_timestamp(),
  `activity` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loginattempts`
--

CREATE TABLE `loginattempts` (
  `IP` varchar(20) NOT NULL,
  `Attempts` int(11) NOT NULL,
  `LastLogin` datetime NOT NULL,
  `Username` varchar(65) DEFAULT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `loginattempts`
--

INSERT INTO `loginattempts` (`IP`, `Attempts`, `LastLogin`, `Username`, `ID`) VALUES
('::1', 3, '2023-08-18 08:37:34', 'faridah', 1);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `id` int(11) NOT NULL,
  `nama_kegiatan` text NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `maintenance`
--

INSERT INTO `maintenance` (`id`, `nama_kegiatan`, `tanggal`) VALUES
(1, 'Maintenance', '2022-12-16'),
(2, 'Open Server', '2023-01-09');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` int(11) NOT NULL,
  `kd_mapel` varchar(4) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `kd_mapel`, `nama_mapel`) VALUES
(1, 'PAI', 'Pendidikan Agama dan Budi Pekerti'),
(2, 'PKn', 'Pendidikan Pancasila dan Kewarganegaraan'),
(3, 'BIN', 'Bahasa Indonesia'),
(4, 'MTK', 'Matematika'),
(5, 'IPA', 'Ilmu Pengetahuan Alam'),
(6, 'IPS', 'Ilmu Pengetahuan Sosial'),
(7, 'SBK', 'Seni Budaya dan Prakarya'),
(8, 'PJK', 'Pendidikan Jasmani Olahraga dan Kesehatan'),
(9, 'BID', 'Bahasa Indramayu'),
(10, 'BIG', 'Bahasa Inggris'),
(11, 'PBP', 'Pendidikan Budi Pekerti');

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `id_mapel` int(11) NOT NULL,
  `kd_mapel` varchar(4) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`id_mapel`, `kd_mapel`, `nama_mapel`) VALUES
(1, 'PAI', 'Pendidikan Agama Islam dan Budi Pekerti'),
(2, 'PP', 'Pendidikan Pancasila'),
(3, 'BIN', 'Bahasa Indonesia'),
(4, 'MTK', 'Matematika'),
(5, 'IPAS', 'Ilmu Pengetahuan Alam dan Sosial'),
(6, 'PJOK', 'Pendidikan Jasmani Olahraga dan Kesehatan'),
(7, 'SR', 'Seni dan Budaya'),
(8, 'BIG', 'Bahasa Inggris'),
(9, 'BID', 'Bahasa Indramayu');

-- --------------------------------------------------------

--
-- Table structure for table `mengajar`
--

CREATE TABLE `mengajar` (
  `id_mengajar` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `rombel` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `id` int(11) NOT NULL,
  `nasabah_id` varchar(10) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nats`
--

CREATE TABLE `nats` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nh`
--

CREATE TABLE `nh` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `tema` varchar(2) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `jns` varchar(5) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nh_temp`
--

CREATE TABLE `nh_temp` (
  `id_nh` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `nph` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nilaiun`
--

CREATE TABLE `nilaiun` (
  `id` int(11) NOT NULL,
  `nopes` varchar(20) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nk`
--

CREATE TABLE `nk` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `tema` varchar(2) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `jns` varchar(5) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nk_temp`
--

CREATE TABLE `nk_temp` (
  `id_nh` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `nph` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nso`
--

CREATE TABLE `nso` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `perilaku` varchar(500) DEFAULT NULL,
  `jns` varchar(10) NOT NULL,
  `nilai` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nso_pai`
--

CREATE TABLE `nso_pai` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `jns` varchar(10) NOT NULL,
  `nilai` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nso_temp`
--

CREATE TABLE `nso_temp` (
  `id_nh` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `jns` varchar(10) NOT NULL,
  `nph` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nsp`
--

CREATE TABLE `nsp` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `perilaku` varchar(500) DEFAULT NULL,
  `jns` varchar(10) NOT NULL,
  `nilai` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nsp_pai`
--

CREATE TABLE `nsp_pai` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `jns` varchar(10) NOT NULL,
  `nilai` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nsp_temp`
--

CREATE TABLE `nsp_temp` (
  `id_nh` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `jns` varchar(10) NOT NULL,
  `nph` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nuts`
--

CREATE TABLE `nuts` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pekerjaan`
--

CREATE TABLE `pekerjaan` (
  `id_pekerjaan` int(11) NOT NULL,
  `nama_pekerjaan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pekerjaan`
--

INSERT INTO `pekerjaan` (`id_pekerjaan`, `nama_pekerjaan`) VALUES
(1, 'Tidak bekerja'),
(2, 'Nelayan'),
(3, 'Petani'),
(4, 'Peternak'),
(5, 'PNS/TNI/Polri'),
(6, 'Karyawan Swasta'),
(7, 'Pedagang Kecil'),
(8, 'Pedagang Besar'),
(9, 'Wiraswasta'),
(10, 'Wirausaha'),
(11, 'Buruh'),
(12, 'Pensiunan'),
(13, 'Ibu Rumah Tangga'),
(14, 'Bidan'),
(15, 'Tenaga Honorer'),
(98, 'Sudah Meninggal'),
(99, 'Lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_bayar` int(11) NOT NULL,
  `id_invoice` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `jenis` int(11) NOT NULL,
  `bulan` int(11) DEFAULT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_temp`
--

CREATE TABLE `pembayaran_temp` (
  `id_bayar` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `jenis` int(11) NOT NULL,
  `bulan` int(11) DEFAULT NULL,
  `deskripsi` varchar(300) DEFAULT NULL,
  `bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelajaran`
--

CREATE TABLE `pembelajaran` (
  `idpb` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `mapel` int(11) NOT NULL,
  `pb` int(11) NOT NULL,
  `nama_pb` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemetaan`
--

CREATE TABLE `pemetaan` (
  `id_pemetaan` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `kd_aspek` int(11) NOT NULL,
  `mapel` int(11) NOT NULL,
  `tema` varchar(2) NOT NULL,
  `nama_peta` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemetaan_proyek`
--

CREATE TABLE `pemetaan_proyek` (
  `id_pemetaan` int(11) NOT NULL,
  `proyek` int(11) NOT NULL,
  `dimensi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pendidikan`
--

CREATE TABLE `pendidikan` (
  `id_pendidikan` int(11) NOT NULL,
  `nama_pendidikan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pendidikan`
--

INSERT INTO `pendidikan` (`id_pendidikan`, `nama_pendidikan`) VALUES
(0, 'Tidak sekolah'),
(1, 'PAUD'),
(2, 'TK / sederajat'),
(3, 'Putus SD'),
(4, 'SD / sederajat'),
(5, 'SMP / sederajat'),
(6, 'SMA / sederajat'),
(7, 'Paket A'),
(8, 'Paket B'),
(9, 'Paket C'),
(20, 'D1'),
(21, 'D2'),
(22, 'D3'),
(23, 'D4'),
(30, 'S1'),
(35, 'S2'),
(40, 'S3'),
(90, 'Non formal'),
(91, 'Informal'),
(98, '(tidak diisi)'),
(99, 'Lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `pend_terakhir`
--

CREATE TABLE `pend_terakhir` (
  `idPend` int(11) NOT NULL,
  `pendidikan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pend_terakhir`
--

INSERT INTO `pend_terakhir` (`idPend`, `pendidikan`) VALUES
(1, 'SMA/IPA'),
(2, 'SMA/IPS'),
(3, 'SMA/Bahasa'),
(4, 'SMK'),
(5, 'MA'),
(6, 'D3/Tarbiyah'),
(7, 'S1/PGSD'),
(8, 'S1/Pend. Matematika'),
(9, 'S1/Pend. Agama Islam'),
(10, 'S1/Pend. Bahasa Inggris'),
(11, 'S1/Hukum'),
(12, 'S1/Sejarah'),
(13, 'S1/Pertanian'),
(14, 'S1/Perikanan'),
(15, 'S1/Sastra Inggris'),
(16, 'S1/PJOK');

-- --------------------------------------------------------

--
-- Table structure for table `penempatan`
--

CREATE TABLE `penempatan` (
  `id_rombel` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `nama` varchar(41) DEFAULT NULL,
  `rombel` varchar(2) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `smt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `penempatan`
--

INSERT INTO `penempatan` (`id_rombel`, `peserta_didik_id`, `nama`, `rombel`, `tapel`, `smt`) VALUES
(1, 'dg8gzm02-rzh9-w08a-9exv-1s5vyf0977me', 'Nandang Setia Nugraha', '2', '2023/2024', 1),
(2, 'vb5mcryl-s4m8-hebu-q2tk-lj8ffftmuhx8', 'Nandang Setia Nugraha', '1', '2023/2024', 1),
(3, 't4flcF9m-YoKR-lCL4-5dNo-6twUY0jRuCNH', 'Nandang Setia Nugraha', '2', '2023/2024', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `nama_lengkap` varchar(200) NOT NULL,
  `level` int(11) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `ptk_id`, `username`, `password`, `nama_lengkap`, `level`, `verified`, `gambar`) VALUES
(1, '009ab849-2cf5-e011-b7ae-9b859d73d4ca', 'admin', '$2y$10$YxLGFgUrZWroKKe0fZnSKOe0WQYmChOH9MYkaL2zWRduNbSneyAGa', 'Nandang Setia Nugraha', 11, 1, 'avatar_1234914804.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `penghasilan`
--

CREATE TABLE `penghasilan` (
  `id_penghasilan` int(11) NOT NULL,
  `nama_penghasilan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `penghasilan`
--

INSERT INTO `penghasilan` (`id_penghasilan`, `nama_penghasilan`) VALUES
(1, 'Kurang dari Rp 1.000.000'),
(2, 'Rp 1.000.000 - Rp 2.000.000'),
(3, 'Lebih dari Rp 2.000.000'),
(9, 'Lainnya'),
(11, 'Kurang dari Rp. 500,000'),
(12, 'Rp. 500,000 - Rp. 999,999'),
(13, 'Rp. 1,000,000 - Rp. 1,999,999'),
(14, 'Rp. 2,000,000 - Rp. 4,999,999'),
(15, 'Rp. 5,000,000 - Rp. 20,000,000'),
(16, 'Lebih dari Rp. 20,000,000');

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` int(10) NOT NULL,
  `waktu` datetime NOT NULL,
  `judul` text NOT NULL,
  `berita` text NOT NULL,
  `tipe` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE `penilaian` (
  `id_penilaian` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `smt` int(11) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `tanggal` date NOT NULL,
  `nip` varchar(50) NOT NULL,
  `akk` int(11) NOT NULL,
  `pend` text NOT NULL,
  `keahlian` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penilaian_proyek`
--

CREATE TABLE `penilaian_proyek` (
  `id_penilaian` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `smt` int(11) NOT NULL,
  `proyek` int(11) NOT NULL,
  `id_elemen` int(11) NOT NULL,
  `dimensi` int(11) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(10) NOT NULL,
  `id_pengirim` varchar(36) NOT NULL,
  `id_penerima` varchar(36) NOT NULL,
  `tanggal` date NOT NULL,
  `judul_pesan` varchar(50) NOT NULL,
  `isi_pesan` longtext NOT NULL,
  `sudah_dibaca` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesertaun`
--

CREATE TABLE `pesertaun` (
  `id` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `nopes` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peserta_us`
--

CREATE TABLE `peserta_us` (
  `peserta_didik_id` varchar(36) NOT NULL,
  `nopes` text NOT NULL,
  `tahun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pip`
--

CREATE TABLE `pip` (
  `id_pip` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `virtual_acc` varchar(100) NOT NULL,
  `no_rekening` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `potongan_gaji`
--

CREATE TABLE `potongan_gaji` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` int(11) NOT NULL,
  `hari` int(11) DEFAULT 0,
  `absen` int(11) DEFAULT 0,
  `ekskul` int(11) DEFAULT 0,
  `telat` int(11) DEFAULT 0,
  `cepat` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prestasi`
--

CREATE TABLE `prestasi` (
  `idprestasi` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `prestasi` varchar(100) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `penyelenggara` varchar(100) NOT NULL,
  `tingkat` varchar(15) NOT NULL,
  `juara` varchar(10) NOT NULL,
  `scan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `prestasi`
--

INSERT INTO `prestasi` (`idprestasi`, `peserta_didik_id`, `prestasi`, `tahun`, `penyelenggara`, `tingkat`, `juara`, `scan`) VALUES
(1, '4a1e4c18-e0dd-e111-845f-8d010f14253e', 'OSN Kategori IPA', '2016', 'UPTD Kecamatan', 'Kecamatan', '1', ''),
(2, '93934c18-e0dd-e111-8468-8d010f14253e', 'Lomba Cipta Baca Puisi', '2016', 'UPTD Kecamatan', 'Kecamatan', '1', ''),
(3, 'a0ba4c18-e0dd-e111-8468-8d010f14253e', 'Lomba Membatik', '2016', 'UPTD Kecamatan', 'Kecamatan', '1', ''),
(4, 'c05a8bf0-3ba2-11e3-9efc-fb46fe1a1bf9', 'Lomba Calistung Kelas 3', '2016', 'UPTD Kecamatan', 'Kecamatan', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `printer`
--

CREATE TABLE `printer` (
  `id_printer` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `spp` varchar(100) NOT NULL,
  `tabungan` varchar(100) NOT NULL,
  `kwitansi` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `printer`
--

INSERT INTO `printer` (`id_printer`, `nama`, `spp`, `tabungan`, `kwitansi`, `status`) VALUES
(1, 'EPSON L1110 Series', 'SPP', 'Tabungan', 'Kwitansi', 1),
(2, 'EPSON L3110 Series', 'SPP', 'Tabungan', 'F4', 0),
(3, 'HP PageWide Pro 577 MFP', 'F4', 'Tabungan', 'F4', 0);

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `id_prov` char(2) NOT NULL,
  `nama` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`id_prov`, `nama`) VALUES
('11', 'Aceh'),
('12', 'Sumatera Utara'),
('13', 'Sumatera Barat'),
('14', 'Riau'),
('15', 'Jambi'),
('16', 'Sumatera Selatan'),
('17', 'Bengkulu'),
('18', 'Lampung'),
('19', 'Kepulauan Bangka Belitung'),
('21', 'Kepulauan Riau'),
('31', 'DKI Jakarta'),
('32', 'Jawa Barat'),
('33', 'Jawa Tengah'),
('34', 'DI Yogyakarta'),
('35', 'Jawa Timur'),
('36', 'Banten'),
('51', 'Bali'),
('52', 'Nusa Tenggara Barat'),
('53', 'Nusa Tenggara Timur'),
('61', 'Kalimantan Barat'),
('62', 'Kalimantan Tengah'),
('63', 'Kalimantan Selatan'),
('64', 'Kalimantan Timur'),
('65', 'Kalimantan Utara'),
('71', 'Sulawesi Utara'),
('72', 'Sulawesi Tengah'),
('73', 'Sulawesi Selatan'),
('74', 'Sulawesi Tenggara'),
('75', 'Gorontalo'),
('76', 'Sulawesi Barat'),
('81', 'Maluku'),
('82', 'Maluku Utara'),
('91', 'Papua Barat'),
('92', 'Papua');

-- --------------------------------------------------------

--
-- Table structure for table `ptk`
--

CREATE TABLE `ptk` (
  `id` int(11) NOT NULL,
  `ptk_id` varchar(36) DEFAULT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `gelar` varchar(30) DEFAULT NULL,
  `jenis_kelamin` varchar(1) DEFAULT NULL,
  `tempat_lahir` varchar(20) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `niy_nigk` varchar(14) DEFAULT NULL,
  `nuptk` varchar(16) DEFAULT NULL,
  `status_kepegawaian_id` int(1) DEFAULT NULL,
  `jenis_ptk_id` int(2) DEFAULT NULL,
  `alamat_jalan` varchar(250) DEFAULT NULL,
  `no_hp` varchar(12) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status_keaktifan_id` int(1) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `nasabah_id` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ptk`
--

INSERT INTO `ptk` (`id`, `ptk_id`, `nama`, `gelar`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `nik`, `niy_nigk`, `nuptk`, `status_kepegawaian_id`, `jenis_ptk_id`, `alamat_jalan`, `no_hp`, `email`, `status_keaktifan_id`, `gambar`, `nasabah_id`) VALUES
(2, '009ab849-2cf5-e011-b7ae-9b859d73d4ca', 'Nandang Setia Nugraha', '', 'L', 'Indramayu', '1912-12-12', '', '', '', 4, 11, '', '', '', 1, 'avatar_416692639.png', '');

-- --------------------------------------------------------

--
-- Table structure for table `ranking_ikm`
--

CREATE TABLE `ranking_ikm` (
  `id_rank` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `smt` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `raport`
--

CREATE TABLE `raport` (
  `id_raport` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` double(11,2) NOT NULL DEFAULT 0.00,
  `oleh` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `raport_ikm`
--

CREATE TABLE `raport_ikm` (
  `id_raport` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` double(11,2) NOT NULL DEFAULT 0.00,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `raport_k13`
--

CREATE TABLE `raport_k13` (
  `id_raport` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `jns` varchar(5) NOT NULL,
  `nilai` double(11,2) NOT NULL DEFAULT 0.00,
  `predikat` varchar(1) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rapor_akm`
--

CREATE TABLE `rapor_akm` (
  `id_rapor` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `nilai_literasi` double NOT NULL,
  `nilai_literasi_serupa` double NOT NULL,
  `status_literasi` varchar(100) NOT NULL,
  `hasil_literasi` varchar(250) NOT NULL,
  `nilai_numerasi` double NOT NULL,
  `nilai_numerasi_serupa` double NOT NULL,
  `status_numerasi` varchar(100) NOT NULL,
  `hasil_numerasi` varchar(250) NOT NULL,
  `nilai_karakter` double NOT NULL,
  `nilai_karakter_serupa` double NOT NULL,
  `status_karakter` varchar(100) NOT NULL,
  `hasil_karakter` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rapor_akm`
--

INSERT INTO `rapor_akm` (`id_rapor`, `tahun`, `nilai_literasi`, `nilai_literasi_serupa`, `status_literasi`, `hasil_literasi`, `nilai_numerasi`, `nilai_numerasi_serupa`, `status_numerasi`, `hasil_numerasi`, `nilai_karakter`, `nilai_karakter_serupa`, `status_karakter`, `hasil_karakter`) VALUES
(1, 2021, 2.08, 1.75, 'Mencapai kompetensi mininum', 'Sebagian besar peserta didik telah mencapai batas kompetensi minimum untuk literasi membaca namun perlu upaya mendorong lebih banyak peserta didik menjadi mahir.', 1.8, 1.59, 'Mencapai kompetensi mininum', 'Sebagian besar peserta didik telah mencapai batas kompetensi minimum untuk numerasi namun perlu upaya mendorong lebih banyak peserta didik menjadi mahir.', 2.09, 2.11, 'Berkembang', 'Peserta didik terbiasa menerapkan nilai-nilai karakter pelajar pancasila yang berakhlak mulia, bergotong royong, mandiri, kreatif dan bernalar kritis serta berkebinekaan global dalam kehidupan sehari hari.');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_pendidikan`
--

CREATE TABLE `riwayat_pendidikan` (
  `id_riwayat` int(11) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `jenjang` int(11) NOT NULL,
  `nama_jenjang` varchar(50) NOT NULL,
  `fakultas` varchar(50) NOT NULL,
  `tahun_masuk` varchar(4) NOT NULL,
  `tahun_keluar` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rombel`
--

CREATE TABLE `rombel` (
  `id_rombel` int(11) NOT NULL,
  `nama_rombel` varchar(10) NOT NULL,
  `kurikulum` varchar(50) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `wali_kelas` varchar(36) DEFAULT NULL,
  `pendamping` varchar(36) DEFAULT NULL,
  `pai` varchar(36) DEFAULT NULL,
  `penjas` varchar(36) DEFAULT NULL,
  `inggris` varchar(36) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rombel`
--

INSERT INTO `rombel` (`id_rombel`, `nama_rombel`, `kurikulum`, `tapel`, `wali_kelas`, `pendamping`, `pai`, `penjas`, `inggris`) VALUES
(1, '1', 'Kurikulum Merdeka', '2023/2024', '009ab849-2cf5-e011-b7ae-9b859d73d4ca', '009ab849-2cf5-e011-b7ae-9b859d73d4ca', '009ab849-2cf5-e011-b7ae-9b859d73d4ca', '009ab849-2cf5-e011-b7ae-9b859d73d4ca', '009ab849-2cf5-e011-b7ae-9b859d73d4ca'),
(2, '2', 'Kurikulum Merdeka', '2023/2024', '009ab849-2cf5-e011-b7ae-9b859d73d4ca', '009ab849-2cf5-e011-b7ae-9b859d73d4ca', '009ab849-2cf5-e011-b7ae-9b859d73d4ca', '009ab849-2cf5-e011-b7ae-9b859d73d4ca', '009ab849-2cf5-e011-b7ae-9b859d73d4ca');

-- --------------------------------------------------------

--
-- Table structure for table `saran`
--

CREATE TABLE `saran` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `saran` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sas`
--

CREATE TABLE `sas` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sekolah`
--

CREATE TABLE `sekolah` (
  `sekolah_id` varchar(36) DEFAULT NULL,
  `nama` varchar(18) DEFAULT NULL,
  `nss` bigint(12) DEFAULT NULL,
  `npsn` int(8) DEFAULT NULL,
  `bentuk_pendidikan_id` int(1) DEFAULT NULL,
  `alamat_jalan` varchar(25) DEFAULT NULL,
  `rt` int(1) DEFAULT NULL,
  `rw` int(1) DEFAULT NULL,
  `nama_dusun` varchar(10) DEFAULT NULL,
  `desa_kelurahan` varchar(10) DEFAULT NULL,
  `kode_wilayah` varchar(8) DEFAULT NULL,
  `kode_pos` int(5) DEFAULT NULL,
  `lintang` decimal(15,6) DEFAULT NULL,
  `bujur` decimal(15,6) DEFAULT NULL,
  `nomor_telepon` varchar(14) DEFAULT NULL,
  `nomor_fax` varchar(10) DEFAULT NULL,
  `email` varchar(22) DEFAULT NULL,
  `website` varchar(30) DEFAULT NULL,
  `kebutuhan_khusus_id` int(1) DEFAULT NULL,
  `status_sekolah` int(1) DEFAULT NULL,
  `sk_pendirian_sekolah` varchar(17) DEFAULT NULL,
  `tanggal_sk_pendirian` varchar(8) DEFAULT NULL,
  `visimisi` text DEFAULT NULL,
  `kurikulum` text DEFAULT NULL,
  `sk_izin_operasional` varchar(25) DEFAULT NULL,
  `tanggal_sk_izin_operasional` varchar(10) DEFAULT NULL,
  `no_rekening` bigint(13) DEFAULT NULL,
  `nama_bank` varchar(17) DEFAULT NULL,
  `cabang_kcp_unit` varchar(11) DEFAULT NULL,
  `rekening_atas_nama` varchar(18) DEFAULT NULL,
  `mbs` int(1) DEFAULT NULL,
  `luas_tanah_milik` int(4) DEFAULT NULL,
  `luas_tanah_bukan_milik` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sekolah`
--

INSERT INTO `sekolah` (`sekolah_id`, `nama`, `nss`, `npsn`, `bentuk_pendidikan_id`, `alamat_jalan`, `rt`, `rw`, `nama_dusun`, `desa_kelurahan`, `kode_wilayah`, `kode_pos`, `lintang`, `bujur`, `nomor_telepon`, `nomor_fax`, `email`, `website`, `kebutuhan_khusus_id`, `status_sekolah`, `sk_pendirian_sekolah`, `tanggal_sk_pendirian`, `visimisi`, `kurikulum`, `sk_izin_operasional`, `tanggal_sk_izin_operasional`, `no_rekening`, `nama_bank`, `cabang_kcp_unit`, `rekening_atas_nama`, `mbs`, `luas_tanah_milik`, `luas_tanah_bukan_milik`) VALUES
('20162e13-2cf5-e011-91d5-a9ab0de328a2', 'SD ISLAM AL JANNAH', 102021803031, 20258088, 5, 'Jl. Raya Gabuswetan No. 1', 5, 1, 'Gabuswetan', 'Gabuswetan', '021803  ', 45263, '-6.416582', '108.080501', '(0234) 5508501', '', 'sdi.aljannah@gmail.com', 'http://www.sdi-aljannah.web.id', 0, 2, '01-LP/YAI/VI/2006', '6/2/2006', '3', '7409cba0-37fe-11e3-bb93-d3ca5cddff61', '421.1/Kep.166-Disdik/2008', '12/30/2008', 16826103100, 'Bank Jabar Banten', 'Karangsinom', 'SD Islam Al-Jannah', 1, 1470, 0);

-- --------------------------------------------------------

--
-- Table structure for table `session_viewer`
--

CREATE TABLE `session_viewer` (
  `id_count` int(11) NOT NULL,
  `count_blog_id` text NOT NULL,
  `count_ip` text NOT NULL,
  `tanggal` datetime NOT NULL,
  `session_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(5) NOT NULL,
  `website_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `website_url` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `website_email` varchar(100) NOT NULL,
  `meta_description` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `meta_keyword` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `favicon` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `website_maintenance` enum('Y','N') NOT NULL DEFAULT 'N',
  `website_maintenance_tgl` varchar(10) NOT NULL,
  `website_cache` enum('Y','N') NOT NULL DEFAULT 'N',
  `website_cache_time` varchar(10) NOT NULL,
  `member_register` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id_setting`, `website_name`, `website_url`, `website_email`, `meta_description`, `meta_keyword`, `favicon`, `timezone`, `website_maintenance`, `website_maintenance_tgl`, `website_cache`, `website_cache_time`, `member_register`) VALUES
(1, 'SD Islam Al-Jannah', 'http://localhost/1-popo', 'sekolahdasarislamaljannah@gmail.com', 'Membangun Generasi Islam yang Mandiri dan Beriman dan Bertakwa', 'popojicms, website popojicms, cms indonesia, cms terbaik indonesia, cms gratis, cms gratis indonesia, alternatif cms', 'favicon.png', 'Asia/Jakarta', 'N', '', 'N', '', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `id_shift` int(11) NOT NULL,
  `tanggal_awal` date NOT NULL,
  `tanggal_akhir` date NOT NULL,
  `masuk` time NOT NULL,
  `keluar` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sikap`
--

CREATE TABLE `sikap` (
  `id_sikap` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `sikap` varchar(1) NOT NULL,
  `rajin` varchar(1) NOT NULL,
  `rapi` varchar(1) NOT NULL,
  `ijin` int(11) NOT NULL,
  `sakit` int(11) NOT NULL,
  `alpa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL DEFAULT '',
  `nis` varchar(9) NOT NULL,
  `nisn` varchar(10) DEFAULT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `jk` varchar(1) DEFAULT NULL,
  `tempat` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `agama` int(11) NOT NULL DEFAULT 1,
  `pend_sebelum` varchar(100) NOT NULL,
  `alamat` varchar(350) DEFAULT NULL,
  `nama_ayah` varchar(150) DEFAULT NULL,
  `nama_ibu` varchar(150) DEFAULT NULL,
  `no_wa` varchar(15) NOT NULL DEFAULT '085798869782',
  `pek_ayah` int(11) NOT NULL,
  `pek_ibu` int(11) NOT NULL,
  `jalan` varchar(100) NOT NULL,
  `kelurahan` varchar(20) NOT NULL,
  `kecamatan` varchar(20) NOT NULL,
  `kabupaten` varchar(20) NOT NULL,
  `provinsi` varchar(20) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `nasabah_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `peserta_didik_id`, `nis`, `nisn`, `nama`, `jk`, `tempat`, `tanggal`, `nik`, `agama`, `pend_sebelum`, `alamat`, `nama_ayah`, `nama_ibu`, `no_wa`, `pek_ayah`, `pek_ibu`, `jalan`, `kelurahan`, `kecamatan`, `kabupaten`, `provinsi`, `avatar`, `status`, `nasabah_id`) VALUES
(1, 'dg8gzm02-rzh9-w08a-9exv-1s5vyf0977me', '', '', 'Nandang Setia Nugraha', 'L', 'Indramayu', '2023-08-21', '', 1, '', 'Jl. Raya gabuswetan', '', '', '082214880179_', 1, 1, '', 'Pilih Desa/kelurahan', 'Pilih Kecamatan', 'Pilih Kabupaten', 'Pilih Provinsi', 'avatar.png', 1, '0'),
(2, 'vb5mcryl-s4m8-hebu-q2tk-lj8ffftmuhx8', '', '', 'Nandang Setia Nugraha', 'L', 'Indramayu', '2023-08-02', '', 1, '', 'Jl. Raya gabuswetan', '', '', '082214880179_', 1, 1, '', 'Pilih Desa/kelurahan', 'Pilih Kecamatan', 'Pilih Kabupaten', 'Pilih Provinsi', 'avatar.png', 1, '0'),
(3, 't4flcF9m-YoKR-lCL4-5dNo-6twUY0jRuCNH', '', '', 'Nandang Setia Nugraha', 'L', 'ki', '2023-08-01', '', 1, '', 'Jl. Raya gabuswetan', '', '', '082214880179_', 1, 1, '', 'Pilih Desa/kelurahan', 'Pilih Kecamatan', 'Pilih Kabupaten', 'Pilih Provinsi', 'avatar.png', 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `sk`
--

CREATE TABLE `sk` (
  `id_sk` int(11) NOT NULL,
  `tanggal_sk` date NOT NULL,
  `no_sk` varchar(100) NOT NULL,
  `ptk_id` varchar(50) NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `jenis_ptk` varchar(50) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `pengangkat` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skkb`
--

CREATE TABLE `skkb` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sk_aktif`
--

CREATE TABLE `sk_aktif` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `tapel` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sk_pip`
--

CREATE TABLE `sk_pip` (
  `id` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `tahap` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `kelas` varchar(25) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slip_gaji`
--

CREATE TABLE `slip_gaji` (
  `id` int(11) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `gapok` int(11) NOT NULL,
  `tunj_transport` int(11) NOT NULL,
  `tunj_jabatan` int(11) NOT NULL,
  `tunj_lain` int(11) NOT NULL,
  `tunj_kehadiran` int(11) NOT NULL,
  `tunj_ekskul` int(11) NOT NULL,
  `pot_telat` int(11) NOT NULL,
  `pot_cepat` int(11) NOT NULL,
  `pot_absen` int(11) NOT NULL,
  `pot_ketidakhadiran` int(11) NOT NULL,
  `pot_ekskul` int(11) NOT NULL,
  `hari_kerja` int(11) NOT NULL,
  `kehadiran` int(11) NOT NULL,
  `absensi` int(11) NOT NULL,
  `telat` int(11) NOT NULL,
  `cepat` int(11) NOT NULL,
  `total_gaji` int(11) NOT NULL,
  `total_pot` int(11) NOT NULL,
  `gaji_bersih` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `smutasi`
--

CREATE TABLE `smutasi` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `nomor` varchar(36) NOT NULL,
  `pemohon` varchar(100) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `sdmut` varchar(100) NOT NULL,
  `npsn` varchar(15) NOT NULL,
  `alamatsd` varchar(200) NOT NULL,
  `alasan` varchar(100) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `isi_status` text NOT NULL,
  `tanggal_status` varchar(20) NOT NULL,
  `dihapus` varchar(1) DEFAULT 't'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status_kepegawaian`
--

CREATE TABLE `status_kepegawaian` (
  `status_kepegawaian_id` int(11) NOT NULL,
  `nama` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `status_kepegawaian`
--

INSERT INTO `status_kepegawaian` (`status_kepegawaian_id`, `nama`) VALUES
(1, 'PNS'),
(2, 'PNS Diperbantukan'),
(3, 'PNS Depag'),
(4, 'GTY/PTY'),
(5, 'GTT/PTT Provinsi'),
(6, 'GTT/PTT Kab/Kota'),
(7, 'Guru Bantu Pusat'),
(8, 'Guru Honor Sekolah'),
(9, 'Tenaga Honor Sekolah');

-- --------------------------------------------------------

--
-- Table structure for table `sts`
--

CREATE TABLE `sts` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subtema`
--

CREATE TABLE `subtema` (
  `id_sub` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tema` varchar(2) NOT NULL,
  `sub` varchar(5) NOT NULL,
  `nama_sub` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sumatif`
--

CREATE TABLE `sumatif` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `lm` varchar(2) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surah`
--

CREATE TABLE `surah` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `surah`
--

INSERT INTO `surah` (`id`, `nama`) VALUES
(1, 'Al-Baqarah 1-8'),
(2, 'Al-Baqarah 183'),
(3, 'Al-Baqarah 255'),
(4, 'Al-Baqarah 284-286'),
(5, 'Al-Baqarah 153-157'),
(6, 'Luqman 12-19'),
(7, 'Ar-Rahman 1-6'),
(8, 'Ar-Rahman 7-13'),
(9, 'Al-Mu\'minin 1-4'),
(10, 'Al-Mu\'minin 5-9'),
(11, 'Al-Mu\'minin 10-11');

-- --------------------------------------------------------

--
-- Table structure for table `surah_pilihan`
--

CREATE TABLE `surah_pilihan` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `surah` int(11) NOT NULL,
  `nilai` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat_ijin`
--

CREATE TABLE `surat_ijin` (
  `id` int(11) NOT NULL,
  `no_surat` varchar(100) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `tanggal_awal` date NOT NULL,
  `tanggal_akhir` date NOT NULL,
  `keterangan` varchar(10) NOT NULL,
  `alasan` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `penolakan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tabungan`
--

CREATE TABLE `tabungan` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `kode` int(11) NOT NULL,
  `nasabah_id` varchar(10) NOT NULL,
  `masuk` bigint(20) DEFAULT 0,
  `keluar` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tahfidz`
--

CREATE TABLE `tahfidz` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `surah` int(11) NOT NULL,
  `nilai` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tapel`
--

CREATE TABLE `tapel` (
  `id_tapel` int(11) NOT NULL,
  `nama_tapel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tapel`
--

INSERT INTO `tapel` (`id_tapel`, `nama_tapel`) VALUES
(8, '2014/2015'),
(9, '2015/2016'),
(10, '2016/2017'),
(11, '2017/2018'),
(12, '2018/2019'),
(13, '2019/2020'),
(14, '2020/2021'),
(15, '2021/2022'),
(16, '2022/2023'),
(17, '2023/2024'),
(18, '2024/2025');

-- --------------------------------------------------------

--
-- Table structure for table `tarif_spp`
--

CREATE TABLE `tarif_spp` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telegram`
--

CREATE TABLE `telegram` (
  `id` int(11) NOT NULL,
  `iduser` varchar(100) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `username` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `telegram`
--

INSERT INTO `telegram` (`id`, `iduser`, `nama`, `nis`, `username`) VALUES
(6, '489586155', 'ë³´ì´ìŠ¤', '192001024', 'NandangAbieFarhan');

-- --------------------------------------------------------

--
-- Table structure for table `tema`
--

CREATE TABLE `tema` (
  `id_tema` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tema` varchar(2) NOT NULL,
  `nama_tema` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tema_proyek`
--

CREATE TABLE `tema_proyek` (
  `id_tema` int(11) NOT NULL,
  `nama_tema` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tema_proyek`
--

INSERT INTO `tema_proyek` (`id_tema`, `nama_tema`) VALUES
(1, 'Gaya Hidup Berkelanjutan'),
(2, 'Kearifan Lokal'),
(3, 'Bhineka Tunggal Ika'),
(6, 'Berekayasa dan Berteknologi untuk Membangun NKRI'),
(7, 'Kewirausahaan');

-- --------------------------------------------------------

--
-- Table structure for table `temp_pas`
--

CREATE TABLE `temp_pas` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` varchar(3) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_pts`
--

CREATE TABLE `temp_pts` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` varchar(3) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `titimangsa`
--

CREATE TABLE `titimangsa` (
  `id` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `tanggal2` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tp`
--

CREATE TABLE `tp` (
  `id_tp` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `lm` varchar(2) NOT NULL,
  `mapel` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tp` varchar(10) NOT NULL,
  `nama_tp` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transportasi`
--

CREATE TABLE `transportasi` (
  `id_transportasi` int(11) NOT NULL,
  `nama_transportasi` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transportasi`
--

INSERT INTO `transportasi` (`id_transportasi`, `nama_transportasi`) VALUES
(1, 'Jalan kaki'),
(2, 'Kendaraan pribadi'),
(3, 'Angkutan umum/bus/pete-pete'),
(4, 'Mobil/bus antar jemput'),
(5, 'Kereta api'),
(6, 'Ojek'),
(7, 'Andong/bendi/sado/dokar/delman/becak'),
(8, 'Perahu penyeberangan/rakit/getek'),
(11, 'Kuda'),
(12, 'Sepeda'),
(13, 'Sepeda motor'),
(14, 'Mobil pribadi'),
(99, 'Lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id_tugas` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `tugas_ke` int(11) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` float(11,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tunggakan_lain`
--

CREATE TABLE `tunggakan_lain` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `jenis` int(11) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uas`
--

CREATE TABLE `uas` (
  `id_uas` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` float(11,2) NOT NULL DEFAULT 0.00,
  `oleh` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uasbn`
--

CREATE TABLE `uasbn` (
  `id_uasbn` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uasbn_praktek`
--

CREATE TABLE `uasbn_praktek` (
  `id_uasbn` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ulhar`
--

CREATE TABLE `ulhar` (
  `id_ulhar` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `ulhar_ke` int(11) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` float(11,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `unique_id` int(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `unique_id`, `fname`, `lname`, `email`, `password`, `img`, `status`) VALUES
(1, 1016604816, 'Nandang', 'Setia Nugraha', 'shareddeep@gmail.com', '637eb69a418a619244a874252ae7f992', '1664508122happy.jpg', 'Active now');

-- --------------------------------------------------------

--
-- Table structure for table `usm1`
--

CREATE TABLE `usm1` (
  `id` int(11) NOT NULL,
  `nis` varchar(10) DEFAULT NULL,
  `nopes` varchar(20) DEFAULT NULL,
  `pair` varchar(4) DEFAULT NULL,
  `paiu` varchar(4) DEFAULT NULL,
  `pais` varchar(4) DEFAULT NULL,
  `pknr` varchar(4) DEFAULT NULL,
  `pknu` varchar(4) DEFAULT NULL,
  `pkns` varchar(4) DEFAULT NULL,
  `binr` varchar(4) DEFAULT NULL,
  `binu` varchar(4) DEFAULT NULL,
  `bins` varchar(4) DEFAULT NULL,
  `mtkr` varchar(4) DEFAULT NULL,
  `mtku` varchar(4) DEFAULT NULL,
  `mtks` varchar(4) DEFAULT NULL,
  `ipar` varchar(4) DEFAULT NULL,
  `ipau` varchar(4) DEFAULT NULL,
  `ipas` varchar(4) DEFAULT NULL,
  `ipsr` varchar(4) DEFAULT NULL,
  `ipsu` varchar(4) DEFAULT NULL,
  `ipss` varchar(4) DEFAULT NULL,
  `sbkr` varchar(4) DEFAULT NULL,
  `sbku` varchar(4) DEFAULT NULL,
  `sbks` varchar(4) DEFAULT NULL,
  `pjkr` varchar(4) DEFAULT NULL,
  `pjku` varchar(4) DEFAULT NULL,
  `pjks` varchar(4) DEFAULT NULL,
  `bidr` varchar(4) DEFAULT NULL,
  `bidu` varchar(4) DEFAULT NULL,
  `bids` varchar(4) DEFAULT NULL,
  `bigr` varchar(4) DEFAULT NULL,
  `bigu` varchar(4) DEFAULT NULL,
  `bigs` varchar(4) DEFAULT NULL,
  `pbpr` varchar(4) DEFAULT NULL,
  `pbpu` varchar(4) DEFAULT NULL,
  `pbps` varchar(4) DEFAULT NULL,
  `binun` varchar(4) DEFAULT NULL,
  `mtkun` varchar(4) DEFAULT NULL,
  `ipaun` varchar(4) DEFAULT NULL,
  `rataun` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `us_praktek`
--

CREATE TABLE `us_praktek` (
  `peserta_didik_id` varchar(36) NOT NULL,
  `pai` decimal(10,2) NOT NULL,
  `bin` decimal(10,2) NOT NULL,
  `ipa` decimal(10,2) NOT NULL,
  `bid` decimal(10,2) NOT NULL,
  `big` decimal(10,2) NOT NULL,
  `pjk` decimal(10,2) NOT NULL,
  `sbk` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `us_tulis`
--

CREATE TABLE `us_tulis` (
  `peserta_didik_id` varchar(36) NOT NULL,
  `pai` decimal(10,2) NOT NULL,
  `pkn` decimal(10,2) NOT NULL,
  `ips` decimal(10,2) NOT NULL,
  `bid` decimal(10,2) NOT NULL,
  `big` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uts`
--

CREATE TABLE `uts` (
  `id_uts` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` float(11,2) NOT NULL DEFAULT 0.00,
  `oleh` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id_video` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `link` varchar(150) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `uri` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wiki`
--

CREATE TABLE `wiki` (
  `id` int(11) NOT NULL,
  `penulis` varchar(36) NOT NULL,
  `tanggal` date NOT NULL,
  `judul` text NOT NULL,
  `slug` varchar(250) NOT NULL,
  `isi` longtext NOT NULL,
  `images` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `view` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id_absen`);

--
-- Indexes for table `absensi_ptk`
--
ALTER TABLE `absensi_ptk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `absen_config`
--
ALTER TABLE `absen_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indexes for table `anak`
--
ALTER TABLE `anak`
  ADD PRIMARY KEY (`id_anak`);

--
-- Indexes for table `arbain`
--
ALTER TABLE `arbain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `berita_acara`
--
ALTER TABLE `berita_acara`
  ADD PRIMARY KEY (`id_bap`);

--
-- Indexes for table `bulan_spp`
--
ALTER TABLE `bulan_spp`
  ADD PRIMARY KEY (`id_bulan`);

--
-- Indexes for table `catatan`
--
ALTER TABLE `catatan`
  ADD PRIMARY KEY (`id_cat`);

--
-- Indexes for table `data_absensi`
--
ALTER TABLE `data_absensi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_ekskul`
--
ALTER TABLE `data_ekskul`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_kesehatan`
--
ALTER TABLE `data_kesehatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_prestasi`
--
ALTER TABLE `data_prestasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_proyek`
--
ALTER TABLE `data_proyek`
  ADD PRIMARY KEY (`id_proyek`);

--
-- Indexes for table `data_register`
--
ALTER TABLE `data_register`
  ADD PRIMARY KEY (`peserta_didik_id`),
  ADD KEY `peserta_didik_id` (`peserta_didik_id`);

--
-- Indexes for table `desa`
--
ALTER TABLE `desa`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `deskripsi_k13`
--
ALTER TABLE `deskripsi_k13`
  ADD PRIMARY KEY (`id_raport`);

--
-- Indexes for table `dimensi_proyek`
--
ALTER TABLE `dimensi_proyek`
  ADD PRIMARY KEY (`id_dimensi`);

--
-- Indexes for table `doa`
--
ALTER TABLE `doa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doa_harian`
--
ALTER TABLE `doa_harian`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `ekskul`
--
ALTER TABLE `ekskul`
  ADD PRIMARY KEY (`id_ekskul`);

--
-- Indexes for table `elemen_proyek`
--
ALTER TABLE `elemen_proyek`
  ADD PRIMARY KEY (`id_elemen`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filepkg`
--
ALTER TABLE `filepkg`
  ADD PRIMARY KEY (`id_penilaian`);

--
-- Indexes for table `formatif`
--
ALTER TABLE `formatif`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `gajipokok`
--
ALTER TABLE `gajipokok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Indexes for table `hadits`
--
ALTER TABLE `hadits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hadits_arbain`
--
ALTER TABLE `hadits_arbain`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `hadits_pilihan`
--
ALTER TABLE `hadits_pilihan`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `hafalan`
--
ALTER TABLE `hafalan`
  ADD PRIMARY KEY (`id_hafalan`);

--
-- Indexes for table `harilibur`
--
ALTER TABLE `harilibur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hari_efektif`
--
ALTER TABLE `hari_efektif`
  ADD PRIMARY KEY (`id_hari`);

--
-- Indexes for table `id_pegawai`
--
ALTER TABLE `id_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ijazah`
--
ALTER TABLE `ijazah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ijin_ptk`
--
ALTER TABLE `ijin_ptk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indikator`
--
ALTER TABLE `indikator`
  ADD PRIMARY KEY (`id_indikator`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwalku`
--
ALTER TABLE `jadwalku`
  ADD PRIMARY KEY (`jadwal_id`);

--
-- Indexes for table `jenis_ptk`
--
ALTER TABLE `jenis_ptk`
  ADD UNIQUE KEY `jenis_ptk_id_2` (`jenis_ptk_id`),
  ADD KEY `jenis_ptk_id` (`jenis_ptk_id`);

--
-- Indexes for table `jenis_tunggakan`
--
ALTER TABLE `jenis_tunggakan`
  ADD PRIMARY KEY (`id_tunggakan`);

--
-- Indexes for table `jenjang`
--
ALTER TABLE `jenjang`
  ADD PRIMARY KEY (`kd_jenjang`);

--
-- Indexes for table `jenjang_pendidikan`
--
ALTER TABLE `jenjang_pendidikan`
  ADD PRIMARY KEY (`id_jenjang`);

--
-- Indexes for table `jns_daftar`
--
ALTER TABLE `jns_daftar`
  ADD UNIQUE KEY `id_jns_daftar` (`id_jns_daftar`);

--
-- Indexes for table `jns_mutasi`
--
ALTER TABLE `jns_mutasi`
  ADD PRIMARY KEY (`id_mutasi`);

--
-- Indexes for table `jns_tinggal`
--
ALTER TABLE `jns_tinggal`
  ADD PRIMARY KEY (`id_jns_tinggal`);

--
-- Indexes for table `juzamma`
--
ALTER TABLE `juzamma`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kd`
--
ALTER TABLE `kd`
  ADD PRIMARY KEY (`id_kd`);

--
-- Indexes for table `kd_sosial`
--
ALTER TABLE `kd_sosial`
  ADD PRIMARY KEY (`ids`);

--
-- Indexes for table `kd_spirit`
--
ALTER TABLE `kd_spirit`
  ADD PRIMARY KEY (`ids`);

--
-- Indexes for table `keahlian`
--
ALTER TABLE `keahlian`
  ADD PRIMARY KEY (`idke`);

--
-- Indexes for table `keb_khusus`
--
ALTER TABLE `keb_khusus`
  ADD UNIQUE KEY `id_keb_khusus_2` (`id_keb_khusus`),
  ADD KEY `id_keb_khusus` (`id_keb_khusus`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id_keg`);

--
-- Indexes for table `kip`
--
ALTER TABLE `kip`
  ADD PRIMARY KEY (`id_kip`);

--
-- Indexes for table `kkm`
--
ALTER TABLE `kkm`
  ADD PRIMARY KEY (`id_kkm`);

--
-- Indexes for table `kkmku`
--
ALTER TABLE `kkmku`
  ADD PRIMARY KEY (`id_kkm`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`);

--
-- Indexes for table `kompetensi`
--
ALTER TABLE `kompetensi`
  ADD PRIMARY KEY (`kd_komp`);

--
-- Indexes for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  ADD UNIQUE KEY `id_conf` (`id_conf`);

--
-- Indexes for table `kurikulum`
--
ALTER TABLE `kurikulum`
  ADD PRIMARY KEY (`id_kurikulum`);

--
-- Indexes for table `lingkup_materi`
--
ALTER TABLE `lingkup_materi`
  ADD PRIMARY KEY (`id_lm`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loginattempts`
--
ALTER TABLE `loginattempts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `mengajar`
--
ALTER TABLE `mengajar`
  ADD PRIMARY KEY (`id_mengajar`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nats`
--
ALTER TABLE `nats`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `nh`
--
ALTER TABLE `nh`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `nh_temp`
--
ALTER TABLE `nh_temp`
  ADD PRIMARY KEY (`id_nh`);

--
-- Indexes for table `nilaiun`
--
ALTER TABLE `nilaiun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nk`
--
ALTER TABLE `nk`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `nk_temp`
--
ALTER TABLE `nk_temp`
  ADD PRIMARY KEY (`id_nh`);

--
-- Indexes for table `nso`
--
ALTER TABLE `nso`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `nso_pai`
--
ALTER TABLE `nso_pai`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `nso_temp`
--
ALTER TABLE `nso_temp`
  ADD PRIMARY KEY (`id_nh`);

--
-- Indexes for table `nsp`
--
ALTER TABLE `nsp`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `nsp_pai`
--
ALTER TABLE `nsp_pai`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `nsp_temp`
--
ALTER TABLE `nsp_temp`
  ADD PRIMARY KEY (`id_nh`);

--
-- Indexes for table `nuts`
--
ALTER TABLE `nuts`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  ADD PRIMARY KEY (`id_pekerjaan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_bayar`);

--
-- Indexes for table `pembayaran_temp`
--
ALTER TABLE `pembayaran_temp`
  ADD PRIMARY KEY (`id_bayar`);

--
-- Indexes for table `pembelajaran`
--
ALTER TABLE `pembelajaran`
  ADD PRIMARY KEY (`idpb`);

--
-- Indexes for table `pemetaan`
--
ALTER TABLE `pemetaan`
  ADD PRIMARY KEY (`id_pemetaan`);

--
-- Indexes for table `pemetaan_proyek`
--
ALTER TABLE `pemetaan_proyek`
  ADD PRIMARY KEY (`id_pemetaan`);

--
-- Indexes for table `pendidikan`
--
ALTER TABLE `pendidikan`
  ADD UNIQUE KEY `id_pendidikan` (`id_pendidikan`);

--
-- Indexes for table `pend_terakhir`
--
ALTER TABLE `pend_terakhir`
  ADD PRIMARY KEY (`idPend`);

--
-- Indexes for table `penempatan`
--
ALTER TABLE `penempatan`
  ADD PRIMARY KEY (`id_rombel`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penghasilan`
--
ALTER TABLE `penghasilan`
  ADD PRIMARY KEY (`id_penghasilan`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id_penilaian`);

--
-- Indexes for table `penilaian_proyek`
--
ALTER TABLE `penilaian_proyek`
  ADD PRIMARY KEY (`id_penilaian`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `pesertaun`
--
ALTER TABLE `pesertaun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peserta_us`
--
ALTER TABLE `peserta_us`
  ADD UNIQUE KEY `peserta_didik_id` (`peserta_didik_id`);

--
-- Indexes for table `pip`
--
ALTER TABLE `pip`
  ADD PRIMARY KEY (`id_pip`);

--
-- Indexes for table `potongan_gaji`
--
ALTER TABLE `potongan_gaji`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prestasi`
--
ALTER TABLE `prestasi`
  ADD PRIMARY KEY (`idprestasi`);

--
-- Indexes for table `printer`
--
ALTER TABLE `printer`
  ADD PRIMARY KEY (`id_printer`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id_prov`);

--
-- Indexes for table `ptk`
--
ALTER TABLE `ptk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ptk_id` (`ptk_id`);

--
-- Indexes for table `ranking_ikm`
--
ALTER TABLE `ranking_ikm`
  ADD PRIMARY KEY (`id_rank`);

--
-- Indexes for table `raport`
--
ALTER TABLE `raport`
  ADD PRIMARY KEY (`id_raport`);

--
-- Indexes for table `raport_ikm`
--
ALTER TABLE `raport_ikm`
  ADD PRIMARY KEY (`id_raport`);

--
-- Indexes for table `raport_k13`
--
ALTER TABLE `raport_k13`
  ADD PRIMARY KEY (`id_raport`);

--
-- Indexes for table `rapor_akm`
--
ALTER TABLE `rapor_akm`
  ADD PRIMARY KEY (`id_rapor`);

--
-- Indexes for table `riwayat_pendidikan`
--
ALTER TABLE `riwayat_pendidikan`
  ADD PRIMARY KEY (`id_riwayat`);

--
-- Indexes for table `rombel`
--
ALTER TABLE `rombel`
  ADD PRIMARY KEY (`id_rombel`);

--
-- Indexes for table `saran`
--
ALTER TABLE `saran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sas`
--
ALTER TABLE `sas`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `sekolah`
--
ALTER TABLE `sekolah`
  ADD UNIQUE KEY `sekolah_id` (`sekolah_id`);

--
-- Indexes for table `session_viewer`
--
ALTER TABLE `session_viewer`
  ADD PRIMARY KEY (`id_count`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id_shift`);

--
-- Indexes for table `sikap`
--
ALTER TABLE `sikap`
  ADD PRIMARY KEY (`id_sikap`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `peserta_didik_id` (`peserta_didik_id`);

--
-- Indexes for table `sk`
--
ALTER TABLE `sk`
  ADD PRIMARY KEY (`id_sk`);

--
-- Indexes for table `skkb`
--
ALTER TABLE `skkb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sk_aktif`
--
ALTER TABLE `sk_aktif`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sk_pip`
--
ALTER TABLE `sk_pip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slip_gaji`
--
ALTER TABLE `slip_gaji`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smutasi`
--
ALTER TABLE `smutasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `status_kepegawaian`
--
ALTER TABLE `status_kepegawaian`
  ADD UNIQUE KEY `status_kepegawaian_id` (`status_kepegawaian_id`);

--
-- Indexes for table `sts`
--
ALTER TABLE `sts`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `subtema`
--
ALTER TABLE `subtema`
  ADD PRIMARY KEY (`id_sub`);

--
-- Indexes for table `sumatif`
--
ALTER TABLE `sumatif`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `surah`
--
ALTER TABLE `surah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surah_pilihan`
--
ALTER TABLE `surah_pilihan`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `surat_ijin`
--
ALTER TABLE `surat_ijin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tabungan`
--
ALTER TABLE `tabungan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tahfidz`
--
ALTER TABLE `tahfidz`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `tapel`
--
ALTER TABLE `tapel`
  ADD PRIMARY KEY (`id_tapel`);

--
-- Indexes for table `tarif_spp`
--
ALTER TABLE `tarif_spp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telegram`
--
ALTER TABLE `telegram`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`id_tema`);

--
-- Indexes for table `tema_proyek`
--
ALTER TABLE `tema_proyek`
  ADD PRIMARY KEY (`id_tema`);

--
-- Indexes for table `temp_pas`
--
ALTER TABLE `temp_pas`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `temp_pts`
--
ALTER TABLE `temp_pts`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `titimangsa`
--
ALTER TABLE `titimangsa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp`
--
ALTER TABLE `tp`
  ADD PRIMARY KEY (`id_tp`);

--
-- Indexes for table `transportasi`
--
ALTER TABLE `transportasi`
  ADD PRIMARY KEY (`id_transportasi`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id_tugas`);

--
-- Indexes for table `tunggakan_lain`
--
ALTER TABLE `tunggakan_lain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uas`
--
ALTER TABLE `uas`
  ADD PRIMARY KEY (`id_uas`);

--
-- Indexes for table `uasbn`
--
ALTER TABLE `uasbn`
  ADD PRIMARY KEY (`id_uasbn`);

--
-- Indexes for table `uasbn_praktek`
--
ALTER TABLE `uasbn_praktek`
  ADD PRIMARY KEY (`id_uasbn`);

--
-- Indexes for table `ulhar`
--
ALTER TABLE `ulhar`
  ADD PRIMARY KEY (`id_ulhar`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `usm1`
--
ALTER TABLE `usm1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_praktek`
--
ALTER TABLE `us_praktek`
  ADD UNIQUE KEY `peserta_didik_id` (`peserta_didik_id`);

--
-- Indexes for table `us_tulis`
--
ALTER TABLE `us_tulis`
  ADD UNIQUE KEY `peserta_didik_id` (`peserta_didik_id`);

--
-- Indexes for table `uts`
--
ALTER TABLE `uts`
  ADD PRIMARY KEY (`id_uts`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id_video`);

--
-- Indexes for table `wiki`
--
ALTER TABLE `wiki`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `absensi_ptk`
--
ALTER TABLE `absensi_ptk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `absen_config`
--
ALTER TABLE `absen_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `anak`
--
ALTER TABLE `anak`
  MODIFY `id_anak` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `arbain`
--
ALTER TABLE `arbain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `berita_acara`
--
ALTER TABLE `berita_acara`
  MODIFY `id_bap` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bulan_spp`
--
ALTER TABLE `bulan_spp`
  MODIFY `id_bulan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `catatan`
--
ALTER TABLE `catatan`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_absensi`
--
ALTER TABLE `data_absensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_ekskul`
--
ALTER TABLE `data_ekskul`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_kesehatan`
--
ALTER TABLE `data_kesehatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_prestasi`
--
ALTER TABLE `data_prestasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_proyek`
--
ALTER TABLE `data_proyek`
  MODIFY `id_proyek` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deskripsi_k13`
--
ALTER TABLE `deskripsi_k13`
  MODIFY `id_raport` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dimensi_proyek`
--
ALTER TABLE `dimensi_proyek`
  MODIFY `id_dimensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `doa`
--
ALTER TABLE `doa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `doa_harian`
--
ALTER TABLE `doa_harian`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ekskul`
--
ALTER TABLE `ekskul`
  MODIFY `id_ekskul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `elemen_proyek`
--
ALTER TABLE `elemen_proyek`
  MODIFY `id_elemen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filepkg`
--
ALTER TABLE `filepkg`
  MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formatif`
--
ALTER TABLE `formatif`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gajipokok`
--
ALTER TABLE `gajipokok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hadits`
--
ALTER TABLE `hadits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `hadits_arbain`
--
ALTER TABLE `hadits_arbain`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hadits_pilihan`
--
ALTER TABLE `hadits_pilihan`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hafalan`
--
ALTER TABLE `hafalan`
  MODIFY `id_hafalan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `harilibur`
--
ALTER TABLE `harilibur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hari_efektif`
--
ALTER TABLE `hari_efektif`
  MODIFY `id_hari` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `id_pegawai`
--
ALTER TABLE `id_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ijazah`
--
ALTER TABLE `ijazah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ijin_ptk`
--
ALTER TABLE `ijin_ptk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `indikator`
--
ALTER TABLE `indikator`
  MODIFY `id_indikator` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jadwalku`
--
ALTER TABLE `jadwalku`
  MODIFY `jadwal_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_tunggakan`
--
ALTER TABLE `jenis_tunggakan`
  MODIFY `id_tunggakan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `jenjang_pendidikan`
--
ALTER TABLE `jenjang_pendidikan`
  MODIFY `id_jenjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `juzamma`
--
ALTER TABLE `juzamma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `kd`
--
ALTER TABLE `kd`
  MODIFY `id_kd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kd_sosial`
--
ALTER TABLE `kd_sosial`
  MODIFY `ids` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kd_spirit`
--
ALTER TABLE `kd_spirit`
  MODIFY `ids` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `keahlian`
--
ALTER TABLE `keahlian`
  MODIFY `idke` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id_keg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kip`
--
ALTER TABLE `kip`
  MODIFY `id_kip` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kkm`
--
ALTER TABLE `kkm`
  MODIFY `id_kkm` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kkmku`
--
ALTER TABLE `kkmku`
  MODIFY `id_kkm` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kurikulum`
--
ALTER TABLE `kurikulum`
  MODIFY `id_kurikulum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lingkup_materi`
--
ALTER TABLE `lingkup_materi`
  MODIFY `id_lm` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loginattempts`
--
ALTER TABLE `loginattempts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mengajar`
--
ALTER TABLE `mengajar`
  MODIFY `id_mengajar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nasabah`
--
ALTER TABLE `nasabah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nats`
--
ALTER TABLE `nats`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nh`
--
ALTER TABLE `nh`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nh_temp`
--
ALTER TABLE `nh_temp`
  MODIFY `id_nh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116550;

--
-- AUTO_INCREMENT for table `nilaiun`
--
ALTER TABLE `nilaiun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nk`
--
ALTER TABLE `nk`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nk_temp`
--
ALTER TABLE `nk_temp`
  MODIFY `id_nh` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nso`
--
ALTER TABLE `nso`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nso_pai`
--
ALTER TABLE `nso_pai`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nso_temp`
--
ALTER TABLE `nso_temp`
  MODIFY `id_nh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8521;

--
-- AUTO_INCREMENT for table `nsp`
--
ALTER TABLE `nsp`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nsp_pai`
--
ALTER TABLE `nsp_pai`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nsp_temp`
--
ALTER TABLE `nsp_temp`
  MODIFY `id_nh` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nuts`
--
ALTER TABLE `nuts`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_bayar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran_temp`
--
ALTER TABLE `pembayaran_temp`
  MODIFY `id_bayar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembelajaran`
--
ALTER TABLE `pembelajaran`
  MODIFY `idpb` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemetaan`
--
ALTER TABLE `pemetaan`
  MODIFY `id_pemetaan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemetaan_proyek`
--
ALTER TABLE `pemetaan_proyek`
  MODIFY `id_pemetaan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pend_terakhir`
--
ALTER TABLE `pend_terakhir`
  MODIFY `idPend` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `penempatan`
--
ALTER TABLE `penempatan`
  MODIFY `id_rombel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penilaian_proyek`
--
ALTER TABLE `penilaian_proyek`
  MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id_pesan` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesertaun`
--
ALTER TABLE `pesertaun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pip`
--
ALTER TABLE `pip`
  MODIFY `id_pip` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `potongan_gaji`
--
ALTER TABLE `potongan_gaji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prestasi`
--
ALTER TABLE `prestasi`
  MODIFY `idprestasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `printer`
--
ALTER TABLE `printer`
  MODIFY `id_printer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ptk`
--
ALTER TABLE `ptk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `ranking_ikm`
--
ALTER TABLE `ranking_ikm`
  MODIFY `id_rank` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `raport`
--
ALTER TABLE `raport`
  MODIFY `id_raport` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `raport_ikm`
--
ALTER TABLE `raport_ikm`
  MODIFY `id_raport` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `raport_k13`
--
ALTER TABLE `raport_k13`
  MODIFY `id_raport` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rapor_akm`
--
ALTER TABLE `rapor_akm`
  MODIFY `id_rapor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `riwayat_pendidikan`
--
ALTER TABLE `riwayat_pendidikan`
  MODIFY `id_riwayat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rombel`
--
ALTER TABLE `rombel`
  MODIFY `id_rombel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `saran`
--
ALTER TABLE `saran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sas`
--
ALTER TABLE `sas`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session_viewer`
--
ALTER TABLE `session_viewer`
  MODIFY `id_count` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `id_shift` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sikap`
--
ALTER TABLE `sikap`
  MODIFY `id_sikap` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sk`
--
ALTER TABLE `sk`
  MODIFY `id_sk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skkb`
--
ALTER TABLE `skkb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sk_aktif`
--
ALTER TABLE `sk_aktif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sk_pip`
--
ALTER TABLE `sk_pip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slip_gaji`
--
ALTER TABLE `slip_gaji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smutasi`
--
ALTER TABLE `smutasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sts`
--
ALTER TABLE `sts`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subtema`
--
ALTER TABLE `subtema`
  MODIFY `id_sub` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sumatif`
--
ALTER TABLE `sumatif`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surah`
--
ALTER TABLE `surah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `surah_pilihan`
--
ALTER TABLE `surah_pilihan`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat_ijin`
--
ALTER TABLE `surat_ijin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabungan`
--
ALTER TABLE `tabungan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tahfidz`
--
ALTER TABLE `tahfidz`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tapel`
--
ALTER TABLE `tapel`
  MODIFY `id_tapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tarif_spp`
--
ALTER TABLE `tarif_spp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `telegram`
--
ALTER TABLE `telegram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tema`
--
ALTER TABLE `tema`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tema_proyek`
--
ALTER TABLE `tema_proyek`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `temp_pas`
--
ALTER TABLE `temp_pas`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_pts`
--
ALTER TABLE `temp_pts`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `titimangsa`
--
ALTER TABLE `titimangsa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tp`
--
ALTER TABLE `tp`
  MODIFY `id_tp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id_tugas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tunggakan_lain`
--
ALTER TABLE `tunggakan_lain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uas`
--
ALTER TABLE `uas`
  MODIFY `id_uas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ulhar`
--
ALTER TABLE `ulhar`
  MODIFY `id_ulhar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `uts`
--
ALTER TABLE `uts`
  MODIFY `id_uts` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki`
--
ALTER TABLE `wiki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
