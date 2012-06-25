
CREATE TABLE  `intrasell_daten_2`.`buchvorgaengeWaehrung` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `VorgangTyp` varchar(3) DEFAULT NULL,
  `Nummer` int(10) DEFAULT NULL,
  `Waehrung` varchar(3) NOT NULL DEFAULT 'EUR',
  `Wechselkurs` decimal(10,3) DEFAULT NULL,
  `Summe` decimal(10,2) DEFAULT NULL,
  `SummeMWST` decimal(10,2) DEFAULT NULL,
  `SummeBrutto` decimal(10,2) DEFAULT NULL,
  `ErstelltAm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`),
  KEY `Waehrung` (`Waehrung`),
  KEY `Nummer` (`Nummer`),
  KEY `VorgangTyp` (`VorgangTyp`)
) ENGINE=InnoDB AUTO_INCREMENT=723 DEFAULT CHARSET=latin1;

ALTER TABLE `intrasell_daten_2`.`buchrechnung` ADD COLUMN `Waehrung` VARCHAR(3) DEFAULT 'EUR';
 
ALTER TABLE `intrasell_daten_2`.`buchAngebot` ADD COLUMN `Waehrung` VARCHAR(3) DEFAULT 'EUR';

ALTER TABLE `intrasell_daten_2`.`buchAuftrag` ADD COLUMN `Waehrung` VARCHAR(3) DEFAULT 'EUR';

ALTER TABLE `intrasell_daten_2`.`buchLieferschein` ADD COLUMN `Waehrung` VARCHAR(3) DEFAULT 'EUR';

ALTER TABLE `intrasell_daten_2`.`buchRetourwaren` ADD COLUMN `Waehrung` VARCHAR(3) DEFAULT 'EUR';

ALTER TABLE `intrasell_daten_2`.`buchgutschrift` ADD COLUMN `Waehrung` VARCHAR(3) DEFAULT 'EUR';

ALTER TABLE `intrasell_daten_2`.`buchlieferantauftrag`  ADD COLUMN `Waehrung` VARCHAR(3) DEFAULT 'EUR';

ALTER TABLE `intrasell_daten_2`.`buchkassabuch` ADD COLUMN `Waehrung` VARCHAR(3) DEFAULT 'EUR';

ALTER TABLE `intrasell_daten_2`.`transportAuftrag` ADD COLUMN `Waehrung` VARCHAR(3) DEFAULT 'EUR';




    
  
  
  
  
 
 
 