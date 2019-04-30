-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 30, 2019 at 08:47 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '25-04-2019 10:01:44 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `CountWorkers` int(11) NOT NULL DEFAULT '0',
  `RemWorkers` int(11) NOT NULL,
  `categoryDescription` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `CountWorkers`, `RemWorkers`, `categoryDescription`) VALUES
(1, 'Sewage & Waste Management', 15, 15, 'Sewage & Waste Management'),
(2, 'Road Management', 15, 15, 'Road Management'),
(3, 'Water Supply', 15, 5, 'Water Supply');

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaintremark`
--

INSERT INTO `complaintremark` (`id`, `complaintNumber`, `status`, `remark`, `remarkDate`) VALUES
(24, 27, '2', 'hgchgfcg', '2019-04-27 11:27:26'),
(25, 28, '1', 'sajdknsldf', '2019-04-27 11:36:05'),
(26, 27, '4', 'gchf', '2019-04-27 11:36:38'),
(27, 27, '5', 'sajkldfhasjk', '2019-04-27 11:40:54'),
(28, 28, '2', 'dasfhadk', '2019-04-27 11:42:21'),
(29, 29, '1', 'dbgfhdasbk', '2019-04-27 11:43:22'),
(30, 30, '1', 'cjkashd', '2019-04-27 11:43:41'),
(31, 29, '2', 'dfhs', '2019-04-27 11:44:22'),
(32, 30, '2', 'dsakbh', '2019-04-27 11:44:50'),
(33, 28, '4', 'djsfkl', '2019-04-27 11:46:44'),
(34, 28, '5', 'jhbjhb', '2019-04-27 11:47:43'),
(35, 29, '4', 'Work completed', '2019-04-27 12:56:35'),
(36, 29, '5', 'Repaired', '2019-04-27 12:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `ReqWorkers` int(11) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `ReqWorkers`, `creationDate`, `updationDate`) VALUES
(1, 1, 'Pipeline Blockage ', 5, '2017-03-28 07:11:07', ''),
(2, 1, 'Pipeline Leakage', 3, '2017-03-28 07:11:20', ''),
(3, 2, 'Potholes ', 7, '2017-03-28 07:11:20', ''),
(4, 2, 'Cleaning', 3, '2017-03-28 07:11:20', ''),
(5, 2, 'Reconstruction ', 20, '2017-03-28 07:11:20', ''),
(6, 2, 'Speed breaker ', 5, '2017-03-28 07:11:20', ''),
(7, 3, 'Manhole', 5, '2017-03-28 07:11:20', ''),
(8, 3, 'Drainage Leakage', 10, '2017-03-28 07:11:20', ''),
(9, 3, 'Drainage Cleaning ', 7, '2017-03-28 07:11:20', ''),
(10, 3, 'Drainage Repair', 10, '2017-03-28 07:11:20', ''),
(11, 3, 'Dead Animal ', 4, '2017-03-28 07:11:20', ''),
(12, 3, 'Dustbin installation', 6, '2017-03-28 07:11:20', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `complaintDetails` mediumtext NOT NULL,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `category`, `subcategory`, `complaintDetails`, `complaintFile`, `regDate`, `lastUpdationDate`, `status`) VALUES
(27, 3, 1, 'Pipeline Blockage ', 'No water supply in my home', '', '2019-04-27 10:55:38', '2019-04-27 11:40:54', 5),
(28, 3, 3, 'Drainage Leakage', 'water is leaking', '', '2019-04-27 11:31:12', '2019-04-27 11:47:43', 5),
(29, 3, 3, 'Drainage Leakage', 'jnjkbhjhb', '', '2019-04-27 11:33:20', '2019-04-27 12:57:20', 5),
(30, 3, 3, 'Drainage Leakage', 'kjbjhbhjb', '', '2019-04-27 11:34:05', '2019-04-27 12:57:20', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(11) DEFAULT NULL,
  `address` tinytext,
  `pincode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `contactNo`, `address`, `pincode`, `userImage`, `regDate`, `updationDate`, `status`) VALUES
(1, 'Anuj Kumar', 'anuj.lpu1@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 9999857860, 'Shakarpur', 110092, 'd58f8c3b7227d9511fa40261425b2e73jpeg', '2017-03-28 11:44:52', '2019-04-23 21:16:02', 1),
(2, 'a Tyagi', 'tyagianubhav619@gmail.com', '912ec803b2ce49e4a541068d495ab570', 9101248338, NULL, NULL, NULL, '2019-04-25 16:30:20', '0000-00-00 00:00:00', 1),
(3, 'Piyush', 'piyushg1411@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 7663907551, NULL, NULL, NULL, '2019-04-27 10:54:27', '0000-00-00 00:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
