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
-- Definition of table `calcsheetpositions`
--

DROP TABLE IF EXISTS `calcsheetpositions`;
CREATE TABLE `calcsheetpositions` (
  `Position` int(10) NOT NULL,
  `Gruppe` varchar(50) DEFAULT NULL,
  `Bezeichnung` varchar(50) DEFAULT NULL,
  `Col1` longtext,
  `Col2` longtext,
  `Col3` longtext,
  `Col4` longtext,
  `Operation` varchar(50) DEFAULT NULL,
  `Sortierung` int(11) DEFAULT NULL,
  PRIMARY KEY (`Position`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `calcsheetpositions`
--

/*!40000 ALTER TABLE `calcsheetpositions` DISABLE KEYS */;
INSERT INTO `calcsheetpositions` (`Position`,`Gruppe`,`Bezeichnung`,`Col1`,`Col2`,`Col3`,`Col4`,`Operation`,`Sortierung`) VALUES 
 (101,'Einkauf','Position','INSERT INTO calcSheet( Col1, Col2, Col3, Bezeichnung, [Position], AuftragNr )\r\nSELECT Stk, EKPreis, Stk*EKPreis,  [buchAuftrag-Artikel].Bezeichnung, 101 AS Pos,  [AuftragNr] \r\nFROM [buchAuftrag-Artikel]\r\nWHERE RechNr=[AuftragNr]','0','select Col1*Col2 from ofVars where Id=1',NULL,NULL,102),
 (102,'Einkauf','LAGERKOSTEN','0','0','select Col1*Col2 from ofVars where Id=1',NULL,NULL,103),
 (103,'Einkauf','VETERINÄRKOSTEN','0','0','select Col1*Col2 from ofVars where Id=1',NULL,NULL,104),
 (104,'Einkauf','VERZOLLUNG','0','0','select Col1*Col2 from ofVars where Id=1',NULL,NULL,105),
 (105,'Einkauf','FREMDE PROVISION','0','0','select Col1*Col2 from ofVars where Id=1',NULL,NULL,106),
 (106,'Einkauf','SONSTIGE KOSTEN','1','0','select Col1*Col2 from ofVars where Id=1',NULL,NULL,107),
 (107,'Einkauf','SKONTO','0','select round(sum([Col3]),2) from calcSheetView where Gruppe=\'Einkauf\' and AuftragNr=[AuftragNr] and isNumeric([Col3])  and Position<>107 and Position<>199','select round(-1*Col1*Col2/100 ,2) from ofVars where Id=1',NULL,NULL,108),
 (199,'Einkauf','Einkauf',NULL,NULL,'select round(sum([Col3]),2) from calcSheetView where Gruppe=\'Einkauf\' and AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position<>199',NULL,NULL,109),
 (201,'Verkauf','Position','INSERT INTO calcSheet( Col1, Col2, Col3, Bezeichnung, [Position], AuftragNr )\r\nSELECT Stk, PreisATS, Stk*PreisATS, [buchAuftrag-Artikel].Bezeichnung, 201 AS Pos,  [AuftragNr] \r\nFROM [buchAuftrag-Artikel]\r\nWHERE RechNr=[AuftragNr]','0','select Col1*Col2 from ofVars',NULL,NULL,201),
 (202,'Verkauf','ZUSÄTZLICHER ERTRAG','1','0','select Col1*Col2 from ofVars where Id=1',NULL,NULL,202),
 (203,'Verkauf','SKONTO','0','select round(sum([Col3]),2) from calcSheetView where Gruppe=\'Verkauf\' and AuftragNr=[AuftragNr] and Position <> 203 and Position <> 299','select -1*Col1*Col2/100 from ofVars',NULL,NULL,203),
 (299,'Verkauf','Verkauf',NULL,NULL,'select round(sum([Col3]),2) from calcSheetView where Gruppe=\'Verkauf\' and AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position <> 299',NULL,NULL,299),
 (300,'Transport','Transport (Planboard)','1','SELECT TransportKosten FROM tradeBoardGeschaeft WHERE AuftragNr = [AuftragNr]','select round(Col1*Col2,2) from ofVars',NULL,NULL,300),
 (301,'Transport','Zusätzliche Transportkosten','1','0','select Col1*Col2 from ofVars where Id=1',NULL,NULL,301),
 (400,'Finanzierung','Zahlungs-Ziel Tage','select getZahlungZielTage([ZahlungsBedungung]) from buchAuftrag where Nummer=[AuftragNr]',NULL,NULL,NULL,NULL,400),
 (401,'Finanzierung','Factoring Gebühr','0,35','select col3 from calcSheetView where Bezeichnung=\'Verkauf\' and AuftragNr=[AuftragNr]','select round(Col1*Col2/100,2) from ofVars',NULL,NULL,401),
 (402,'Finanzierung','Verzinsung','5,5','select round(col3 * 1/360 * (select v.COL1 from calcSheetView v where v.Bezeichnung=\'Zahlungs-Ziel Tage\' and v.AuftragNr=[AuftragNr]),2)  from calcSheetView where Bezeichnung=\'Verkauf\' and AuftragNr=[AuftragNr]','select round(Col1*Col2/100,2) from ofVars',NULL,NULL,402),
 (403,'Finanzierung','GKZ','1','select col3 from calcSheetView where Bezeichnung=\'Verkauf\' and AuftragNr=[AuftragNr]','select round(Col1*Col2/100,2) from ofVars',NULL,NULL,403),
 (405,'Finanzierung','Versicherung','0,0053333333','select round(col3*(30 +  (select v.COL1 from calcSheetView v where v.Bezeichnung=\'Zahlungs-Ziel Tage\' and v.AuftragNr=[AuftragNr])),2) from calcSheetView where Bezeichnung=\'Verkauf\' and AuftragNr=[AuftragNr]','select round(Col1*Col2/100,2) from ofVars',NULL,NULL,405),
 (499,'Finanzierung','Finanzierungskosten',NULL,NULL,'select round(sum([Col3]) , 2) from calcSheetView where Gruppe=\'Finanzierung\' and AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position <> 499',NULL,NULL,499),
 (500,'Transport','Ergebnis Brutto',NULL,NULL,'select round( sum(c), 2) from (\r\nselect ([Col3])  as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3])  and Position = 299\r\nunion  \r\nselect -1*([Col3]) as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position = 199\r\nunion  \r\nselect -1*([Col3]) as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position = 300 union  \r\nselect -1*([Col3]) as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position = 301\r\nunion  \r\nselect -1*([Col3]) as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position = 499\r\n) t3',NULL,NULL,399),
 (501,'Ergebnis_Hide','DB1',NULL,NULL,'select round( sum(c), 2) from (\r\nselect ([Col3])  as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3])  and Position = 299\r\nunion  \r\nselect -1*([Col3]) as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position = 199\r\nunion  \r\nselect -1*([Col3]) as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position = 300\r\nunion  \r\nselect -1*([Col3]) as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position = 301\r\n) t3',NULL,NULL,399),
 (502,'Ergebnis_Hide','DB2',NULL,NULL,'select round( sum(c), 2) from (\r\nselect ([Col3])  as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3])  and Position = 501\r\nunion  \r\nselect -1*([Col3]) as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position = 499\r\n) t3',NULL,NULL,705),
 (600,'Ergebnis','Provision Einkauf','SELECT EKProvision\r\nFROM tradeBoardGeschaeft INNER JOIN calcSheetMitarbeiterProvision ON tradeBoardGeschaeft.MitarbeiterEK = calcSheetMitarbeiterProvision.MitarbeiterNr\r\nWHERE AuftragNr =[AuftragNr]','select sum([Col3]) from calcSheetView where Position=502 and AuftragNr=[AuftragNr] and isNumeric([Col3])','select round(Col1*Col2/100,2) from ofVars',NULL,NULL,600),
 (700,'Ergebnis','Provision Verkauf','SELECT VKProvision\r\nFROM tradeBoardGeschaeft INNER JOIN calcSheetMitarbeiterProvision ON tradeBoardGeschaeft.MitarbeiterVK = calcSheetMitarbeiterProvision.MitarbeiterNr\r\nWHERE AuftragNr =[AuftragNr]','select sum([Col3]) from calcSheetView where  Position=502  and AuftragNr=[AuftragNr] and isNumeric([Col3])','select round(Col1*Col2/100,2) from ofVars',NULL,NULL,700),
 (1000,'Ergebnis','Ergebnis Netto',NULL,NULL,'select round(sum(c), 2) from (select [Col3] as c from calcSheetView where Bezeichnung=\'DB2\' and AuftragNr=[AuftragNr] \r\nunion \r\nselect -1*[Col3]  as c from calcSheetView where Bezeichnung=\'Provision Einkauf\' and AuftragNr=[AuftragNr]\r\nunion\r\nselect -1*[Col3] as c from calcSheetView where Bezeichnung=\'Provision Verkauf\' and AuftragNr=[AuftragNr]\r\n)',NULL,NULL,1000),
 (1001,'Ergebnis','Aufschlag','select col3 from calcSheetView where Bezeichnung=\'Einkauf\' and AuftragNr=[AuftragNr]','select col3 from calcSheetView where Bezeichnung=\'Ergebnis Netto\' and AuftragNr=[AuftragNr]','select round(100*(Col2)/Col1,2) & \" %\" from ofVars',NULL,NULL,1001);
/*!40000 ALTER TABLE `calcsheetpositions` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
