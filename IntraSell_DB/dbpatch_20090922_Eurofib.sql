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
-- Definition of table `addin_eurofibu_export_kundengruppenkonten`
--

DROP TABLE IF EXISTS `addin_eurofibu_export_kundengruppenkonten`;
CREATE TABLE `addin_eurofibu_export_kundengruppenkonten` (
  `ID` int(11) NOT NULL,
  `Kundengruppe` varchar(50) DEFAULT NULL,
  `Konto` varchar(10) DEFAULT NULL,
  `Stco` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addin_eurofibu_export_kundengruppenkonten`
--

/*!40000 ALTER TABLE `addin_eurofibu_export_kundengruppenkonten` DISABLE KEYS */;
INSERT INTO `addin_eurofibu_export_kundengruppenkonten` (`ID`,`Kundengruppe`,`Konto`,`Stco`) VALUES 
 (2,'Ausland','4110','A10'),
 (3,'EU','4160','W00'),
 (4,'Inland','4010','310'),
 (11,'Inland20','4020','320');
/*!40000 ALTER TABLE `addin_eurofibu_export_kundengruppenkonten` ENABLE KEYS */;


--
-- Definition of table `addin_eurofibu_export_values`
--

DROP TABLE IF EXISTS `addin_eurofibu_export_values`;
CREATE TABLE `addin_eurofibu_export_values` (
  `Dateiname` varchar(250) DEFAULT NULL,
  `Von` datetime DEFAULT NULL,
  `Bis` datetime DEFAULT NULL,
  `Klient` varchar(4) NOT NULL,
  PRIMARY KEY (`Klient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addin_eurofibu_export_values`
--

/*!40000 ALTER TABLE `addin_eurofibu_export_values` DISABLE KEYS */;
INSERT INTO `addin_eurofibu_export_values` (`Dateiname`,`Von`,`Bis`,`Klient`) VALUES 
 ('c:\\','2001-09-23 00:00:00','2009-09-23 00:00:00','0100');
/*!40000 ALTER TABLE `addin_eurofibu_export_values` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
