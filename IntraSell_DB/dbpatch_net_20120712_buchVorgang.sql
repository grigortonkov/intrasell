CREATE TABLE  `intrasell_daten_2`.`buchVorgangTyp` (
  `Typ` varchar(2) NOT NULL DEFAULT 'AR',
  `Bezeichnung` varchar(100) DEFAULT 'Rechnung',
  `Druckbezeichnung`  varchar(100)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `intrasell_daten_2`.`buchVorgang`;
CREATE TABLE  `intrasell_daten_2`.`buchVorgang` (
  `Nummer` int(10) NOT NULL DEFAULT '0',
  `Typ` varchar(2) NOT NULL,
  `KundNr` int(10) NOT NULL,
  `Datum` datetime NOT NULL,
  `Notiz` varchar(2000) DEFAULT NULL,
  `NotizIntern` varchar(2000) DEFAULT NULL,
  `NotizExtern` varchar(2000) DEFAULT NULL,
  `Summe` decimal(10,2) DEFAULT NULL,
  `Bezahlt` tinyint(1) NOT NULL,
  `Ausgedruckt` tinyint(1) NOT NULL,
  `Abgeschlossen` tinyint(1) NOT NULL,
  `Zahlungsbedungung` varchar(250) DEFAULT NULL,
  `TransportMethode` varchar(250) DEFAULT NULL,
  `ZahlungsMethode` varchar(250) DEFAULT NULL,
  `Woher` varchar(250) DEFAULT NULL,
  `Wohin` varchar(250) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `SummeMWST` decimal(10,2) DEFAULT NULL,
  `SummeBrutto` decimal(10,2) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `MitarbeiterNr` int(10) DEFAULT NULL,
  `KundNr2` int(10) DEFAULT NULL,
  `Waehrung` varchar(3) DEFAULT 'EUR',
  `ErstelltAm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Nummer`,`Typ`),
  KEY `Nummer` (`Nummer`,`Typ`),
  KEY `ofAdressenBuchVorgang` (`KundNr`),
  CONSTRAINT `buchVorgang_ibfk_1` FOREIGN KEY (`KundNr`) REFERENCES `ofadressen` (`IDNR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE IF EXISTS `intrasell_daten_2`.`buchvorgang-artikel`;
CREATE TABLE  `intrasell_daten_2`.`buchvorgang-artikel` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Nummer` int(10) NOT NULL,
  `Typ` varchar(2) NOT NULL,
  `ArtNr` int(10) NOT NULL,
  `Stk` decimal(10,2) NOT NULL DEFAULT '0.00',
  `EKPreis` decimal(10,4) DEFAULT NULL,
  `Preis_Netto` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `Preis_Brutto` decimal(10,4) DEFAULT NULL,
  `MWST` decimal(10,4) DEFAULT NULL,
  `ArtikelIdentifikation` varchar(50) DEFAULT NULL,
  `Bezeichnung` varchar(255) NOT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Referenz` varchar(50) DEFAULT NULL,
  `Packung` varchar(50) DEFAULT NULL,
  `Herkunft` varchar(45) DEFAULT NULL,
  `Incoterm` varchar(45) DEFAULT NULL,
  `Spezifikation` varchar(250) DEFAULT NULL,
  `Zeitpunkt` datetime DEFAULT NULL,
  `ErstelltAm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`,`Nummer`,`Typ`) USING BTREE,
  KEY `buchVorgang-ArtikelNummer` (`Nummer`),
  KEY `buchVorgang-ArtikelArtNr` (`ArtNr`),
  KEY `ID` (`ID`) USING BTREE,
  KEY `buchVorgang-artikel_ibfk_1` (`Nummer`,`Typ`),
  CONSTRAINT `buchVorgang-artikel_ibfk_1` FOREIGN KEY (`Nummer`, `Typ`) REFERENCES `buchvorgang` (`Nummer`, `Typ`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buchVorgang-artikel_ibfk_2` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;