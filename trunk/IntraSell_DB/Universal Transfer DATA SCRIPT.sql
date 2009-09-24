-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.33-community


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

-- CREATE DATABASE /*!32312 IF NOT EXISTS*/ intrasell_daten_2;
USE intrasell_daten_2;

-- Source Datenbank IntraSell_Dbo.  

--
-- Dumping data for table `intrasell_daten_2`.`buchauftrag`
--
START TRANSACTION;


DELETE FROM `buchVorgaengeEigenschaften`; 
 
INSERT INTO `buchVorgaengeEigenschaften`(`ID`, `VorgangTyp`, `Nummer`, `Name`, `Value`, `ErstelltAm`)
SELECT ID, `VorgangTyp`, `Nummer`, `Name`, `Value`, `ErstelltAm`
FROM IntraSell_Dbo.`buchVorgaengeEigenschaften`;


/*!40000 ALTER TABLE `buchauftrag` DISABLE KEYS */;
DELETE FROM `buchauftrag`; 
INSERT INTO `buchauftrag` (`Nummer`,`KundNr`,`Datum`,`Notiz`,`Summe`,`Bezahlt`,`Ausgedrukt`,`anElba`,`ZahlungsBedungung`,`Woher`,`Wohin`,`TransportMethode`,`ZahlungsMethode`,`Status`,`NotizIntern`,`NotizExtern`,`SummeMWST`,`SummeBrutto`,`LieferantNr`,`MitarbeiterNr`,`KundNr2`)
SELECT `Nummer`,`KundNr`,`Datum`,`Notiz`,`Summe`,`Bezahlt`,`Ausgedrukt`,`anElba`,`ZahlungsBedungung`,`Woher`,`Wohin`,`TransportMethode`,`ZahlungsMethode`,'-','-','-',0,0,1,1,null
FROM IntraSell_Dbo.`buchauftrag`;
/*!40000 ALTER TABLE `buchauftrag` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`buchauftrag-artikel`
--

/*!40000 ALTER TABLE `buchauftrag-artikel` DISABLE KEYS */;
DELETE FROM `buchauftrag-artikel`; 
INSERT INTO `buchauftrag-artikel` (`ID`,`RechNr`,`ArtNr`,`PreisATS`,`PreisEuro`,`Stk`,`PreisATS_Brutto`,`ArtikelIdentifikation`,`EKPreis`,`Bezeichnung`,`LieferantNR`,`PositionStatus`,`Referenz`,`Packung`,`Herkunft`,`Incoterm`,`Spezifikation`)
SELECT `ID`,`RechNr`,`ArtNr`,`PreisATS`,`PreisEuro`,`Stk`,`PreisATS_Brutto`,`ArtikelIdentifikation`,`EKPreis`,`Bezeichnung`,null,null,null,null,null,null,null
FROM  IntraSell_Dbo.`buchauftrag-artikel`;
 
/*!40000 ALTER TABLE `buchauftrag-artikel` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`buchkassabuch`
--

/*!40000 ALTER TABLE `buchkassabuch` DISABLE KEYS */;
 DELETE FROM `buchkassabuch`; 

 INSERT INTO `buchkassabuch` (`KBID`,`Datum`,`Konto`,`Beschreibung`,`BetragAusgang`,`BetragEingang`)
 SELECT `KBID`,`Datum`,`Konto`,`Beschreibung`,`BetragAusgang`,`BetragEingang`
 FROM IntraSell_Dbo.`buchkassabuch`;
/*!40000 ALTER TABLE `buchkassabuch` ENABLE KEYS */; 


--
-- Dumping data for table `intrasell_daten_2`.`buchlieferschein`
--

/*!40000 ALTER TABLE `buchlieferschein` DISABLE KEYS */;
DELETE FROM `buchlieferschein`;
INSERT INTO `buchlieferschein`  (`Nummer`,`KundNr`,`Datum`,`Notiz`,`Summe`,`Bezahlt`,`Ausgedrukt`,`anElba`,`ZahlungsBedungung`,`Woher`,`Wohin`,`TransportMethode`,`ZahlungsMethode`,`Status`,`NotizIntern`,`NotizExtern`,`SummeMWST`,`SummeBrutto`,`LieferantNr`,`MitarbeiterNr`,`KundNr2`)
SELECT `Nummer`,`KundNr`,`Datum`,`Notiz`,`Summe`,`Bezahlt`,`Ausgedrukt`,`anElba`,`ZahlungsBedungung`,`Woher`,`Wohin`,`TransportMethode`,`ZahlungsMethode`,'-','-','-',0,0,1,1,null
FROM IntraSell_Dbo.`buchlieferschein`;
 
/*!40000 ALTER TABLE `buchlieferschein` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`buchlieferschein-artikel`
--

/*!40000 ALTER TABLE `buchlieferschein-artikel` DISABLE KEYS */;
DELETE FROM `buchlieferschein-artikel`;
INSERT INTO `buchlieferschein-artikel` (`ID`,`RechNr`,`ArtNr`,`PreisATS`,`PreisEuro`,`Stk`,`PreisATS_Brutto`,`ArtikelIdentifikation`,`EKPreis`,`Bezeichnung`,`LieferantNR`,`PositionStatus`,`Referenz`,`Packung`,`Herkunft`,`Incoterm`,`Spezifikation`)
SELECT `ID`,`RechNr`,`ArtNr`,`PreisATS`,`PreisEuro`,`Stk`,`PreisATS_Brutto`,`ArtikelIdentifikation`,`EKPreis`,`Bezeichnung`,null,null,null,null,null,null,null
FROM  IntraSell_Dbo.`buchlieferschein-artikel`;


/*!40000 ALTER TABLE `buchlieferschein-artikel` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`buchrech-artikel`
--

/*!40000 ALTER TABLE `buchrech-artikel` DISABLE KEYS */;
DELETE FROM `buchrech-artikel`;
INSERT INTO `buchrech-artikel`(`ID`,`RechNr`,`ArtNr`,`PreisATS`,`PreisEuro`,`Stk`,`PreisATS_Brutto`,`ArtikelIdentifikation`,`EKPreis`,`Bezeichnung`,`LieferantNR`,`PositionStatus`,`Referenz`,`Packung`,`Herkunft`,`Incoterm`,`Spezifikation`)
SELECT `ID`,`RechNr`,`ArtNr`,`PreisATS`,`PreisEuro`,`Stk`,`PreisATS_Brutto`,`ArtikelIdentifikation`,`EKPreis`,`Bezeichnung`,null,null,null,null,null,null,null
FROM  IntraSell_Dbo.`buchrech-artikel`;
 
/*!40000 ALTER TABLE `buchrech-artikel` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`buchrechnung`
--

/*!40000 ALTER TABLE `buchrechnung` DISABLE KEYS */;
DELETE FROM `buchrechnung`; 
INSERT INTO `buchrechnung`  (`Nummer`,`KundNr`,`Datum`,`Notiz`,`Summe`,`Bezahlt`,`Ausgedrukt`,`anElba`,`ZahlungsBedungung`,`Woher`,`Wohin`,`TransportMethode`,`ZahlungsMethode`,`Status`,`NotizIntern`,`NotizExtern`,`SummeMWST`,`SummeBrutto`,`LieferantNr`,`MitarbeiterNr`,`KundNr2`)
SELECT `Nummer`,`KundNr`,`Datum`,`Notiz`,`Summe`,`Bezahlt`,`Ausgedrukt`,`anElba`,`ZahlungsBedungung`,`Woher`,`Wohin`,`TransportMethode`,`ZahlungsMethode`,'-','-','-',0,0,1,1,null
FROM IntraSell_Dbo.`buchrechnung`;

/*!40000 ALTER TABLE `buchrechnung` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`granrede`
--

/*!40000 ALTER TABLE `granrede` DISABLE KEYS */;
-- INSERT INTO `granrede` (`Anrede`,`Briefanrede`,`Titel`)
/*!40000 ALTER TABLE `granrede` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`grartikel`
--

/*!40000 ALTER TABLE `grartikel` DISABLE KEYS */;
DELETE FROM `grartikel`; 
INSERT INTO `grartikel` (`ArtNr`,`EAN`,`Barcode`,`Bezeichnung`,`Bezeichnung1`,`Beschreibung`,`Einheit`,`PreisATS`,`PreisEuro`,`PreisATS_Brutto`,`LagerArtikel`,`EKPreis`,`LEKPreis`,`Seriennummer`,`LieferantNR`,`SetArtikel`,`ArtKatNr`,`MWST`,`Gewicht`,`Picture`,`HerstellerNr`,`ProduktAktiv`,`ShopURL`,`HerstellerURL`,`Modifikationen`,`HerstellerRabatt`,`HerstellerRabattText`,`AngelegtAn`,`BruttoGewicht`,`NettoGewicht`,`TaraGewicht`,`AngelegtAm`,`NichtBestellbar`)
SELECT `ArtNr`,`EAN`,`Barcode`,`Bezeichnung`,`Bezeichnung1`,`Beschreibung`,`Einheit`,`PreisATS`,`PreisEuro`,`PreisATS_Brutto`,`LagerArtikel`,`EKPreis`,`LEKPreis`,`Seriennummer`,`LieferantNR`,`SetArtikel`,`ArtKatNr`,`MWST`,`Gewicht`,`Picture`,`HerstellerNr`,`ProduktAktiv`,`ShopURL`,`HerstellerURL`,`Modifikationen`, null, '-',CURRENT_TIMESTAMP,0,0,0,CURRENT_TIMESTAMP, 0
FROM IntraSell_Dbo.`grartikel`; 
  
 /*!40000 ALTER TABLE `grartikel` ENABLE KEYS */;

 
--
-- Dumping data for table `intrasell_daten_2`.`grartikel-kategorien`
--

/*!40000 ALTER TABLE `grartikel-kategorien` DISABLE KEYS */;
-- INSERT INTO `grartikel-kategorien` (`ArtKatNr`,`Name`,`ArtKatNrParent`,`Desc`,`Template`,`Aufschlag`,`GewinnReferenz`,`Stylesheet`,`Picture`,`TemplateForProduct`,`Order`,`Land`) VALUES 
 
/*!40000 ALTER TABLE `grartikel-kategorien` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`grartikel-lagerbestand`
--

/*!40000 ALTER TABLE `grartikel-lagerbestand` DISABLE KEYS */;
DELETE FROM `grartikel-lagerbestand`; 
INSERT INTO `grartikel-lagerbestand` (`artikelLagerID`,`ArtNr`,`LagerOrt`,`LagerBestand`,`ReserviertStk`,`MaxStk`,`AktuellerWert`,`LagerKosten`,`Datum`,`Einheiten`,`GewichtBrutto`,`GewichtNetto`,`GewichtTara`)
SELECT `artikelLagerID`,`ArtNr`,`LagerOrt`,`LagerBestand`,`ReserviertStk`,`MaxStk`,`AktuellerWert`,`LagerKosten`,`Datum`,`Einheiten`,`GewichtBrutto`,`GewichtNetto`,`GewichtTara` 
FROM IntraSell_Dbo.`grartikel-lagerbestand`;  
 
/*!40000 ALTER TABLE `grartikel-lagerbestand` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`grartikel-lagerbewegung`
--

/*!40000 ALTER TABLE `grartikel-lagerbewegung` DISABLE KEYS */;
DELETE FROM `grartikel-lagerbewegung` ;
INSERT INTO `grartikel-lagerbewegung` (`Id`,`Datum`,`ArtNr`,`Eingang`,`Ausgang`,`PreisEingang`,`PreisAusgang`,`Vorgangstyp`,`Vorgangsnummer`,`LagerKosten`,`Lagerort`,`Einheiten`,`GewichtBrutto`,`GewichtNetto`,`GewichtTara`)
SELECT `Id`,`Datum`,`ArtNr`,`Eingang`,`Ausgang`,`PreisEingang`,`PreisAusgang`,`Vorgangstyp`,`Vorgangsnummer`,0,`Lagerort`,'-',0,0,0
FROM IntraSell_Dbo.`grartikel-lagerbewegung`;  
 
/*!40000 ALTER TABLE `grartikel-lagerbewegung` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`grartikel-vkpreisperselection`
--

/*!40000 ALTER TABLE `grartikel-vkpreisperselection` DISABLE KEYS */;
DELETE FROM `grartikel-vkpreisperselection`;
INSERT INTO `grartikel-vkpreisperselection` (`Id`,`Datum`,`VKPreis`,`AufschlagVKPreis`,`AufschlagEKPreis`,`PreislisteName`,`ArtKatNr`,`ArtNr`,`IDNR`,`StkAb`) 
SELECT `Id`,`Datum`,`VKPreis`,`AufschlagVKPreis`,`AufschlagEKPreis`,`PreislisteName`,`ArtKatNr`,`ArtNr`,`IDNR`,`StkAb` 
FROM IntraSell_Dbo.`grartikel-vkpreisperselection`;
 
 
/*!40000 ALTER TABLE `grartikel-vkpreisperselection` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`grland`
--

/*!40000 ALTER TABLE `grland` DISABLE KEYS */;
DELETE FROM `grland`; 
INSERT INTO `grland` (`IdNr`,`VWahl`,`Name`,`Currency`,`PLZPraefix`,`ISO2`,`ISO3`,`language_Code`)
SELECT `IdNr`,`VWahl`,`Name`,`Currency`,ISO2,`ISO2`,`ISO2`,'DEU'
FROM IntraSell_Dbo.`grland`;  
  
/*!40000 ALTER TABLE `grland` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`grplz`
--

/*!40000 ALTER TABLE `grplz` DISABLE KEYS */;
DELETE FROM `grplz`; 
INSERT INTO `grplz` (`IdNr`,`BLand`,`PLZ`,`Ort`,`TelVWahl`,`Land`)
SELECT `IdNr`,`BLand`,`PLZ`,`Ort`,`TelVWahl`,`Land`
FROM `grplz`;  
 
/*!40000 ALTER TABLE `grplz` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`grzahlungsbedingung`
--

/*!40000 ALTER TABLE `grzahlungsbedingung` DISABLE KEYS */;
DELETE FROM `grzahlungsbedingung`; 
INSERT INTO `grzahlungsbedingung` (`Nr`,`Methode`) 
SELECT `Nr`,`Methode` 
FROM IntraSell_Dbo.`grzahlungsbedingung`;  
  
/*!40000 ALTER TABLE `grzahlungsbedingung` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`grzahlungsmethode`
--

/*!40000 ALTER TABLE `grzahlungsmethode` DISABLE KEYS */;
DELETE FROM `grzahlungsmethode`; 
INSERT INTO `grzahlungsmethode` (`Methode`)
SELECT `Methode`
FROM IntraSell_Dbo.`grzahlungsmethode`;
/*!40000 ALTER TABLE `grzahlungsmethode` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`ofadressen`
--

/*!40000 ALTER TABLE `ofadressen` DISABLE KEYS */;
DELETE FROM `ofadressen` ; 
INSERT INTO `ofadressen` (`IDNR`,`Status`,`Branche`,`Briefanrede`,`Titel`,`Anrede`,`Name`,`Vorname`,`Name1`,`Firma`,`Adresse`,`Land`,`PLZ`,`Ort`,`Tel`,`Tel2`,`Fax`,`Fax2`,`Mobil`,`Email`,`Web`,`Export`,`AngelegtAn`,`MAAusen`,`MAInnen`,`Abbuchung`,`hasMenu`,`Passwort`,`nextIDNR`,`mandant`,`Geburtstag`,`UID`,`SkypeAdresse`,`MessengerAdresse`,`EUNummer`,`EUNummer1`,`EUNummer2`,`BHReferenz`)
SELECT `IDNR`,`Status`,`Branche`,`Briefanrede`,`Titel`,`Anrede`,`Name`,`Vorname`,`Name1`,`Firma`,`Adresse`,`Land`,`PLZ`,`Ort`,`Tel`,`Tel2`,`Fax`,`Fax2`,`Mobil`,`Email`,`Web`,`Export`,`AngelegtAn`,`MAAusen`,`MAInnen`,`Abbuchung`,`hasMenu`,`Passwort`,`nextIDNR`,`mandant`,`Geburtstag`,`UID`,'-','-',null,null,null,null
FROM IntraSell_Dbo.`ofadressen`;
 /*!40000 ALTER TABLE `ofadressen` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`ofadressen-kundengruppen`
--

/*!40000 ALTER TABLE `ofadressen-kundengruppen` DISABLE KEYS */;
DELETE FROM `ofadressen-kundengruppen`; 
INSERT INTO `ofadressen-kundengruppen` (`KGR`,`Gruppe`,`KundenNrKreisVon`,`KundenNrKreisBis`,`VorgangNrKreisVon`,`VorgangNrKreisBis`,`RechungenMitMWST`) 
SELECT `KGR`,`Gruppe`,`KundenNrKreisVon`,`KundenNrKreisBis`,`VorgangNrKreisVon`,`VorgangNrKreisBis`,`RechungenMitMWST`
FROM IntraSell_Dbo.`ofadressen-kundengruppen`;  
  
/*!40000 ALTER TABLE `ofadressen-kundengruppen` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`ofadressen-selection1`
--

/*!40000 ALTER TABLE `ofadressen-selection1` DISABLE KEYS */;
DELETE FROM `ofadressen-selection1`; 
INSERT INTO `ofadressen-selection1` (`IdNr`,`Selection`)
SELECT `IdNr`,`Selection`
FROM  IntraSell_Dbo.`ofadressen-selection1`;
 
/*!40000 ALTER TABLE `ofadressen-selection1` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`ofadressen-selection2`
--

/*!40000 ALTER TABLE `ofadressen-selection2` DISABLE KEYS */;
DELETE FROM `ofadressen-selection2`; 
INSERT INTO `ofadressen-selection2` (`IdNr`,`Selection`)
SELECT `IdNr`,`Selection`
FROM  IntraSell_Dbo.`ofadressen-selection2`;
 
/*!40000 ALTER TABLE `ofadressen-selection2` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`ofadressen-settings`
--

/*!40000 ALTER TABLE `ofadressen-settings` DISABLE KEYS */;
DELETE FROM `ofadressen-settings`;
INSERT INTO `ofadressen-settings` (`Id`,`IDNR`,`Kundengruppe`,`Preisliste`,`language_code`)
SELECT `Id`,`IDNR`,`Kundengruppe`,`Preisliste`,'DEU'
FROM  IntraSell_Dbo.`ofadressen-settings`;  

/*!40000 ALTER TABLE `ofadressen-settings` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`ofadressen-transportmethoden`
--

/*!40000 ALTER TABLE `ofadressen-transportmethoden` DISABLE KEYS */;
DELETE FROM `ofadressen-transportmethoden`; 
INSERT INTO `ofadressen-transportmethoden` (`IdNr`,`Methode`)
SELECT  `IdNr`,`Methode`
FROM IntraSell_Dbo.`ofadressen-transportmethoden`;



 
/*!40000 ALTER TABLE `ofadressen-transportmethoden` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`ofadressen-weitere`
--

/*!40000 ALTER TABLE `ofadressen-weitere` DISABLE KEYS */;
DELETE FROM  `ofadressen-weitere`;
INSERT INTO `ofadressen-weitere` (`ID`,`Anrede`,`Typ`,`Branche`,`IDNR`,`Land`,`Name`,`Vorname`,`Name1`,`Firma`,`Adresse`,`PLZ`,`Ort`,`Tel`,`Tel2`,`Fax`,`Mobil`,`Email`,`Web`,`AngelegtAn`,`Passwort`,`Geburtstag`,`UID`,`EUNummer`,`EUNummer1`,`EUNummer2`,`Titel`)
SELECT `ID`,`Anrede`,`Typ`,`Branche`,`IDNR`,`Land`,`Name`,`Vorname`,`Name1`,`Firma`,`Adresse`,`PLZ`,'-',`Tel`,`Tel2`,`Fax`,`Mobil`,`Email`,`Web`,`AngelegtAn`,`Passwort`,`Geburtstag`,'-','-','-','-','-'
FROM IntraSell_Dbo.`ofadressen-weitere`;


/*!40000 ALTER TABLE `ofadressen-weitere` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`ofadressen-zahlungsbedingungen`
--

/*!40000 ALTER TABLE `ofadressen-zahlungsbedingungen` DISABLE KEYS */;
DELETE FROM `ofadressen-zahlungsbedingungen` ; 
INSERT INTO `ofadressen-zahlungsbedingungen` (`IdNr`,`Bedingung`,`Standart`)
SELECT `IdNr`,`Bedingung`,0
FROM IntraSell_Dbo.`ofadressen-zahlungsbedingungen`;  
 
/*!40000 ALTER TABLE `ofadressen-zahlungsbedingungen` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`ofadressen-zahlungsmethoden`
--

/*!40000 ALTER TABLE `ofadressen-zahlungsmethoden` DISABLE KEYS */;
DELETE FROM  `ofadressen-zahlungsmethoden` ;
INSERT INTO `ofadressen-zahlungsmethoden` (`IdNr`,`Methode`,`Standart`)
SELECT `IdNr`,`Methode`,0
FROM IntraSell_Dbo.`ofadressen-zahlungsmethoden`;

/*!40000 ALTER TABLE `ofadressen-zahlungsmethoden` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`statistik_austria_warengruppen`
--

/*!40000 ALTER TABLE `statistik_austria_warengruppen` DISABLE KEYS */;
DELETE FROM  `statistik_austria_warengruppen` ;
INSERT INTO `statistik_austria_warengruppen` (`ArtNr`,`Warennr`,`Gewicht`)
SELECT distinct `ArtNr`,`Warennr`,min(`Gewicht`)
FROM IntraSell_Dbo.`statistik_austria_warengruppen`;
/*!40000 ALTER TABLE `statistik_austria_warengruppen` ENABLE KEYS */;


--
-- Dumping data for table `intrasell_daten_2`.`statistik_austria_warengruppen_uebersicht`
--

/*!40000 ALTER TABLE `statistik_austria_warengruppen_uebersicht` DISABLE KEYS */;
DELETE FROM `statistik_austria_warengruppen_uebersicht`;
INSERT INTO `statistik_austria_warengruppen_uebersicht` (`Warennr`,`Bezeichnung`)
SELECT `Warennr`,`Bezeichnung`
FROM IntraSell_Dbo.`statistik_austria_warengruppen_uebersicht`; 

/*!40000 ALTER TABLE `statistik_austria_warengruppen_uebersicht` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

COMMIT;