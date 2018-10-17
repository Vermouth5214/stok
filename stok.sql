-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2018 at 10:08 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.1.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stok`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_control`
--

CREATE TABLE `access_control` (
  `id` int(11) NOT NULL,
  `user_level_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `content` text,
  `user_modified` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `access_control`
--

INSERT INTO `access_control` (`id`, `user_level_id`, `module_id`, `content`, `user_modified`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'a', 1, '2017-10-17 09:26:05', '2017-10-17 09:26:05'),
(2, 1, 2, 'a', 1, '2017-10-17 09:26:05', '2017-10-17 09:26:05'),
(3, 1, 3, 'a', 1, '2017-10-17 09:26:05', '2017-10-17 09:26:05'),
(4, 2, 1, 'a', 1, '2017-10-17 09:26:13', '2018-03-12 02:31:53'),
(5, 2, 2, 'a', 1, '2017-10-17 09:26:13', '2018-03-12 02:31:53'),
(6, 2, 3, 'a', 1, '2017-10-17 09:26:13', '2018-03-12 02:31:53'),
(7, 3, 1, 'v', 1, '2017-10-17 09:26:18', '2017-10-17 09:26:18'),
(8, 3, 2, 'v', 1, '2017-10-17 09:26:18', '2017-10-17 09:26:18'),
(9, 3, 3, 'v', 1, '2017-10-17 09:26:18', '2017-10-17 09:26:18'),
(10, 1, 4, 'a', 1, '2018-01-17 15:39:29', '2018-01-17 15:39:29'),
(11, 2, 4, 'a', 1, '2018-01-17 15:39:34', '2018-03-12 02:31:53'),
(12, 3, 4, 'v', 1, '2018-01-17 15:39:38', '2018-01-17 15:39:38'),
(13, 1, 5, 'a', 1, '2018-03-11 04:50:00', '2018-03-11 04:50:00'),
(14, 2, 5, 'a', 1, '2018-03-11 04:50:02', '2018-03-12 02:31:53'),
(15, 3, 5, 'v', 1, '2018-03-11 04:50:05', '2018-03-11 04:50:05'),
(16, 1, 6, 'a', 1, '2018-03-11 09:48:27', '2018-03-11 09:48:27'),
(17, 2, 6, 'a', 1, '2018-03-11 09:48:30', '2018-03-12 02:31:53'),
(18, 3, 6, 'v', 1, '2018-03-11 09:48:33', '2018-03-11 09:48:33'),
(19, 1, 7, 'a', 1, '2018-03-13 02:48:54', '2018-03-13 02:48:54'),
(20, 2, 7, 'a', 1, '2018-03-13 02:48:56', '2018-03-13 02:48:56'),
(21, 3, 7, 'v', 1, '2018-03-13 02:48:59', '2018-03-13 02:48:59'),
(22, 1, 8, 'a', 1, '2018-03-13 07:04:45', '2018-03-13 07:04:45'),
(23, 2, 8, 'a', 1, '2018-03-13 07:04:48', '2018-03-13 07:04:48'),
(24, 3, 8, 'v', 1, '2018-03-13 07:04:51', '2018-03-13 07:04:51'),
(25, 1, 9, 'a', 1, '2018-03-13 07:35:47', '2018-03-13 07:35:47'),
(26, 2, 9, 'a', 1, '2018-03-13 07:35:50', '2018-03-13 07:35:50'),
(27, 3, 9, 'v', 1, '2018-03-13 07:35:52', '2018-03-13 07:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `kode` varchar(45) DEFAULT NULL,
  `nama` varchar(300) DEFAULT NULL,
  `jenis_mobil` text,
  `harga_jual` int(11) DEFAULT NULL,
  `keterangan` text,
  `active` int(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_modified` int(11) DEFAULT NULL,
  `stok_awal` int(11) DEFAULT '0',
  `stok_total` int(11) DEFAULT '0',
  `harga_beli` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kode`, `nama`, `jenis_mobil`, `harga_jual`, `keterangan`, `active`, `created_at`, `updated_at`, `user_modified`, `stok_awal`, `stok_total`, `harga_beli`) VALUES
(1, 'MB001', 'Barang 1', 'Jenis Mobil 1 Update', 230000, 'Keterangan', 1, '2018-03-11 05:44:50', '2018-03-13 07:28:36', 2, 50, 56, 150000),
(2, 'MB002', 'Barang 2', 'Jenis Mobil 2', 135000, 'Keterangan 2', 1, '2018-03-11 09:55:26', '2018-03-13 07:28:36', 2, 75, 80, 100000),
(3, 'MB003', 'Barang 3', 'Jenis Mobil 3', 85000, 'Keterangan 3', 1, '2018-03-12 03:43:21', '2018-03-13 07:28:36', 2, 35, 42, 50000),
(4, 'MB004', 'Barang 4', 'Jenis Mobil 4', 45000, 'Keterangan 4', 1, '2018-03-12 10:41:23', '2018-03-13 07:28:36', 1, 10, 7, 25000);

-- --------------------------------------------------------

--
-- Table structure for table `media_library`
--

CREATE TABLE `media_library` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `user_created` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media_library`
--

INSERT INTO `media_library` (`id`, `name`, `type`, `url`, `size`, `user_created`, `created_at`, `updated_at`) VALUES
(0, 'noprofileimage', 'png', 'img/noprofileimage.png', '1159', 1, '2017-05-29 19:56:03', '2017-05-29 19:56:03'),
(1, 'tumblr_o8dmovrRZ21v9dlz9o9_250', 'png', 'upload/img/tumblr_o8dmovrRZ21v9dlz9o9_250.png', '76098', 1, '2017-10-18 05:36:36', '2017-10-18 05:36:36'),
(2, 'tumblr_oo8kv5a44d1s81jsfo2_250', 'png', 'upload/img/tumblr_oo8kv5a44d1s81jsfo2_250.png', '76301', 1, '2017-10-18 05:41:25', '2017-10-18 05:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(20) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `user_modified` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `slug`, `active`, `user_modified`, `created_at`, `updated_at`) VALUES
(1, 'Master User Level', 'users-level', 1, 1, '2017-10-17 07:07:07', '2017-10-17 07:43:43'),
(2, 'Master User', 'users-user', 1, 1, '2017-10-17 07:16:51', '2017-10-17 07:49:30'),
(3, 'Media Library', 'media-library', 1, 1, '2017-10-17 07:19:28', '2017-10-17 07:49:34'),
(4, 'Master Supplier', 'supplier', 1, 1, '2018-01-17 15:39:23', '2018-01-17 15:39:23'),
(5, 'Master Barang', 'barang', 1, 1, '2018-03-11 04:49:55', '2018-03-11 04:49:55'),
(6, 'Purchase Order', 'purchase-order', 1, 1, '2018-03-11 09:48:22', '2018-03-11 09:48:22'),
(7, 'Penjualan', 'penjualan', 1, 1, '2018-03-13 02:48:47', '2018-03-13 02:48:47'),
(8, 'Koreksi Stok Total', 'koreksi-stok-total', 1, 1, '2018-03-13 07:04:38', '2018-03-13 07:04:38'),
(9, 'Inden', 'inden', 1, 1, '2018-03-13 07:35:41', '2018-03-13 07:35:41');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_d`
--

CREATE TABLE `penjualan_d` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_penjualan` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_d`
--

INSERT INTO `penjualan_d` (`id`, `id_barang`, `jumlah`, `harga`, `created_at`, `updated_at`, `id_penjualan`) VALUES
(12, 1, 25, 230000, '2018-03-13 06:44:55', '2018-03-13 06:44:55', 9),
(11, 4, 3, 45000, '2018-03-13 06:44:32', '2018-03-13 06:44:32', 8),
(9, 4, 3, 45000, '2018-03-13 06:38:57', '2018-03-13 06:38:57', 6),
(10, 4, 3, 45000, '2018-03-13 06:43:07', '2018-03-13 06:43:07', 7),
(13, 2, 5, 135000, '2018-03-13 06:49:38', '2018-03-13 06:49:38', 10);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_h`
--

CREATE TABLE `penjualan_h` (
  `id` int(11) NOT NULL,
  `no_nota` varchar(45) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_modified` int(11) DEFAULT NULL,
  `keterangan` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_h`
--

INSERT INTO `penjualan_h` (`id`, `no_nota`, `tanggal`, `total`, `active`, `created_at`, `updated_at`, `user_modified`, `keterangan`) VALUES
(10, 'NOT/03/13/0003', '2018-03-13', 675000, 1, '2018-03-13 06:49:38', '2018-03-13 06:49:38', 2, NULL),
(9, 'NOT/03/13/0002', '2018-03-13', 5750000, 0, '2018-03-13 06:44:55', '2018-03-13 06:45:27', 2, NULL),
(8, 'NOT/03/13/0001', '2018-03-13', 135000, 1, '2018-03-13 06:44:32', '2018-03-13 06:44:32', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_d`
--

CREATE TABLE `purchase_d` (
  `id` int(11) NOT NULL,
  `id_purchase` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_d`
--

INSERT INTO `purchase_d` (`id`, `id_purchase`, `id_barang`, `jumlah`, `harga`, `created_at`, `updated_at`) VALUES
(19, 1, 3, 6, 90000, '2018-03-12 03:44:58', '2018-03-12 03:44:58'),
(18, 1, 2, 10, 130000, '2018-03-12 03:44:58', '2018-03-12 03:44:58'),
(20, 3, 1, 1, 150000, '2018-03-12 04:08:43', '2018-03-12 04:08:43'),
(17, 1, 1, 5, 130000, '2018-03-12 03:44:58', '2018-03-12 03:44:58'),
(21, 3, 3, 1, 50000, '2018-03-12 04:08:43', '2018-03-12 04:08:43'),
(26, 4, 3, 15, 50000, '2018-03-14 04:08:13', '2018-03-14 04:08:13'),
(25, 4, 1, 5, 160000, '2018-03-14 04:08:13', '2018-03-14 04:08:13');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_h`
--

CREATE TABLE `purchase_h` (
  `id` int(11) NOT NULL,
  `no_inv` varchar(45) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `id_sup` int(11) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `status` enum('order','received') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_modified` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `keterangan` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_h`
--

INSERT INTO `purchase_h` (`id`, `no_inv`, `total`, `id_sup`, `active`, `status`, `created_at`, `updated_at`, `user_modified`, `tanggal`, `keterangan`) VALUES
(3, 'INV/03/11/00002', 200000, 1, 1, 'received', '2018-03-12 04:08:43', '2018-03-12 04:08:53', 2, '2018-03-12', '-'),
(1, 'INV/03/11/00001', 2490000, 2, 1, 'received', '2018-03-11 13:34:20', '2018-03-12 04:04:39', 2, '2018-03-11', 'Keterangan 1'),
(4, 'INV/03/13/00001', 1550000, 2, 1, 'order', '2018-03-12 17:10:41', '2018-03-14 04:08:13', 1, '2018-03-13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value` text,
  `user_modified` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `user_modified`, `created_at`, `updated_at`) VALUES
(1, 'title', 'ODWin Panel', 2, '2017-06-13 00:27:16', '2018-02-22 06:01:44'),
(2, 'logo', 'img/logo.png', 1, '2017-06-13 00:27:16', '2017-10-18 08:20:33'),
(3, 'email_admin', 'admin@admin.com ', 2, '2017-06-13 00:27:16', '2018-02-22 06:01:44'),
(4, 'email_server', NULL, 1, '2017-06-13 00:27:16', '2017-07-25 00:30:04'),
(6, 'company_description', 'description', 1, '2017-07-23 23:56:28', '2017-07-24 00:13:45'),
(5, 'company_name', 'ODWin Panel', 1, '2017-07-23 23:56:28', '2017-07-24 00:13:45');

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `keterangan` text,
  `jumlah` int(11) DEFAULT NULL,
  `type` enum('beli','jual') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`id`, `id_barang`, `keterangan`, `jumlah`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'INV/03/11/00001', 5, 'beli', '2018-03-12 04:04:39', '2018-03-12 04:04:39'),
(2, 2, 'INV/03/11/00001', 10, 'beli', '2018-03-12 04:04:39', '2018-03-12 04:04:39'),
(3, 3, 'INV/03/11/00001', 6, 'beli', '2018-03-12 04:04:39', '2018-03-12 04:04:39'),
(4, 1, 'INV/03/11/00002', 1, 'beli', '2018-03-12 04:08:53', '2018-03-12 04:08:53'),
(5, 3, 'INV/03/11/00002', 1, 'beli', '2018-03-12 04:08:53', '2018-03-12 04:08:53'),
(14, 2, 'NOT/03/13/0003', -5, 'jual', '2018-03-13 06:49:38', '2018-03-13 06:49:38'),
(12, 4, 'NOT/03/13/0001', -3, 'jual', '2018-03-13 06:44:32', '2018-03-13 06:44:32');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text,
  `cp` varchar(100) DEFAULT NULL,
  `telp` text,
  `active` int(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_modified` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `nama`, `alamat`, `cp`, `telp`, `active`, `created_at`, `updated_at`, `user_modified`) VALUES
(1, 'Supplier 1', 'Jl Madura 11 A\r\n65117\r\nMalang\r\nJawa Timur', 'Donny', '082818392138912\r\n083138883982891', 1, '2018-01-17 08:21:02', '2018-01-17 08:21:02', 1),
(2, 'Supplier 2', NULL, NULL, NULL, 1, '2018-03-11 11:41:51', '2018-03-11 11:42:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_expired` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id`, `user_id`, `token`, `token_expired`, `created_at`, `updated_at`) VALUES
(17, 1, '$2y$10$2tG5BuD7Lpbz97SnO8OkAOuqGiAxkAkJitD3BZSUi4xmezY2tpqo6', '2018-03-14 11:07:58', '2018-03-14 04:07:58', '2018-03-14 04:07:58'),
(15, 2, '$2y$10$Qj.A5cOcTIDBXFq8wQyeguZitEpIhJ47CIMykb/xJfOz528ZbuXvy', '2018-10-11 16:08:31', '2018-03-13 07:36:01', '2018-10-11 09:08:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_level_id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `avatar_id` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` int(1) NOT NULL,
  `user_modified` int(11) DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_level_id`, `firstname`, `lastname`, `avatar_id`, `email`, `username`, `password`, `active`, `user_modified`, `last_activity`, `created_at`, `updated_at`) VALUES
(1, 1, 'Super', 'Admin', 1, 'superadmin@admin.com', 'superadmin', '$2y$10$wdDD7d/0hSwjqTKnovVRiOyXDYSVbSlRmdTkOL7nh4aEEfkyMcg.C', 1, 1, '2018-03-14 04:07:58', '2017-03-13 20:51:35', '2018-03-14 04:07:58'),
(2, 2, 'Admin', 'Admin', 0, 'admin@admin.com', 'admin', '$2y$10$PQaUY4b0YsSo5qAuK8Cc.OB.WeEJHrJJ0FDgk6YE9xhXboVRou3We', 1, 1, '2018-10-11 09:08:32', '2017-04-19 14:29:01', '2018-10-11 09:08:32');

-- --------------------------------------------------------

--
-- Table structure for table `user_levels`
--

CREATE TABLE `user_levels` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `active` int(1) DEFAULT NULL,
  `user_modified` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_levels`
--

INSERT INTO `user_levels` (`id`, `name`, `active`, `user_modified`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 1, 1, '2017-06-28 06:18:17', '2017-06-28 06:18:17'),
(2, 'Admin', 1, 1, '2017-07-28 01:02:10', '2017-07-28 01:02:10'),
(3, 'User', 1, 1, '2017-10-18 06:38:07', '2017-10-18 06:37:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_control`
--
ALTER TABLE `access_control`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_library`
--
ALTER TABLE `media_library`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan_d`
--
ALTER TABLE `penjualan_d`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan_h`
--
ALTER TABLE `penjualan_h`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_d`
--
ALTER TABLE `purchase_d`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_h`
--
ALTER TABLE `purchase_h`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_levels`
--
ALTER TABLE `user_levels`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_control`
--
ALTER TABLE `access_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `media_library`
--
ALTER TABLE `media_library`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `penjualan_d`
--
ALTER TABLE `penjualan_d`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `penjualan_h`
--
ALTER TABLE `penjualan_h`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `purchase_d`
--
ALTER TABLE `purchase_d`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `purchase_h`
--
ALTER TABLE `purchase_h`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stok`
--
ALTER TABLE `stok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_levels`
--
ALTER TABLE `user_levels`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
