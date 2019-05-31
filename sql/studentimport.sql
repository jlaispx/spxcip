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

-- Dumping structure for table cip_db.studentimport
CREATE TABLE IF NOT EXISTS `studentimport` (
  `userId` varchar(10) NOT NULL,
  `studentFirstName` text NOT NULL,
  `studentPreferredName` text,
  `studentLastName` text NOT NULL,
  `homeroom` text NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table cip_db.studentimport: 0 rows
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

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
