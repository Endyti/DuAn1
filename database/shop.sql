-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 25, 2023 lúc 03:51 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(13, 'Áo sơ mi', '2023-03-07 08:55:59', '2023-03-08 11:06:42'),
(14, 'áo phông', '2023-03-07 08:56:10', '2023-03-08 11:07:02'),
(51, 'QUần dài', '2023-03-25 08:36:06', '2023-03-25 08:36:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tenThanhVien` varchar(255) NOT NULL,
  `gioiTinh` int(11) NOT NULL,
  `anhDaiDien` varchar(255) NOT NULL,
  `anhCK` varchar(255) NOT NULL,
  `soDienThoai` varchar(15) NOT NULL,
  `diaChi` varchar(255) NOT NULL,
  `matKhau` varchar(255) NOT NULL,
  `tienTk` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `members`
--

INSERT INTO `members` (`id`, `email`, `tenThanhVien`, `gioiTinh`, `anhDaiDien`, `anhCK`, `soDienThoai`, `diaChi`, `matKhau`, `tienTk`, `status`, `createdAt`, `updatedAt`) VALUES
(11, 'hiennguyen02hd@gmail.com', 'Nguyen Van Hien', 1, 'https://res.cloudinary.com/djh5ubzth/image/upload/v1679712085/UploadFileMember/w0bbntfyks1wquwkuu79.jpg', '', '0373753158', 'Thong Nhat - Gia Loc - Hai -Duong', '$2a$10$m9OQ1AIKifBaIJ2goTwdoet1bZldXac2mvmUguQbhl.ERNG0ZNn4S', 0, 0, '2023-03-25 09:40:42', '2023-03-25 09:41:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `tieuDe` varchar(255) NOT NULL,
  `anhTinTuc` varchar(255) NOT NULL,
  `moTa` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `maSanPham` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idSP` int(11) NOT NULL,
  `soLuong` int(11) NOT NULL,
  `thanhTien` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `tenSp` varchar(255) NOT NULL,
  `hangSx` varchar(255) NOT NULL,
  `giaSanPham` int(11) NOT NULL,
  `idDanhSach` int(11) NOT NULL,
  `soLuong` int(11) NOT NULL,
  `hot` int(11) NOT NULL,
  `sale` int(11) NOT NULL,
  `image` text NOT NULL,
  `mota` text NOT NULL,
  `luotXem` int(11) NOT NULL,
  `luotTim` int(11) NOT NULL,
  `luotMua` int(11) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `tenSp`, `hangSx`, `giaSanPham`, `idDanhSach`, `soLuong`, `hot`, `sale`, `image`, `mota`, `luotXem`, `luotTim`, `luotMua`, `createdAt`, `updatedAt`) VALUES
(51, 'ÁO KHOÁC RAGLAN REGULAR PHỐI MÀU AK049 MÀU ĐEN', 'adsfd', 12333333, 13, 20, 1, 2, '[\"https://res.cloudinary.com/djh5ubzth/image/upload/v1679675692/UploadFile/fpuddivolmztdthypgnd.jpg\",\"https://res.cloudinary.com/djh5ubzth/image/upload/v1679675729/UploadFile/cfmh26mgeh1mbgyc4krj.jpg\"]', '<p>ÂDFADFAF</p>', 0, 0, 0, '2023-03-16 21:27:31', '2023-03-24 23:35:30'),
(54, ' ÁO THUN IN REGULAR CATMAN AT123 MÀU XANH BIỂN', 'ABC', 12333333, 13, 123, 1, 0, '[\"https://res.cloudinary.com/djh5ubzth/image/upload/v1679675618/UploadFile/hgbzezbldlwumbzdtmdi.jpg\",\"https://res.cloudinary.com/djh5ubzth/image/upload/v1679711538/UploadFile/ghe5zv1edry4f8oc6js3.jpg\",\"https://res.cloudinary.com/djh5ubzth/image/upload/v1679711568/UploadFile/lnrmpziwg7lopvoagstd.jpg\"]', '<h2>SADSAS</h2><p><strong>SADFA</strong></p>', 0, 0, 0, '2023-03-16 23:31:22', '2023-03-25 09:32:52'),
(55, 'Áo khoác Hoodie 2023', 'ABC', 1233322, 13, 5, 1, 2, '[\"https://res.cloudinary.com/djh5ubzth/image/upload/v1679675457/UploadFile/blvybe2bbbdj7qrrdydv.jpg\"]', '<p>gsgsfgfd</p>', 0, 0, 0, '2023-03-20 12:47:45', '2023-03-25 08:34:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `roleName` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `roleName`, `type`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', 'ROLE', '2023-03-06 05:04:09', '2023-03-06 05:04:09'),
(2, 'Editter', 'ROLE', '2023-03-06 05:04:09', '2023-03-06 05:04:09'),
(3, 'Writer', 'ROLE', '2023-03-06 05:06:35', '2023-03-06 05:06:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20230226060459-create-user.js'),
('20230226062426-create-user.js');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `roleID` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `phoneNumber`, `address`, `roleID`, `createdAt`, `updatedAt`) VALUES
(5, 'Nguyễn Văn', 'A', 'nva@gmail.com', '202cb962ac59075b964b07152d234b70', '0123456789', 'Hà Nộis', 2, '2023-02-27 23:50:41', '2023-03-25 08:44:50'),
(25, 'Nguyễn', 'Hiển', 'hiennguyen0s2hd@gmail.com', '202cb962ac59075b964b07152d234b70', '0373753158', 'Thống nhất- Gia Lộc- Hải Dương', 1, '2023-03-02 22:19:12', '2023-03-02 22:19:12'),
(28, 'Nguyễn', 'Hiển', 'nvd@gmail.com', '$2a$10$xBHA6sqdfuYFrijMCHPAZe94acyNFuQ3OrRQsn4vnlaC6lWA/6tqa', '0373753158', 'Thống nhất- Gia Lộc- Hải Dương', 2, '2023-03-06 12:35:51', '2023-03-06 12:35:51'),
(29, 'Nguyễn', 'Hiển2', 'hiennguyen02hd@gmail.com', '$2a$10$E8zyDJnb.MBN.ojhENoLS.FNRzF9x5oo9xoJghzHN8NMUmEo.wP0.', '0373753158', 'Thống nhất- Gia Lộc- Hải Dương', 1, '2023-03-07 09:29:30', '2023-03-25 08:43:49'),
(31, 'Dd', 'SD', 'hiennguyen02hdkd@gmail.com', '$2a$10$sMiPq6/9GwNvC4RJY6k5.uSaBUrAOHTnlAI/HsSrTH2DpA5RJHtnq', '123123', 'sdS', 3, '2023-03-25 07:49:30', '2023-03-25 08:44:01'),
(33, 'Long', 'Nguyễn', 'longnguyen@gmail.com', '$2a$10$sMiPq6/9GwNvC4RJY6k5.uL28Yq.fOHQscFAao3Huaz.dXTLh7N5S', '0373753158', 'Hà Nội', 1, '2023-03-25 08:31:34', '2023-03-25 08:44:07'),
(34, 'Hien', 'Nguyen', 'hiennguyenhd02@gmail.com', '$2a$10$sMiPq6/9GwNvC4RJY6k5.uL28Yq.fOHQscFAao3Huaz.dXTLh7N5S', '0373753159', 'Hải Dương', 1, '2023-03-25 08:41:21', '2023-03-25 08:41:58'),
(35, 'Hien', 'Nguyen', 'hiennguyen02hd01@gmail.com', '$2a$10$sMiPq6/9GwNvC4RJY6k5.uHaqgpQ4PJjzL8hfzciw5o4uQFMZFxta', '0373753158', '123123', 2, '2023-03-25 08:42:37', '2023-03-25 08:44:15'),
(36, 'Hien', 'Nguyen', 'ngc@gmail.com', '$2a$10$sMiPq6/9GwNvC4RJY6k5.uo/lejNKZ4SLyegDTKO7/QxyOlzeBffi', '0373753158', '123123', 1, '2023-03-25 08:44:45', '2023-03-25 08:50:06'),
(37, 'Hien', 'Nguyen', 'nvb@gmail.com', '$2a$10$sMiPq6/9GwNvC4RJY6k5.uHaqgpQ4PJjzL8hfzciw5o4uQFMZFxta', '0373753158', '123123', 2, '2023-03-25 08:46:38', '2023-03-25 08:50:02'),
(38, 'Hien', '1', 'hiennguyenhd021@gmail.com', '$2a$10$rq7KQNWZHGU.8RA5ddzX8uMJkTmTFXiAaPxdRpKF8nQzie6bDsXUu', '0373753158', '123123', 1, '2023-03-25 08:50:35', '2023-03-25 08:50:35'),
(39, 'Hien', 'Nguyen', 'hiennguyen02hdeqeq@gmail.com', '$2a$10$rq7KQNWZHGU.8RA5ddzX8uT7SAZhfBr0h9u30rC4sO.wzBvHOxADm', '0373753158', '123123', 3, '2023-03-25 08:51:54', '2023-03-25 08:51:54');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idUser` (`idUser`,`idSP`),
  ADD KEY `idSP` (`idSP`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idDanhSach` (`idDanhSach`),
  ADD KEY `idDanhSach_2` (`idDanhSach`),
  ADD KEY `idDanhSach_3` (`idDanhSach`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roleID` (`roleID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`idSP`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `members` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`idDanhSach`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
