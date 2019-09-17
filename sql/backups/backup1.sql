-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.17 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table cip_db.cip_provider
DROP TABLE IF EXISTS `cip_provider`;
CREATE TABLE IF NOT EXISTS `cip_provider` (
  `providerId` int(11) NOT NULL AUTO_INCREMENT,
  `providerName` varchar(100) NOT NULL COMMENT 'Provider Name - e.g. St Vincent De Paul',
  `location` varchar(50) DEFAULT NULL COMMENT 'Location of provider - e.g. Chatswood',
  PRIMARY KEY (`providerId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='common list of providers - maintainable by admin';

-- Dumping data for table cip_db.cip_provider: ~18 rows (approximately)
/*!40000 ALTER TABLE `cip_provider` DISABLE KEYS */;
INSERT INTO `cip_provider` (`providerId`, `providerName`, `location`) VALUES
	(1, 'St Vincent De Paul', 'Chatswood'),
	(2, 'Meals On Wheels2', 'Sydney'),
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
	(22, 'San Antonio De Padova Aged Care', 'Ryde');
/*!40000 ALTER TABLE `cip_provider` ENABLE KEYS */;

-- Dumping structure for table cip_db.cip_year
DROP TABLE IF EXISTS `cip_year`;
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
DROP TABLE IF EXISTS `homeroom`;
CREATE TABLE IF NOT EXISTS `homeroom` (
  `homeroomId` int(11) NOT NULL AUTO_INCREMENT,
  `homeroom` text,
  PRIMARY KEY (`homeroomId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Homeroom for Teacher and Student';

-- Dumping data for table cip_db.homeroom: ~5 rows (approximately)
/*!40000 ALTER TABLE `homeroom` DISABLE KEYS */;
INSERT INTO `homeroom` (`homeroomId`, `homeroom`) VALUES
	(1, '10H5'),
	(2, '10H1'),
	(3, '10H2'),
	(4, '10H3'),
	(5, '10H4');
/*!40000 ALTER TABLE `homeroom` ENABLE KEYS */;

-- Dumping structure for view cip_db.homeroomsummaryvw
DROP VIEW IF EXISTS `homeroomsummaryvw`;
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
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `studentid` int(11) NOT NULL AUTO_INCREMENT,
  `StudentFirstName` varchar(50) NOT NULL,
  `StudentPreferredName` varchar(50) NOT NULL,
  `StudentLastName` varchar(50) NOT NULL,
  `UserId` text NOT NULL COMMENT 'School Allocated User ID',
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='Student records - links to a Userid';

-- Dumping data for table cip_db.student: ~32 rows (approximately)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`studentid`, `StudentFirstName`, `StudentPreferredName`, `StudentLastName`, `UserId`) VALUES
	(132, 'Samuel', '', 'Ashman', 'ASHM01'),
	(133, 'Luca', '', 'Cavaleri', 'CAVA10'),
	(134, 'Michael', '', 'Chan', 'CHAN48'),
	(135, 'Benjamin', '', 'Chua', 'CHUA01'),
	(136, 'Thomas', '', 'Cooper', 'COOP09'),
	(137, 'Jamie', '', 'Corcoran', 'CORC03'),
	(138, 'Reuben', '', 'Cuasay', 'CUAS03'),
	(139, 'Zachary', '', 'Davidson', 'DAVI31'),
	(140, 'Daniel', '', 'Drake', 'DRAK05'),
	(141, 'Angelo', '', 'Fernando', 'FERN21'),
	(142, 'Jake', '', 'Forbes', 'FORB02'),
	(143, 'Joshua', '', 'Gomez', 'GOME05'),
	(144, 'Thomas', '', 'Hanley', 'HANL11'),
	(145, 'Max', '', 'Harmata', 'HARM08'),
	(146, 'Tom', '', 'Hopkins', 'HOPK06'),
	(147, 'James', '', 'Hunt', 'HUNT17'),
	(148, 'David', '', 'Jelovic', 'JELO05'),
	(149, 'Ashley', '', 'Johnson', 'JOHN50'),
	(150, 'Bailey', '', 'Kee', 'KEE18'),
	(151, 'Connor', '', 'Lo', 'LO111'),
	(152, 'Jared', '', 'Lohtaja', 'LOHT03'),
	(153, 'Aidan', '', 'Lonsdale', 'LONS03'),
	(154, 'Liam', '', 'Masters', 'MAST10'),
	(155, 'Nicholas', '', 'Moutevelis', 'MOUT01'),
	(156, 'Manav', '', 'Purohit', 'PURO05'),
	(157, 'Xavier', '', 'Rogers', 'ROGE04'),
	(158, 'James', '', 'Shahen', 'SHAH25'),
	(159, 'Oliver', '', 'Stephenson', 'STEP11'),
	(160, 'Kevork', '', 'Tatarian', 'TATA02'),
	(161, 'William', '', 'Thomson', 'THOM29'),
	(162, 'Thomas', '', 'Van Dijk', 'VAND15'),
	(163, 'Joshua', '', 'Virtue', 'VIRT05');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- Dumping structure for table cip_db.studentimport
DROP TABLE IF EXISTS `studentimport`;
CREATE TABLE IF NOT EXISTS `studentimport` (
  `userId` varchar(10) NOT NULL,
  `studentFirstName` text NOT NULL,
  `studentPreferredName` text,
  `studentLastName` text NOT NULL,
  `homeroom` text NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table cip_db.studentimport: 160 rows
/*!40000 ALTER TABLE `studentimport` DISABLE KEYS */;
INSERT INTO `studentimport` (`userId`, `studentFirstName`, `studentPreferredName`, `studentLastName`, `homeroom`) VALUES
	('DAVI31', 'Zachary', 'Davidson', '', '10H5'),
	('SMIT56', 'Cameron', 'Smith', '', '10H4'),
	('KERL07', 'Riley', 'Kerlin', '', '10H4'),
	('BALD03', 'James', 'Baldock', '', '10H2'),
	('LONS03', 'Aidan', 'Lonsdale', '', '10H5'),
	('BEND05', 'Christopher', 'Bendall', '', '10H2'),
	('PETI04', 'Luke', 'Petitto', '', '10H1'),
	('POWE13', 'Bradley', 'Power', '', '10H3'),
	('POWE14', 'James', 'Power', '', '10H4'),
	('GILE04', 'Benjamin ', 'Giles', 'Ben', '10H2'),
	('LO111', 'Conor', 'Lo', '', '10H5'),
	('OCAR03', 'Xavier', 'O&rsquo;Carroll', '', '10H2'),
	('HANN14', 'Alexander', 'Hannam', '', '10H1'),
	('HAMI10', 'Charlie', 'Hamill', '', '10H3'),
	('COOP09', 'Thomas', 'Cooper', 'Tom', '10H5'),
	('FUNG10', 'Fergal', 'Fung', '', '10H3'),
	('JACK16', 'Charlie', 'Jackson', '', '10H1'),
	('THIR02', 'David', 'Thirugnanaraj', '', '10H3'),
	('BRAD19', 'Frederick', 'Braddock', '', '10H1'),
	('ROBS12', 'Oliver', 'Robson', '', '10H3'),
	('ZALI03', 'Chris', 'Zalidas', '', '10H1'),
	('STEP11', 'Oliver', 'Stephenson', 'Oli', '10H5'),
	('LOHT03', 'Jared', 'Lohtaja', '', '10H5'),
	('WONGJ01', 'Joshua', 'Wong', '', '10H3'),
	('BYRN12', 'Nathan', 'Byrne', '', '10H2'),
	('RYAN26', 'Connor', 'Ryan', '', '10H4'),
	('VOLJ01', 'Adrian', 'Voljak', '', '10H2'),
	('ANST13', 'Emerson', 'Ansted', '', '10H4'),
	('BIEF01', 'Nicholas', 'Biefeld', '', '10H1'),
	('BILI04', 'Jordan', 'Bilic', '', '10H4'),
	('BONS01', 'Jordan', 'Bonserio', '', '10H1'),
	('BRAG07', 'Cameron', 'Bragg', '', '10H4'),
	('BOND05', 'Adrian', 'Bond', '', '10H1'),
	('BRAN11', 'Matthew', 'Brannan', '', '10H3'),
	('CAVA10', 'Luca', 'Cavaleri', '', '10H5'),
	('CAVA13', 'Michael', 'Cavaleri', '', '10H1'),
	('CHAN48', 'Michael', 'Chan', '', '10H5'),
	('CHAN51', 'Joel ', 'Chand', '', '10H2'),
	('CHAN54', 'Liam', 'Chang', '', '10H4'),
	('CHIU05', 'Jaden', 'Chiu', '', '10H2'),
	('CHUA01', 'Benjamin', 'Chua', '', '10H5'),
	('COLG05', 'Joseph', 'Colgan', 'Joe', '10H3'),
	('COOP08', 'Benjamin', 'Cooper', 'Ben', '10H4'),
	('COUL05', 'Geordan', 'Coulits', '', '10H1'),
	('CRAW01', 'Jack', 'Crawley', '', '10H1'),
	('CUMM12', 'Thomas', 'Cummins', 'Tom', '10H4'),
	('DANI03', 'Douglas', 'Daniels', '', '10H3'),
	('DIXO06', 'Joshua', 'Dixon', '', '10H1'),
	('FELI01', 'Matthew', 'Felice', 'Matt', '10H2'),
	('FERG07', 'Benjamin', 'Ferguson', 'Ben', '10H3'),
	('FITZ23', 'Callum', 'Fitzgibbon', '', '10H3'),
	('FITZ25', 'Oliver', 'Fitzroy', '', '10H4'),
	('GARM01', 'William', 'Garment', 'Will', '10H3'),
	('GLAS01', 'Jacob', 'Glass', 'Jake', '10H2'),
	('GOAD02', 'Jacob', 'Goad', '', '10H2'),
	('GUER16', 'Christopher', 'Guerrera', '', '10H3'),
	('GOME05', 'Joshua', 'Gomez', '', '10H5'),
	('HANL11', 'Thomas', 'Hanley', '', '10H5'),
	('HARG06', 'Maxwell', 'Hargreaves', '', '10H4'),
	('HARM08', 'Max ', 'Harmata', 'Max', '10H5'),
	('HART11', 'Alexander', 'Hart', 'Alex', '10H3'),
	('HAYE05', 'Mitchell', 'Hayes', '', '10H1'),
	('HETT06', 'Jack', 'Hettler', '', '10H1'),
	('HOPK06', 'Thomas', 'Hopkins', 'Tom', '10H5'),
	('HOOL01', 'Blake', 'Hoolahan', '', '10H1'),
	('HUGH07', 'Cian', 'Hughes', '', '10H3'),
	('HUNT17', 'James', 'Hunt', '', '10H5'),
	('IGNA05', 'Adam', 'Ignatius', '', '10H2'),
	('JACO07', 'Reuben', 'Jacobson', '', '10H4'),
	('JELO05', 'David', 'Jelovic', '', '10H5'),
	('JOHN50', 'Ashley', 'Johnson', '', '10H5'),
	('JONE18', 'Joshua', 'Jones', 'Josh', '10H2'),
	('KACH01', 'Matthew', 'Kachel', '', '10H2'),
	('KAFE05', 'Benjamin', 'Kafer', 'Ben', '10H3'),
	('KENN08', 'Riley', 'Kennedy', '', '10H3'),
	('KENN11', 'Thomas', 'Kennedy', 'Tom', '10H4'),
	('KINN02', 'Liam', 'Kinna', '', '10H2'),
	('KRIZ01', 'Luka', 'Krizan', '', '10H4'),
	('LAHO9', 'Victor', 'Lahoud', '', '10H1'),
	('LYNC05', 'Ciaran', 'Lynch', '', '10H1'),
	('MAKA01', 'Lucas', 'Makarewicz', '', '10H2'),
	('MARI05', 'Ben', 'Marino', '', '10H1'),
	('MARS07', 'Max', 'Marshall', '', '10H2'),
	('MAST10', 'Liam', 'Masters', '', '10H5'),
	('MATT12', 'Liam', 'Mattera', '', '10H3'),
	('MILE04', 'Lachlan', 'Miles', '', '10H1'),
	('MILE07', 'Thomas', 'Miles', '', '10H4'),
	('MOOR19', 'Patrick', 'Moore', '', '10H4'),
	('MOON05', 'Benjamin', 'Mooney', 'Ben', '10H3'),
	('MOUT01', 'Nicholas', 'Moutevelis', '', '10H5'),
	('NORT03', 'Matthew', 'North', '', '10H2'),
	('OEY05', 'Alexander', 'Oey', '', '10H1'),
	('ONSL9', 'Lachlan', 'Onslow', '', '10H1'),
	('OVER01', 'Joshua', 'Overton', '', '10H3'),
	('PANE12', 'Damon', 'Panetta', '', '10H2'),
	('PAVE01', 'Samuel', 'Pavely', 'Sam', '10H3'),
	('PRIN07', 'Mitchell', 'Princi', '', '10H3'),
	('PRIO02', 'Talis', 'Prior', '', '10H1'),
	('PURO05', 'Manav', 'Purohit', '', '10H5'),
	('RAMS04', 'Alec', 'Ramsbottom', '', '10H3'),
	('REGA01', 'James', 'Regan', '', '10H1'),
	('ROCK01', 'Ethan', 'Rockett', '', '10H4'),
	('SCAI05', 'James', 'Scaiff', '', '10H2'),
	('SIMP12', 'Cole', 'Simpson', '', '10H2'),
	('THOM29', 'William', 'Thomson', '', '10H5'),
	('VIRT05', 'Joshua', 'Virtue', '', '10H5'),
	('VITA01', 'Matthew', 'Vitagliani', '', '10H4'),
	('WILK07', 'Max', 'Wilkins', '', '10H3'),
	('WILL38', 'Reece', 'Williams', '', '10H4'),
	('WUNS01', 'Thomas', 'Wunsch', '', '10H2'),
	('WYLI08', 'William', 'Wylie', '', '10H1'),
	('ONEI9', 'Callum', 'O&rsquo;Neill', '', '10H3'),
	('AREN07', 'Natale', 'Arena', 'Nate', '10H4'),
	('FERN21', 'Warnakulasuriya', 'Fernando', 'Angelo', '10H5'),
	('STAN06', 'William', 'Stanley', '', '10H2'),
	('FITZ28', 'Frank', 'Fitzsimons', '', '10H2'),
	('ASHM01', 'Samuel', 'Ashman', 'Sam', '10H5'),
	('BELL08', 'James', 'Bellenger', '', '10H4'),
	('BYRN16', 'James', 'Byrnes', '', '10H4'),
	('CORC03', 'Jamie', 'Corcoran', '', '10H5'),
	('CUAS03', 'Reuben', 'Cuasay', '', '10H5'),
	('DOBL03', 'Jaime', 'Dobles', '', '10H4'),
	('FORB02', 'Jake', 'Forbes', '', '10H5'),
	('JUNG02', ' Tristan Woosung', 'Jung', 'Tristan', '10H3'),
	('KEE18', 'Bailey', 'Kee', '', '10H5'),
	('KEIR01', 'Cameron', 'Keir', '', '10H1'),
	('CHRI10', 'Benjamin', 'Christensen', '', '10H4'),
	('CLEA07', 'Austin', 'Cleary', '', '10H2'),
	('LORK05', 'Aidan', 'Lorking', '', '10H1'),
	('MASS07', 'Luke', 'Massa', '', '10H1'),
	('MCKE30', 'Matthew', 'McKenzie', '', '10H2'),
	('MICH06', 'Sebastian', 'Michaeil', '', '10H1'),
	('ROGE04', 'Xavier', 'Rogers', '', '10H5'),
	('ROWE02', 'Harry', 'Rowe', '', '10H4'),
	('KIM13', 'Andrew', 'Kim', '', '10H1'),
	('TUER08', 'Adrian', 'Tuersley', '', '10H3'),
	('URRI01', 'Jack', 'Urriste', '', '10H3'),
	('MOON06', 'David', 'Mooney', '', '10H2'),
	('PANO03', 'Dominic', 'Panozzo', 'Dom', '10H2'),
	('WALL12', 'Marcus', 'Wall', '', '10H3'),
	('WARD23', 'Nicholas', 'Ward', '', '10H4'),
	('WATT19', 'Matthew', 'Watts', '', '10H4'),
	('SELL07', 'Luca', 'Sella', '', '10H4'),
	('TATA02', 'Kevork', 'Tatarian', 'Kevo', '10H5'),
	('DRAK05', 'Daniel', 'Drake', '', '10H5'),
	('HASS08', 'Alexander', 'Hassan', '', '10H3'),
	('BOUS07', 'Christian', 'Boustani', '', '10H4'),
	('POZZ10', 'Christian', 'Pozzolungo', '', '10H1'),
	('REC10', 'Zachary', 'Rec', 'Zac', '10H1'),
	('VAND15', 'Thomas', 'Van Dijk', '', '10H5'),
	('CARP07', 'Adam', 'Carpenter', '', '10H3'),
	('TANF01', 'Monte', 'Tanfield ', '', '10H3'),
	('MIDI01', 'Lee', 'Midis', '', '10H2'),
	('ZAAR01', 'Levi', 'Zaarour', '', '10H4'),
	('BART05', 'Evan', 'Barton', '', '10H2'),
	('ABNO04', 'Daniel', 'Abnous', '', '10H1'),
	('MERC01', 'Zachary ', 'Mercer', '', '10H4'),
	('SHAH25', 'James', 'Shahen', '', '10H5'),
	('LUSH01', 'Ethan', 'Lush', '', '10H2'),
	('', '', '', '', '');
/*!40000 ALTER TABLE `studentimport` ENABLE KEYS */;

-- Dumping structure for table cip_db.studentyearprovider
DROP TABLE IF EXISTS `studentyearprovider`;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='Student Hours';

-- Dumping data for table cip_db.studentyearprovider: ~18 rows (approximately)
/*!40000 ALTER TABLE `studentyearprovider` DISABLE KEYS */;
INSERT INTO `studentyearprovider` (`studentYearProviderId`, `providerId`, `yearstudentId`, `cipHours`, `venueFormFlag`, `logBookFlag`, `comments`) VALUES
	(11, 12, 3, 0, 0, 0, ''),
	(12, 17, 4, 7, 1, 0, NULL),
	(13, 3, 6, 3, 0, 0, NULL),
	(14, 13, 7, 36, 1, 1, NULL),
	(15, 1, 9, 7, 0, 0, NULL),
	(16, 1, 12, 16, 1, 0, NULL),
	(17, 15, 14, 4, 0, 0, ''),
	(18, 1, 14, 12, 0, 0, 'b'),
	(19, 1, 17, 7, 1, 0, NULL),
	(20, 15, 19, 5, 0, 0, ''),
	(21, 18, 19, 6, 0, 0, ''),
	(22, 19, 20, 0, 0, 0, NULL),
	(25, 14, 25, 0, 1, 0, NULL),
	(26, 20, 8, 13, 0, 0, NULL),
	(27, 20, 15, 2, 0, 0, NULL),
	(28, 15, 33, 2, 0, 1, ''),
	(29, 21, 33, 9, 1, 0, ''),
	(30, 22, 31, 0, 0, 0, NULL);
/*!40000 ALTER TABLE `studentyearprovider` ENABLE KEYS */;

-- Dumping structure for view cip_db.teacherdetailsvw
DROP VIEW IF EXISTS `teacherdetailsvw`;
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
DROP TABLE IF EXISTS `teacherhomeroom`;
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
DROP TABLE IF EXISTS `userrole`;
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
DROP TABLE IF EXISTS `users`;
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
DROP TABLE IF EXISTS `yearstudents`;
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
DROP VIEW IF EXISTS `homeroomsummaryvw`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `homeroomsummaryvw`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `homeroomsummaryvw` AS select `td`.`UserID` AS `userID`,`td`.`homeroomId` AS `homeroomId`,`td`.`homeroom` AS `homeroom`,`td`.`yearId` AS `yearId`,`td`.`YEAR` AS `YEAR`,`ys`.`yearstudentId` AS `yearstudentId`,`s`.`studentid` AS `studentId`,`s`.`StudentFirstName` AS `StudentFirstName`,`s`.`StudentLastName` AS `StudentLastName`,`s`.`UserId` AS `studentUserId`,`syp`.`studentYearProviderId` AS `studentYearProviderId`,`p`.`providerId` AS `providerId`,`p`.`providerName` AS `providerName`,`p`.`location` AS `location`,`syp`.`cipHours` AS `cipHours`,`syp`.`venueFormFlag` AS `venueFormFlag`,`syp`.`logBookFlag` AS `logBookFlag` from ((((`teacherdetailsvw` `td` join `yearstudents` `ys`) join `student` `s`) join `studentyearprovider` `syp`) join `cip_provider` `p`) where ((`ys`.`studentid` = `s`.`studentid`) and (`ys`.`homeroomid` = `td`.`homeroomId`) and (`ys`.`yearid` = `td`.`yearId`) and (`syp`.`yearstudentId` = `ys`.`yearstudentId`) and (`syp`.`providerId` = `p`.`providerId`)) order by `td`.`UserID`,`s`.`StudentLastName`,`s`.`StudentFirstName`,`p`.`providerName`,`p`.`location`;

-- Dumping structure for view cip_db.teacherdetailsvw
DROP VIEW IF EXISTS `teacherdetailsvw`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `teacherdetailsvw`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `teacherdetailsvw` AS select `u`.`UserID` AS `UserID`,`u`.`UserName` AS `UserName`,`u`.`Password` AS `PASSWORD`,`u`.`FirstName` AS `FirstName`,`u`.`LastName` AS `LastName`,`h`.`homeroomId` AS `homeroomId`,`h`.`homeroom` AS `homeroom`,`y`.`yearId` AS `yearId`,`y`.`year` AS `YEAR` from (((`users` `u` join `teacherhomeroom` `th`) join `cip_year` `y`) join `homeroom` `h`) where ((`u`.`UserID` = `th`.`userId`) and (`y`.`year` = convert(date_format(curdate(),'%Y') using utf8)) and (`th`.`yearId` = `y`.`yearId`) and (`h`.`homeroomId` = `th`.`homeroomId`));

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
