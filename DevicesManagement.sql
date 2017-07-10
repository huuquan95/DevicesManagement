-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 10, 2017 at 11:17 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DevicesManagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `Account`
--

CREATE TABLE `Account` (
  `id` int(255) NOT NULL,
  `username` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `role` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `id_Employee` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `enabled` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `Account`
--

INSERT INTO `Account` (`id`, `username`, `password`, `role`, `id_Employee`, `enabled`) VALUES
(0, 'Harry', 'e10adc3949ba59abbe56e057f20f883e', 'ADMIN', 'E03', 1),
(1, 'Tom', 'e10adc3949ba59abbe56e057f20f883e', 'ADMIN', 'E01', 1),
(2, 'Jerry', 'e10adc3949ba59abbe56e057f20f883e', 'USER', 'E02', 1),
(4, 'Tinh', 'e10adc3949ba59abbe56e057f20f883e', 'USER', 'E04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `id` int(255) NOT NULL,
  `name` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`id`, `name`) VALUES
(1, 'Ram'),
(3, 'Keyboard'),
(4, 'Mouse'),
(5, 'Monitor'),
(6, 'PC');

-- --------------------------------------------------------

--
-- Table structure for table `Contact`
--

CREATE TABLE `Contact` (
  `id` int(255) NOT NULL,
  `id_Account` int(255) NOT NULL,
  `description` varchar(2000) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `Contact`
--

INSERT INTO `Contact` (`id`, `id_Account`, `description`) VALUES
(1, 1, 'My PC is slow. Can I change it?'),
(2, 3, 'My PC is slow. Can I change it?');

-- --------------------------------------------------------

--
-- Table structure for table `Devices`
--

CREATE TABLE `Devices` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `seri_number` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `idAccount` int(255) NOT NULL,
  `idCat` int(255) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `made_in` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `warranty` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `isnew` int(1) NOT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `date_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Devices`
--

INSERT INTO `Devices` (`id`, `seri_number`, `idAccount`, `idCat`, `name`, `made_in`, `price`, `warranty`, `isnew`, `status`, `picture`, `date_start`) VALUES
('DV01', '123', 0, 1, 'RamKingston', 'Italy', '30', '3 years', 1, 'In use ', 'ram-1-w628.jpg', '2017-07-04 06:41:16'),
('DV01', '1234', 1, 1, 'RamKingston', 'Italy', '30', '3 years', 1, 'No use', 'ram-1-w628.jpg', '2017-06-28 10:09:35'),
('DV01', '12345', 2, 1, 'RamKingston', 'Italy', '30', '3 years', 0, 'In use', 'ram-1-w628.jpg', '2017-06-28 09:50:07'),
('M01', '12', 0, 5, 'Monitor', 'VietNam', '30', '3 years', 1, 'No use', 'dell-ultrasharp-u2412m-lcd-monitor-56a6f9cc3df78cf772913a70.jpg', '2017-07-04 06:39:06'),
('R01', 'R1_Kingston', 2, 1, 'Ram DDR3 4Gb', 'Hong Kong', '30', '3 years', 0, 'No use ', 'loi-ram-laptop.jpg', '2017-07-04 06:55:52'),
('R01', 'R2_Kingston', 0, 1, 'Ram DDR3 4Gb', 'Hong Kong', '30', '3 years', 1, 'In use ', 'loi-ram-laptop.jpg', '2017-07-04 06:39:20');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `id` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `birthday` date NOT NULL,
  `address` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_vietnamese_ci NOT NULL,
  `picture` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `id_Position` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `id_Team` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`id`, `name`, `birthday`, `address`, `phone`, `picture`, `id_Position`, `id_Team`) VALUES
('E01', 'Tommy Tran', '1995-06-07', 'Ha Tinh', '01666394426', '', '4', '-1'),
('E02', 'Phan Le', '1991-06-13', 'Ha Tinh', '01666394426', '', '1', 'J01'),
('E03', 'Tina', '1995-06-20', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `History`
--

CREATE TABLE `History` (
  `id` int(255) NOT NULL,
  `id_Account` int(255) NOT NULL,
  `id_Devices` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `timeStart` date NOT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Position`
--

CREATE TABLE `Position` (
  `id` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `Position`
--

INSERT INTO `Position` (`id`, `name`) VALUES
('1', 'Dev'),
('2', 'HR'),
('3', 'Manager'),
('4', 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `Team`
--

CREATE TABLE `Team` (
  `id` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `Team`
--

INSERT INTO `Team` (`id`, `name`) VALUES
('J01', 'Java_Vic'),
('P01', 'PHP_Jin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Contact`
--
ALTER TABLE `Contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Devices`
--
ALTER TABLE `Devices`
  ADD PRIMARY KEY (`id`,`seri_number`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `History`
--
ALTER TABLE `History`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Position`
--
ALTER TABLE `Position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Team`
--
ALTER TABLE `Team`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Account`
--
ALTER TABLE `Account`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `Contact`
--
ALTER TABLE `Contact`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `History`
--
ALTER TABLE `History`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
