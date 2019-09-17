-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.17 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             10.2.0.5606
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table sgiadb.division
DROP TABLE IF EXISTS `division`;
CREATE TABLE IF NOT EXISTS `division` (
  `divisionId` int(11) NOT NULL AUTO_INCREMENT,
  `divisionCode` text NOT NULL,
  `divisionName` text,
  PRIMARY KEY (`divisionId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf32;

-- Dumping data for table sgiadb.division: ~6 rows (approximately)
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` (`divisionId`, `divisionCode`, `divisionName`) VALUES
	(1, 'MD', 'Men\'s Division'),
	(2, 'WD', 'Women\'s Division'),
	(3, 'YMD', 'Young Men\'s Division'),
	(4, 'YWD', 'Young Women\'s Division'),
	(5, 'HSG', 'High School Group'),
	(6, 'FD', 'Future Division');
/*!40000 ALTER TABLE `division` ENABLE KEYS */;

-- Dumping structure for table sgiadb.groupmember
DROP TABLE IF EXISTS `groupmember`;
CREATE TABLE IF NOT EXISTS `groupmember` (
  `groupMemberId` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `personId` int(11) DEFAULT NULL,
  `joinDate` date DEFAULT NULL,
  `leaveDate` date DEFAULT NULL,
  PRIMARY KEY (`groupMemberId`),
  KEY `FK_groupmember_group` (`groupId`),
  KEY `FK_groupmember_person` (`personId`),
  CONSTRAINT `FK_groupmember_group` FOREIGN KEY (`groupId`) REFERENCES `organisation` (`organisationId`),
  CONSTRAINT `FK_groupmember_person` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf32 COMMENT='members of group - SGIA Member or Guest/Naitoku\r\nNot visitor';

-- Dumping data for table sgiadb.groupmember: ~24 rows (approximately)
/*!40000 ALTER TABLE `groupmember` DISABLE KEYS */;
INSERT INTO `groupmember` (`groupMemberId`, `groupId`, `personId`, `joinDate`, `leaveDate`) VALUES
	(1, 1, 1, '2013-01-01', NULL),
	(2, 1, 2, '2013-01-01', NULL),
	(3, 1, 3, '2013-01-01', NULL),
	(4, 1, 9, '2013-01-01', NULL),
	(5, 1, 10, '2013-01-01', NULL),
	(6, 1, 11, '2013-01-01', NULL),
	(7, 1, 12, '2013-01-01', NULL),
	(8, 1, 13, '2013-01-01', NULL),
	(9, 1, 14, '2013-01-01', NULL),
	(10, 1, 15, '2013-01-01', NULL),
	(11, 1, 16, '2013-01-01', NULL),
	(12, 2, 4, '2013-01-01', NULL),
	(13, 3, 5, '2013-01-01', NULL),
	(14, 5, 7, '2013-01-01', NULL),
	(15, 4, 6, '2013-01-01', NULL),
	(17, 6, 21, '2019-07-06', NULL),
	(18, 6, 8, '2013-01-01', NULL),
	(20, 1, 23, '2019-07-08', NULL),
	(21, 1, 24, '2019-07-08', NULL),
	(22, 1, 25, '2019-07-08', NULL),
	(23, 1, 26, '2019-07-08', NULL),
	(24, 1, 27, '2019-07-08', NULL),
	(25, 1, 28, '2019-07-08', NULL),
	(26, 1, 31, '2019-07-10', NULL);
/*!40000 ALTER TABLE `groupmember` ENABLE KEYS */;

-- Dumping structure for table sgiadb.meeting
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE IF NOT EXISTS `meeting` (
  `meetingId` int(11) NOT NULL AUTO_INCREMENT,
  `organisationId` int(11) NOT NULL DEFAULT '0',
  `meetingTypeId` int(11) NOT NULL DEFAULT '0',
  `meetingLocationId` int(11) NOT NULL DEFAULT '0',
  `meetingDate` date DEFAULT NULL,
  `meetingNotes` text,
  PRIMARY KEY (`meetingId`),
  KEY `FK_meeting_organisation` (`organisationId`),
  KEY `FK_meeting_meetingtype` (`meetingTypeId`),
  KEY `FK_meeting_meetinglocation` (`meetingLocationId`),
  CONSTRAINT `FK_meeting_meetinglocation` FOREIGN KEY (`meetingLocationId`) REFERENCES `meetinglocation` (`locationId`),
  CONSTRAINT `FK_meeting_meetingtype` FOREIGN KEY (`meetingTypeId`) REFERENCES `meetingtype` (`meetingTypeId`),
  CONSTRAINT `FK_meeting_organisation` FOREIGN KEY (`organisationId`) REFERENCES `organisation` (`organisationId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf32;

-- Dumping data for table sgiadb.meeting: ~3 rows (approximately)
/*!40000 ALTER TABLE `meeting` DISABLE KEYS */;
INSERT INTO `meeting` (`meetingId`, `organisationId`, `meetingTypeId`, `meetingLocationId`, `meetingDate`, `meetingNotes`) VALUES
	(2, 1, 1, 1, '2019-02-17', 'Discussion Meeting '),
	(3, 1, 1, 1, '2019-03-17', 'Discussion Meeting '),
	(4, 1, 1, 1, '2019-04-19', ''),
	(5, 1, 1, 1, '2019-05-19', ''),
	(6, 1, 1, 1, '2019-06-16', '');
/*!40000 ALTER TABLE `meeting` ENABLE KEYS */;

-- Dumping structure for table sgiadb.meetingattendees
DROP TABLE IF EXISTS `meetingattendees`;
CREATE TABLE IF NOT EXISTS `meetingattendees` (
  `meetingAttendeesId` int(11) NOT NULL AUTO_INCREMENT,
  `meetingId` int(11) DEFAULT NULL,
  `personId` int(11) DEFAULT NULL,
  `meetingRoleId` int(11) NOT NULL,
  PRIMARY KEY (`meetingAttendeesId`),
  KEY `FK_meetingattendees_meeting` (`meetingId`),
  KEY `FK_meetingattendees_person` (`personId`),
  KEY `FK_meetingattendees_meetingrole` (`meetingRoleId`),
  CONSTRAINT `FK_meetingattendees_meeting` FOREIGN KEY (`meetingId`) REFERENCES `meeting` (`meetingId`),
  CONSTRAINT `FK_meetingattendees_meetingrole` FOREIGN KEY (`meetingRoleId`) REFERENCES `meetingrole` (`meetingRoleId`),
  CONSTRAINT `FK_meetingattendees_person` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf32;

-- Dumping data for table sgiadb.meetingattendees: ~13 rows (approximately)
/*!40000 ALTER TABLE `meetingattendees` DISABLE KEYS */;
INSERT INTO `meetingattendees` (`meetingAttendeesId`, `meetingId`, `personId`, `meetingRoleId`) VALUES
	(162, 4, 30, 1),
	(163, 4, 23, 1),
	(164, 4, 10, 1),
	(165, 4, 12, 1),
	(166, 4, 11, 1),
	(167, 4, 1, 1),
	(168, 4, 2, 1),
	(169, 4, 25, 1),
	(170, 4, 3, 1),
	(179, 2, 9, 1),
	(180, 2, 10, 1),
	(181, 2, 1, 1),
	(182, 2, 2, 1),
	(183, 2, 13, 1),
	(184, 2, 3, 1),
	(185, 3, 32, 1),
	(186, 3, 23, 1),
	(187, 3, 9, 1),
	(188, 3, 10, 1),
	(189, 3, 27, 1),
	(190, 3, 1, 1),
	(191, 3, 2, 1),
	(192, 3, 25, 1),
	(193, 3, 15, 1),
	(194, 5, 17, 1),
	(195, 5, 32, 1),
	(196, 5, 23, 1),
	(197, 5, 9, 1),
	(198, 5, 10, 1),
	(199, 5, 1, 1),
	(200, 5, 2, 1),
	(201, 5, 15, 1),
	(202, 5, 16, 1),
	(203, 6, 32, 1),
	(204, 6, 23, 1),
	(205, 6, 9, 1),
	(206, 6, 1, 1),
	(207, 6, 2, 1),
	(208, 6, 15, 1);
/*!40000 ALTER TABLE `meetingattendees` ENABLE KEYS */;

-- Dumping structure for table sgiadb.meetinglocation
DROP TABLE IF EXISTS `meetinglocation`;
CREATE TABLE IF NOT EXISTS `meetinglocation` (
  `locationId` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `locationName` text,
  `locationStreet` text,
  `locationTown` text,
  `locationState` text,
  `locationPostCode` text,
  PRIMARY KEY (`locationId`),
  KEY `FK_grouplocation_group` (`groupId`),
  CONSTRAINT `FK_grouplocation_group` FOREIGN KEY (`groupId`) REFERENCES `organisation` (`organisationId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf32 COMMENT='Meeting Locations';

-- Dumping data for table sgiadb.meetinglocation: ~3 rows (approximately)
/*!40000 ALTER TABLE `meetinglocation` DISABLE KEYS */;
INSERT INTO `meetinglocation` (`locationId`, `groupId`, `locationName`, `locationStreet`, `locationTown`, `locationState`, `locationPostCode`) VALUES
	(1, 1, 'Joe & Kayoko\'s', '69 Mackillop Drive', 'Baulkham Hills', 'NSW', '2153'),
	(2, 2, 'Pankaj & Meha', '21 Windarra Pl', 'Castle Hill', 'NSW', '2154'),
	(3, 5, 'Callan & Kaoru\'s', '9/25 Railway St', 'Baulkham Hills', 'NSW', '2153');
/*!40000 ALTER TABLE `meetinglocation` ENABLE KEYS */;

-- Dumping structure for table sgiadb.meetingrole
DROP TABLE IF EXISTS `meetingrole`;
CREATE TABLE IF NOT EXISTS `meetingrole` (
  `meetingRoleId` int(11) NOT NULL AUTO_INCREMENT,
  `meetingRole` text,
  PRIMARY KEY (`meetingRoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf32;

-- Dumping data for table sgiadb.meetingrole: ~4 rows (approximately)
/*!40000 ALTER TABLE `meetingrole` DISABLE KEYS */;
INSERT INTO `meetingrole` (`meetingRoleId`, `meetingRole`) VALUES
	(1, 'Group Member'),
	(2, 'Visiting Member'),
	(3, 'Guest (Not Member)'),
	(4, 'Visiting Leader');
/*!40000 ALTER TABLE `meetingrole` ENABLE KEYS */;

-- Dumping structure for table sgiadb.meetingtype
DROP TABLE IF EXISTS `meetingtype`;
CREATE TABLE IF NOT EXISTS `meetingtype` (
  `meetingTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `meetingType` text,
  PRIMARY KEY (`meetingTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf32;

-- Dumping data for table sgiadb.meetingtype: ~4 rows (approximately)
/*!40000 ALTER TABLE `meetingtype` DISABLE KEYS */;
INSERT INTO `meetingtype` (`meetingTypeId`, `meetingType`) VALUES
	(1, 'Regular Discussion Meeting'),
	(2, 'Study Meeting'),
	(3, 'Division Meeting'),
	(4, 'Friendship Meeting');
/*!40000 ALTER TABLE `meetingtype` ENABLE KEYS */;

-- Dumping structure for table sgiadb.memberstatus
DROP TABLE IF EXISTS `memberstatus`;
CREATE TABLE IF NOT EXISTS `memberstatus` (
  `memberStatusId` int(11) NOT NULL AUTO_INCREMENT,
  `status` text,
  PRIMARY KEY (`memberStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf32;

-- Dumping data for table sgiadb.memberstatus: ~2 rows (approximately)
/*!40000 ALTER TABLE `memberstatus` DISABLE KEYS */;
INSERT INTO `memberstatus` (`memberStatusId`, `status`) VALUES
	(1, 'Member'),
	(2, 'Guest (Local)');
/*!40000 ALTER TABLE `memberstatus` ENABLE KEYS */;

-- Dumping structure for table sgiadb.organisation
DROP TABLE IF EXISTS `organisation`;
CREATE TABLE IF NOT EXISTS `organisation` (
  `organisationId` int(11) NOT NULL AUTO_INCREMENT,
  `organisationName` text,
  `organisationTypeId` int(11) DEFAULT NULL,
  `administeredBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`organisationId`),
  KEY `FK_organisation_organisationtype` (`organisationTypeId`),
  KEY `FK_organisation_organisation` (`administeredBy`),
  CONSTRAINT `FK_organisation_organisation` FOREIGN KEY (`administeredBy`) REFERENCES `organisation` (`organisationId`),
  CONSTRAINT `FK_organisation_organisationtype` FOREIGN KEY (`organisationTypeId`) REFERENCES `organisationtype` (`organisationTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf32;

-- Dumping data for table sgiadb.organisation: ~12 rows (approximately)
/*!40000 ALTER TABLE `organisation` DISABLE KEYS */;
INSERT INTO `organisation` (`organisationId`, `organisationName`, `organisationTypeId`, `administeredBy`) VALUES
	(1, 'Soka Lions', 5, 7),
	(2, 'Castle Hill Group', 5, 7),
	(3, 'Castle Hill/Kellyville', 5, 7),
	(4, 'Daytime Study Group', 5, 7),
	(5, 'Callan\'s Meeting', 5, 7),
	(6, 'Toshi\'s Gathering', 6, 7),
	(7, 'Hills', 4, 8),
	(8, 'Western Sydney', 3, 9),
	(9, 'NSW', 2, 10),
	(10, 'Australia', 1, NULL),
	(11, 'Parramatta', 4, 8),
	(12, 'Liverpool', 4, 8);
/*!40000 ALTER TABLE `organisation` ENABLE KEYS */;

-- Dumping structure for table sgiadb.organisationtype
DROP TABLE IF EXISTS `organisationtype`;
CREATE TABLE IF NOT EXISTS `organisationtype` (
  `organisationTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `organisationTypeName` text,
  PRIMARY KEY (`organisationTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf32;

-- Dumping data for table sgiadb.organisationtype: ~6 rows (approximately)
/*!40000 ALTER TABLE `organisationtype` DISABLE KEYS */;
INSERT INTO `organisationtype` (`organisationTypeId`, `organisationTypeName`) VALUES
	(1, 'Country'),
	(2, 'State'),
	(3, 'Region'),
	(4, 'Area'),
	(5, 'Group'),
	(6, 'Gathering');
/*!40000 ALTER TABLE `organisationtype` ENABLE KEYS */;

-- Dumping structure for table sgiadb.person
DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `personId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` text,
  `lastName` text NOT NULL,
  `street` text,
  `town` text,
  `state` text,
  `postcode` text,
  `memberStatus` int(11) NOT NULL,
  `division` int(11) DEFAULT NULL,
  `email` text,
  `mobile` text,
  PRIMARY KEY (`personId`),
  KEY `FK_person_division` (`division`),
  KEY `FK_person_memberstatus` (`memberStatus`),
  CONSTRAINT `FK_person_division` FOREIGN KEY (`division`) REFERENCES `division` (`divisionId`),
  CONSTRAINT `FK_person_memberstatus` FOREIGN KEY (`memberStatus`) REFERENCES `memberstatus` (`memberStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf32;

-- Dumping data for table sgiadb.person: ~28 rows (approximately)
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`personId`, `firstName`, `lastName`, `street`, `town`, `state`, `postcode`, `memberStatus`, `division`, `email`, `mobile`) VALUES
	(1, 'Joseph', 'Lai', '69 Mackillop Dr', 'Baulkham Hills', 'NSW', '2153', 1, 1, 'josephhylai@gmail.com', '0401974534'),
	(2, 'Kayoko', 'Lai', '69 Mackillop Dr', 'Baulkham Hills', 'NSW', '2153', 1, 2, 'kayokolai@gmail.com', NULL),
	(3, 'Merissa', 'Wong', '61 Oakhill Drive', 'Castle Hill', 'NSW', '2154', 1, 2, 'mwongpk@yahoo.com', '0431537891'),
	(4, 'Pankaj', 'Raina', '21 Windarra Pl', 'Castle Hill', 'NSW', '2154', 1, 1, 'rainapankaj@gmail.com', '0432 854 654'),
	(5, 'Rakhee', 'Kapadia', '14 Parkwood Close', 'Castle Hill', 'NSW', '2154', 1, 2, 'rakheeseth@yahoo.com', '0400884481'),
	(6, 'Kaoru', 'Farrugia', '71 Tamboura Ave', 'Baulkham Hills', 'NSW', '2153', 1, 2, 'kaorufarrugia@optusnet.com.au', '0422 612477'),
	(7, 'Callan', 'Lynes', '9/25-27 Railway St', 'Baulkham Hills', 'NSW', '2153', 1, 1, 'callan.lynes@gmail.com', NULL),
	(8, 'Toshi', 'Imaya', '50/13-19 Seven Hills Road', 'Baulkham Hills', 'NSW', '2153', 1, 1, 'toshiimaya@gmail.com', '0414 755 237 '),
	(9, 'Ronald', 'Clarke', '10 Lindsay St', 'Baulkham Hills', 'NSW', '2153', 1, 1, 'ron.r.clarke@gmail.com', '0418 277624'),
	(10, 'Lee Yin', 'Hoe', '46 Peel Road', 'Baulkham Hills', 'NSW', '2153', 1, 2, 'lyhoe09@gmail.com', '0432 510 321'),
	(11, 'Dillon', 'Lai', '69 Mackillop Drive', 'Baulkham Hills', 'NSW', '2153', 1, 5, NULL, NULL),
	(12, 'Alexander', 'Lai', '69 Mackillop Drive', 'Baulkham Hills', 'NSW', '2153', 1, 6, NULL, NULL),
	(13, 'Puja', 'Lal', '3 Kent St', 'Baulkham Hills', 'NSW', '2153', 1, 2, 'dr_pl72@yahoo.com', '0420 750 817'),
	(14, 'Sonali', 'Kapoor', '32, Yattenden Crescent', 'Baulkham Hills', 'NSW', '2153', 2, 2, 'sonalikapoor28@gmail.com', '0410 949491'),
	(15, 'Annie', 'Pathania', '51 Chepstow Drive', 'Castle Hill', 'NSW', '2154', 1, 4, 'anniespathania@gmail.com', '0415261761'),
	(16, 'Shu-Qi (Chloe)', 'Qu', NULL, 'Castle Hill', 'NSW', '2154', 1, 4, 'chloe.sqqu@gmail.com', NULL),
	(17, 'Andy', 'Kumar', '4/5 Good St', 'Parramatta', 'NSW', '2150', 1, 1, 'k_anant@yahoo.com', '0406 017 270'),
	(18, 'Sarah', 'Li', '17 Tristania Court', 'Baulkham Hills', 'NSW', '2153', 1, 2, 'sarahli123@hotmail.com', '0405 136 867'),
	(21, 'Kyoko', 'Imaya', '50/13-19 Seven Hills Road', 'Baulkham Hills', 'NSW', '2153', 1, 2, 'kyokoimaya@gmail.com', '+61 419 654 907'),
	(23, 'Junko', 'Bell', '90 Bingara Crescent', 'Bella Vista', 'NSW', '2153', 1, 2, 'junco10-30@hotmail.co.jp', '0428 388 804'),
	(24, 'Margaret', 'Bradley', '157 McFarlane Drive', 'Minchinbury', 'NSW', '2770', 1, 2, 'margaretrbradley12@gmail.com', '0420 308118'),
	(25, 'Peck Siew', 'Lai', '24 Yawung Ave', 'Baulkham Hills', 'NSW', '2153', 1, 2, 'peckslai@yahoo.com.au', '0430 659989'),
	(26, 'Wai Jin', 'Lok', '61 Oakhill Drive', 'Castle Hill', 'NSW', '2154', 1, 3, 'waijin_92@Hotmail.com', '0435 456983'),
	(27, 'Alison', 'Khoo', '', 'Baulkham Hills', 'NSW', '2153', 1, 2, 'yamsaulan@yahoo.com', '0415 553 100'),
	(28, 'Ching Khee', 'Lok', '61 Oakhill Drive', 'Castle Hill', 'NSW', '2154', 1, 1, 'lokck2006@yahoo.com', '0431 331 396'),
	(30, 'Yuko', 'Ishigaya', NULL, 'Epping', 'NSW', '2121', 1, 4, 'yishigaya@icloud.com', '0491 091 821'),
	(31, 'Rohan', 'Malhotra', 'Chapel Lane', 'Baulkham Hills', 'NSW', '2153', 1, 1, 'malhotra.rohan@gmail.com', '0405 655 844'),
	(32, 'Hans', 'Van Der Bent', '28 Roland Ave', 'Northmead', 'NSW', NULL, 1, 1, 'hvan4446@bigpond.net.au', '0416223846');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;

-- Dumping structure for table sgiadb.personrole
DROP TABLE IF EXISTS `personrole`;
CREATE TABLE IF NOT EXISTS `personrole` (
  `personRoleId` int(11) NOT NULL AUTO_INCREMENT,
  `personId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `organisationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`personRoleId`),
  KEY `FK_personRole_person` (`personId`),
  KEY `FK_personRole_role` (`roleId`),
  KEY `FK_personrole_organisation` (`organisationId`),
  CONSTRAINT `FK_personRole_person` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`),
  CONSTRAINT `FK_personRole_role` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`),
  CONSTRAINT `FK_personrole_organisation` FOREIGN KEY (`organisationId`) REFERENCES `organisation` (`organisationId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf32;

-- Dumping data for table sgiadb.personrole: ~12 rows (approximately)
/*!40000 ALTER TABLE `personrole` DISABLE KEYS */;
INSERT INTO `personrole` (`personRoleId`, `personId`, `roleId`, `organisationId`) VALUES
	(1, 1, 2, 7),
	(2, 2, 3, 1),
	(3, 3, 1, 8),
	(4, 4, 3, 2),
	(5, 5, 3, 3),
	(6, 6, 3, 4),
	(7, 7, 3, 5),
	(8, 8, 4, 6),
	(9, 13, 2, 7),
	(11, 18, 2, 7),
	(12, 17, 1, 8),
	(14, 30, 1, 8),
	(15, 32, 5, 10),
	(16, 8, 5, 10),
	(17, 21, 5, 10);
/*!40000 ALTER TABLE `personrole` ENABLE KEYS */;

-- Dumping structure for table sgiadb.role
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` text,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf32;

-- Dumping data for table sgiadb.role: ~4 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`roleId`, `roleName`) VALUES
	(1, 'Region Leader'),
	(2, 'Area Leader'),
	(3, 'Group Leader'),
	(4, 'Gathering Leader'),
	(5, 'Vice General Director');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table sgiadb.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `personId` int(11) NOT NULL DEFAULT '1',
  `userName` text,
  `password` text,
  PRIMARY KEY (`userId`),
  KEY `FK_users_person` (`personId`),
  CONSTRAINT `FK_users_person` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf32;

-- Dumping data for table sgiadb.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`userId`, `personId`, `userName`, `password`) VALUES
	(1, 1, 'jlai', '$5$rounds=5000$sgiahillssystem2$evKwhWL8phZ.iEf8EbstUDSpiQQpjKdXCyUfOnT4r34'),
	(2, 2, 'klai', '$5$rounds=5000$sgiahillssystem2$evKwhWL8phZ.iEf8EbstUDSpiQQpjKdXCyUfOnT4r34'),
	(3, 3, 'mwong', '$5$rounds=5000$sgiahillssystem2$evKwhWL8phZ.iEf8EbstUDSpiQQpjKdXCyUfOnT4r34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for view sgiadb.vwleaders
DROP VIEW IF EXISTS `vwleaders`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vwleaders` (
	`adminOrgId` INT(11) NOT NULL,
	`adminOrgName` TEXT NULL COLLATE 'utf32_general_ci',
	`organisationId` INT(11) NOT NULL,
	`organisationName` TEXT NULL COLLATE 'utf32_general_ci',
	`personId` INT(11) NOT NULL,
	`firstName` TEXT NULL COLLATE 'utf32_general_ci',
	`lastName` TEXT NOT NULL COLLATE 'utf32_general_ci',
	`roleId` INT(11) NOT NULL,
	`roleName` TEXT NULL COLLATE 'utf32_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view sgiadb.vwleaders
DROP VIEW IF EXISTS `vwleaders`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vwleaders`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwleaders` AS select `ao`.`organisationId` AS `adminOrgId`,`ao`.`organisationName` AS `adminOrgName`,`o`.`organisationId` AS `organisationId`,`o`.`organisationName` AS `organisationName`,`p`.`personId` AS `personId`,`p`.`firstName` AS `firstName`,`p`.`lastName` AS `lastName`,`r`.`roleId` AS `roleId`,`r`.`roleName` AS `roleName` from ((((`organisation` `o` join `person` `p`) join `personrole` `pr`) join `role` `r`) join `organisation` `ao`) where ((`pr`.`personId` = `p`.`personId`) and (`pr`.`organisationId` = `o`.`organisationId`) and (`r`.`roleId` = `pr`.`roleId`) and (`o`.`administeredBy` = `ao`.`organisationId`)) order by `ao`.`organisationName`,`o`.`organisationName`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
