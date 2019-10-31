-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2019 at 09:15 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `engineers`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `activid` int(11) NOT NULL,
  `activitname` varchar(4000) DEFAULT NULL,
  `activitdetails` varchar(4000) DEFAULT NULL,
  `activitendDate` varchar(30) DEFAULT NULL,
  `activitbigDate` varchar(30) DEFAULT NULL,
  `activitstatus` varchar(15) DEFAULT NULL,
  `place` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `activityreg`
--

CREATE TABLE `activityreg` (
  `activRegid` int(11) NOT NULL,
  `engineer_id` int(11) DEFAULT NULL,
  `activid` int(11) DEFAULT NULL,
  `joinDate` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branchid` int(11) NOT NULL,
  `branchname` varchar(30) DEFAULT NULL,
  `branchaddress` varchar(30) DEFAULT NULL,
  `creationdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branchid`, `branchname`, `branchaddress`, `creationdate`) VALUES
(1, 'Kigali', 'Remera', '2017-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryid` int(11) NOT NULL,
  `categoryname` varchar(30) DEFAULT NULL,
  `categorydesc` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryid`, `categoryname`, `categorydesc`) VALUES
(1, 'Associate Members', 'Companies who practice Engineering Activities in Rwanda');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `departmentid` int(11) NOT NULL,
  `departmentname` varchar(100) DEFAULT NULL,
  `departmentdesc` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`departmentid`, `departmentname`, `departmentdesc`) VALUES
(1, 'Civil Engineers', 'Everyone who practices Civil Engineering Activities in Rwanda');

-- --------------------------------------------------------

--
-- Table structure for table `engineer`
--

CREATE TABLE `engineer` (
  `engineer_id` int(11) NOT NULL,
  `names` varchar(56) NOT NULL,
  `email` varchar(65) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(54) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `status` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `categoryid` int(11) NOT NULL,
  `departmentid` int(11) NOT NULL,
  `branchid` int(11) NOT NULL,
  `membertitle` varchar(45) NOT NULL,
  `memberdob` varchar(45) NOT NULL,
  `memberpobirth` varchar(45) NOT NULL,
  `membersex` varchar(45) NOT NULL,
  `memberlocation` varchar(65) NOT NULL,
  `memberphone` varchar(54) NOT NULL,
  `membernation` varchar(54) NOT NULL,
  `memberregdate` varchar(45) NOT NULL,
  `cv` varchar(65) NOT NULL,
  `officialdoc` varchar(73) NOT NULL,
  `bankslip` varchar(73) NOT NULL,
  `tecreport` varchar(65) NOT NULL,
  `nid` varchar(73) NOT NULL,
  `prophoto` varchar(73) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `tagid` varchar(45) NOT NULL,
  `tagid1` varchar(45) NOT NULL,
  `tagid2` varchar(45) NOT NULL,
  `identity` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

CREATE TABLE `experiences` (
  `experienceid` int(11) NOT NULL,
  `bigdate` varchar(30) DEFAULT NULL,
  `enddate` varchar(30) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `engineer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projectsdone`
--

CREATE TABLE `projectsdone` (
  `projectid` int(11) NOT NULL,
  `engineer_id` int(11) DEFAULT NULL,
  `projectname` varchar(250) DEFAULT NULL,
  `projectYear` varchar(20) DEFAULT NULL,
  `projectClient` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qualifications`
--

CREATE TABLE `qualifications` (
  `acadQlif` int(10) UNSIGNED NOT NULL,
  `acInstitution` varchar(45) NOT NULL,
  `certfAward` varchar(45) NOT NULL,
  `yearOfAward` varchar(45) NOT NULL,
  `engineer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `staff_id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stockholders`
--

CREATE TABLE `stockholders` (
  `stockholdid` int(11) NOT NULL,
  `stockholdNames` varchar(80) DEFAULT NULL,
  `identification` varchar(20) DEFAULT NULL,
  `stockholdTel` varchar(20) DEFAULT NULL,
  `stockholdqual` varchar(400) DEFAULT NULL,
  `engineer_id` int(11) DEFAULT NULL,
  `recierId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supporters`
--

CREATE TABLE `supporters` (
  `suportid` int(11) NOT NULL,
  `supporternames` varchar(45) NOT NULL,
  `supportierid` int(11) NOT NULL,
  `engineer_id` int(11) NOT NULL,
  `signature` varchar(45) NOT NULL,
  `supporterphone` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `roles` varchar(50) NOT NULL,
  `userstatus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activid`);

--
-- Indexes for table `activityreg`
--
ALTER TABLE `activityreg`
  ADD PRIMARY KEY (`activRegid`) USING BTREE,
  ADD KEY `FK_activityreg_1` (`activid`),
  ADD KEY `FK_activityreg_2` (`engineer_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branchid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`departmentid`);

--
-- Indexes for table `engineer`
--
ALTER TABLE `engineer`
  ADD PRIMARY KEY (`engineer_id`) USING BTREE,
  ADD KEY `FK_engineer_1` (`categoryid`),
  ADD KEY `FK_engineer_2` (`branchid`),
  ADD KEY `FK_engineer_3` (`departmentid`);

--
-- Indexes for table `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`experienceid`),
  ADD KEY `engineer_id` (`engineer_id`);

--
-- Indexes for table `projectsdone`
--
ALTER TABLE `projectsdone`
  ADD PRIMARY KEY (`projectid`),
  ADD KEY `engineer_id` (`engineer_id`);

--
-- Indexes for table `qualifications`
--
ALTER TABLE `qualifications`
  ADD PRIMARY KEY (`acadQlif`) USING BTREE,
  ADD KEY `engineer_id` (`engineer_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `FK_staffs_1` (`user_id`) USING BTREE;

--
-- Indexes for table `stockholders`
--
ALTER TABLE `stockholders`
  ADD PRIMARY KEY (`stockholdid`),
  ADD KEY `engineer_id` (`engineer_id`);

--
-- Indexes for table `supporters`
--
ALTER TABLE `supporters`
  ADD PRIMARY KEY (`suportid`),
  ADD KEY `engineer_id` (`engineer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `activid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `activityreg`
--
ALTER TABLE `activityreg`
  MODIFY `activRegid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branchid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `departmentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `engineer`
--
ALTER TABLE `engineer`
  MODIFY `engineer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `projectsdone`
--
ALTER TABLE `projectsdone`
  MODIFY `projectid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qualifications`
--
ALTER TABLE `qualifications`
  MODIFY `acadQlif` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stockholders`
--
ALTER TABLE `stockholders`
  MODIFY `stockholdid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supporters`
--
ALTER TABLE `supporters`
  MODIFY `suportid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activityreg`
--
ALTER TABLE `activityreg`
  ADD CONSTRAINT `FK_activityreg_1` FOREIGN KEY (`activid`) REFERENCES `activities` (`activid`),
  ADD CONSTRAINT `FK_activityreg_2` FOREIGN KEY (`engineer_id`) REFERENCES `engineer` (`engineer_id`);

--
-- Constraints for table `engineer`
--
ALTER TABLE `engineer`
  ADD CONSTRAINT `FK_engineer_1` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`categoryid`),
  ADD CONSTRAINT `FK_engineer_2` FOREIGN KEY (`branchid`) REFERENCES `branches` (`branchid`),
  ADD CONSTRAINT `FK_engineer_3` FOREIGN KEY (`departmentid`) REFERENCES `departments` (`departmentid`);

--
-- Constraints for table `experiences`
--
ALTER TABLE `experiences`
  ADD CONSTRAINT `FK_experiences_1` FOREIGN KEY (`engineer_id`) REFERENCES `engineer` (`engineer_id`);

--
-- Constraints for table `projectsdone`
--
ALTER TABLE `projectsdone`
  ADD CONSTRAINT `FK_projectsdone_1` FOREIGN KEY (`engineer_id`) REFERENCES `engineer` (`engineer_id`);

--
-- Constraints for table `qualifications`
--
ALTER TABLE `qualifications`
  ADD CONSTRAINT `FK_qualifications_1` FOREIGN KEY (`engineer_id`) REFERENCES `engineer` (`engineer_id`);

--
-- Constraints for table `stockholders`
--
ALTER TABLE `stockholders`
  ADD CONSTRAINT `FK_stockholders_1` FOREIGN KEY (`engineer_id`) REFERENCES `engineer` (`engineer_id`);

--
-- Constraints for table `supporters`
--
ALTER TABLE `supporters`
  ADD CONSTRAINT `FK_supporters_1` FOREIGN KEY (`engineer_id`) REFERENCES `engineer` (`engineer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
