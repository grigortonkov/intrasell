/*Table structure for table `ofDokumente` */

USE `intrasell_daten_2`;

DROP TABLE IF EXISTS `ofDokumente`;

CREATE TABLE `ofDokumente` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `DokumenteName` varchar(255) NOT NULL,
  `TabelleName` varchar(50) NOT NULL,
  `FilterString` varchar(50) NOT NULL,
  `ErstelltAm` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `ofDokumente` */

LOCK TABLES `ofDokumente` WRITE;

UNLOCK TABLES;