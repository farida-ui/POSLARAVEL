-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2022 at 02:34 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poslaravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `barcode` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` enum('pcs','pck') COLLATE utf8mb4_unicode_ci NOT NULL,
  `stok` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `profit` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `supplier_id`, `barcode`, `nama`, `satuan`, `stok`, `harga_beli`, `harga_jual`, `profit`, `created_at`, `updated_at`) VALUES
(9, 5, '201904240002', 'Celana Bayi', 'pcs', 43, 60000, 80000, 20000, '2022-09-09 06:52:34', '2022-09-27 06:04:53'),
(13, 7, '201904240003', 'Pasta Gigi Pepsoden', 'pcs', 96, 3000, 4500, 1500, '2022-10-04 13:44:15', '2022-10-04 13:44:15'),
(14, 7, '201904240004', 'Rinso', 'pcs', 96, 700, 1000, 300, '2022-10-06 07:21:42', '2022-10-06 07:21:42');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_penjualan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_pembayaran` int(11) NOT NULL,
  `pembayaran` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`id`, `kode_penjualan`, `total_pembayaran`, `pembayaran`, `kembalian`, `created_at`, `updated_at`) VALUES
(1, 'LM0310220001', 80000, 80000, 0, '2022-10-03 14:45:32', '2022-10-03 14:45:32'),
(2, 'LM0310220002', 80000, 100000, 20000, '2022-10-03 15:24:08', '2022-10-03 15:24:08'),
(4, 'LM0410220003', 19500, 20000, 500, '2022-10-04 13:49:22', '2022-10-04 13:49:22'),
(5, 'LM0410220004', 15000, 15000, 0, '2022-10-04 14:33:11', '2022-10-04 14:33:11'),
(6, 'LM0510220003', 9000, 10000, 1000, '2022-10-05 08:44:15', '2022-10-05 08:44:15'),
(7, 'LM0610220004', 30000, 30000, 0, '2022-10-06 07:18:39', '2022-10-06 07:18:39'),
(8, 'LM0810220005', 15000, 20000, 5000, '2022-10-08 15:07:32', '2022-10-08 15:07:32'),
(9, 'LM1210220006', 7500, 10000, 2500, '2022-10-12 16:55:47', '2022-10-12 16:55:47'),
(10, 'LM0211220001', 80000, 100000, 20000, '2022-11-02 14:27:49', '2022-11-02 14:27:49'),
(11, 'LM0211220002', 80000, 80000, 0, '2022-11-02 14:29:30', '2022-11-02 14:29:30'),
(12, 'LM0211220003', 80000, 80000, 0, '2022-11-02 14:33:51', '2022-11-02 14:33:51'),
(13, 'LM0211220004', 1000, 2000, 1000, '2022-11-02 14:35:10', '2022-11-02 14:35:10');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_09_06_165501_create_suppliers_table', 1),
(5, '2022_09_07_122843_create_barangs_table', 2),
(6, '2022_09_12_144738_create_penjualans_table', 3),
(7, '2022_09_12_145348_create_detail_penjualan_table', 4),
(8, '2022_09_23_223850_create_detail_penjualans_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `kode_penjualan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_harga` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `user_id`, `kode_penjualan`, `barcode`, `qty`, `total_harga`, `created_at`, `updated_at`) VALUES
(25, 1, 'LM0310220001', '201904240002', '1', '80000', '2022-10-03 14:29:05', '2022-10-03 14:29:05'),
(26, 1, 'LM0310220002', '201904240002', '1', '80000', '2022-10-03 15:23:55', '2022-10-03 15:23:55'),
(32, 1, 'LM0510220003', '201904240003', '2', '9000', '2022-10-05 08:43:57', '2022-10-05 08:43:57'),
(33, 4, 'LM0610220004', '201904240001', '2', '30000', '2022-10-06 07:18:22', '2022-10-06 07:18:22'),
(34, 1, 'LM0810220005', '201904240001', '1', '15000', '2022-10-08 15:07:21', '2022-10-08 15:07:21'),
(35, 1, 'LM1210220006', '201904240003', '1', '4500', '2022-10-12 16:54:26', '2022-10-12 16:54:26'),
(36, 1, 'LM1210220006', '201904240004', '3', '3000', '2022-10-12 16:55:18', '2022-10-12 16:55:18'),
(37, 1, 'LM0211220001', '201904240002', '1', '80000', '2022-11-02 14:27:40', '2022-11-02 14:27:40'),
(38, 1, 'LM0211220002', '201904240002', '1', '80000', '2022-11-02 14:29:22', '2022-11-02 14:29:22'),
(39, 1, 'LM0211220003', '201904240002', '1', '80000', '2022-11-02 14:33:43', '2022-11-02 14:33:43'),
(40, 1, 'LM0211220004', '201904240004', '1', '1000', '2022-11-02 14:35:04', '2022-11-02 14:35:04');

--
-- Triggers `penjualan`
--
DELIMITER $$
CREATE TRIGGER `update stok barang` AFTER INSERT ON `penjualan` FOR EACH ROW BEGIN
UPDATE barang
SET stok = stok - NEW.qty
WHERE barcode = NEW.barcode;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `nama`, `keterangan`, `created_at`, `updated_at`) VALUES
(5, 'CV Wijaya', 'Bandung', '2022-09-07 05:25:25', '2022-09-07 05:25:25'),
(6, 'Sinar Murni', 'Jakarta', '2022-09-08 15:09:27', '2022-09-09 15:09:27'),
(7, 'Unilever', 'Karanganyar', '2022-09-27 06:01:23', '2022-09-27 06:01:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'Rida', 'faridacamut157@gmail.com', '2022-09-08 23:45:12', '$2y$10$3eWaoI/aNShQTYv/782hKuBDFLSwxMZP/2LrxkSrWBMI27/79coly', 'ADEM3i72j3sQeZOCpKxNFMhJZ2hfmxj0LsokTm8zGprS5SpXxHeqQeJrtN5j', 'admin', 'user.png', NULL, '2022-11-03 04:00:24'),
(4, 'Mirna Nurhayati', 'mirna@gmail.com', NULL, '$2y$10$t5n0kJ86mMt5f0yI.j8KheB08K/vtAC6x34TDYYXoWNjGkLxdwIKe', NULL, 'kasir', '1667438930_IMG_20211122_170140.jpg', '2022-09-09 00:16:36', '2022-11-03 02:22:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjualan_user_id_foreign` (`user_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
