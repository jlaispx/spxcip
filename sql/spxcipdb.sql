-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.17 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for cip_db
CREATE DATABASE IF NOT EXISTS `cip_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cip_db`;

-- Dumping structure for table cip_db.cip_provider
CREATE TABLE IF NOT EXISTS `cip_provider` (
  `providerId` int(11) NOT NULL AUTO_INCREMENT,
  `providerName` varchar(100) NOT NULL COMMENT 'Provider Name - e.g. St Vincent De Paul',
  `location` varchar(50) DEFAULT NULL COMMENT 'Location of provider - e.g. Chatswood',
  PRIMARY KEY (`providerId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='common list of providers - maintainable by admin';

-- Dumping data for table cip_db.cip_provider: ~4 rows (approximately)
/*!40000 ALTER TABLE `cip_provider` DISABLE KEYS */;
INSERT INTO `cip_provider` (`providerId`, `providerName`, `location`) VALUES
	(1, 'St Vincent De Paul', 'Chatswood'),
	(2, 'Meals On Wheels', NULL),
	(3, 'Matthew Talbot Hostel', NULL),
	(4, 'Willowood Nursing Home', NULL);
/*!40000 ALTER TABLE `cip_provider` ENABLE KEYS */;

-- Dumping structure for table cip_db.cip_year
CREATE TABLE IF NOT EXISTS `cip_year` (
  `yearId` int(11) NOT NULL AUTO_INCREMENT,
  `Year` year(4) NOT NULL,
  PRIMARY KEY (`yearId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Year student''s CIP hours are linked to - 2015, 2016, etc\r\n';

-- Dumping data for table cip_db.cip_year: ~1 rows (approximately)
/*!40000 ALTER TABLE `cip_year` DISABLE KEYS */;
INSERT INTO `cip_year` (`yearId`, `Year`) VALUES
	(1, '2018');
/*!40000 ALTER TABLE `cip_year` ENABLE KEYS */;

-- Dumping structure for table cip_db.homeroom
CREATE TABLE IF NOT EXISTS `homeroom` (
  `homeroomId` int(11) NOT NULL AUTO_INCREMENT,
  `homeroom` text,
  PRIMARY KEY (`homeroomId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Homeroom for Teacher and Student';

-- Dumping data for table cip_db.homeroom: ~1 rows (approximately)
/*!40000 ALTER TABLE `homeroom` DISABLE KEYS */;
INSERT INTO `homeroom` (`homeroomId`, `homeroom`) VALUES
	(1, '10H5');
/*!40000 ALTER TABLE `homeroom` ENABLE KEYS */;

-- Dumping structure for table cip_db.student
CREATE TABLE IF NOT EXISTS `student` (
  `studentid` int(11) NOT NULL AUTO_INCREMENT,
  `StudentFirstName` varchar(50) NOT NULL,
  `StudentLastName` varchar(50) NOT NULL,
  `UserId` text NOT NULL COMMENT 'School Allocated User ID',
  `email` text COMMENT 'School email address',
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Student records - links to a Userid';

-- Dumping data for table cip_db.student: ~2 rows (approximately)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`studentid`, `StudentFirstName`, `StudentLastName`, `UserId`, `email`) VALUES
	(1, 'Hunter', 'Bird', 'BIRD03', '	BIRD03@stpiusx.nsw.edu.au'),
	(2, 'Matthew', 'Bradley', 'BRAD13', 'BRAD13@stpiusx.nsw.edu.au');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- Dumping structure for table cip_db.studentyearprovider
CREATE TABLE IF NOT EXISTS `studentyearprovider` (
  `ciphoursId` int(11) NOT NULL AUTO_INCREMENT,
  `providerid` int(11) NOT NULL,
  `yearStudentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ciphoursId`),
  KEY `FK_ciphours_cip_provider` (`providerid`),
  CONSTRAINT `FK_ciphours_cip_provider` FOREIGN KEY (`providerid`) REFERENCES `cip_provider` (`providerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Student Hours';

-- Dumping data for table cip_db.studentyearprovider: ~0 rows (approximately)
/*!40000 ALTER TABLE `studentyearprovider` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentyearprovider` ENABLE KEYS */;

-- Dumping structure for table cip_db.userrole
CREATE TABLE IF NOT EXISTS `userrole` (
  `userRoleId` int(11) NOT NULL AUTO_INCREMENT,
  `userRole` varchar(10) NOT NULL,
  `accessLevel` tinyint(4) NOT NULL COMMENT '0 Admin, 1 User',
  PRIMARY KEY (`userRoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table cip_db.userrole: ~4 rows (approximately)
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` (`userRoleId`, `userRole`, `accessLevel`) VALUES
	(1, 'Admin', 0),
	(2, 'Teacher', 1),
	(3, 'Public', 3),
	(4, 'Student', 2);
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;

-- Dumping structure for table cip_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(10) NOT NULL COMMENT 'User Name',
  `Password` varchar(10) NOT NULL DEFAULT 'password' COMMENT 'Password',
  `FirstName` varchar(20) NOT NULL COMMENT 'First Name',
  `LastName` varchar(20) NOT NULL COMMENT 'Last Name',
  `Email` varchar(50) NOT NULL,
  `Role` int(11) NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `FK_users_userrole` (`Role`),
  CONSTRAINT `FK_users_userrole` FOREIGN KEY (`Role`) REFERENCES `userrole` (`userRoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='User Table';

-- Dumping data for table cip_db.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`UserID`, `UserName`, `Password`, `FirstName`, `LastName`, `Email`, `Role`) VALUES
	(1, 'jlai', 'password', 'Joseph', 'Lai', 'jlai@stpiusx.nsw.edu.au', 1),
	(2, 'ncook', 'password', 'Nicholas', 'Cook', 'ncook@stpiusx.nsw.edu.au', 2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table cip_db.yearstudents
CREATE TABLE IF NOT EXISTS `yearstudents` (
  `yearstudentId` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(11) NOT NULL,
  `homeroomid` int(11) NOT NULL,
  `yearid` int(11) NOT NULL,
  PRIMARY KEY (`yearstudentId`),
  KEY `FK_yearstudents_student` (`studentid`),
  KEY `FK_yearstudents_homeroom` (`homeroomid`),
  KEY `FK_yearstudents_cip_year` (`yearid`),
  CONSTRAINT `FK_yearstudents_cip_year` FOREIGN KEY (`yearid`) REFERENCES `cip_year` (`yearId`),
  CONSTRAINT `FK_yearstudents_homeroom` FOREIGN KEY (`homeroomid`) REFERENCES `homeroom` (`homeroomId`),
  CONSTRAINT `FK_yearstudents_student` FOREIGN KEY (`studentid`) REFERENCES `student` (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Students in a year';

-- Dumping data for table cip_db.yearstudents: ~2 rows (approximately)
/*!40000 ALTER TABLE `yearstudents` DISABLE KEYS */;
INSERT INTO `yearstudents` (`yearstudentId`, `studentid`, `homeroomid`, `yearid`) VALUES
	(1, 1, 1, 1),
	(2, 2, 1, 1);
/*!40000 ALTER TABLE `yearstudents` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
