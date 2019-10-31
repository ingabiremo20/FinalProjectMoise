-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.20


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema engineers
--

CREATE DATABASE IF NOT EXISTS engineers;
USE engineers;

--
-- Definition of table `activities`
--

DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities` (
  `activid` int(11) NOT NULL AUTO_INCREMENT,
  `activitname` varchar(4000) DEFAULT NULL,
  `activitdetails` varchar(4000) DEFAULT NULL,
  `activitendDate` varchar(30) DEFAULT NULL,
  `activitbigDate` varchar(30) DEFAULT NULL,
  `activitstatus` varchar(15) DEFAULT NULL,
  `place` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`activid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activities`
--

/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` (`activid`,`activitname`,`activitdetails`,`activitendDate`,`activitbigDate`,`activitstatus`,`place`) VALUES 
 (2,'Conference','Annual Conference for all Members','12/07/2017','12/07/2017','Open','Top View Hotel'),
 (3,'Training','For All Registered  Civil Engineers ','15/08/2017','12/08/2017','Open','Top View Hotel'),
 (4,'Training','For All Registered Engineers','18/05/2017','12/05/2017','Closed','Top View Hotel'),
 (5,'Conference','gf','23/09/2017','01/02/2017','Open','Mgdd');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;


--
-- Definition of table `activityreg`
--

DROP TABLE IF EXISTS `activityreg`;
CREATE TABLE `activityreg` (
  `activRegid` int(11) NOT NULL AUTO_INCREMENT,
  `engineer_id` int(11) DEFAULT NULL,
  `activid` int(11) DEFAULT NULL,
  `joinDate` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`activRegid`) USING BTREE,
  KEY `FK_activityreg_1` (`activid`),
  KEY `FK_activityreg_2` (`engineer_id`),
  CONSTRAINT `FK_activityreg_1` FOREIGN KEY (`activid`) REFERENCES `activities` (`activid`),
  CONSTRAINT `FK_activityreg_2` FOREIGN KEY (`engineer_id`) REFERENCES `engineer` (`engineer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activityreg`
--

/*!40000 ALTER TABLE `activityreg` DISABLE KEYS */;
/*!40000 ALTER TABLE `activityreg` ENABLE KEYS */;


--
-- Definition of table `branches`
--

DROP TABLE IF EXISTS `branches`;
CREATE TABLE `branches` (
  `branchid` int(11) NOT NULL AUTO_INCREMENT,
  `branchname` varchar(30) DEFAULT NULL,
  `branchaddress` varchar(30) DEFAULT NULL,
  `creationdate` date DEFAULT NULL,
  PRIMARY KEY (`branchid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` (`branchid`,`branchname`,`branchaddress`,`creationdate`) VALUES 
 (1,'Kigali','Remera','2017-01-01');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;


--
-- Definition of table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(30) DEFAULT NULL,
  `categorydesc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`categoryid`,`categoryname`,`categorydesc`) VALUES 
 (1,'Associate Members','Companies who practice Engineering Activities in Rwanda');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


--
-- Definition of table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `departmentid` int(11) NOT NULL AUTO_INCREMENT,
  `departmentname` varchar(100) DEFAULT NULL,
  `departmentdesc` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` (`departmentid`,`departmentname`,`departmentdesc`) VALUES 
 (1,'Civil Engineers','Everyone who practices Civil Engineering Activities in Rwanda');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;


--
-- Definition of table `engineer`
--

DROP TABLE IF EXISTS `engineer`;
CREATE TABLE `engineer` (
  `engineer_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `identity` varchar(20) NOT NULL,
  PRIMARY KEY (`engineer_id`) USING BTREE,
  KEY `FK_engineer_1` (`categoryid`),
  KEY `FK_engineer_2` (`branchid`),
  KEY `FK_engineer_3` (`departmentid`),
  CONSTRAINT `FK_engineer_1` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`categoryid`),
  CONSTRAINT `FK_engineer_2` FOREIGN KEY (`branchid`) REFERENCES `branches` (`branchid`),
  CONSTRAINT `FK_engineer_3` FOREIGN KEY (`departmentid`) REFERENCES `departments` (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `engineer`
--

/*!40000 ALTER TABLE `engineer` DISABLE KEYS */;
INSERT INTO `engineer` (`engineer_id`,`names`,`email`,`password`,`role`,`status`,`categoryid`,`departmentid`,`branchid`,`membertitle`,`memberdob`,`memberpobirth`,`membersex`,`memberlocation`,`memberphone`,`membernation`,`memberregdate`,`cv`,`officialdoc`,`bankslip`,`tecreport`,`nid`,`prophoto`,`tagid`,`tagid1`,`tagid2`,`identity`) VALUES 
 (106,'River Cost Ltd','rivercost@yahoo.fr','ò& ]\Z- :ßõô.ƒçN',0x436F6D70616E79,0x4163636570746564,1,1,1,'','','Kigali','','KN128','0728228760','Rwanda','2017-06-28','CV_106.pdf','Degree_106.pdf','Pending','Pending','Pending',0x50656E64696E67,'A','REC','ECF','56457567'),
 (107,'Kimenyi John','kimenyiJohn@yahoo.fr','ò& ]\Z- :ßõô.ƒçN',0x496E646976696475616C,0x70656E64696E67,1,1,1,'Mr','1993-12-31','Kigali','Male','KN128','0728128760','Rwandan','2017-06-28','CV_107.pdf','Degree_107.jpg','Bank_107.jpg','TecRep_107.pdf','Nid_107.jpg',0x5070686F746F5F3130372E6A7067,'A','EC','IER','1198780003588072'),
 (108,'Moise Ingabire','ingabiremo@yahoo.fr','ò& ]\Z- :ßõô.ƒçN',0x496E646976696475616C,0x4163636570746564,1,1,1,'Mr','1988-11-30','Kigali','Male','KN128','0788453213','Rwandan','2017-06-28','Pending','Pending','Pending','Pending','Pending',0x50656E64696E67,'A','EC','IER','1198780003588079'),
 (109,'Rukundo James','rukundojames1@yahoo.fr','ò& ]\Z- :ßõô.ƒçN`',0x496E646976696475616C,0x70656E64696E67,1,1,1,'','','','','','0728228560','','2017-06-28','Pending','Pending','Pending','Pending','Pending',0x50656E64696E67,'A','EC','IER',''),
 (110,'Karangwa Aime','karangwa@yahoo.fr','ò& ]\Z- :ßõô.ƒçN',0x496E646976696475616C,0x70656E64696E67,1,1,1,'','','','','','0788453222','','2017-06-28','Pending','Pending','Pending','Pending','Pending',0x50656E64696E67,'A','EC','IER',''),
 (111,'Coco Ltd','cocoltd@yahoo.fr','ò& ]\Z- :ßõô.ƒçN`',0x436F6D70616E79,0x70656E64696E67,1,1,1,'','','','','','0788228761','','2017-06-28','Pending','Pending','Pending','Pending','Pending',0x50656E64696E67,'A','REC','ECF',''),
 (112,'Litacons Ltd','litacons20@yahoo.fr','“à÷>ÏàUæÉ¤bŸ¹`',0x436F6D70616E79,0x70656E64696E67,1,1,1,'','','','','','0788228877','','2017-06-28','Pending','Pending','Pending','Pending','Pending',0x50656E64696E67,'A','REC','ECF',''),
 (113,'Muhoza Ltd','muhoza10@gmail.com','ò& ]\Z- :ßõô.ƒçN',0x436F6D70616E79,0x70656E64696E67,1,1,1,'','','','','','0788228769','','2017-06-28','CV_113.pdf','Degree_113.jpg','Bank_113.jpg','Pending','Pending',0x5070686F746F5F3131332E6A7067,'A','REC','ECF',''),
 (114,'Ingabire Moise','ingabirgfemo@yahoo.fr','ò& ]\Z- :ßõô.ƒçN',0x496E646976696475616C,0x4163636570746564,1,1,1,'Mr','2010-10-30','Kigali','Female','KN128','0728123760','Rwandan','2017-07-02','Pending','Pending','Pending','Pending','Pending',0x50656E64696E67,'A','EC','IER','1198780003588079');
/*!40000 ALTER TABLE `engineer` ENABLE KEYS */;


--
-- Definition of table `experiences`
--

DROP TABLE IF EXISTS `experiences`;
CREATE TABLE `experiences` (
  `experienceid` int(11) NOT NULL,
  `bigdate` varchar(30) DEFAULT NULL,
  `enddate` varchar(30) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `engineer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`experienceid`),
  KEY `engineer_id` (`engineer_id`),
  CONSTRAINT `FK_experiences_1` FOREIGN KEY (`engineer_id`) REFERENCES `engineer` (`engineer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experiences`
--

/*!40000 ALTER TABLE `experiences` DISABLE KEYS */;
INSERT INTO `experiences` (`experienceid`,`bigdate`,`enddate`,`description`,`engineer_id`) VALUES 
 (2,'2009-12-30','2015-12-31','Field Technician at REAL CONSTRUCTORS',108),
 (3,'2015-12-31','2016-12-31','Manager At Coco Ltd',108);
/*!40000 ALTER TABLE `experiences` ENABLE KEYS */;


--
-- Definition of table `projectsdone`
--

DROP TABLE IF EXISTS `projectsdone`;
CREATE TABLE `projectsdone` (
  `projectid` int(11) NOT NULL AUTO_INCREMENT,
  `engineer_id` int(11) DEFAULT NULL,
  `projectname` varchar(250) DEFAULT NULL,
  `projectYear` varchar(20) DEFAULT NULL,
  `projectClient` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`projectid`),
  KEY `engineer_id` (`engineer_id`),
  CONSTRAINT `FK_projectsdone_1` FOREIGN KEY (`engineer_id`) REFERENCES `engineer` (`engineer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projectsdone`
--

/*!40000 ALTER TABLE `projectsdone` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectsdone` ENABLE KEYS */;


--
-- Definition of table `qualifications`
--

DROP TABLE IF EXISTS `qualifications`;
CREATE TABLE `qualifications` (
  `acadQlif` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acInstitution` varchar(45) NOT NULL,
  `certfAward` varchar(45) NOT NULL,
  `yearOfAward` varchar(45) NOT NULL,
  `engineer_id` int(11) NOT NULL,
  PRIMARY KEY (`acadQlif`) USING BTREE,
  KEY `engineer_id` (`engineer_id`),
  CONSTRAINT `FK_qualifications_1` FOREIGN KEY (`engineer_id`) REFERENCES `engineer` (`engineer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qualifications`
--

/*!40000 ALTER TABLE `qualifications` DISABLE KEYS */;
INSERT INTO `qualifications` (`acadQlif`,`acInstitution`,`certfAward`,`yearOfAward`,`engineer_id`) VALUES 
 (2,'Adventist University of Central Africa ','Bachelor Degree in Information Technology','2015',108);
/*!40000 ALTER TABLE `qualifications` ENABLE KEYS */;


--
-- Definition of table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
CREATE TABLE `staffs` (
  `staff_id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `branchid` int(11) NOT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `FK_staffs_1` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staffs`
--

/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
INSERT INTO `staffs` (`staff_id`,`fname`,`lname`,`gender`,`phone`,`email`,`user_id`,`branchid`) VALUES 
 (7,'Ingabire','Moise','Male','0788223341','ingabiremo20@yahoo.fr',10197,1),
 (8,'NKUBANA','Arinaitwe Dismas','Male','0788228877','nkubanadismas1@yahoo.fr',10198,1),
 (9,'KENTE','Liliane Sandra','Female','0783526054','kentesanda10@yahoo.fr',10199,1),
 (10,'NSENGUMUREMYI','Alexis','Male','0783226154','nsengumuremyialexis1@yahoo.fr',10200,1),
 (11,'NSENGIMANA','Silas','Male','0783526454','nsengimanasilas2@yahoo.fr',10201,1);
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;


--
-- Definition of table `stockholders`
--

DROP TABLE IF EXISTS `stockholders`;
CREATE TABLE `stockholders` (
  `stockholdid` int(11) NOT NULL AUTO_INCREMENT,
  `stockholdNames` varchar(80) DEFAULT NULL,
  `identification` varchar(20) DEFAULT NULL,
  `stockholdTel` varchar(20) DEFAULT NULL,
  `stockholdqual` varchar(400) DEFAULT NULL,
  `engineer_id` int(11) DEFAULT NULL,
  `recierId` int(11) DEFAULT NULL,
  PRIMARY KEY (`stockholdid`),
  KEY `engineer_id` (`engineer_id`),
  CONSTRAINT `FK_stockholders_1` FOREIGN KEY (`engineer_id`) REFERENCES `engineer` (`engineer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stockholders`
--

/*!40000 ALTER TABLE `stockholders` DISABLE KEYS */;
INSERT INTO `stockholders` (`stockholdid`,`stockholdNames`,`identification`,`stockholdTel`,`stockholdqual`,`engineer_id`,`recierId`) VALUES 
 (1,'Bugingo Emmy ','1287653749234','0788334412','Technician ',106,102);
/*!40000 ALTER TABLE `stockholders` ENABLE KEYS */;


--
-- Definition of table `supporters`
--

DROP TABLE IF EXISTS `supporters`;
CREATE TABLE `supporters` (
  `suportid` int(11) NOT NULL AUTO_INCREMENT,
  `supporternames` varchar(45) NOT NULL,
  `supportierid` int(11) NOT NULL,
  `engineer_id` int(11) NOT NULL,
  `signature` varchar(45) NOT NULL,
  `supporterphone` varchar(45) NOT NULL,
  PRIMARY KEY (`suportid`),
  KEY `engineer_id` (`engineer_id`),
  CONSTRAINT `FK_supporters_1` FOREIGN KEY (`engineer_id`) REFERENCES `engineer` (`engineer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supporters`
--

/*!40000 ALTER TABLE `supporters` DISABLE KEYS */;
INSERT INTO `supporters` (`suportid`,`supporternames`,`supportierid`,`engineer_id`,`signature`,`supporterphone`) VALUES 
 (1,'Ingabire 5',106,108,'unsigned','0788228867'),
 (2,'dfdsg',100,107,'unsigned','ffsdf');
/*!40000 ALTER TABLE `supporters` ENABLE KEYS */;


--
-- Definition of table `tbl_employees`
--

DROP TABLE IF EXISTS `tbl_employees`;
CREATE TABLE `tbl_employees` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(25) NOT NULL,
  `emp_dept` varchar(50) NOT NULL,
  `emp_salary` varchar(7) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_employees`
--

/*!40000 ALTER TABLE `tbl_employees` DISABLE KEYS */;
INSERT INTO `tbl_employees` (`emp_id`,`emp_name`,`emp_dept`,`emp_salary`) VALUES 
 (1,'john doe','programmer','155000'),
 (2,'test','web designer','500000');
/*!40000 ALTER TABLE `tbl_employees` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `roles` varchar(50) NOT NULL,
  `userstatus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`userid`,`username`,`password`,`roles`,`userstatus`) VALUES 
 (10197,'ingabiremo20@yahoo.fr','ê‡h•ßK;8UŽ}yÇ/','Admin','unlocked'),
 (10198,'nkubanadismas1@yahoo.fr','R&\røßYo7>ëM¤³ˆ5','President','unlocked'),
 (10199,'kentesanda10@yahoo.fr','_V¹#OÄc•.Š•;5ƒ','Secretary','unlocked'),
 (10200,'nsengumuremyialexis1@yahoo.fr','¾8v0F¨&va±v×\\N!-_ù	7D§ªV„o±jD¡','Receptionist','unlocked'),
 (10201,'nsengimanasilas2@yahoo.fr','‹8›hy®Ëb‹_˜E\"M=Vå‘Tâ†Ra‹Õý','Vice President','unlocked');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
