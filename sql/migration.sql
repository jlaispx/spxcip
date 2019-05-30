-- --------------------------------------------------------
-- Host:                         172.16.2.214
-- Server version:               5.5.38 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table cip_db.cip_provider
CREATE TABLE IF NOT EXISTS `cip_provider` (
  `providerId` int(11) NOT NULL AUTO_INCREMENT,
  `providerName` varchar(100) NOT NULL COMMENT 'Provider Name - e.g. St Vincent De Paul',
  `location` varchar(50) DEFAULT NULL COMMENT 'Location of provider - e.g. Chatswood',
  PRIMARY KEY (`providerId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='common list of providers - maintainable by admin';

-- Dumping data for table cip_db.cip_provider: ~20 rows (approximately)
/*!40000 ALTER TABLE `cip_provider` DISABLE KEYS */;
INSERT INTO `cip_provider` (`providerId`, `providerName`, `location`) VALUES
	(1, 'St Vincent De Paul', 'Chatswood'),
	(2, 'Meals On Wheels', 'Sydney'),
	(3, 'Matthew Talbot Hostel', 'Sydney'),
	(4, 'Willowood Nursing Home', NULL),
	(8, 'St Edmund\'s College', 'Wahroonga'),
	(9, 'Robotics Coaching', 'St Pius X'),
	(11, 'St Vincent De Paul', 'Forestville'),
	(12, 'Presbyterian Aged Care', 'Thornleigh'),
	(13, 'St Vincent De Paul', 'Lane Cove'),
	(14, 'St Vincent De Paul', 'Gordon'),
	(15, 'School Open Day', 'St Pius X'),
	(16, 'Chain Gang', 'St Pius X'),
	(17, 'St Vincent De Paul', 'North Ryde'),
	(18, 'North Ryde Nursing Home', 'North Ryde'),
	(19, 'Coonabarabran', 'St Pius X'),
	(20, 'To Be Confirmed', 'TBC'),
	(21, 'Centacare Industrlies', 'St Pius X'),
	(22, 'San Antonio De Padova Aged Care', 'Ryde'),
	(23, 'St Vincent De Paul', 'St Ives'),
	(26, 'Salvation Army', 'Chatswood (SPX)');
/*!40000 ALTER TABLE `cip_provider` ENABLE KEYS */;

-- Dumping structure for table cip_db.cip_year
CREATE TABLE IF NOT EXISTS `cip_year` (
  `yearId` int(11) NOT NULL AUTO_INCREMENT,
  `year` text NOT NULL,
  PRIMARY KEY (`yearId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Year student''s CIP hours are linked to - 2015, 2016, etc\r\n';

-- Dumping data for table cip_db.cip_year: ~1 rows (approximately)
/*!40000 ALTER TABLE `cip_year` DISABLE KEYS */;
INSERT INTO `cip_year` (`yearId`, `year`) VALUES
	(1, '2019');
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

-- Dumping structure for view cip_db.homeroomsummaryvw
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `homeroomsummaryvw` (
	`userID` INT(11) NOT NULL,
	`homeroomId` INT(11) NOT NULL,
	`homeroom` TEXT NULL COLLATE 'utf8_general_ci',
	`yearId` INT(11) NOT NULL,
	`YEAR` TEXT NOT NULL COLLATE 'utf8_general_ci',
	`yearstudentId` INT(11) NOT NULL,
	`studentId` INT(11) NOT NULL,
	`StudentFirstName` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`StudentLastName` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`studentUserId` TEXT NOT NULL COMMENT 'School Allocated User ID' COLLATE 'utf8_general_ci',
	`studentYearProviderId` INT(11) NOT NULL,
	`providerId` INT(11) NOT NULL,
	`providerName` VARCHAR(100) NOT NULL COMMENT 'Provider Name - e.g. St Vincent De Paul' COLLATE 'utf8_general_ci',
	`location` VARCHAR(50) NULL COMMENT 'Location of provider - e.g. Chatswood' COLLATE 'utf8_general_ci',
	`cipHours` INT(11) NOT NULL,
	`venueFormFlag` INT(1) NOT NULL,
	`logBookFlag` INT(1) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table cip_db.student
CREATE TABLE IF NOT EXISTS `student` (
  `studentid` int(11) NOT NULL AUTO_INCREMENT,
  `StudentFirstName` varchar(50) NOT NULL,
  `StudentLastName` varchar(50) NOT NULL,
  `UserId` text NOT NULL COMMENT 'School Allocated User ID',
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='Student records - links to a Userid';

-- Dumping data for table cip_db.student: ~32 rows (approximately)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`studentid`, `StudentFirstName`, `StudentLastName`, `UserId`) VALUES
	(132, 'Samuel', 'Ashman', 'ASHM01'),
	(133, 'Luca', 'Cavaleri', 'CAVA10'),
	(134, 'Michael', 'Chan', 'CHAN48'),
	(135, 'Benjamin', 'Chua', 'CHUA01'),
	(136, 'Thomas', 'Cooper', 'COOP09'),
	(137, 'Jamie', 'Corcoran', 'CORC03'),
	(138, 'Reuben', 'Cuasay', 'CUAS03'),
	(139, 'Zachary', 'Davidson', 'DAVI31'),
	(140, 'Daniel', 'Drake', 'DRAK05'),
	(141, 'Angelo', 'Fernando', 'FERN21'),
	(142, 'Jake', 'Forbes', 'FORB02'),
	(143, 'Joshua', 'Gomez', 'GOME05'),
	(144, 'Thomas', 'Hanley', 'HANL11'),
	(145, 'Max', 'Harmata', 'HARM08'),
	(146, 'Tom', 'Hopkins', 'HOPK06'),
	(147, 'James', 'Hunt', 'HUNT17'),
	(148, 'David', 'Jelovic', 'JELO05'),
	(149, 'Ashley', 'Johnson', 'JOHN50'),
	(150, 'Bailey', 'Kee', 'KEE18'),
	(151, 'Connor', 'Lo', 'LO111'),
	(152, 'Jared', 'Lohtaja', 'LOHT03'),
	(153, 'Aidan', 'Lonsdale', 'LONS03'),
	(154, 'Liam', 'Masters', 'MAST10'),
	(155, 'Nicholas', 'Moutevelis', 'MOUT01'),
	(156, 'Manav', 'Purohit', 'PURO05'),
	(157, 'Xavier', 'Rogers', 'ROGE04'),
	(158, 'James', 'Shahen', 'SHAH25'),
	(159, 'Oliver', 'Stephenson', 'STEP11'),
	(160, 'Kevork', 'Tatarian', 'TATA02'),
	(161, 'William', 'Thomson', 'THOM29'),
	(162, 'Thomas', 'Van Dijk', 'VAND15'),
	(163, 'Joshua', 'Virtue', 'VIRT05');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- Dumping structure for table cip_db.studentyearprovider
CREATE TABLE IF NOT EXISTS `studentyearprovider` (
  `studentYearProviderId` int(11) NOT NULL AUTO_INCREMENT,
  `providerId` int(11) NOT NULL,
  `yearstudentId` int(11) NOT NULL,
  `cipHours` int(11) NOT NULL DEFAULT '0',
  `venueFormFlag` int(1) NOT NULL DEFAULT '0',
  `logBookFlag` int(1) NOT NULL DEFAULT '0',
  `comments` text,
  PRIMARY KEY (`studentYearProviderId`),
  KEY `FK_ciphours_cip_provider` (`providerId`),
  KEY `FK_studentyearprovider_yearstudents` (`yearstudentId`),
  CONSTRAINT `FK_ciphours_cip_provider` FOREIGN KEY (`providerId`) REFERENCES `cip_provider` (`providerId`),
  CONSTRAINT `FK_studentyearprovider_yearstudents` FOREIGN KEY (`yearstudentId`) REFERENCES `yearstudents` (`yearstudentId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='Student Hours';

-- Dumping data for table cip_db.studentyearprovider: ~25 rows (approximately)
/*!40000 ALTER TABLE `studentyearprovider` DISABLE KEYS */;
INSERT INTO `studentyearprovider` (`studentYearProviderId`, `providerId`, `yearstudentId`, `cipHours`, `venueFormFlag`, `logBookFlag`, `comments`) VALUES
	(11, 12, 3, 8, 0, 0, ''),
	(12, 17, 4, 7, 1, 0, NULL),
	(13, 3, 6, 3, 0, 0, NULL),
	(14, 13, 7, 36, 1, 1, NULL),
	(15, 1, 9, 7, 0, 0, NULL),
	(16, 1, 12, 16, 1, 0, NULL),
	(17, 15, 14, 4, 0, 0, ''),
	(18, 1, 14, 12, 0, 0, ''),
	(19, 1, 17, 7, 1, 0, NULL),
	(20, 15, 19, 5, 0, 0, NULL),
	(21, 18, 19, 6, 0, 0, NULL),
	(22, 19, 20, 0, 0, 0, NULL),
	(25, 14, 25, 0, 1, 0, NULL),
	(26, 20, 8, 13, 0, 0, NULL),
	(28, 15, 33, 2, 0, 1, NULL),
	(29, 21, 33, 9, 0, 1, NULL),
	(30, 22, 31, 0, 0, 0, NULL),
	(31, 23, 5, 0, 0, 0, ''),
	(32, 14, 11, 0, 0, 0, ''),
	(33, 16, 15, 8, 0, 0, ''),
	(34, 3, 15, 3, 0, 0, ''),
	(35, 2, 15, 2, 0, 0, '1.5hrs'),
	(36, 26, 16, 4, 0, 0, 'b'),
	(37, 16, 16, 4, 0, 0, 'a'),
	(38, 15, 16, 5, 0, 0, 'c');
/*!40000 ALTER TABLE `studentyearprovider` ENABLE KEYS */;

-- Dumping structure for view cip_db.teacherdetailsvw
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `teacherdetailsvw` (
	`UserID` INT(11) NOT NULL,
	`UserName` VARCHAR(10) NOT NULL COMMENT 'User Name' COLLATE 'utf8_general_ci',
	`PASSWORD` VARCHAR(10) NOT NULL COMMENT 'Password' COLLATE 'utf8_general_ci',
	`FirstName` VARCHAR(20) NOT NULL COMMENT 'First Name' COLLATE 'utf8_general_ci',
	`LastName` VARCHAR(20) NOT NULL COMMENT 'Last Name' COLLATE 'utf8_general_ci',
	`homeroomId` INT(11) NOT NULL,
	`homeroom` TEXT NULL COLLATE 'utf8_general_ci',
	`yearId` INT(11) NOT NULL,
	`YEAR` TEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for table cip_db.teacherhomeroom
CREATE TABLE IF NOT EXISTS `teacherhomeroom` (
  `teacherHomeroomId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `homeroomId` int(11) DEFAULT NULL,
  `yearId` int(11) DEFAULT NULL,
  PRIMARY KEY (`teacherHomeroomId`),
  KEY `FK_teacherHomeroom_users` (`userId`),
  KEY `FK_teacherHomeroom_homeroom` (`homeroomId`),
  KEY `FK_teacherHomeroom_cip_year` (`yearId`),
  CONSTRAINT `FK_teacherHomeroom_cip_year` FOREIGN KEY (`yearId`) REFERENCES `cip_year` (`yearId`),
  CONSTRAINT `FK_teacherHomeroom_homeroom` FOREIGN KEY (`homeroomId`) REFERENCES `homeroom` (`homeroomId`),
  CONSTRAINT `FK_teacherHomeroom_users` FOREIGN KEY (`userId`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Homeroom allocated to a teacher ';

-- Dumping data for table cip_db.teacherhomeroom: ~2 rows (approximately)
/*!40000 ALTER TABLE `teacherhomeroom` DISABLE KEYS */;
INSERT INTO `teacherhomeroom` (`teacherHomeroomId`, `userId`, `homeroomId`, `yearId`) VALUES
	(1, 1, 1, 1),
	(2, 2, 1, 1);
/*!40000 ALTER TABLE `teacherhomeroom` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='Students in a year';

-- Dumping data for table cip_db.yearstudents: ~32 rows (approximately)
/*!40000 ALTER TABLE `yearstudents` DISABLE KEYS */;
INSERT INTO `yearstudents` (`yearstudentId`, `studentid`, `homeroomid`, `yearid`) VALUES
	(3, 132, 1, 1),
	(4, 133, 1, 1),
	(5, 134, 1, 1),
	(6, 135, 1, 1),
	(7, 136, 1, 1),
	(8, 137, 1, 1),
	(9, 138, 1, 1),
	(10, 139, 1, 1),
	(11, 140, 1, 1),
	(12, 141, 1, 1),
	(13, 142, 1, 1),
	(14, 143, 1, 1),
	(15, 144, 1, 1),
	(16, 145, 1, 1),
	(17, 146, 1, 1),
	(18, 147, 1, 1),
	(19, 148, 1, 1),
	(20, 149, 1, 1),
	(21, 150, 1, 1),
	(22, 151, 1, 1),
	(23, 152, 1, 1),
	(24, 153, 1, 1),
	(25, 154, 1, 1),
	(26, 155, 1, 1),
	(27, 156, 1, 1),
	(28, 157, 1, 1),
	(29, 158, 1, 1),
	(30, 159, 1, 1),
	(31, 160, 1, 1),
	(32, 161, 1, 1),
	(33, 162, 1, 1),
	(34, 163, 1, 1);
/*!40000 ALTER TABLE `yearstudents` ENABLE KEYS */;

-- Dumping structure for view cip_db.homeroomsummaryvw
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `homeroomsummaryvw`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `homeroomsummaryvw` AS select `td`.`UserID` AS `userID`,`td`.`homeroomId` AS `homeroomId`,`td`.`homeroom` AS `homeroom`,`td`.`yearId` AS `yearId`,`td`.`YEAR` AS `YEAR`,`ys`.`yearstudentId` AS `yearstudentId`,`s`.`studentid` AS `studentId`,`s`.`StudentFirstName` AS `StudentFirstName`,`s`.`StudentLastName` AS `StudentLastName`,`s`.`UserId` AS `studentUserId`,`syp`.`studentYearProviderId` AS `studentYearProviderId`,`p`.`providerId` AS `providerId`,`p`.`providerName` AS `providerName`,`p`.`location` AS `location`,`syp`.`cipHours` AS `cipHours`,`syp`.`venueFormFlag` AS `venueFormFlag`,`syp`.`logBookFlag` AS `logBookFlag` from ((((`teacherdetailsvw` `td` join `yearstudents` `ys`) join `student` `s`) join `studentyearprovider` `syp`) join `cip_provider` `p`) where ((`ys`.`studentid` = `s`.`studentid`) and (`ys`.`homeroomid` = `td`.`homeroomId`) and (`ys`.`yearid` = `td`.`yearId`) and (`syp`.`yearstudentId` = `ys`.`yearstudentId`) and (`syp`.`providerId` = `p`.`providerId`)) order by `td`.`UserID`,`s`.`StudentLastName`,`s`.`StudentFirstName`,`p`.`providerName`,`p`.`location` ;

-- Dumping structure for view cip_db.teacherdetailsvw
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `teacherdetailsvw`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `teacherdetailsvw` AS select `u`.`UserID` AS `UserID`,`u`.`UserName` AS `UserName`,`u`.`Password` AS `PASSWORD`,`u`.`FirstName` AS `FirstName`,`u`.`LastName` AS `LastName`,`h`.`homeroomId` AS `homeroomId`,`h`.`homeroom` AS `homeroom`,`y`.`yearId` AS `yearId`,`y`.`year` AS `YEAR` from (((`users` `u` join `teacherhomeroom` `th`) join `cip_year` `y`) join `homeroom` `h`) where ((`u`.`UserID` = `th`.`userId`) and (`y`.`year` = convert(date_format(curdate(),'%Y') using utf8)) and (`th`.`yearId` = `y`.`yearId`) and (`h`.`homeroomId` = `th`.`homeroomId`)) ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
