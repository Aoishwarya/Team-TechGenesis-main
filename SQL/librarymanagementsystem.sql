-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2024 at 10:45 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `librarymanagementsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `firstname`, `lastname`, `email`, `phone`, `password`) VALUES
(1, 'Niloy ', 'Das', 'nildas1002@gmail.com', '01843470760', '$2y$10$R2f5nJrs9MU6Q2OWEHSq5eNr9NgW.CWVi3FmTJ.oh2XcHRaoioCSi'),
(2, 'Aoishu', 'Das', 'aoishudas@gmail.com', '012232321', '$2y$10$MNFgucZ56dYtQExJv9trte2aGOkGBNX/kRrQwl2D5qTTxrEsIeijO');

-- --------------------------------------------------------

--
-- Table structure for table `borrow_requests`
--

CREATE TABLE `borrow_requests` (
  `request_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `isbn_number` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','issued') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrow_requests`
--

INSERT INTO `borrow_requests` (`request_id`, `user_id`, `book_id`, `isbn_number`, `request_date`, `status`) VALUES
(16, 'UID661d835917907', 9, '1848126476', '2024-04-16 14:50:20', 'issued'),
(17, 'UID661d835917907', 5, '9350237695', '2024-04-16 18:07:06', 'issued'),
(18, 'UID661d835917908', 1, '222333', '2024-04-18 11:40:51', 'pending'),
(19, 'UID661d835917908', 1, '222333', '2024-04-18 11:57:03', 'pending'),
(20, 'UID661d835917908', 7, 'B09NKWH7NP', '2024-04-18 11:57:06', 'issued'),
(21, 'UID661d835917908', 5, '9350237695', '2024-04-18 13:17:03', 'pending'),
(22, 'UID661d835917908', 5, '9350237695', '2024-04-18 13:43:57', 'pending'),
(23, 'UID661d835917908', 11, 'GBSJ36344563', '2024-04-18 13:44:05', 'pending'),
(24, 'UID661d835917908', 11, 'GBSJ36344563', '2024-04-18 14:00:27', 'pending'),
(25, 'UID661d835917908', 10, '007053246X', '2024-04-18 14:31:25', 'pending'),
(26, 'UID661d835917908', 1, '222333', '2024-04-18 14:42:46', 'pending'),
(27, 'UID661d835917906', 10, '007053246X', '2024-04-18 18:33:48', 'issued');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `filesize` int(11) NOT NULL,
  `filetype` varchar(100) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `filename`, `filesize`, `filetype`, `upload_date`) VALUES
(7, 'Computer_Programming-1_(1).pdf', 2141999, 'application/pdf', '2024-04-18 15:36:15'),
(8, 'Discrete Mathematics and It_s Applications(2).pdf', 26937082, 'application/pdf', '2024-04-18 15:46:11'),
(9, 'Object Oriented Programming With C++C.pdf', 21894156, 'application/pdf', '2024-04-18 15:46:54'),
(10, 'Object Oriented Programming With C++C.pdf', 21894156, 'application/pdf', '2024-04-18 15:59:02'),
(11, 'Object Oriented Programming With C++C.pdf', 21894156, 'application/pdf', '2024-04-18 16:20:25');

-- --------------------------------------------------------

--
-- Table structure for table `tblauthors`
--

CREATE TABLE `tblauthors` (
  `id` int(11) NOT NULL,
  `AuthorName` varchar(159) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblauthors`
--

INSERT INTO `tblauthors` (`id`, `AuthorName`, `creationDate`, `UpdationDate`) VALUES
(1, 'Anuj kumar', '2024-01-25 01:23:03', '2024-02-04 00:34:19'),
(2, 'Chetan Bhagatt', '2024-01-25 01:23:03', '2024-02-04 00:34:26'),
(3, 'Anita Desai', '2024-01-25 01:23:03', '2024-02-04 00:34:26'),
(4, 'HC Verma', '2024-01-25 01:23:03', '2024-02-04 00:34:26'),
(5, 'R.D. Sharma ', '2024-01-25 01:23:03', '2024-02-04 00:34:26'),
(9, 'fwdfrwer', '2024-01-25 01:23:03', '2024-02-04 00:34:26'),
(10, 'Dr. Andy Williams', '2024-01-25 01:23:03', '2024-02-04 00:34:26'),
(11, 'Kyle Hill', '2024-01-25 01:23:03', '2024-02-04 00:34:26'),
(12, 'Robert T. Kiyosak', '2024-01-25 01:23:03', '2024-02-04 00:34:26'),
(13, 'Kelly Barnhill', '2024-01-25 01:23:03', '2024-02-04 00:34:26'),
(14, 'Herbert Schildt', '2024-01-25 01:23:03', '2024-02-04 00:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooks`
--

CREATE TABLE `tblbooks` (
  `id` int(11) NOT NULL,
  `BookName` varchar(255) DEFAULT NULL,
  `CatId` int(11) DEFAULT NULL,
  `AuthorId` int(11) DEFAULT NULL,
  `ISBNNumber` varchar(25) DEFAULT NULL,
  `BookPrice` decimal(10,2) DEFAULT NULL,
  `bookImage` varchar(250) NOT NULL,
  `pdf_path` varchar(255) DEFAULT NULL,
  `isIssued` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbooks`
--

INSERT INTO `tblbooks` (`id`, `BookName`, `CatId`, `AuthorId`, `ISBNNumber`, `BookPrice`, `bookImage`, `pdf_path`, `isIssued`, `RegDate`, `UpdationDate`) VALUES
(1, 'PHP And MySql programming', 5, 1, '222333', 25.00, '1efecc0ca822e40b7b673c0d79ae943f.jpg', NULL, 1, '2024-01-30 01:23:03', '2024-04-13 20:40:17'),
(3, 'physics', 6, 4, '1111', 15.00, 'dd8267b57e0e4feee5911cb1e1a03a79.jpg', NULL, 1, '2024-01-30 01:23:03', '2024-04-16 07:07:21'),
(5, 'Murach\'s MySQL', 5, 1, '9350237695', 455.00, '5939d64655b4d2ae443830d73abc35b6.jpg', NULL, 1, '2024-01-30 01:23:03', '2024-02-04 00:34:11'),
(6, 'WordPress for Beginners 2022: A Visual Step-by-Step Guide to Mastering WordPress', 5, 10, 'B019MO3WCM', 100.00, '144ab706ba1cb9f6c23fd6ae9c0502b3.jpg', NULL, NULL, '2024-01-30 01:23:03', '2024-02-04 00:34:11'),
(7, 'WordPress Mastery Guide:', 5, 11, 'B09NKWH7NP', 53.00, '90083a56014186e88ffca10286172e64.jpg', NULL, 1, '2024-01-30 01:23:03', '2024-04-18 11:59:22'),
(8, 'Rich Dad Poor Dad: What the Rich Teach Their Kids About Money That the Poor and Middle Class Do Not', 8, 12, 'B07C7M8SX9', 120.00, '52411b2bd2a6b2e0df3eb10943a5b640.jpg', NULL, 1, '2024-01-30 01:23:03', '2024-04-16 08:17:36'),
(9, 'The Girl Who Drank the Moon', 8, 13, '1848126476', 200.00, 'f05cd198ac9335245e1fdffa793207a7.jpg', NULL, 1, '2024-01-30 01:23:03', '2024-04-16 16:12:52'),
(10, 'C++: The Complete Reference, 4th Edition', 5, 14, '007053246X', 142.00, '36af5de9012bf8c804e499dc3c3b33a5.jpg', 'pdfs/Object Oriented Programming With C++C.pdf', 1, '2024-01-30 01:23:03', '2024-04-18 19:05:36'),
(11, 'ASP.NET Core 5 for Beginners', 9, 11, 'GBSJ36344563', 422.00, 'b1b6788016bbfab12cfd2722604badc9.jpg', NULL, 0, '2024-01-30 01:23:03', '2024-02-04 00:34:11');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Status`, `CreationDate`, `UpdationDate`) VALUES
(4, 'Romantic', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:43'),
(5, 'Technology', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51'),
(6, 'Science', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51'),
(7, 'Management', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51'),
(8, 'General', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51'),
(9, 'Programming', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51');

-- --------------------------------------------------------

--
-- Table structure for table `tblissuedbookdetails`
--

CREATE TABLE `tblissuedbookdetails` (
  `id` int(11) NOT NULL,
  `BookId` int(11) DEFAULT NULL,
  `UserID` varchar(150) DEFAULT NULL,
  `IssuesDate` timestamp NULL DEFAULT current_timestamp(),
  `ReturnDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `RetrunStatus` int(1) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblissuedbookdetails`
--

INSERT INTO `tblissuedbookdetails` (`id`, `BookId`, `UserID`, `IssuesDate`, `ReturnDate`, `RetrunStatus`, `fine`) VALUES
(7, 5, 'UID661d835917906', '2024-01-31 23:45:57', NULL, NULL, NULL),
(8, 1, 'UID661d835917907', '2024-01-31 23:45:57', '2024-02-04 00:33:08', 1, 0),
(0, 3, 'UID661D835917906', '2024-04-16 07:07:21', NULL, NULL, NULL),
(0, 8, 'UID661D835917907', '2024-04-16 08:17:36', NULL, NULL, NULL),
(0, NULL, NULL, '2024-04-16 16:06:56', NULL, NULL, NULL),
(0, NULL, NULL, '2024-04-16 16:08:34', NULL, NULL, NULL),
(0, 9, 'UID661d835917907', '2024-04-16 16:12:52', NULL, NULL, NULL),
(0, 5, 'UID661d835917907', '2024-04-16 18:08:04', NULL, NULL, NULL),
(0, 7, 'UID661d835917908', '2024-04-18 11:59:22', NULL, NULL, NULL),
(0, 10, 'UID661d835917906', '2024-04-18 18:34:09', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `usertype` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `confirmpassword` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `regi_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `updatation_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`, `usertype`, `password`, `confirmpassword`, `user_id`, `regi_date`, `status`, `updatation_time`) VALUES
(1, 'Niloy ', 'Das', 'dasnil684@gmail.com', '01843470760', 'user', '$2y$10$P/7FcXfRn///w1q5LbYu4eQGoH6gntfaQ6m7klTdoZB.o8KP2emca', '', 'UID661d835917906', '2024-04-15 19:43:21', 'active', '2024-04-18 17:47:03'),
(2, 'Aoishwarya ', 'Mojumdar', 'aoishwaryamojumdar15@gmail.com', '01974337950', 'user', '$2y$10$ywx2mZJRuBPPELO8cw21H.rpZI0PtPhZrv917enILgs9VHbPjuYYe', '', 'UID661d835917907', '2024-04-15 19:45:24', 'active', '2024-04-15 19:45:24'),
(3, 'Puja', 'Mojumder', 'puja@gmail.com', '018213232', 'user', '$2y$10$H39RGCm1pFCKs7Bc3Hf6m.3vm11SYefq95XO.qD85m0uFJqZFkr3m', '', 'UID661d835917908', '2024-04-17 14:33:35', 'active', '2024-04-17 14:33:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrow_requests`
--
ALTER TABLE `borrow_requests`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `borrow_requests`
--
ALTER TABLE `borrow_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
