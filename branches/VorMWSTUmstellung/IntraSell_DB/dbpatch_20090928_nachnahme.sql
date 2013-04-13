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
-- Definition of table `addin_nachnameerf_eingang`
--

DROP TABLE IF EXISTS `addin_nachnameerf_eingang`;
CREATE TABLE `addin_nachnameerf_eingang` (
  `Nr` int(11) NOT NULL AUTO_INCREMENT,
  `AuszugsGruppe` varchar(10) NOT NULL,
  `Auszugsdatum` datetime NOT NULL,
  `KundNr` int(11) NOT NULL,
  `RechNr` int(11) NOT NULL,
  `NNBetrag` double NOT NULL,
  `Exportiert` bit(1) NOT NULL DEFAULT b'0',
  `ErfDatum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Nr`)
) ENGINE=InnoDB AUTO_INCREMENT=7063 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addin_nachnameerf_eingang`
--

/*!40000 ALTER TABLE `addin_nachnameerf_eingang` DISABLE KEYS */;
/*!40000 ALTER TABLE `addin_nachnameerf_eingang` ENABLE KEYS */;


--
-- Definition of table `addin_nachnameerf_vars`
--

DROP TABLE IF EXISTS `addin_nachnameerf_vars`;
CREATE TABLE `addin_nachnameerf_vars` (
  `ID` int(11) NOT NULL,
  `AuszugsGruppe` varchar(50) DEFAULT NULL,
  `AuszugsDatum` datetime DEFAULT NULL,
  `Buchungenfile` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addin_nachnameerf_vars`
--

/*!40000 ALTER TABLE `addin_nachnameerf_vars` DISABLE KEYS */;
INSERT INTO `addin_nachnameerf_vars` (`ID`,`AuszugsGruppe`,`AuszugsDatum`,`Buchungenfile`) VALUES 
 (3,'080015','2031-03-08 00:00:00','Z:\\BMD_219-236.csv'),
 (4,'spp06016',NULL,NULL);
/*!40000 ALTER TABLE `addin_nachnameerf_vars` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;



ALTER TABLE `intrasell_daten_2`.`addin_nachnameerf_eingang`
 MODIFY COLUMN `Exportiert` BOOLEAN NOT NULL;


ALTER TABLE `intrasell_daten_2`.`addin_nachnameerf_eingang` 
 MODIFY COLUMN `Exportiert` TINYINT(1) NOT NULL DEFAULT 0;  