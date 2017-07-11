-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3307
-- Thời gian đã tạo: Th7 10, 2017 lúc 03:12 AM
-- Phiên bản máy phục vụ: 5.6.36
-- Phiên bản PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `devicesmanagement`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int(255) NOT NULL,
  `username` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `role` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `id_Employee` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `enable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `role`, `id_Employee`, `enable`) VALUES
(1, 'Tom', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'E01', 1),
(2, 'Jerry', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'E25', 0),
(3, 'Tommy', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'E22', 0),
(4, 'Tinh', '123456', 'admin', 'E20', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(255) NOT NULL,
  `name` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Ram'),
(2, 'PC'),
(3, 'Keyboard'),
(4, 'Mouse'),
(5, 'Monitor'),
(6, 'HDD'),
(7, 'HDD');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(255) NOT NULL,
  `id_Account` int(255) NOT NULL,
  `description` varchar(2000) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`id`, `id_Account`, `description`) VALUES
(1, 1, 'My PC is slow. Can I change it?'),
(2, 3, 'My PC is slow. Can I change it?');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `devices`
--

CREATE TABLE `devices` (
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
-- Đang đổ dữ liệu cho bảng `devices`
--

INSERT INTO `devices` (`id`, `seri_number`, `idAccount`, `idCat`, `name`, `made_in`, `price`, `warranty`, `isnew`, `status`, `picture`, `date_start`) VALUES
('DV01', '123', 2, 1, 'RamKingston', 'Italy', '30', '3 years', 1, 'In use ', 'ram-1-w628.jpg', '2017-06-28 10:09:31'),
('DV01', '1234', 1, 1, 'RamKingston', 'Italy', '30', '3 years', 1, 'No use', 'ram-1-w628.jpg', '2017-06-28 10:09:35'),
('DV01', '12345', 2, 1, 'RamKingston', 'Italy', '30', '3 years', 0, 'In use', 'ram-1-w628.jpg', '2017-06-28 09:50:07'),
('R01', 'R1_Kingston', 1, 3, 'Ram DDR3 4Gb', 'Hong Kong', '30$', '3 years', 0, 'No use ', 'ram-la-gi-1.jpg', '2017-06-28 10:10:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee`
--

CREATE TABLE `employee` (
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
-- Đang đổ dữ liệu cho bảng `employee`
--

INSERT INTO `employee` (`id`, `name`, `birthday`, `address`, `phone`, `picture`, `id_Position`, `id_Team`) VALUES
('E19', 'Quinto', '2017-06-27', 'DN', '01635266058', '17426130_1073903916047390_4463100204824136675_n-19833404484973.jpg', '1', 'P01'),
('E20', 'Tina', '2017-06-21', 'Ha Tinh', '0123456789', '15940414_1009616859171970_7798589069182843414_n-19845216164532.jpg', '1', 'J01'),
('E22', 'Kevin', '2017-06-27', 'DN', '01635266058', '16426027_1636141026681553_3022039283928362087_n-19855904087775.jpg', '1', 'J01'),
('E25', 'Torres', '2017-06-18', 'DN', '01635266058', '3954234579-storm-clouds-coming-anime-art-298P-1920x1080-MM-100-20100901988832.jpg', '1', 'J01'),
('E30', 'Thor', '2017-06-12', 'DN', '01635266058', '', '3', 'P01'),
('E33', 'Tom', '2017-07-20', 'Ha Tinh', '01635266058', '18557049_1970800019822850_2976533477387153543_n-20338465264710.jpg', '2', 'P01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history`
--

CREATE TABLE `history` (
  `id` int(255) NOT NULL,
  `id_Account` int(255) NOT NULL,
  `timestart` date NOT NULL,
  `action` int(255) NOT NULL,
  `idEquipment` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `seri_number` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `history`
--

INSERT INTO `history` (`id`, `id_Account`, `timestart`, `action`, `idEquipment`, `seri_number`) VALUES
(8, 3, '2017-07-05', 1, 'DV01', '123'),
(17, 0, '2017-07-12', 1, 'DV01', '1234'),
(18, 2, '2017-07-20', 0, 'DV01', '12345'),
(19, 4, '2017-07-04', 2, 'R01', 'R1_Kingston');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `namePos` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `namePos`) VALUES
('1', 'Dev'),
('2', 'HR'),
('3', 'Manager'),
('4', 'Administrator');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `team`
--

CREATE TABLE `team` (
  `id` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `team`
--

INSERT INTO `team` (`id`, `name`) VALUES
('J01', 'Java_Vic'),
('P01', 'PHP_Jin');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`,`seri_number`);

--
-- Chỉ mục cho bảng `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `history`
--
ALTER TABLE `history`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
