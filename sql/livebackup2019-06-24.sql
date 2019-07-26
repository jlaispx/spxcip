-- --------------------------------------------------------
-- Host:                         172.16.2.214
-- Server version:               5.5.38 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5606
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table cip_db.achievements
DROP TABLE IF EXISTS `achievements`;
CREATE TABLE IF NOT EXISTS `achievements` (
  `achievementsId` int(11) NOT NULL AUTO_INCREMENT,
  `achievementTypeId` int(11) DEFAULT '0',
  `yearStudentId` int(11) DEFAULT '0',
  `achievementDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`achievementsId`),
  KEY `FK_achievements_achievementtype` (`achievementTypeId`),
  KEY `FK_achievements_yearstudents` (`yearStudentId`),
  CONSTRAINT `FK_achievements_achievementtype` FOREIGN KEY (`achievementTypeId`) REFERENCES `achievementtype` (`achievementTypeId`),
  CONSTRAINT `FK_achievements_yearstudents` FOREIGN KEY (`yearStudentId`) REFERENCES `yearstudents` (`yearstudentId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='Activities and awards students receive for this Homeroom this year.';

-- Dumping data for table cip_db.achievements: ~41 rows (approximately)
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` (`achievementsId`, `achievementTypeId`, `yearStudentId`, `achievementDescription`) VALUES
	(1, 1, 3, '16\'s NSTA Tennis Team'),
	(2, 2, 4, 'Blue Fide et Labore in Religious Education and PDHPE'),
	(3, 1, 4, '15C Basketball Team'),
	(4, 1, 4, 'Boxercise'),
	(5, 2, 5, 'Silver Fide et Labore in Commerce'),
	(6, 1, 5, '15\'s NSTA Tennis Team'),
	(8, 2, 6, 'Blue Fide et Labore in Information and Software Technology and PDHPE'),
	(9, 1, 6, '15E Basketball Team'),
	(10, 2, 7, 'Blue Fide et Labore in Industrial Technology Timber and Science'),
	(11, 1, 7, '16\'s Rugby Team'),
	(12, 1, 7, 'Boxercise'),
	(13, 2, 8, 'Blue Fide et Labore in Mathematics, Science and Religious Education'),
	(14, 1, 8, '15C Basketball Team'),
	(15, 2, 9, 'Silver Fide et Labore in Mathematics'),
	(16, 1, 9, 'Division 4 ISA Tennis Team'),
	(17, 2, 10, 'Blue Fide et Labore in Physical Activity and Sports Studies'),
	(18, 1, 10, '15B Basketball Team'),
	(19, 1, 10, 'Cross Country Team'),
	(20, 1, 10, '16s Rugby Team'),
	(21, 1, 12, 'Intermediate String Ensemble'),
	(22, 1, 12, 'Senior Guitar Ensemble'),
	(23, 1, 12, 'Senior String Ensemble'),
	(24, 1, 12, 'College Orchestra'),
	(25, 1, 12, 'Debating'),
	(26, 1, 12, 'Robotics'),
	(27, 2, 12, 'Gold Fide et Labore in Commerce, English, Information and Software Technology and Mathematics'),
	(28, 2, 12, 'Silver Fide et Labore in Religious Education'),
	(29, 1, 14, 'Intermediate Concert Band'),
	(30, 1, 14, '15F Basketball Team'),
	(31, 1, 14, 'Debating'),
	(32, 1, 14, 'Boxercise'),
	(33, 2, 14, 'Blue Fide et Labore in Chinese and iStem'),
	(34, 2, 15, 'Gold Fide et Labore in Mathematics'),
	(35, 1, 16, '15A Basketball Team'),
	(36, 2, 17, 'Silver Fide et Labore in Chinese'),
	(37, 1, 3, 'the Duke of Edinburgh Hike for the Silver Award'),
	(38, 1, 17, '15B Football Team'),
	(39, 1, 16, '15\'s Football Team'),
	(40, 1, 15, '15\'s Basketball Team'),
	(41, 1, 18, '16B Football Team'),
	(42, 1, 18, 'Athletics Team');
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;

-- Dumping structure for table cip_db.achievementtype
DROP TABLE IF EXISTS `achievementtype`;
CREATE TABLE IF NOT EXISTS `achievementtype` (
  `achievementTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `achievementTypeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`achievementTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table cip_db.achievementtype: ~2 rows (approximately)
/*!40000 ALTER TABLE `achievementtype` DISABLE KEYS */;
INSERT INTO `achievementtype` (`achievementTypeId`, `achievementTypeName`) VALUES
	(1, 'co-curricular'),
	(2, 'award');
/*!40000 ALTER TABLE `achievementtype` ENABLE KEYS */;

-- Dumping structure for table cip_db.cip_provider
DROP TABLE IF EXISTS `cip_provider`;
CREATE TABLE IF NOT EXISTS `cip_provider` (
  `providerId` int(11) NOT NULL AUTO_INCREMENT,
  `providerName` varchar(100) NOT NULL COMMENT 'Provider Name - e.g. St Vincent De Paul',
  `location` varchar(50) DEFAULT NULL COMMENT 'Location of provider - e.g. Chatswood',
  PRIMARY KEY (`providerId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='common list of providers - maintainable by admin';

-- Dumping data for table cip_db.cip_provider: ~27 rows (approximately)
/*!40000 ALTER TABLE `cip_provider` DISABLE KEYS */;
INSERT INTO `cip_provider` (`providerId`, `providerName`, `location`) VALUES
	(1, 'St Vincent De Paul', 'Chatswood'),
	(2, 'Meals On Wheels', 'Sydney'),
	(3, 'Matthew Talbot Hostel', 'Sydney'),
	(4, 'Willowood Nursing Home', 'St Pius X'),
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
	(26, 'Salvation Army', 'Chatswood'),
	(27, 'Reading Programme', 'St Pius X'),
	(28, 'Tigers Rugby League', 'Lane Cove'),
	(29, 'Walgett Trip', 'St Pius X'),
	(30, 'Lifeline Shop', 'Naremburn'),
	(31, 'Willoughby Council - Vacation Childcare', ''),
	(32, 'Red Shield Appeal', ''),
	(33, 'Food Bank NSW', 'Glendinning');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Homeroom for Teacher and Student';

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

-- Dumping structure for table cip_db.pastoraladjectives
DROP TABLE IF EXISTS `pastoraladjectives`;
CREATE TABLE IF NOT EXISTS `pastoraladjectives` (
  `pastoralAdjectivesId` int(11) NOT NULL AUTO_INCREMENT,
  `pastoralAdjective` text CHARACTER SET utf8,
  PRIMARY KEY (`pastoralAdjectivesId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf32;

-- Dumping data for table cip_db.pastoraladjectives: ~13 rows (approximately)
/*!40000 ALTER TABLE `pastoraladjectives` DISABLE KEYS */;
INSERT INTO `pastoraladjectives` (`pastoralAdjectivesId`, `pastoralAdjective`) VALUES
	(1, 'polite'),
	(2, 'well-mannered'),
	(3, 'considerate'),
	(4, 'courteous'),
	(5, 'responsible'),
	(6, 'co-operative'),
	(7, 'friendly'),
	(8, 'helpful'),
	(9, 'respectful'),
	(10, 'quiet'),
	(11, 'amiable'),
	(12, 'mature'),
	(13, 'pleasant');
/*!40000 ALTER TABLE `pastoraladjectives` ENABLE KEYS */;

-- Dumping structure for table cip_db.student
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `studentid` int(11) NOT NULL AUTO_INCREMENT,
  `StudentFirstName` varchar(50) NOT NULL,
  `StudentPreferredName` varchar(50) NOT NULL,
  `StudentLastName` varchar(50) NOT NULL,
  `UserId` text NOT NULL COMMENT 'School Allocated User ID',
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8 COMMENT='Student records - links to a Userid';

-- Dumping data for table cip_db.student: ~159 rows (approximately)
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
	(163, 'Joshua', '', 'Virtue', 'VIRT05'),
	(164, 'Daniel', '', 'Abnous', 'ABNO04'),
	(165, 'Nicholas', '', 'Biefeld', 'BIEF01'),
	(166, 'Adrian', '', 'Bond', 'BOND05'),
	(167, 'Jordan', '', 'Bonserio', 'BONS01'),
	(168, 'Frederick', '', 'Braddock', 'BRAD19'),
	(169, 'Michael', '', 'Cavaleri', 'CAVA13'),
	(170, 'Geordan', '', 'Coulits', 'COUL05'),
	(171, 'Jack', '', 'Crawley', 'CRAW01'),
	(172, 'Joshua', '', 'Dixon', 'DIXO06'),
	(173, 'Alexander', '', 'Hannam', 'HANN14'),
	(174, 'Mitchell', '', 'Hayes', 'HAYE05'),
	(175, 'Jack', '', 'Hettler', 'HETT06'),
	(176, 'Blake', '', 'Hoolahan', 'HOOL01'),
	(177, 'Charlie', '', 'Jackson', 'JACK16'),
	(178, 'Cameron', '', 'Keir', 'KEIR01'),
	(179, 'Andrew', '', 'Kim', 'KIM13'),
	(180, 'Victor', '', 'Lahoud', 'LAHO9'),
	(181, 'Aidan', '', 'Lorking', 'LORK05'),
	(182, 'Ciaran', '', 'Lynch', 'LYNC05'),
	(183, 'Ben', '', 'Marino', 'MARI05'),
	(184, 'Luke', '', 'Massa', 'MASS07'),
	(185, 'Sebastian', '', 'Michaeil', 'MICH06'),
	(186, 'Lachlan', '', 'Miles', 'MILE04'),
	(187, 'Alexander', '', 'Oey', 'OEY05'),
	(188, 'Lachlan', '', 'Onslow', 'ONSL9'),
	(189, 'Luke', '', 'Petitto', 'PETI04'),
	(190, 'Christian', '', 'Pozzolungo', 'POZZ10'),
	(191, 'Talis', '', 'Prior', 'PRIO02'),
	(192, 'Zachary', 'Zac', 'Rec', 'REC10'),
	(193, 'James', '', 'Regan', 'REGA01'),
	(194, 'William', '', 'Wylie', 'WYLI08'),
	(195, 'Chris', '', 'Zalidas', 'ZALI03'),
	(196, 'James', '', 'Baldock', 'BALD03'),
	(197, 'Evan', '', 'Barton', 'BART05'),
	(198, 'Christopher', '', 'Bendall', 'BEND05'),
	(199, 'Nathan', '', 'Byrne', 'BYRN12'),
	(200, 'Joel ', '', 'Chand', 'CHAN51'),
	(201, 'Jaden', '', 'Chiu', 'CHIU05'),
	(202, 'Austin', '', 'Cleary', 'CLEA07'),
	(203, 'Matthew', 'Matt', 'Felice', 'FELI01'),
	(204, 'Frank', '', 'Fitzsimons', 'FITZ28'),
	(205, 'Benjamin ', 'Ben', 'Giles', 'GILE04'),
	(206, 'Jacob', 'Jake', 'Glass', 'GLAS01'),
	(207, 'Jacob', '', 'Goad', 'GOAD02'),
	(208, 'Adam', '', 'Ignatius', 'IGNA05'),
	(209, 'Joshua', 'Josh', 'Jones', 'JONE18'),
	(210, 'Matthew', '', 'Kachel', 'KACH01'),
	(211, 'Liam', '', 'Kinna', 'KINN02'),
	(212, 'Ethan', '', 'Lush', 'LUSH01'),
	(213, 'Lucas', '', 'Makarewicz', 'MAKA01'),
	(214, 'Max', '', 'Marshall', 'MARS07'),
	(215, 'Matthew', '', 'McKenzie', 'MCKE30'),
	(216, 'Lee', '', 'Midis', 'MIDI01'),
	(217, 'David', '', 'Mooney', 'MOON06'),
	(218, 'Matthew', '', 'North', 'NORT03'),
	(219, 'Xavier', '', 'O&rsquo;Carroll', 'OCAR03'),
	(220, 'Damon', '', 'Panetta', 'PANE12'),
	(221, 'Dominic', 'Dom', 'Panozzo', 'PANO03'),
	(222, 'James', '', 'Scaiff', 'SCAI05'),
	(223, 'Cole', '', 'Simpson', 'SIMP12'),
	(224, 'William', '', 'Stanley', 'STAN06'),
	(225, 'Adrian', '', 'Voljak', 'VOLJ01'),
	(226, 'Thomas', '', 'Wunsch', 'WUNS01'),
	(227, 'Matthew', '', 'Brannan', 'BRAN11'),
	(228, 'Adam', '', 'Carpenter', 'CARP07'),
	(229, 'Joseph', 'Joe', 'Colgan', 'COLG05'),
	(230, 'Douglas', '', 'Daniels', 'DANI03'),
	(231, 'Benjamin', 'Ben', 'Ferguson', 'FERG07'),
	(232, 'Callum', '', 'Fitzgibbon', 'FITZ23'),
	(233, 'Fergal', '', 'Fung', 'FUNG10'),
	(234, 'William', 'Will', 'Garment', 'GARM01'),
	(235, 'Christopher', '', 'Guerrera', 'GUER16'),
	(236, 'Charlie', '', 'Hamill', 'HAMI10'),
	(237, 'Alexander', 'Alex', 'Hart', 'HART11'),
	(238, 'Alexander', '', 'Hassan', 'HASS08'),
	(239, 'Cian', '', 'Hughes', 'HUGH07'),
	(240, ' Tristan Woosung', 'Tristan', 'Jung', 'JUNG02'),
	(241, 'Benjamin', 'Ben', 'Kafer', 'KAFE05'),
	(242, 'Riley', '', 'Kennedy', 'KENN08'),
	(243, 'Liam', '', 'Mattera', 'MATT12'),
	(244, 'Benjamin', 'Ben', 'Mooney', 'MOON05'),
	(245, 'Callum', '', 'O&rsquo;Neill', 'ONEI9'),
	(246, 'Joshua', '', 'Overton', 'OVER01'),
	(247, 'Samuel', 'Sam', 'Pavely', 'PAVE01'),
	(248, 'Bradley', '', 'Power', 'POWE13'),
	(249, 'Mitchell', '', 'Princi', 'PRIN07'),
	(250, 'Alec', '', 'Ramsbottom', 'RAMS04'),
	(251, 'Oliver', '', 'Robson', 'ROBS12'),
	(252, 'Monte', '', 'Tanfield ', 'TANF01'),
	(253, 'David', '', 'Thirugnanaraj', 'THIR02'),
	(254, 'Adrian', '', 'Tuersley', 'TUER08'),
	(255, 'Jack', '', 'Urriste', 'URRI01'),
	(256, 'Marcus', '', 'Wall', 'WALL12'),
	(257, 'Max', '', 'Wilkins', 'WILK07'),
	(258, 'Joshua', '', 'Wong', 'WONGJ01'),
	(259, 'Emerson', '', 'Ansted', 'ANST13'),
	(260, 'Natale', 'Nate', 'Arena', 'AREN07'),
	(261, 'James', '', 'Bellenger', 'BELL08'),
	(262, 'Jordan', '', 'Bilic', 'BILI04'),
	(263, 'Christian', '', 'Boustani', 'BOUS07'),
	(264, 'Cameron', '', 'Bragg', 'BRAG07'),
	(265, 'James', '', 'Byrnes', 'BYRN16'),
	(266, 'Liam', '', 'Chang', 'CHAN54'),
	(267, 'Benjamin', '', 'Christensen', 'CHRI10'),
	(268, 'Benjamin', 'Ben', 'Cooper', 'COOP08'),
	(269, 'Thomas', 'Tom', 'Cummins', 'CUMM12'),
	(270, 'Jaime', '', 'Dobles', 'DOBL03'),
	(271, 'Oliver', '', 'Fitzroy', 'FITZ25'),
	(272, 'Maxwell', '', 'Hargreaves', 'HARG06'),
	(273, 'Reuben', '', 'Jacobson', 'JACO07'),
	(274, 'Thomas', 'Tom', 'Kennedy', 'KENN11'),
	(275, 'Riley', '', 'Kerlin', 'KERL07'),
	(276, 'Luka', '', 'Krizan', 'KRIZ01'),
	(277, 'Zachary ', '', 'Mercer', 'MERC01'),
	(278, 'Thomas', '', 'Miles', 'MILE07'),
	(279, 'Patrick', '', 'Moore', 'MOOR19'),
	(280, 'James', '', 'Power', 'POWE14'),
	(281, 'Ethan', '', 'Rockett', 'ROCK01'),
	(282, 'Harry', '', 'Rowe', 'ROWE02'),
	(283, 'Connor', '', 'Ryan', 'RYAN26'),
	(284, 'Luca', '', 'Sella', 'SELL07'),
	(285, 'Cameron', '', 'Smith', 'SMIT56'),
	(286, 'Matthew', '', 'Vitagliani', 'VITA01'),
	(287, 'Nicholas', '', 'Ward', 'WARD23'),
	(288, 'Matthew', '', 'Watts', 'WATT19'),
	(289, 'Reece', '', 'Williams', 'WILL38'),
	(290, 'Levi', '', 'Zaarour', 'ZAAR01');
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
	('DAVI31', 'Zachary', '', 'Davidson', '10H5'),
	('SMIT56', 'Cameron', '', 'Smith', '10H4'),
	('KERL07', 'Riley', '', 'Kerlin', '10H4'),
	('BALD03', 'James', '', 'Baldock', '10H2'),
	('LONS03', 'Aidan', '', 'Lonsdale', '10H5'),
	('BEND05', 'Christopher', '', 'Bendall', '10H2'),
	('PETI04', 'Luke', '', 'Petitto', '10H1'),
	('POWE13', 'Bradley', '', 'Power', '10H3'),
	('POWE14', 'James', '', 'Power', '10H4'),
	('GILE04', 'Benjamin ', 'Ben', 'Giles', '10H2'),
	('LO111', 'Conor', '', 'Lo', '10H5'),
	('OCAR03', 'Xavier', '', 'O&rsquo;Carroll', '10H2'),
	('HANN14', 'Alexander', '', 'Hannam', '10H1'),
	('HAMI10', 'Charlie', '', 'Hamill', '10H3'),
	('COOP09', 'Thomas', 'Tom', 'Cooper', '10H5'),
	('FUNG10', 'Fergal', '', 'Fung', '10H3'),
	('JACK16', 'Charlie', '', 'Jackson', '10H1'),
	('THIR02', 'David', '', 'Thirugnanaraj', '10H3'),
	('BRAD19', 'Frederick', '', 'Braddock', '10H1'),
	('ROBS12', 'Oliver', '', 'Robson', '10H3'),
	('ZALI03', 'Chris', '', 'Zalidas', '10H1'),
	('STEP11', 'Oliver', 'Oli', 'Stephenson', '10H5'),
	('LOHT03', 'Jared', '', 'Lohtaja', '10H5'),
	('WONGJ01', 'Joshua', '', 'Wong', '10H3'),
	('BYRN12', 'Nathan', '', 'Byrne', '10H2'),
	('RYAN26', 'Connor', '', 'Ryan', '10H4'),
	('VOLJ01', 'Adrian', '', 'Voljak', '10H2'),
	('ANST13', 'Emerson', '', 'Ansted', '10H4'),
	('BIEF01', 'Nicholas', '', 'Biefeld', '10H1'),
	('BILI04', 'Jordan', '', 'Bilic', '10H4'),
	('BONS01', 'Jordan', '', 'Bonserio', '10H1'),
	('BRAG07', 'Cameron', '', 'Bragg', '10H4'),
	('BOND05', 'Adrian', '', 'Bond', '10H1'),
	('BRAN11', 'Matthew', '', 'Brannan', '10H3'),
	('CAVA10', 'Luca', '', 'Cavaleri', '10H5'),
	('CAVA13', 'Michael', '', 'Cavaleri', '10H1'),
	('CHAN48', 'Michael', '', 'Chan', '10H5'),
	('CHAN51', 'Joel ', '', 'Chand', '10H2'),
	('CHAN54', 'Liam', '', 'Chang', '10H4'),
	('CHIU05', 'Jaden', '', 'Chiu', '10H2'),
	('CHUA01', 'Benjamin', '', 'Chua', '10H5'),
	('COLG05', 'Joseph', 'Joe', 'Colgan', '10H3'),
	('COOP08', 'Benjamin', 'Ben', 'Cooper', '10H4'),
	('COUL05', 'Geordan', '', 'Coulits', '10H1'),
	('CRAW01', 'Jack', '', 'Crawley', '10H1'),
	('CUMM12', 'Thomas', 'Tom', 'Cummins', '10H4'),
	('DANI03', 'Douglas', '', 'Daniels', '10H3'),
	('DIXO06', 'Joshua', '', 'Dixon', '10H1'),
	('FELI01', 'Matthew', 'Matt', 'Felice', '10H2'),
	('FERG07', 'Benjamin', 'Ben', 'Ferguson', '10H3'),
	('FITZ23', 'Callum', '', 'Fitzgibbon', '10H3'),
	('FITZ25', 'Oliver', '', 'Fitzroy', '10H4'),
	('GARM01', 'William', 'Will', 'Garment', '10H3'),
	('GLAS01', 'Jacob', 'Jake', 'Glass', '10H2'),
	('GOAD02', 'Jacob', '', 'Goad', '10H2'),
	('GUER16', 'Christopher', '', 'Guerrera', '10H3'),
	('GOME05', 'Joshua', '', 'Gomez', '10H5'),
	('HANL11', 'Thomas', '', 'Hanley', '10H5'),
	('HARG06', 'Maxwell', '', 'Hargreaves', '10H4'),
	('HARM08', 'Max ', 'Max', 'Harmata', '10H5'),
	('HART11', 'Alexander', 'Alex', 'Hart', '10H3'),
	('HAYE05', 'Mitchell', '', 'Hayes', '10H1'),
	('HETT06', 'Jack', '', 'Hettler', '10H1'),
	('HOPK06', 'Thomas', 'Tom', 'Hopkins', '10H5'),
	('HOOL01', 'Blake', '', 'Hoolahan', '10H1'),
	('HUGH07', 'Cian', '', 'Hughes', '10H3'),
	('HUNT17', 'James', '', 'Hunt', '10H5'),
	('IGNA05', 'Adam', '', 'Ignatius', '10H2'),
	('JACO07', 'Reuben', '', 'Jacobson', '10H4'),
	('JELO05', 'David', '', 'Jelovic', '10H5'),
	('JOHN50', 'Ashley', '', 'Johnson', '10H5'),
	('JONE18', 'Joshua', 'Josh', 'Jones', '10H2'),
	('KACH01', 'Matthew', '', 'Kachel', '10H2'),
	('KAFE05', 'Benjamin', 'Ben', 'Kafer', '10H3'),
	('KENN08', 'Riley', '', 'Kennedy', '10H3'),
	('KENN11', 'Thomas', 'Tom', 'Kennedy', '10H4'),
	('KINN02', 'Liam', '', 'Kinna', '10H2'),
	('KRIZ01', 'Luka', '', 'Krizan', '10H4'),
	('LAHO9', 'Victor', '', 'Lahoud', '10H1'),
	('LYNC05', 'Ciaran', '', 'Lynch', '10H1'),
	('MAKA01', 'Lucas', '', 'Makarewicz', '10H2'),
	('MARI05', 'Ben', '', 'Marino', '10H1'),
	('MARS07', 'Max', '', 'Marshall', '10H2'),
	('MAST10', 'Liam', '', 'Masters', '10H5'),
	('MATT12', 'Liam', '', 'Mattera', '10H3'),
	('MILE04', 'Lachlan', '', 'Miles', '10H1'),
	('MILE07', 'Thomas', '', 'Miles', '10H4'),
	('MOOR19', 'Patrick', '', 'Moore', '10H4'),
	('MOON05', 'Benjamin', 'Ben', 'Mooney', '10H3'),
	('MOUT01', 'Nicholas', '', 'Moutevelis', '10H5'),
	('NORT03', 'Matthew', '', 'North', '10H2'),
	('OEY05', 'Alexander', '', 'Oey', '10H1'),
	('ONSL9', 'Lachlan', '', 'Onslow', '10H1'),
	('OVER01', 'Joshua', '', 'Overton', '10H3'),
	('PANE12', 'Damon', '', 'Panetta', '10H2'),
	('PAVE01', 'Samuel', 'Sam', 'Pavely', '10H3'),
	('PRIN07', 'Mitchell', '', 'Princi', '10H3'),
	('PRIO02', 'Talis', '', 'Prior', '10H1'),
	('PURO05', 'Manav', '', 'Purohit', '10H5'),
	('RAMS04', 'Alec', '', 'Ramsbottom', '10H3'),
	('REGA01', 'James', '', 'Regan', '10H1'),
	('ROCK01', 'Ethan', '', 'Rockett', '10H4'),
	('SCAI05', 'James', '', 'Scaiff', '10H2'),
	('SIMP12', 'Cole', '', 'Simpson', '10H2'),
	('THOM29', 'William', '', 'Thomson', '10H5'),
	('VIRT05', 'Joshua', '', 'Virtue', '10H5'),
	('VITA01', 'Matthew', '', 'Vitagliani', '10H4'),
	('WILK07', 'Max', '', 'Wilkins', '10H3'),
	('WILL38', 'Reece', '', 'Williams', '10H4'),
	('WUNS01', 'Thomas', '', 'Wunsch', '10H2'),
	('WYLI08', 'William', '', 'Wylie', '10H1'),
	('ONEI9', 'Callum', '', 'O&rsquo;Neill', '10H3'),
	('AREN07', 'Natale', 'Nate', 'Arena', '10H4'),
	('FERN21', 'Warnakulasuriya', 'Angelo', 'Fernando', '10H5'),
	('STAN06', 'William', '', 'Stanley', '10H2'),
	('FITZ28', 'Frank', '', 'Fitzsimons', '10H2'),
	('ASHM01', 'Samuel', 'Sam', 'Ashman', '10H5'),
	('BELL08', 'James', '', 'Bellenger', '10H4'),
	('BYRN16', 'James', '', 'Byrnes', '10H4'),
	('CORC03', 'Jamie', '', 'Corcoran', '10H5'),
	('CUAS03', 'Reuben', '', 'Cuasay', '10H5'),
	('DOBL03', 'Jaime', '', 'Dobles', '10H4'),
	('FORB02', 'Jake', '', 'Forbes', '10H5'),
	('JUNG02', ' Tristan Woosung', 'Tristan', 'Jung', '10H3'),
	('KEE18', 'Bailey', '', 'Kee', '10H5'),
	('KEIR01', 'Cameron', '', 'Keir', '10H1'),
	('CHRI10', 'Benjamin', '', 'Christensen', '10H4'),
	('CLEA07', 'Austin', '', 'Cleary', '10H2'),
	('LORK05', 'Aidan', '', 'Lorking', '10H1'),
	('MASS07', 'Luke', '', 'Massa', '10H1'),
	('MCKE30', 'Matthew', '', 'McKenzie', '10H2'),
	('MICH06', 'Sebastian', '', 'Michaeil', '10H1'),
	('ROGE04', 'Xavier', '', 'Rogers', '10H5'),
	('ROWE02', 'Harry', '', 'Rowe', '10H4'),
	('KIM13', 'Andrew', '', 'Kim', '10H1'),
	('TUER08', 'Adrian', '', 'Tuersley', '10H3'),
	('URRI01', 'Jack', '', 'Urriste', '10H3'),
	('MOON06', 'David', '', 'Mooney', '10H2'),
	('PANO03', 'Dominic', 'Dom', 'Panozzo', '10H2'),
	('WALL12', 'Marcus', '', 'Wall', '10H3'),
	('WARD23', 'Nicholas', '', 'Ward', '10H4'),
	('WATT19', 'Matthew', '', 'Watts', '10H4'),
	('SELL07', 'Luca', '', 'Sella', '10H4'),
	('TATA02', 'Kevork', 'Kevo', 'Tatarian', '10H5'),
	('DRAK05', 'Daniel', '', 'Drake', '10H5'),
	('HASS08', 'Alexander', '', 'Hassan', '10H3'),
	('BOUS07', 'Christian', '', 'Boustani', '10H4'),
	('POZZ10', 'Christian', '', 'Pozzolungo', '10H1'),
	('REC10', 'Zachary', 'Zac', 'Rec', '10H1'),
	('VAND15', 'Thomas', '', 'Van Dijk', '10H5'),
	('CARP07', 'Adam', '', 'Carpenter', '10H3'),
	('TANF01', 'Monte', '', 'Tanfield ', '10H3'),
	('MIDI01', 'Lee', '', 'Midis', '10H2'),
	('ZAAR01', 'Levi', '', 'Zaarour', '10H4'),
	('BART05', 'Evan', '', 'Barton', '10H2'),
	('ABNO04', 'Daniel', '', 'Abnous', '10H1'),
	('MERC01', 'Zachary ', '', 'Mercer', '10H4'),
	('SHAH25', 'James', '', 'Shahen', '10H5'),
	('LUSH01', 'Ethan', '', 'Lush', '10H2'),
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='Student Hours';

-- Dumping data for table cip_db.studentyearprovider: ~56 rows (approximately)
/*!40000 ALTER TABLE `studentyearprovider` DISABLE KEYS */;
INSERT INTO `studentyearprovider` (`studentYearProviderId`, `providerId`, `yearstudentId`, `cipHours`, `venueFormFlag`, `logBookFlag`, `comments`) VALUES
	(11, 12, 3, 14, 1, 0, ''),
	(12, 17, 4, 15, 1, 0, ''),
	(13, 3, 6, 7, 0, 1, 'Through school'),
	(14, 13, 7, 36, 1, 1, NULL),
	(15, 1, 9, 7, 1, 0, ''),
	(16, 1, 12, 25, 1, 0, ''),
	(17, 15, 14, 4, 0, 0, ''),
	(18, 1, 14, 12, 0, 0, ''),
	(19, 1, 17, 7, 1, 0, NULL),
	(20, 15, 19, 5, 0, 0, NULL),
	(21, 18, 19, 6, 0, 0, NULL),
	(22, 19, 20, 0, 0, 0, NULL),
	(25, 14, 25, 22, 1, 0, ''),
	(28, 15, 33, 2, 0, 1, NULL),
	(29, 21, 33, 9, 0, 1, NULL),
	(30, 22, 31, 14, 1, 0, ''),
	(31, 23, 5, 0, 0, 0, 'Still has not started 23/6'),
	(32, 14, 11, 4, 0, 0, ''),
	(33, 16, 15, 8, 0, 0, ''),
	(34, 3, 15, 3, 0, 0, ''),
	(35, 2, 15, 2, 0, 0, '1.5hrs'),
	(36, 26, 16, 4, 0, 0, 'b'),
	(37, 16, 16, 4, 0, 0, 'a'),
	(38, 15, 16, 5, 0, 0, 'c'),
	(39, 16, 10, 10, 0, 0, '?'),
	(40, 15, 10, 4, 0, 0, ''),
	(41, 21, 8, 9, 0, 0, ''),
	(42, 15, 8, 4, 0, 0, ''),
	(43, 15, 23, 5, 0, 0, ''),
	(44, 16, 23, 7, 0, 0, ''),
	(45, 27, 23, 0, 0, 0, ''),
	(46, 15, 22, 4, 0, 0, ''),
	(47, 3, 22, 3, 0, 0, ''),
	(48, 26, 22, 4, 0, 0, ''),
	(49, 27, 22, 4, 0, 0, ''),
	(50, 15, 26, 4, 0, 0, ''),
	(51, 16, 26, 2, 0, 0, ''),
	(52, 28, 26, 4, 0, 0, ''),
	(53, 14, 13, 0, 0, 0, 'Do most of hours in school hols'),
	(54, 19, 18, 0, 0, 0, ''),
	(55, 16, 21, 16, 0, 0, ''),
	(56, 4, 24, 16, 0, 0, 'Independent - not through school - 2hrs a week'),
	(57, 29, 34, 0, 0, 0, ''),
	(59, 16, 28, 3, 0, 0, ''),
	(60, 26, 28, 0, 0, 0, ''),
	(61, 16, 29, 3, 0, 0, ''),
	(62, 15, 30, 5, 0, 0, ''),
	(63, 16, 30, 2, 0, 0, ''),
	(64, 30, 32, 20, 0, 0, 'Need blue form and log book'),
	(65, 31, 27, 0, 0, 0, 'Waiting for phone call from them to tell him dates'),
	(66, 26, 6, 2, 0, 1, 'Red shield appeal - through school'),
	(67, 32, 9, 0, 0, 0, ''),
	(68, 15, 31, 5, 0, 1, ''),
	(69, 33, 6, 11, 1, 1, ''),
	(70, 2, 3, 0, 0, 0, 'Starts in Term2 hols'),
	(71, 16, 31, 2, 0, 1, '');
/*!40000 ALTER TABLE `studentyearprovider` ENABLE KEYS */;

-- Dumping structure for view cip_db.teacherdetailsvw
DROP VIEW IF EXISTS `teacherdetailsvw`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `teacherdetailsvw` (
	`UserID` INT(11) NOT NULL,
	`UserName` VARCHAR(10) NOT NULL COMMENT 'User Name' COLLATE 'utf8_general_ci',
	`PASSWORD` TEXT NOT NULL COMMENT 'Password' COLLATE 'utf8_general_ci',
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
  `Password` text NOT NULL COMMENT 'Password',
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
	(1, 'jlai', '$5$rounds=5000$stpiusxcipsystem$BeO3HgmJU3PTfqrbSuGLNh6Y0zFAeifTcgLlzQlA9j8', 'Joseph', 'Lai', 'jlai@stpiusx.nsw.edu.au', 1),
	(2, 'ncook', 'reset', 'Nicholas', 'Cook', 'ncook@stpiusx.nsw.edu.au', 2);
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
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='Students in a year';

-- Dumping data for table cip_db.yearstudents: ~159 rows (approximately)
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
	(34, 163, 1, 1),
	(35, 164, 2, 1),
	(36, 165, 2, 1),
	(37, 166, 2, 1),
	(38, 167, 2, 1),
	(39, 168, 2, 1),
	(40, 169, 2, 1),
	(41, 170, 2, 1),
	(42, 171, 2, 1),
	(43, 172, 2, 1),
	(44, 173, 2, 1),
	(45, 174, 2, 1),
	(46, 175, 2, 1),
	(47, 176, 2, 1),
	(48, 177, 2, 1),
	(49, 178, 2, 1),
	(50, 179, 2, 1),
	(51, 180, 2, 1),
	(52, 181, 2, 1),
	(53, 182, 2, 1),
	(54, 183, 2, 1),
	(55, 184, 2, 1),
	(56, 185, 2, 1),
	(57, 186, 2, 1),
	(58, 187, 2, 1),
	(59, 188, 2, 1),
	(60, 189, 2, 1),
	(61, 190, 2, 1),
	(62, 191, 2, 1),
	(63, 192, 2, 1),
	(64, 193, 2, 1),
	(65, 194, 2, 1),
	(66, 195, 2, 1),
	(67, 196, 3, 1),
	(68, 197, 3, 1),
	(69, 198, 3, 1),
	(70, 199, 3, 1),
	(71, 200, 3, 1),
	(72, 201, 3, 1),
	(73, 202, 3, 1),
	(74, 203, 3, 1),
	(75, 204, 3, 1),
	(76, 205, 3, 1),
	(77, 206, 3, 1),
	(78, 207, 3, 1),
	(79, 208, 3, 1),
	(80, 209, 3, 1),
	(81, 210, 3, 1),
	(82, 211, 3, 1),
	(83, 212, 3, 1),
	(84, 213, 3, 1),
	(85, 214, 3, 1),
	(86, 215, 3, 1),
	(87, 216, 3, 1),
	(88, 217, 3, 1),
	(89, 218, 3, 1),
	(90, 219, 3, 1),
	(91, 220, 3, 1),
	(92, 221, 3, 1),
	(93, 222, 3, 1),
	(94, 223, 3, 1),
	(95, 224, 3, 1),
	(96, 225, 3, 1),
	(97, 226, 3, 1),
	(98, 227, 4, 1),
	(99, 228, 4, 1),
	(100, 229, 4, 1),
	(101, 230, 4, 1),
	(102, 231, 4, 1),
	(103, 232, 4, 1),
	(104, 233, 4, 1),
	(105, 234, 4, 1),
	(106, 235, 4, 1),
	(107, 236, 4, 1),
	(108, 237, 4, 1),
	(109, 238, 4, 1),
	(110, 239, 4, 1),
	(111, 240, 4, 1),
	(112, 241, 4, 1),
	(113, 242, 4, 1),
	(114, 243, 4, 1),
	(115, 244, 4, 1),
	(116, 245, 4, 1),
	(117, 246, 4, 1),
	(118, 247, 4, 1),
	(119, 248, 4, 1),
	(120, 249, 4, 1),
	(121, 250, 4, 1),
	(122, 251, 4, 1),
	(123, 252, 4, 1),
	(124, 253, 4, 1),
	(125, 254, 4, 1),
	(126, 255, 4, 1),
	(127, 256, 4, 1),
	(128, 257, 4, 1),
	(129, 258, 4, 1),
	(130, 259, 5, 1),
	(131, 260, 5, 1),
	(132, 261, 5, 1),
	(133, 262, 5, 1),
	(134, 263, 5, 1),
	(135, 264, 5, 1),
	(136, 265, 5, 1),
	(137, 266, 5, 1),
	(138, 267, 5, 1),
	(139, 268, 5, 1),
	(140, 269, 5, 1),
	(141, 270, 5, 1),
	(142, 271, 5, 1),
	(143, 272, 5, 1),
	(144, 273, 5, 1),
	(145, 274, 5, 1),
	(146, 275, 5, 1),
	(147, 276, 5, 1),
	(148, 277, 5, 1),
	(149, 278, 5, 1),
	(150, 279, 5, 1),
	(151, 280, 5, 1),
	(152, 281, 5, 1),
	(153, 282, 5, 1),
	(154, 283, 5, 1),
	(155, 284, 5, 1),
	(156, 285, 5, 1),
	(157, 286, 5, 1),
	(158, 287, 5, 1),
	(159, 288, 5, 1),
	(160, 289, 5, 1),
	(161, 290, 5, 1);
/*!40000 ALTER TABLE `yearstudents` ENABLE KEYS */;

-- Dumping structure for view cip_db.homeroomsummaryvw
DROP VIEW IF EXISTS `homeroomsummaryvw`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `homeroomsummaryvw`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `homeroomsummaryvw` AS select `td`.`UserID` AS `userID`,`td`.`homeroomId` AS `homeroomId`,`td`.`homeroom` AS `homeroom`,`td`.`yearId` AS `yearId`,`td`.`YEAR` AS `YEAR`,`ys`.`yearstudentId` AS `yearstudentId`,`s`.`studentid` AS `studentId`,`s`.`StudentFirstName` AS `StudentFirstName`,`s`.`StudentLastName` AS `StudentLastName`,`s`.`UserId` AS `studentUserId`,`syp`.`studentYearProviderId` AS `studentYearProviderId`,`p`.`providerId` AS `providerId`,`p`.`providerName` AS `providerName`,`p`.`location` AS `location`,`syp`.`cipHours` AS `cipHours`,`syp`.`venueFormFlag` AS `venueFormFlag`,`syp`.`logBookFlag` AS `logBookFlag` from ((((`teacherdetailsvw` `td` join `yearstudents` `ys`) join `student` `s`) join `studentyearprovider` `syp`) join `cip_provider` `p`) where ((`ys`.`studentid` = `s`.`studentid`) and (`ys`.`homeroomid` = `td`.`homeroomId`) and (`ys`.`yearid` = `td`.`yearId`) and (`syp`.`yearstudentId` = `ys`.`yearstudentId`) and (`syp`.`providerId` = `p`.`providerId`)) order by `td`.`UserID`,`s`.`StudentLastName`,`s`.`StudentFirstName`,`p`.`providerName`,`p`.`location` ;

-- Dumping structure for view cip_db.teacherdetailsvw
DROP VIEW IF EXISTS `teacherdetailsvw`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `teacherdetailsvw`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `teacherdetailsvw` AS select `u`.`UserID` AS `UserID`,`u`.`UserName` AS `UserName`,`u`.`Password` AS `PASSWORD`,`u`.`FirstName` AS `FirstName`,`u`.`LastName` AS `LastName`,`h`.`homeroomId` AS `homeroomId`,`h`.`homeroom` AS `homeroom`,`y`.`yearId` AS `yearId`,`y`.`year` AS `YEAR` from (((`users` `u` join `teacherhomeroom` `th`) join `cip_year` `y`) join `homeroom` `h`) where ((`u`.`UserID` = `th`.`userId`) and (`y`.`year` = convert(date_format(curdate(),'%Y') using utf8)) and (`th`.`yearId` = `y`.`yearId`) and (`h`.`homeroomId` = `th`.`homeroomId`)) ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
