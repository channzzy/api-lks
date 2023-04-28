-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2023 at 09:51 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodxyz`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga_item` varchar(40) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`id`, `nama_barang`, `harga_item`, `image`) VALUES
(1, 'Nasi Goreng', '25000', 'nasigoreng.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_token`
--

CREATE TABLE `tbl_token` (
  `id` int(10) UNSIGNED NOT NULL,
  `token` varchar(80) NOT NULL,
  `expired` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_user` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_token`
--

INSERT INTO `tbl_token` (`id`, `token`, `expired`, `id_user`) VALUES
(1, 'de7f7799869cde72aa107f64006bc827', '2023-04-29 01:11:03', 1),
(2, '49597ad7278e8d4c77bc59922a7a0436', '2023-04-29 01:56:36', 1),
(3, '4b2fbdb730c13d95e286d547d00c2792', '2023-04-29 01:57:26', 1),
(4, '64697dc7a95b85ff7a9af0c8ce94e5db', '2023-04-29 02:29:03', 1),
(5, 'ef57360ff8e823c75d3dd77a0f4860b7', '2023-04-29 02:29:51', 1),
(6, 'f70b55c0d204f6ff6cc13b7796334fb7', '2023-04-29 02:29:54', 1),
(7, 'dd0f0c1495370614de9b323378a6e061', '2023-04-29 02:30:49', 1),
(8, '5eb64f16d1d6f15256ff17894de90cdf', '2023-04-29 02:30:59', 1),
(9, 'd5e32fcd1d1b891c78a1ddf49d68c229', '2023-04-29 02:31:42', 1),
(10, '4c5c5804fc69ff69e631004da867f6df', '2023-04-29 02:32:33', 1),
(11, '1d2eb71cb89bcba16239fea9a5b1cf98', '2023-04-29 02:33:02', 1),
(12, 'c720f76acd5ca58795a9ee49c08edb35', '2023-04-29 02:35:11', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_user` varchar(80) NOT NULL,
  `alamat` varchar(80) NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `nama_user`, `alamat`, `telepon`, `username`, `password`) VALUES
(1, 'Chandra', 'Cirebon', '895612965196', 'chanzy', '6af1e9302c4ddd46420d59050e12556f'),
(2, 'ardiansyah', 'jakarta', '8956127890', 'ardi', '0264391c340e4d3cbba430cee7836eaf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_token`
--
ALTER TABLE `tbl_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_IDUser` (`id_user`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_token`
--
ALTER TABLE `tbl_token`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_token`
--
ALTER TABLE `tbl_token`
  ADD CONSTRAINT `FK_IDUser` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
