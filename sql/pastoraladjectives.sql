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

-- Dumping structure for table cip_db.pastoraladjectives
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

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
