-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 24, 2019 at 05:14 PM
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
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '18-10-2016 04:18:16');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `CountWorkers` int(11) NOT NULL DEFAULT '0',
  `categoryDescription` longtext NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `CountWorkers`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'Sewage & Waste Management', 15, 'Sewage & Waste Management', '2017-03-28 07:10:55', ''),
(2, 'Road Management', 15, 'Road Management', '2017-06-11 10:54:06', ''),
(3, 'Water Supply', 15, 'Water Supply', '2017-03-28 07:10:55', '');

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
(1, 2, 'in process', 'Hi this for demo', '2017-04-01 17:29:19'),
(2, 9, 'in process', 'hiiiiiiiiiiiiiiiiiiii', '2017-04-01 18:37:59'),
(3, 3, 'in process', 'test', '2017-05-02 15:57:43'),
(4, 19, 'closed', 'case solved', '2017-06-11 11:18:33'),
(5, 1, 'closed', 'This sample text for testing', '2018-09-05 17:08:26');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `stateName` varchar(255) NOT NULL,
  `stateDescription` tinytext NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `stateName`, `stateDescription`, `postingDate`, `updationDate`) VALUES
(3, 'Uttar Pradesh', '', '2016-10-18 11:35:02', ''),
(4, 'Punjab', 'pbPB', '2016-10-18 11:35:58', '28-03-2017 03:40:02 PM'),
(5, 'Haryana', 'Haryana', '2017-03-28 07:20:36', ''),
(6, 'fsdfs', 'fsdf', '2017-06-11 10:54:12', '');

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
(1, 1, 1, 'E-wllaet', 'test demo test demo test demotest demotest demotest demotest demotest demotest demotest demotest demo', NULL, '2017-03-30 16:52:40', '2019-04-24 07:16:30', 2),
(2, 1, 1, 'Online SHopping', 'sample text for demo', '', '2017-03-30 17:05:56', '2019-04-24 07:16:48', 4),
(3, 1, 1, 'Online SHopping', 'wetwetwe', '', '2017-03-30 17:07:51', '2017-05-02 15:57:43', 0),
(4, 1, 1, 'E-wllaet', 'fdsf,msd,f  f f', '2. Compendium Selected Paper.doc', '2017-03-30 17:13:14', '2017-03-31 16:06:22', 0),
(5, 1, 1, 'E-wllaet', 'hfghfgh', '1 (3).jpg', '2017-03-30 17:14:55', '0000-00-00 00:00:00', 0),
(6, 1, 1, 'E-wllaet', 'hfghfgh', '1 (3).jpg', '2017-03-30 17:20:16', '0000-00-00 00:00:00', 0),
(7, 1, 1, 'E-wllaet', 'hfghfgh', '1 (3).jpg', '2017-03-30 17:20:56', '0000-00-00 00:00:00', 0),
(8, 1, 1, 'E-wllaet', 'hfghfgh', '1 (3).jpg', '2017-03-30 17:23:05', '0000-00-00 00:00:00', 0),
(9, 1, 1, 'E-wllaet', 'hfghfgh', '1 (3).jpg', '2017-03-30 17:25:09', '2017-04-01 18:38:00', 0),
(10, 1, 1, 'E-wllaet', 'hfghfgh', '1 (3).jpg', '2017-03-30 17:27:24', '0000-00-00 00:00:00', 0),
(11, 1, 1, 'Online SHopping', 'fsdfsdfsdf', 'avatar-1.jpg.png', '2017-03-30 17:36:32', '0000-00-00 00:00:00', 0),
(12, 1, 1, 'Online SHopping', 'fsdfsdfsdf', 'avatar-1.jpg.png', '2017-03-30 17:37:09', '0000-00-00 00:00:00', 0),
(13, 1, 1, 'Online SHopping', 'fsdfsdfsdf', 'avatar-1.jpg.png', '2017-03-30 17:39:57', '0000-00-00 00:00:00', 0),
(14, 1, 1, 'Online SHopping', 'cvcx', 'doctorslog.sql', '2017-03-30 17:41:19', '0000-00-00 00:00:00', 0),
(15, 1, 1, 'E-wllaet', 'fsdfsdf', '', '2017-03-30 17:42:38', '0000-00-00 00:00:00', 0),
(16, 1, 1, 'E-wllaet', 'fsdfsdf', '', '2017-03-31 01:54:07', '0000-00-00 00:00:00', 0),
(17, 5, 1, 'E-wllaet', 'test test', '', '2017-06-11 10:57:49', '0000-00-00 00:00:00', 0),
(18, 5, 1, 'Online SHopping', 'rtytry', 'About Us.docx', '2017-06-11 11:08:47', '0000-00-00 00:00:00', 0),
(19, 6, 1, 'Online SHopping', 'Test@123 dfds fsd fs gs gsd g sg g g sgstwerwe ewtw tw', 'About Us.docx', '2017-06-11 11:15:24', '2017-06-11 11:18:33', 0),
(20, 1, 1, 'E-wllaet', 'gdgsdgsd', '', '2018-05-24 18:26:23', '0000-00-00 00:00:00', 0),
(21, 1, 1, 'Online SHopping', 'fsdfs', '', '2018-05-24 18:26:55', '0000-00-00 00:00:00', 0),
(22, 1, 1, 'Online SHopping', 'fsdfs', '', '2018-05-24 18:27:02', '0000-00-00 00:00:00', 0),
(23, 1, 1, 'Pipeline Blockage ', 'ghjvhv', '', '2019-04-24 10:40:18', '0000-00-00 00:00:00', 0),
(24, 1, 2, 'Potholes ', 'asdf', '', '2019-04-24 10:41:15', '0000-00-00 00:00:00', 0),
(25, 1, 2, 'Potholes ', 'nsdlkfhadslhfsa', '', '2019-04-24 15:07:02', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-28 17:04:36', '', 1),
(2, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-29 15:02:26', '', 1),
(3, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-30 14:58:00', '', 1),
(4, 0, 'dsad', 0x3a3a3100000000000000000000000000, '2017-03-31 17:39:07', '', 0),
(5, 0, 'dwerwer', 0x3a3a3100000000000000000000000000, '2017-03-31 17:41:22', '', 0),
(6, 0, 'ffert', 0x3a3a3100000000000000000000000000, '2017-03-31 17:41:29', '', 0),
(7, 0, 'ewrwe', 0x3a3a3100000000000000000000000000, '2017-03-31 17:42:12', '', 0),
(8, 0, 'ewrwe', 0x3a3a3100000000000000000000000000, '2017-03-31 17:47:51', '', 0),
(9, 0, 'ewrwe', 0x3a3a3100000000000000000000000000, '2017-03-31 17:47:54', '', 0),
(10, 0, 'fsdfsdff', 0x3a3a3100000000000000000000000000, '2017-03-31 17:48:11', '', 0),
(11, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-31 17:49:25', '', 1),
(12, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-04-01 18:52:35', '02-04-2017 12:24:41 AM', 1),
(13, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-04-01 18:58:09', '02-04-2017 12:50:42 AM', 1),
(14, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-04-01 19:38:15', '02-04-2017 01:08:19 AM', 1),
(15, 0, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-04-02 18:50:20', '', 0),
(16, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-04-02 18:50:28', '03-04-2017 12:26:50 AM', 1),
(17, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-05-02 18:01:26', '', 1),
(18, 0, 'test@gm.com', 0x3a3a3100000000000000000000000000, '2017-06-11 10:48:50', '', 0),
(19, 5, 'abc@abc.com', 0x3a3a3100000000000000000000000000, '2017-06-11 10:56:30', '11-06-2017 04:39:15 PM', 1),
(20, 6, 'xyz@xyz.com', 0x3a3a3100000000000000000000000000, '2017-06-11 11:13:28', '11-06-2017 04:45:46 PM', 1),
(21, 6, 'xyz@xyz.com', 0x3a3a3100000000000000000000000000, '2017-06-11 11:19:45', '11-06-2017 04:50:02 PM', 1),
(22, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-24 18:26:07', '', 1),
(23, 0, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2018-09-05 17:05:22', '', 0),
(24, 0, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2018-09-05 17:05:32', '', 0),
(25, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2018-09-05 17:07:12', '', 1),
(26, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2019-04-23 16:37:58', '', 1),
(27, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2019-04-23 19:15:49', '24-04-2019 04:13:32 PM', 1),
(28, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2019-04-24 15:04:56', '24-04-2019 08:35:26 PM', 1),
(29, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2019-04-24 15:05:54', '24-04-2019 08:35:59 PM', 1),
(30, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2019-04-24 15:06:10', '24-04-2019 08:37:43 PM', 1);

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
  `State` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `contactNo`, `address`, `State`, `country`, `pincode`, `userImage`, `regDate`, `updationDate`, `status`) VALUES
(1, 'Anuj Kumar', 'anuj.lpu1@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 9999857860, 'Shakarpur', 'Uttar Pradesh', 'India', 110092, 'd58f8c3b7227d9511fa40261425b2e73jpeg', '2017-03-28 11:44:52', '2019-04-23 21:16:02', 1);

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
-- Indexes for table `state`
--
ALTER TABLE `state`
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
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
