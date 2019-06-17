-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2019 at 05:59 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lelangindah`
--

-- --------------------------------------------------------

--
-- Table structure for table `confirm_lelang`
--

CREATE TABLE `confirm_lelang` (
  `id_confirm` int(11) NOT NULL,
  `id_daftar_pemenang` int(11) NOT NULL,
  `nama_file` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `daftar_pemenang`
--

CREATE TABLE `daftar_pemenang` (
  `id_daftar_pemenang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `id_iklan` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iklan`
--

CREATE TABLE `iklan` (
  `id_iklan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_iklan` date NOT NULL,
  `file_iklan` varchar(35) NOT NULL,
  `judul_iklan` varchar(35) NOT NULL,
  `isi_iklan` text NOT NULL,
  `status` enum('0','1') NOT NULL,
  `harga_lelang` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iklan`
--

INSERT INTO `iklan` (`id_iklan`, `id_user`, `tgl_iklan`, `file_iklan`, `judul_iklan`, `isi_iklan`, `status`, `harga_lelang`) VALUES
(6, 5, '2019-06-13', '5_20190613_171706.jpg', 'Motor Suzuki 2019', '150cc', '1', 100000),
(7, 5, '2019-06-14', '5_20190614_163929.jpg', 'Motor Nmax 2018', 'Tipe Mesin	Liquid cooled 4-stroke, SOHC\r\nJumlah/Posisi silinder	Single Cylinder\r\nKapasitas Mesin	155cc\r\nDiameter x langkah	58,0 mm x 58.7 mm\r\nPerbandingan kompresi	10,5 : 1\r\nDaya maksimum	11.1 kW/8000 rpm\r\nTorsi maksimum	14.4 Nm/6000 rpm\r\nSistem Starter	Electric Starter\r\nSistem Pelumasan	Basah\r\nKapasitas Oli Mesin	Total â€“ 1,00 L ; Berkala 0,90 L\r\nSistem Bahan Bakar	FI (Fuel Injection)\r\nTipe Kopling	Kering, Centrifugal Automatic\r\nTipe Transmisi	V-belt Automatic', '1', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int(11) NOT NULL,
  `id_iklan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `isi_komentar` text NOT NULL,
  `waktu_komentar` date NOT NULL,
  `jam` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id_komentar`, `id_iklan`, `id_user`, `isi_komentar`, `waktu_komentar`, `jam`) VALUES
(6, 6, 0, '110000', '2019-06-13', '18:28:54'),
(7, 6, 6, '110000', '2019-06-13', '18:44:48'),
(8, 6, 6, '110000', '2019-06-13', '18:45:34'),
(9, 6, 6, '110000', '2019-06-13', '18:48:53'),
(10, 6, 6, '1299999', '2019-06-13', '18:48:57'),
(11, 6, 6, '1309999', '2019-06-14', '08:55:45'),
(12, 6, 7, '1319999', '2019-06-14', '09:53:31'),
(13, 6, 6, '1329999', '2019-06-14', '10:06:56'),
(14, 6, 6, '1339999', '2019-06-14', '10:08:58'),
(15, 7, 0, '10000', '2019-06-14', '17:41:01'),
(16, 7, 7, '20000', '2019-06-14', '17:41:30'),
(17, 7, 7, '30000', '2019-06-14', '17:41:36'),
(18, 7, 0, '40000', '2019-06-15', '15:26:04'),
(19, 7, 6, '50000', '2019-06-15', '15:36:00'),
(20, 6, 6, '1349999', '2019-06-15', '15:44:47');

-- --------------------------------------------------------

--
-- Table structure for table `lelang`
--

CREATE TABLE `lelang` (
  `id_lelang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_iklan` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `ikhtisar` longtext,
  `nama_file` varchar(200) NOT NULL,
  `status_menang` varchar(1) NOT NULL,
  `checked` enum('0','1') NOT NULL,
  `time_bid` date NOT NULL,
  `jam` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lelang`
--

INSERT INTO `lelang` (`id_lelang`, `id_user`, `id_iklan`, `harga`, `ikhtisar`, `nama_file`, `status_menang`, `checked`, `time_bid`, `jam`) VALUES
(10, 6, 6, 1309999, NULL, '', '0', '0', '2019-06-14', '08:55:45'),
(11, 7, 6, 1319999, NULL, '', '0', '0', '2019-06-14', '09:53:31'),
(12, 6, 6, 1329999, NULL, '', '0', '0', '2019-06-14', '10:06:56'),
(13, 6, 6, 1339999, NULL, '', '0', '0', '2019-06-14', '10:08:58'),
(14, 0, 7, 10000, NULL, '', '0', '0', '2019-06-14', '17:41:01'),
(15, 7, 7, 20000, NULL, '', '0', '0', '2019-06-14', '17:41:30'),
(16, 7, 7, 30000, NULL, '', '0', '0', '2019-06-14', '17:41:36'),
(17, 0, 7, 40000, NULL, '', '0', '0', '2019-06-15', '15:26:04'),
(18, 6, 7, 50000, NULL, '', '0', '0', '2019-06-15', '15:36:00'),
(19, 6, 6, 1349999, NULL, '', '0', '0', '2019-06-15', '15:44:47');

-- --------------------------------------------------------

--
-- Table structure for table `notif_comentar`
--

CREATE TABLE `notif_comentar` (
  `id_notif` int(11) NOT NULL,
  `id_iklan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notif_comentar`
--

INSERT INTO `notif_comentar` (`id_notif`, `id_iklan`, `id_user`, `status`) VALUES
(4, 6, 5, '1'),
(5, 6, 0, '1'),
(6, 6, 6, '0'),
(7, 6, 7, '1'),
(8, 7, 5, '1'),
(9, 7, 0, '1'),
(10, 7, 7, '1');

-- --------------------------------------------------------

--
-- Table structure for table `profil`
--

CREATE TABLE `profil` (
  `id_profil` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `tahun_berdiri` date NOT NULL,
  `profil` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profil`
--

INSERT INTO `profil` (`id_profil`, `nama`, `jenis`, `alamat`, `tahun_berdiri`, `profil`) VALUES
(1, 'Lelang Indah', 'Lelang Finance', 'Jl.Joglo Raya', '0000-00-00', 'Keuntungan yang banyak');

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE `rekening` (
  `id_rek` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `bank_rek` varchar(20) NOT NULL,
  `holder_rek` varchar(35) NOT NULL,
  `no_rek` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekening`
--

INSERT INTO `rekening` (`id_rek`, `id_user`, `bank_rek`, `holder_rek`, `no_rek`) VALUES
(3, 5, 'BCA', 'ADMIN ', '083123123'),
(4, 6, 'BCA', 'nasabah', '082313213'),
(5, 7, 'BCA', 'nasabah 2', '0312313');

-- --------------------------------------------------------

--
-- Table structure for table `tutorial`
--

CREATE TABLE `tutorial` (
  `id_tutorial` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tgl` date NOT NULL,
  `kategori` enum('0','1') NOT NULL,
  `isi` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(35) NOT NULL,
  `password` varchar(35) NOT NULL,
  `hak_akses` enum('0','1') NOT NULL,
  `block` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `no_hp`, `email`, `username`, `password`, `hak_akses`, `block`) VALUES
(5, 'Dian Setiyadi', '083812321312313', 'admin@gmail.com', 'admin', '12345', '1', '0'),
(6, 'Nasabah 1', '08312312313', 'dummy@gmail.com', 'nasabah', '12345', '0', '0'),
(7, 'Nasabah 2', '083812321312313', 'dummy@gmail.com', 'nasabah2', '12345', '0', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `confirm_lelang`
--
ALTER TABLE `confirm_lelang`
  ADD PRIMARY KEY (`id_confirm`);

--
-- Indexes for table `daftar_pemenang`
--
ALTER TABLE `daftar_pemenang`
  ADD PRIMARY KEY (`id_daftar_pemenang`);

--
-- Indexes for table `iklan`
--
ALTER TABLE `iklan`
  ADD PRIMARY KEY (`id_iklan`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`);

--
-- Indexes for table `lelang`
--
ALTER TABLE `lelang`
  ADD PRIMARY KEY (`id_lelang`);

--
-- Indexes for table `notif_comentar`
--
ALTER TABLE `notif_comentar`
  ADD PRIMARY KEY (`id_notif`);

--
-- Indexes for table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id_profil`);

--
-- Indexes for table `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`id_rek`);

--
-- Indexes for table `tutorial`
--
ALTER TABLE `tutorial`
  ADD PRIMARY KEY (`id_tutorial`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `confirm_lelang`
--
ALTER TABLE `confirm_lelang`
  MODIFY `id_confirm` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daftar_pemenang`
--
ALTER TABLE `daftar_pemenang`
  MODIFY `id_daftar_pemenang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iklan`
--
ALTER TABLE `iklan`
  MODIFY `id_iklan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `lelang`
--
ALTER TABLE `lelang`
  MODIFY `id_lelang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `notif_comentar`
--
ALTER TABLE `notif_comentar`
  MODIFY `id_notif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `profil`
--
ALTER TABLE `profil`
  MODIFY `id_profil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rekening`
--
ALTER TABLE `rekening`
  MODIFY `id_rek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tutorial`
--
ALTER TABLE `tutorial`
  MODIFY `id_tutorial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
