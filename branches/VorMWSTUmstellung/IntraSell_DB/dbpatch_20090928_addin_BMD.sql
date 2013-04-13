-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.34-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema intrasell_daten_2
--

CREATE DATABASE IF NOT EXISTS intrasell_daten_2;
USE intrasell_daten_2;

--
-- Definition of table `impexbmd_kundengruppenkonten`
--

DROP TABLE IF EXISTS `impexbmd_kundengruppenkonten`;
CREATE TABLE `impexbmd_kundengruppenkonten` (
  `ID` int(11) NOT NULL,
  `Kundengruppe` varchar(50) DEFAULT NULL,
  `Konto` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `impexbmd_kundengruppenkonten`
--

/*!40000 ALTER TABLE `impexbmd_kundengruppenkonten` DISABLE KEYS */;
INSERT INTO `impexbmd_kundengruppenkonten` (`ID`,`Kundengruppe`,`Konto`) VALUES 
 (2,'Exportkunden EU','4100'),
 (3,'Exportkunden Non-EU','4050'),
 (4,'GH-Kunden Inland','4001'),
 (5,'Konsumenten EU','4090'),
 (7,'Versandkunden Inland','4000'),
 (8,'Tennislehrer','4090'),
 (10,'Online Kunden','4090');
/*!40000 ALTER TABLE `impexbmd_kundengruppenkonten` ENABLE KEYS */;


--
-- Definition of table `impexbmd_vars`
--

DROP TABLE IF EXISTS `impexbmd_vars`;
CREATE TABLE `impexbmd_vars` (
  `ID` int(11) NOT NULL,
  `Stammdatenfile` varchar(50) DEFAULT NULL,
  `Buchungenfile` varchar(50) DEFAULT NULL,
  `BuchDatumVon` datetime DEFAULT NULL,
  `BuchDatumBis` datetime DEFAULT NULL,
  `KontoUST` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `impexbmd_vars`
--

/*!40000 ALTER TABLE `impexbmd_vars` DISABLE KEYS */;
INSERT INTO `impexbmd_vars` (`ID`,`Stammdatenfile`,`Buchungenfile`,`BuchDatumVon`,`BuchDatumBis`,`KontoUST`) VALUES 
 (1,'z:\\BMD\\stamm.csv','z:\\BMD_buch_11.csv','2001-07-01 00:00:00','2009-11-30 00:00:00','3500');
/*!40000 ALTER TABLE `impexbmd_vars` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
