-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 06:47 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbvehicle`
--
CREATE DATABASE IF NOT EXISTS `dbvehicle` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbvehicle`;

-- --------------------------------------------------------

--
-- Table structure for table `access_token`
--

CREATE TABLE `access_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `access_token`
--

INSERT INTO `access_token` (`id`, `user_id`, `token`, `created_at`, `updated_at`) VALUES
(95, 14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZCI6MTQsIm5hbWUiOiJBZG1pbmlzdGF0b3IgSnVhbCBNb2JpbCIsImlzX2FkbWluIjoxLCJwYXNzd29yZCI6ImM4NDI1OGU5YzM5MDU5YTg5YWI3N2Q4NDZkZGFiOTA5IiwiY3JlYXRlZF9hdCI6IjIwMjMtMDQtMTZUMDM6Mjk6MzAuMDAwWiIsInVwZGF0ZWRfYXQiOiIyMDIzLTA0LTE2VDAzOjI5OjMwLjAwMFoifV0sImlhdCI6MTY4MTYxOTc1OCwiZXhwIjoxNjgxNjIwMDU4fQ.v7ltte_a0aZIpmW1H167rl3cbC1CwZl_XR6vphX_PPg', '2023-04-16 04:35:58', '2023-04-16 04:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `pricelist`
--

CREATE TABLE `pricelist` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `price` float NOT NULL,
  `year_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pricelist`
--

INSERT INTO `pricelist` (`id`, `code`, `price`, `year_id`, `model_id`, `created_at`, `updated_at`) VALUES
(1, 'HND01', 167900000, 3, 6, '2023-04-16 02:30:34', '2023-04-16 04:28:33'),
(4, 'TYT01-F', 75000000, 3, 8, '2023-04-16 02:36:48', '2023-04-16 02:36:48'),
(7, 'HND01-CTY', 343000000, 3, 10, '2023-04-16 04:27:14', '2023-04-16 04:27:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `is_admin`, `password`, `created_at`, `updated_at`) VALUES
(6, 'Adi Daud', 1, '9ae636cbe416662a86e8287c830acffc', '2023-04-15 00:53:34', '2023-04-15 00:53:34'),
(9, 'Kazuyuki Kiyoshi', 0, 'cda313c58b0f9144031ac66212abb154', '2023-04-15 00:56:59', '2023-04-15 00:56:59'),
(11, 'Administator Honda', 1, '0192023a7bbd73250516f069df18b500', '2023-04-15 09:17:45', '2023-04-15 09:17:45'),
(12, 'Administator Aston Martin', 1, '98bfe7780b3044eba8560c4a35455a18', '2023-04-15 23:48:30', '2023-04-15 23:48:30'),
(14, 'Administator Jual Mobil', 1, 'c84258e9c39059a89ab77d846ddab909', '2023-04-16 03:29:30', '2023-04-16 03:29:30');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_brand`
--

CREATE TABLE `vehicle_brand` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle_brand`
--

INSERT INTO `vehicle_brand` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Toyota', '2023-04-14 07:00:48', '2023-04-14 07:00:48'),
(2, 'Daihatsu', '2023-04-14 07:01:07', '2023-04-14 07:01:07'),
(3, 'Honda', '2023-04-14 07:24:53', '2023-04-14 07:24:53'),
(4, 'Mitsubishi Motors', '2023-04-14 07:57:40', '2023-04-14 08:01:59'),
(6, 'Suzuki', '2023-04-14 08:05:42', '2023-04-15 16:00:42'),
(8, 'Isuzu', '2023-04-15 15:00:32', '2023-04-15 15:00:32'),
(10, 'Aston Martin', '2023-04-15 23:49:58', '2023-04-15 23:49:58'),
(11, 'Hyundai-HMID', '2023-04-16 03:33:45', '2023-04-16 03:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_model`
--

CREATE TABLE `vehicle_model` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `type_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle_model`
--

INSERT INTO `vehicle_model` (`id`, `name`, `type_id`, `created_at`, `updated_at`) VALUES
(2, 'V12 Vantage Coupe', 8, '2023-04-16 00:37:48', '2023-04-16 00:37:48'),
(3, 'DBS 770 Ultimate', 12, '2023-04-16 00:56:31', '2023-04-16 00:56:31'),
(4, 'DBS 770 Ultimate Volante', 12, '2023-04-16 00:57:11', '2023-04-16 00:57:57'),
(5, 'Toyota 86', 3, '2023-04-16 00:59:13', '2023-04-16 01:22:30'),
(6, 'Agya', 1, '2023-04-16 01:34:40', '2023-04-16 01:34:40'),
(8, 'Fortuner', 15, '2023-04-16 01:36:07', '2023-04-16 01:38:22'),
(10, 'City Hatchback', 4, '2023-04-16 04:10:08', '2023-04-16 04:14:29');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_type`
--

CREATE TABLE `vehicle_type` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle_type`
--

INSERT INTO `vehicle_type` (`id`, `name`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Hatchback', 1, '2023-04-14 09:20:44', '2023-04-14 09:20:44'),
(2, 'Sedan', 1, '2023-04-14 09:20:44', '2023-04-14 09:20:44'),
(3, 'Coupe', 1, '2023-04-14 09:22:59', '2023-04-14 09:22:59'),
(4, 'Hatchback', 3, '2023-04-14 09:22:59', '2023-04-14 09:22:59'),
(5, 'SUV', 3, '2023-04-14 09:25:03', '2023-04-14 09:25:03'),
(6, 'Hatchback', 2, '2023-04-14 09:25:03', '2023-04-14 09:25:03'),
(7, 'SUV', 2, '2023-04-14 09:25:47', '2023-04-14 09:25:47'),
(8, 'Sport Coupe', 10, '2023-04-15 23:51:57', '2023-04-16 04:05:25'),
(9, 'SUV', 10, '2023-04-15 23:53:36', '2023-04-15 23:53:36'),
(12, 'Superleggera', 10, '2023-04-16 00:55:32', '2023-04-16 00:55:32'),
(13, 'Cabrio', 10, '2023-04-16 01:28:20', '2023-04-16 01:31:37'),
(15, 'SUV', 1, '2023-04-16 01:36:50', '2023-04-16 01:36:50'),
(16, 'MPV', 1, '2023-04-16 04:02:58', '2023-04-16 04:02:58');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_year`
--

CREATE TABLE `vehicle_year` (
  `id` int(11) NOT NULL,
  `year` varchar(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle_year`
--

INSERT INTO `vehicle_year` (`id`, `year`, `created_at`, `updated_at`) VALUES
(3, '2022', '2023-04-16 02:05:18', '2023-04-16 02:05:18'),
(4, '2023', '2023-04-16 02:43:15', '2023-04-16 02:43:15'),
(5, '2019', '2023-04-16 04:17:44', '2023-04-16 04:18:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_token`
--
ALTER TABLE `access_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pricelist`
--
ALTER TABLE `pricelist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `year_id` (`year_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_brand`
--
ALTER TABLE `vehicle_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_model`
--
ALTER TABLE `vehicle_model`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `vehicle_year`
--
ALTER TABLE `vehicle_year`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_token`
--
ALTER TABLE `access_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `pricelist`
--
ALTER TABLE `pricelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `vehicle_brand`
--
ALTER TABLE `vehicle_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vehicle_model`
--
ALTER TABLE `vehicle_model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `vehicle_year`
--
ALTER TABLE `vehicle_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access_token`
--
ALTER TABLE `access_token`
  ADD CONSTRAINT `access_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pricelist`
--
ALTER TABLE `pricelist`
  ADD CONSTRAINT `pricelist_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `vehicle_model` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pricelist_ibfk_2` FOREIGN KEY (`year_id`) REFERENCES `vehicle_year` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle_model`
--
ALTER TABLE `vehicle_model`
  ADD CONSTRAINT `vehicle_model_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `vehicle_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  ADD CONSTRAINT `vehicle_type_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `vehicle_brand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
