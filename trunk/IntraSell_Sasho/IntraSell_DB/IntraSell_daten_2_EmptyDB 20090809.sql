/*
SQLyog Community Edition- MySQL GUI v8.12 
MySQL - 5.1.37-community : Database - intrasell_daten_2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`intrasell_daten_2` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `intrasell_daten_2`;

/*Table structure for table `addinobjects` */

DROP TABLE IF EXISTS `addinobjects`;

CREATE TABLE `addinobjects` (
  `AddInName` varchar(50) NOT NULL,
  `ObjName` varchar(50) NOT NULL,
  `ObjType` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Index_2` (`AddInName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `addinobjects` */

LOCK TABLES `addinobjects` WRITE;

insert  into `addinobjects`(`AddInName`,`ObjName`,`ObjType`,`ID`) values ('Sparkasse/Paypal','DataAccessPages',3,1),('Sparkasse/Paypal','Forms',3,2),('Sparkasse/Paypal','Modules',3,3),('Sparkasse/Paypal','Reports',3,4),('Sparkasse/Paypal','Scripts',3,5),('Sparkasse/Paypal','SysRel',3,6),('Sparkasse/Paypal','AccessLayout',-32757,7),('Sparkasse/Paypal','SummaryInfo',-32757,8),('Sparkasse/Paypal','UserDefined',-32757,9),('Sparkasse/Paypal','addInSparkasse_NachnahmeErfassung',-32768,10),('Sparkasse/Paypal','addInSparkasse_NachnameErf_Eingang',-32768,11),('Sparkasse/Paypal','addInSparkasse_functionsImpEx',-32761,12),('Sparkasse/Paypal','addInSparkasse_exportBMDBuchungen',-32766,13),('Sparkasse/Paypal','_export_BMD_Zahlungen',5,14),('Sparkasse/Paypal','_export_BMD_Zahlungen_2',5,15),('Sparkasse/Paypal','~sq_caddInSparkasse_NachnahmeErfassung~sq_cAuszugs',5,16),('Sparkasse/Paypal','~sq_caddInSparkasse_NachnahmeErfassung~sq_cNachnam',5,17),('Sparkasse/Paypal','~sq_faddInSparkasse_NachnahmeErfassung',5,18),('Sparkasse/Paypal','addInSparkasse_VerfuegbareRechnungen',5,19),('Sparkasse/Paypal','nachnameErf_Check',5,20),('Sparkasse/Paypal','nachnameErf_insertNN',5,21),('Sparkasse/Paypal','MSysObjects',1,22),('Sparkasse/Paypal','MSysACEs',1,23),('Sparkasse/Paypal','MSysQueries',1,24),('Sparkasse/Paypal','MSysRelationships',1,25),('Sparkasse/Paypal','buchrech-artikel',4,26),('Sparkasse/Paypal','buchrechnung',4,27),('Sparkasse/Paypal','grartikel',4,28),('Sparkasse/Paypal','grbanken',4,29),('Sparkasse/Paypal','grland',4,30),('Sparkasse/Paypal','grplz',4,31),('Sparkasse/Paypal','impExBMD_KundengruppenKonten',1,32),('Sparkasse/Paypal','impexBMD_Vars',1,33),('Sparkasse/Paypal','MSysAccessObjects',1,34),('Sparkasse/Paypal','MSysAccessXML',1,35),('Sparkasse/Paypal','NachnameErf_Eingang',1,36),('Sparkasse/Paypal','NachnameErf_Vars',1,37),('Sparkasse/Paypal','ofadressen',4,38),('Sparkasse/Paypal','ofadressenbanken',4,39),('Sparkasse/Paypal','ofadressen-kundengruppen',4,40),('Sparkasse/Paypal','ofadressen-settings',4,41),('Sparkasse/Paypal','ofvars',4,42),('Sparkasse/Paypal','Tables',3,43),('Sparkasse/Paypal','Databases',3,44),('Sparkasse/Paypal','Relationships',3,45),('Sparkasse/Paypal','MSysDb',2,46),('Nachnahme','DataAccessPages',3,47),('Nachnahme','Forms',3,48),('Nachnahme','Modules',3,49),('Nachnahme','Reports',3,50),('Nachnahme','Scripts',3,51),('Nachnahme','SysRel',3,52),('Nachnahme','AccessLayout',-32757,53),('Nachnahme','SummaryInfo',-32757,54),('Nachnahme','UserDefined',-32757,55),('Nachnahme','NachnameErf_Eingang',-32768,56),('Nachnahme','NachnameErfassung',-32768,57),('Nachnahme','AddInNachnahme_functionsImpEx',-32761,58),('Nachnahme','testReport',-32764,59),('Nachnahme','exportBMDBuchungen',-32766,60),('Nachnahme','_export_BMD_Zahlungen',5,61),('Nachnahme','_export_BMD_Zahlungen_2',5,62),('Nachnahme','~sq_cNachnameErfassung~sq_cAuszugsGruppe',5,63),('Nachnahme','~sq_cNachnameErfassung~sq_cNachnameErf_Eingang',5,64),('Nachnahme','~sq_fNachnameErf_Eingang',5,65),('Nachnahme','~sq_fNachnameErfassung',5,66),('Nachnahme','nachnameErf_insertNN',5,67),('Nachnahme','nachnameErf_Check',5,68),('Nachnahme','MSysObjects',1,69),('Nachnahme','MSysACEs',1,70),('Nachnahme','MSysQueries',1,71),('Nachnahme','MSysRelationships',1,72),('Nachnahme','buchrech-artikel',4,73),('Nachnahme','buchrechnung',4,74),('Nachnahme','grartikel',4,75),('Nachnahme','grbanken',4,76),('Nachnahme','grland',4,77),('Nachnahme','grplz',4,78),('Nachnahme','impExBMD_KundengruppenKonten',1,79),('Nachnahme','impexBMD_Vars',1,80),('Nachnahme','MSysAccessObjects',1,81),('Nachnahme','MSysAccessXML',1,82),('Nachnahme','NachnameErf_Eingang',1,83),('Nachnahme','nachnameErf_Vars',1,84),('Nachnahme','ofadressen',4,85),('Nachnahme','ofadressenbanken',4,86),('Nachnahme','ofadressen-kundengruppen',4,87),('Nachnahme','ofadressen-settings',4,88),('Nachnahme','ofvars',4,89),('Nachnahme','Tables',3,90),('Nachnahme','Databases',3,91),('Nachnahme','Relationships',3,92),('Nachnahme','MSysDb',2,93),('BMD','DataAccessPages',3,94),('BMD','Forms',3,95),('BMD','Modules',3,96),('BMD','Reports',3,97),('BMD','Scripts',3,98),('BMD','SysRel',3,99),('BMD','AccessLayout',-32757,100),('BMD','SummaryInfo',-32757,101),('BMD','UserDefined',-32757,102),('BMD','impExportBMD',-32768,103),('BMD','exportBMDBuchungen',-32766,104),('BMD','_export_BMD_Buchungen',5,105),('BMD','_export_BMD_Buchungen_2',5,106),('BMD','_export_BMD_Buchungen_3',5,107),('BMD','_export_BMD_Buchungen_alle',5,108),('BMD','_export_BMD_Stammdaten',5,109),('BMD','~sq_fimpExportBMD',5,110),('BMD','AddInBMD_functionsImpEx',-32761,111),('BMD','test',5,112),('BMD','MSysObjects',1,113),('BMD','MSysACEs',1,114),('BMD','MSysQueries',1,115),('BMD','MSysRelationships',1,116),('BMD','impExBMD_KundengruppenKonten',1,117),('BMD','impexBMD_Vars',1,118),('BMD','MSysAccessObjects',1,119),('BMD','MSysAccessXML',1,120),('BMD','buchrech-artikel',4,121),('BMD','buchrechnung',4,122),('BMD','grartikel',4,123),('BMD','grbanken',4,124),('BMD','grland',4,125),('BMD','grplz',4,126),('BMD','ofadressen',4,127),('BMD','ofadressenbanken',4,128),('BMD','ofadressen-kundengruppen',4,129),('BMD','ofadressen-settings',4,130),('BMD','ofvars',4,131),('BMD','Tables',3,132),('BMD','Databases',3,133),('BMD','Relationships',3,134),('BMD','MSysDb',2,135),('Barverkauf','SummaryInfo',-32757,849),('Barverkauf','UserDefined',-32757,850),('Barverkauf','Forms',3,851),('Barverkauf','Reports',3,852),('Barverkauf','Scripts',3,853),('Barverkauf','Modules',3,854),('Barverkauf','SysRel',3,855),('Barverkauf','DataAccessPages',3,856),('Barverkauf','AccessLayout',-32757,857),('Barverkauf','AddIn_Bar_buchAdresse-Kopf',-32768,858),('Barverkauf','AddIn_Bar_buchRech-Artikel',-32768,859),('Barverkauf','AddIn_Bar_buchRechnungBar',-32768,860),('Barverkauf','AddIn_Bar_buchVorgaengeEigenschaften',-32768,861),('Barverkauf','MSysObjects',1,870),('Barverkauf','MSysACEs',1,871),('Barverkauf','MSysQueries',1,872),('Barverkauf','MSysRelationships',1,873),('Barverkauf','MSysAccessObjects',1,874),('Barverkauf','MSysAccessXML',1,875),('Barverkauf','Tables',3,876),('Barverkauf','Databases',3,877),('Barverkauf','Relationships',3,878),('Barverkauf','MSysDb',2,879),('Barverkauf','Modul1',-32761,955),('Barverkauf','Modul2',-32761,956),('Barverkauf','buchangebot',4,969),('Barverkauf','buchangebot-artikel',4,970),('Barverkauf','buchauftrag',4,971),('Barverkauf','buchauftrag-artikel',4,972),('Barverkauf','buchgutschein',4,973),('Barverkauf','buchgutschrift',4,974),('Barverkauf','buchgutschrift-artikel',4,975),('Barverkauf','buchkassabuch',4,976),('Barverkauf','buchlieferschein',4,977),('Barverkauf','buchlieferschein-artikel',4,978),('Barverkauf','buchrech-artikel',4,979),('Barverkauf','buchrechnung',4,980),('Barverkauf','buchruestschein',4,981),('Barverkauf','buchruestschein-artikel',4,982),('Barverkauf','buchseriennummer',4,983),('Barverkauf','buchsetartikel',4,984),('Barverkauf','buchvorgaenge',4,985),('Barverkauf','buchvorgaengeausdrucke',4,986),('Barverkauf','buchvorgaengeausdruckelog',4,987),('Barverkauf','buchvorgaengeeigenschaften',4,988),('Barverkauf','buchvorgaengestatus',4,989),('Barverkauf','buchvorgang-artikeldetaillager',4,990),('Barverkauf','buchvorgangeigenschaft',4,991),('Barverkauf','grartikel',4,992),('Barverkauf','grartikel-kategorien',4,993),('Barverkauf','grartikel-lagerbestand',4,994),('Barverkauf','grartikel-lagerbewegung',4,995),('Barverkauf','grartikel-lagerort',4,996),('Barverkauf','grland',4,997),('Barverkauf','grplz',4,998),('Barverkauf','lagerlagerbuchung',4,999),('Barverkauf','ofadressen',4,1002),('Barverkauf','ofadressen1',4,1003),('Barverkauf','ofadressenbanken',4,1004),('Barverkauf','ofadressen-bonuspunkte',4,1005),('Barverkauf','ofadressen-kundengruppen',4,1006),('Barverkauf','ofadressen-selection1',4,1007),('Barverkauf','ofadressen-selection2',4,1008),('Barverkauf','ofadressen-seriendruck',4,1009),('Barverkauf','ofadressen-settings',4,1010),('Barverkauf','ofadressen-transportmethoden',4,1011),('Barverkauf','ofadressen-weitere',4,1012),('Barverkauf','ofadressen-zahlungsbedingungen',4,1013),('Barverkauf','ofadressen-zahlungsmethoden',4,1014),('Barverkauf','ofvars',4,1015),('Arfaian','DataAccessPages',3,2258),('Arfaian','Forms',3,2259),('Arfaian','Modules',3,2260),('Arfaian','Reports',3,2261),('Arfaian','Scripts',3,2262),('Arfaian','SysRel',3,2263),('Arfaian','AccessLayout',-32757,2264),('Arfaian','SummaryInfo',-32757,2265),('Arfaian','UserDefined',-32757,2266),('Arfaian','buchRech-Artikel_arfaian_2',-32764,2267),('Arfaian','buchRech-Lieferadresse',-32764,2268),('Arfaian','buchRechnung_arfaian_2',-32764,2269),('Arfaian','Admin',-32758,2270),('Arfaian','MSysObjects',1,2271),('Arfaian','MSysACEs',1,2272),('Arfaian','MSysQueries',1,2273),('Arfaian','MSysRelationships',1,2274),('Arfaian','MSysAccessStorage',1,2275),('Arfaian','MSysAccessXML',1,2276),('Arfaian','MSysCmdbars',1,2277),('Arfaian','MSysIMEXColumns',1,2278),('Arfaian','MSysIMEXSpecs',1,2279),('Arfaian','Tables',3,2280),('Arfaian','Databases',3,2281),('Arfaian','Relationships',3,2282),('Arfaian','MSysDb',2,2283),('Arfaian','buchRech-Lieferadresse_arfaian_2',-32764,2294),('Arfaian','qry_Adressfelder-Weitere',5,2323),('Arfaian','MSysNavPaneObjectIDs',1,2800),('GLS','DataAccessPages',3,4169),('GLS','Forms',3,4170),('GLS','Modules',3,4171),('GLS','Reports',3,4172),('GLS','Scripts',3,4173),('GLS','SysRel',3,4174),('GLS','AccessLayout',-32757,4175),('GLS','SummaryInfo',-32757,4176),('GLS','UserDefined',-32757,4177),('GLS','addIn_GLS_NachnameErfassung',-32768,4178),('GLS','addIn_GLS_functionsImpEx',-32761,4179),('GLS','Makro1',-32766,4180),('GLS','addIn_GLS_export_BMD_Zahlungen',5,4181),('GLS','addIn_GLS_export_BMD_Zahlungen_2',5,4182),('GLS','addin_gls_export_GLS_File',5,4183),('GLS','addin_gls_export_GLS_RechnungSumme',5,4184),('GLS','addin_gls_make_Adressfelder_und_Weitere',5,4185),('GLS','addIn_GLS_nachnameErf_Check',5,4186),('GLS','addIn_GLS_nachnameErf_insertNN',5,4187),('GLS','addin_gls_qry_Adressfelder',5,4188),('GLS','addin_gls_qry_Adressfelder_und_Weitere_slow',5,4189),('GLS','addin_gls_qry_Adressfelder-Weitere',5,4190),('GLS','MSysObjects',1,4191),('GLS','MSysACEs',1,4192),('GLS','MSysQueries',1,4193),('GLS','MSysRelationships',1,4194),('GLS','addin_gls_Email_log_ok',1,4195),('GLS','addIn_GLS_KundengruppenKonten',1,4196),('GLS','addIn_GLS_NachnameErf_Eingang',1,4197),('GLS','addIn_GLS_nachnameErf_Vars',1,4198),('GLS','addin_GLS_qry_Adressfelder_und_Weitere',1,4199),('GLS','addIn_GLS_Vars',1,4200),('GLS','buchrech-artikel',4,4201),('GLS','buchrechnung',4,4202),('GLS','buchvorgaengeeigenschaften',4,4203),('GLS','grartikel',4,4204),('GLS','grbanken',4,4205),('GLS','grland',4,4206),('GLS','grplz',4,4207),('GLS','MSysAccessObjects',1,4208),('GLS','MSysAccessXML',1,4209),('GLS','MSysIMEXColumns',1,4210),('GLS','MSysIMEXSpecs',1,4211),('GLS','ofadressen',4,4212),('GLS','ofadressenbanken',4,4213),('GLS','ofadressen-kundengruppen',4,4214),('GLS','ofadressen-settings',4,4215),('GLS','ofadressen-weitere',4,4216),('GLS','ofvars',4,4217),('GLS','Tables',3,4218),('GLS','Databases',3,4219),('GLS','Relationships',3,4220),('GLS','MSysDb',2,4221),('TradeBoard','DataAccessPages',3,4419),('TradeBoard','Forms',3,4420),('TradeBoard','Modules',3,4421),('TradeBoard','Reports',3,4422),('TradeBoard','Scripts',3,4423),('TradeBoard','SysRel',3,4424),('TradeBoard','AccessLayout',-32757,4425),('TradeBoard','SummaryInfo',-32757,4426),('TradeBoard','UserDefined',-32757,4427),('TradeBoard','tradeBoardCheckliste',-32768,4428),('TradeBoard','tradeBoardFilter',-32768,4429),('TradeBoard','tradeBoardForm',-32768,4430),('TradeBoard','tradeBoardKundenAnfrage',-32768,4431),('TradeBoard','tradeBoardKundenAngebote',-32768,4432),('TradeBoard','tradeBoardLieferantenAnfrage',-32768,4433),('TradeBoard','tradeBoardLieferantenAngebotErfassen',-32768,4434),('TradeBoard','tradeBoardLieferantenAngebotFoto',-32768,4435),('TradeBoard','tradeBoardPlanungsboard',-32768,4436),('TradeBoard','tradeBoardVorlagenMerge',-32768,4437),('TradeBoard','transportAdresse',-32768,4438),('TradeBoard','transportAdresseWaehlen',-32768,4439),('TradeBoard','transportAuftrag',-32768,4440),('TradeBoard','transportAuftrag_Beladung',-32768,4441),('TradeBoard','transportAuftrag_Entladung',-32768,4442),('TradeBoard','transportDokumente',-32768,4443),('TradeBoard','transportLadezeiten',-32768,4444),('TradeBoard','transportLieferantGruppeSubform',-32768,4445),('TradeBoard','transportLieferantWaehlen',-32768,4446),('TradeBoard','functionsTransport',-32761,4447),('TradeBoard','tmpTradeBoardAbfrage',5,4448),('TradeBoard','tradeBoard_ErstelleTMPLieferantenAngebotTabelle',5,4449),('TradeBoard','tradeBoard_GeschaefteEinstellen',5,4450),('TradeBoard','tradeBoard_ImportiereTMPLieferantenAngebotTabelle',5,4451),('TradeBoard','tradeBoard_LieferantenAuftragVerbinden',5,4452),('TradeBoard','tradeBoard_LieferantenAuftragVerbinden_Teil2',5,4453),('TradeBoard','tradeBoard_LieferscheineVerbinden',5,4454),('TradeBoard','tradeBoard_LieferscheineVerbinden_VerladeGewicht',5,4455),('TradeBoard','tradeBoard_Liste_Web',5,4456),('TradeBoard','tradeBoard_RechnungenVerbinden',5,4457),('TradeBoard','tradeBoard_VerladeGewicht',5,4458),('TradeBoard','tradeBoardAbfrage',5,4459),('TradeBoard','tradeBoardAngebotZuAuftrag',5,4460),('TradeBoard','tradeBoardGeschaeftCheckAnzahl',5,4461),('TradeBoard','tradeBoardGeschaeftCheckAnzahlErledigt',5,4462),('TradeBoard','tradeBoardGeschaeftCheckUebersicht',5,4463),('TradeBoard','tradeBoardLieferantenPreisListe',5,4464),('TradeBoard','tradeBoardListe_ETA',5,4465),('TradeBoard','tradeBoardListe_ETD',5,4466),('TradeBoard','tradeBoardListe_Incoterm',5,4467),('TradeBoard','tradeBoardListe_Land',5,4468),('TradeBoard','tradeBoardListe_Menge',5,4469),('TradeBoard','tradeBoardListe_Packung',5,4470),('TradeBoard','tradeBoardListe_Plant',5,4471),('TradeBoard','tradeBoardListe_Qualitaet',5,4472),('TradeBoard','transportListe_Anforderung',5,4473),('TradeBoard','transportListe_ArtWare',5,4474),('TradeBoard','transportListe_Grenzübergang',5,4475),('TradeBoard','transportListe_LKWArt',5,4476),('TradeBoard','transportListe_Paletten',5,4477),('TradeBoard','transportListe_Route',5,4478),('TradeBoard','transportListe_Status',5,4479),('TradeBoard','transportListe_Temperatur',5,4480),('TradeBoard','transportListe_Versicherung',5,4481),('TradeBoard','transportListe_Zoll',5,4482),('TradeBoard','MSysObjects',1,4483),('TradeBoard','MSysACEs',1,4484),('TradeBoard','MSysQueries',1,4485),('TradeBoard','MSysRelationships',1,4486),('TradeBoard','buchangebot',4,4487),('TradeBoard','buchangebot-artikel',4,4488),('TradeBoard','buchauftrag',4,4489),('TradeBoard','buchauftrag-artikel',4,4490),('TradeBoard','buchfirmenkonto',4,4491),('TradeBoard','buchgutschein',4,4492),('TradeBoard','buchgutschrift',4,4493),('TradeBoard','buchgutschrift-artikel',4,4494),('TradeBoard','buchkassabuch',4,4495),('TradeBoard','buchlieferantauftrag',4,4496),('TradeBoard','buchlieferantauftrag-artikel',4,4497),('TradeBoard','buchlieferschein',4,4498),('TradeBoard','buchlieferschein-artikel',4,4499),('TradeBoard','buchmahnungshistorie',4,4500),('TradeBoard','buchrech-artikel',4,4501),('TradeBoard','buchrechnung',4,4502),('TradeBoard','buchretourwaren',4,4503),('TradeBoard','buchretourwaren-artikel',4,4504),('TradeBoard','buchruestschein',4,4505),('TradeBoard','buchruestschein-artikel',4,4506),('TradeBoard','buchseriennummer',4,4507),('TradeBoard','buchsetartikel',4,4508),('TradeBoard','buchvorgaenge',4,4509),('TradeBoard','buchvorgaengeausdrucke',4,4510),('TradeBoard','buchvorgaengeausdruckelog',4,4511),('TradeBoard','buchvorgaengeeigenschaften',4,4512),('TradeBoard','buchvorgaengestatus',4,4513),('TradeBoard','buchvorgang-artikeldetaillager',4,4514),('TradeBoard','buchvorgangeigenschaft',4,4515),('TradeBoard','calcsheet',4,4516),('TradeBoard','calcsheetmitarbeiterprovision',4,4517),('TradeBoard','calcsheetpositions',4,4518),('TradeBoard','granrede',4,4519),('TradeBoard','grartikel',4,4520),('TradeBoard','grartikel-einheiten',4,4521),('TradeBoard','grartikel-htmlinfo',4,4522),('TradeBoard','grartikel-itemtrackinghistory',4,4523),('TradeBoard','grartikel-kategorien',4,4524),('TradeBoard','grartikel-kategorien-verwandte',4,4525),('TradeBoard','grartikel-keywords',4,4526),('TradeBoard','grartikel-keywordstoproducts',4,4527),('TradeBoard','grartikel-lagerbestand',4,4528),('TradeBoard','grartikel-lagerbewegung',4,4529),('TradeBoard','grartikel-lagerort',4,4530),('TradeBoard','grartikel-orderrabatt',4,4531),('TradeBoard','grartikel-reviews',4,4532),('TradeBoard','grartikel-staffelpreise',4,4533),('TradeBoard','grartikel-vertriebskosten',4,4534),('TradeBoard','grartikel-verwandteartikel',4,4535),('TradeBoard','grartikel-vkpreisperselection',4,4536),('TradeBoard','grbanken',4,4537),('TradeBoard','grblz',4,4538),('TradeBoard','grbranchen',4,4539),('TradeBoard','grbranchenkeywords',4,4540),('TradeBoard','grland',4,4541),('TradeBoard','grlieferungbedingungen',4,4542),('TradeBoard','grmwst',4,4543),('TradeBoard','grplz',4,4544),('TradeBoard','grselection1',4,4545),('TradeBoard','grselection2',4,4546),('TradeBoard','grservices',4,4547),('TradeBoard','grtransportmethode',4,4548),('TradeBoard','grwaehrung',4,4549),('TradeBoard','grzahlungsbedingung',4,4550),('TradeBoard','grzahlungsmethode',4,4551),('TradeBoard','impetb',4,4552),('TradeBoard','impexlieferantbestellung',4,4553),('TradeBoard','impkorrekt',4,4554),('TradeBoard','impkorrekt_rubrik_suchtext',4,4555),('TradeBoard','impkundendaten',4,4556),('TradeBoard','lagerlagerbuchung',4,4557),('TradeBoard','language',4,4558),('TradeBoard','lieferantenadressen',4,4559),('TradeBoard','lieferantenanrufe',4,4560),('TradeBoard','lieferantenartikel-preise',4,4561),('TradeBoard','lieferantenbanken',4,4562),('TradeBoard','login',4,4563),('TradeBoard','mailstosend',4,4564),('TradeBoard','MSysAccessObjects',1,4565),('TradeBoard','MSysAccessXML',1,4566),('TradeBoard','ofadressen',4,4567),('TradeBoard','ofadressenbanken',4,4568),('TradeBoard','ofadressen-bonuspunkte',4,4569),('TradeBoard','ofadressen-kundengruppen',4,4570),('TradeBoard','ofadressen-selection1',4,4571),('TradeBoard','ofadressen-selection2',4,4572),('TradeBoard','ofadressen-seriendruck',4,4573),('TradeBoard','ofadressen-settings',4,4574),('TradeBoard','ofadressen-transportmethoden',4,4575),('TradeBoard','ofadressen-weitere',4,4576),('TradeBoard','ofadressen-zahlungsbedingungen',4,4577),('TradeBoard','ofadressen-zahlungsmethoden',4,4578),('TradeBoard','ofanrufe',4,4579),('TradeBoard','ofasppartner',4,4580),('TradeBoard','ofdictionary',4,4581),('TradeBoard','ofdictionarysets',4,4582),('TradeBoard','offotos',4,4583),('TradeBoard','ofkorespondenz',4,4584),('TradeBoard','ofmitarbeiter',4,4585),('TradeBoard','oftermine',4,4586),('TradeBoard','oftips',4,4587),('TradeBoard','ofvars',4,4588),('TradeBoard','tables',4,4589),('TradeBoard','tradeboardchecklist',4,4590),('TradeBoard','tradeboardchecks',4,4591),('TradeBoard','tradeboardgeschaeft',4,4592),('TradeBoard','tradeboardkundenanfrage',4,4593),('TradeBoard','tradeboardlieferantenanfrage',4,4594),('TradeBoard','tradeboardlieferantenanfrageartikel',4,4595),('TradeBoard','tradeboardlieferantenangebot',4,4596),('TradeBoard','tradeboardlieferantenangebotfoto',4,4597),('TradeBoard','translations',4,4598),('TradeBoard','transportanfrage',4,4599),('TradeBoard','transportauftrag',4,4600),('TradeBoard','transportauftrag_beladung',4,4601),('TradeBoard','transportauftrag_entladung',4,4602),('TradeBoard','transportauftragdokumente',4,4603),('TradeBoard','transportdokumente',4,4604),('TradeBoard','transportgruppe',4,4605),('TradeBoard','transportincotermcode',4,4606),('TradeBoard','transportladezeiten',4,4607),('TradeBoard','transportladunginstruktionen',4,4608),('TradeBoard','transportlieferantgruppe',4,4609),('TradeBoard','Tables',3,4610),('TradeBoard','Databases',3,4611),('TradeBoard','Relationships',3,4612),('TradeBoard','MSysDb',2,4613),('Arfaian','DataAccessPages',3,5406),('Arfaian','Forms',3,5407),('Arfaian','Modules',3,5408),('Arfaian','Reports',3,5409),('Arfaian','Scripts',3,5410),('Arfaian','SysRel',3,5411),('Arfaian','AccessLayout',-32757,5412),('Arfaian','SummaryInfo',-32757,5413),('Arfaian','UserDefined',-32757,5414),('Arfaian','buchRech-Artikel_arfaian_2',-32764,5415),('Arfaian','buchRech-Lieferadresse_arfaian_2',-32764,5416),('Arfaian','buchRechnung_arfaian_2',-32764,5417),('Arfaian','Admin',-32758,5418),('Arfaian','qry_Adressfelder-Weitere',5,5419),('Arfaian','MSysObjects',1,5420),('Arfaian','MSysACEs',1,5421),('Arfaian','MSysQueries',1,5422),('Arfaian','MSysRelationships',1,5423),('Arfaian','MSysAccessStorage',1,5424),('Arfaian','MSysAccessXML',1,5425),('Arfaian','MSysCmdbars',1,5426),('Arfaian','MSysIMEXColumns',1,5427),('Arfaian','MSysIMEXSpecs',1,5428),('Arfaian','MSysNavPaneObjectIDs',1,5429),('Arfaian','Tables',3,5430),('Arfaian','Databases',3,5431),('Arfaian','Relationships',3,5432),('Arfaian','MSysDb',2,5433),('Barverkauf','DataAccessPages',3,5434),('Barverkauf','Forms',3,5435),('Barverkauf','Modules',3,5436),('Barverkauf','Reports',3,5437),('Barverkauf','Scripts',3,5438),('Barverkauf','SysRel',3,5439),('Barverkauf','AccessLayout',-32757,5440),('Barverkauf','SummaryInfo',-32757,5441),('Barverkauf','UserDefined',-32757,5442),('Barverkauf','AddIn_Bar_buchAdresse-Kopf',-32768,5443),('Barverkauf','AddIn_Bar_buchRech-Artikel',-32768,5444),('Barverkauf','AddIn_Bar_buchRechnungBar',-32768,5445),('Barverkauf','AddIn_Bar_buchVorgaengeEigenschaften',-32768,5446),('Barverkauf','MSysObjects',1,5447),('Barverkauf','MSysACEs',1,5448),('Barverkauf','MSysQueries',1,5449),('Barverkauf','MSysRelationships',1,5450),('Barverkauf','MSysAccessObjects',1,5451),('Barverkauf','MSysAccessXML',1,5452),('Barverkauf','buchangebot',4,5453),('Barverkauf','buchangebot-artikel',4,5454),('Barverkauf','buchauftrag',4,5455),('Barverkauf','buchauftrag-artikel',4,5456),('Barverkauf','buchgutschein',4,5457),('Barverkauf','buchgutschrift',4,5458),('Barverkauf','buchgutschrift-artikel',4,5459),('Barverkauf','buchkassabuch',4,5460),('Barverkauf','buchlieferschein',4,5461),('Barverkauf','buchlieferschein-artikel',4,5462),('Barverkauf','buchrech-artikel',4,5463),('Barverkauf','buchrechnung',4,5464),('Barverkauf','buchruestschein',4,5465),('Barverkauf','buchruestschein-artikel',4,5466),('Barverkauf','buchseriennummer',4,5467),('Barverkauf','buchsetartikel',4,5468),('Barverkauf','buchvorgaenge',4,5469),('Barverkauf','buchvorgaengeausdrucke',4,5470),('Barverkauf','buchvorgaengeausdruckelog',4,5471),('Barverkauf','buchvorgaengeeigenschaften',4,5472),('Barverkauf','buchvorgaengestatus',4,5473),('Barverkauf','buchvorgang-artikeldetaillager',4,5474),('Barverkauf','buchvorgangeigenschaft',4,5475),('Barverkauf','grartikel',4,5476),('Barverkauf','grartikel-kategorien',4,5477),('Barverkauf','grartikel-lagerbestand',4,5478),('Barverkauf','grartikel-lagerbewegung',4,5479),('Barverkauf','grartikel-lagerort',4,5480),('Barverkauf','grland',4,5481),('Barverkauf','grplz',4,5482),('Barverkauf','lagerlagerbuchung',4,5483),('Barverkauf','ofadressen',4,5484),('Barverkauf','ofadressen1',4,5485),('Barverkauf','ofadressenbanken',4,5486),('Barverkauf','ofadressen-bonuspunkte',4,5487),('Barverkauf','ofadressen-kundengruppen',4,5488),('Barverkauf','ofadressen-selection1',4,5489),('Barverkauf','ofadressen-selection2',4,5490),('Barverkauf','ofadressen-seriendruck',4,5491),('Barverkauf','ofadressen-settings',4,5492),('Barverkauf','ofadressen-transportmethoden',4,5493),('Barverkauf','ofadressen-weitere',4,5494),('Barverkauf','ofadressen-zahlungsbedingungen',4,5495),('Barverkauf','ofadressen-zahlungsmethoden',4,5496),('Barverkauf','ofvars',4,5497),('Barverkauf','Tables',3,5498),('Barverkauf','Databases',3,5499),('Barverkauf','Relationships',3,5500),('Barverkauf','MSysDb',2,5501),('BMD','DataAccessPages',3,5502),('BMD','Forms',3,5503),('BMD','Modules',3,5504),('BMD','Reports',3,5505),('BMD','Scripts',3,5506),('BMD','SysRel',3,5507),('BMD','AccessLayout',-32757,5508),('BMD','SummaryInfo',-32757,5509),('BMD','UserDefined',-32757,5510),('BMD','impExportBMD',-32768,5511),('BMD','AddInBMD_functionsImpEx',-32761,5512),('BMD','exportBMDBuchungen',-32766,5513),('BMD','_export_BMD_Buchungen',5,5514),('BMD','_export_BMD_Buchungen_2',5,5515),('BMD','_export_BMD_Buchungen_3',5,5516),('BMD','_export_BMD_Buchungen_alle',5,5517),('BMD','_export_BMD_Stammdaten',5,5518),('BMD','test',5,5519),('BMD','MSysObjects',1,5520),('BMD','MSysACEs',1,5521),('BMD','MSysQueries',1,5522),('BMD','MSysRelationships',1,5523),('BMD','buchrech-artikel',4,5524),('BMD','buchrechnung',4,5525),('BMD','grartikel',4,5526),('BMD','grbanken',4,5527),('BMD','grland',4,5528),('BMD','grplz',4,5529),('BMD','impExBMD_KundengruppenKonten',1,5530),('BMD','impexBMD_Vars',1,5531),('BMD','MSysAccessObjects',1,5532),('BMD','MSysAccessXML',1,5533),('BMD','ofadressen',4,5534),('BMD','ofadressenbanken',4,5535),('BMD','ofadressen-kundengruppen',4,5536),('BMD','ofadressen-settings',4,5537),('BMD','ofvars',4,5538),('BMD','Tables',3,5539),('BMD','Databases',3,5540),('BMD','Relationships',3,5541),('BMD','MSysDb',2,5542),('Barverkauf','DataAccessPages',3,5543),('Barverkauf','Forms',3,5544),('Barverkauf','Modules',3,5545),('Barverkauf','Reports',3,5546),('Barverkauf','Scripts',3,5547),('Barverkauf','SysRel',3,5548),('Barverkauf','AccessLayout',-32757,5549),('Barverkauf','SummaryInfo',-32757,5550),('Barverkauf','UserDefined',-32757,5551),('Barverkauf','AddIn_Bar_buchAdresse-Kopf',-32768,5552),('Barverkauf','AddIn_Bar_buchRech-Artikel',-32768,5553),('Barverkauf','AddIn_Bar_buchRechnungBar',-32768,5554),('Barverkauf','AddIn_Bar_buchVorgaengeEigenschaften',-32768,5555),('Barverkauf','MSysObjects',1,5556),('Barverkauf','MSysACEs',1,5557),('Barverkauf','MSysQueries',1,5558),('Barverkauf','MSysRelationships',1,5559),('Barverkauf','buchangebot',4,5560),('Barverkauf','buchangebot-artikel',4,5561),('Barverkauf','buchauftrag',4,5562),('Barverkauf','buchauftrag-artikel',4,5563),('Barverkauf','buchgutschein',4,5564),('Barverkauf','buchgutschrift',4,5565),('Barverkauf','buchgutschrift-artikel',4,5566),('Barverkauf','buchkassabuch',4,5567),('Barverkauf','buchlieferschein',4,5568),('Barverkauf','buchlieferschein-artikel',4,5569),('Barverkauf','buchrech-artikel',4,5570),('Barverkauf','buchrechnung',4,5571),('Barverkauf','buchruestschein',4,5572),('Barverkauf','buchruestschein-artikel',4,5573),('Barverkauf','buchseriennummer',4,5574),('Barverkauf','buchsetartikel',4,5575),('Barverkauf','buchvorgaenge',4,5576),('Barverkauf','buchvorgaengeausdrucke',4,5577),('Barverkauf','buchvorgaengeausdruckelog',4,5578),('Barverkauf','buchvorgaengeeigenschaften',4,5579),('Barverkauf','buchvorgaengestatus',4,5580),('Barverkauf','buchvorgang-artikeldetaillager',4,5581),('Barverkauf','buchvorgangeigenschaft',4,5582),('Barverkauf','grartikel',4,5583),('Barverkauf','grartikel-kategorien',4,5584),('Barverkauf','grartikel-lagerbestand',4,5585),('Barverkauf','grartikel-lagerbewegung',4,5586),('Barverkauf','grartikel-lagerort',4,5587),('Barverkauf','grland',4,5588),('Barverkauf','grplz',4,5589),('Barverkauf','lagerlagerbuchung',4,5590),('Barverkauf','MSysAccessObjects',1,5591),('Barverkauf','MSysAccessXML',1,5592),('Barverkauf','ofadressen',4,5593),('Barverkauf','ofadressen1',4,5594),('Barverkauf','ofadressenbanken',4,5595),('Barverkauf','ofadressen-bonuspunkte',4,5596),('Barverkauf','ofadressen-kundengruppen',4,5597),('Barverkauf','ofadressen-selection1',4,5598),('Barverkauf','ofadressen-selection2',4,5599),('Barverkauf','ofadressen-seriendruck',4,5600),('Barverkauf','ofadressen-settings',4,5601),('Barverkauf','ofadressen-transportmethoden',4,5602),('Barverkauf','ofadressen-weitere',4,5603),('Barverkauf','ofadressen-zahlungsbedingungen',4,5604),('Barverkauf','ofadressen-zahlungsmethoden',4,5605),('Barverkauf','ofvars',4,5606),('Barverkauf','Tables',3,5607),('Barverkauf','Databases',3,5608),('Barverkauf','Relationships',3,5609),('Barverkauf','MSysDb',2,5610),('Barverkauf','DataAccessPages',3,5611),('Barverkauf','Forms',3,5612),('Barverkauf','Modules',3,5613),('Barverkauf','Reports',3,5614),('Barverkauf','Scripts',3,5615),('Barverkauf','SysRel',3,5616),('Barverkauf','AccessLayout',-32757,5617),('Barverkauf','SummaryInfo',-32757,5618),('Barverkauf','UserDefined',-32757,5619),('Barverkauf','AddIn_Bar_buchAdresse-Kopf',-32768,5620),('Barverkauf','AddIn_Bar_buchRech-Artikel',-32768,5621),('Barverkauf','AddIn_Bar_buchRechnungBar',-32768,5622),('Barverkauf','AddIn_Bar_buchVorgaengeEigenschaften',-32768,5623),('Barverkauf','MSysObjects',1,5624),('Barverkauf','MSysACEs',1,5625),('Barverkauf','MSysQueries',1,5626),('Barverkauf','MSysRelationships',1,5627),('Barverkauf','buchangebot',4,5628),('Barverkauf','buchangebot-artikel',4,5629),('Barverkauf','buchauftrag',4,5630),('Barverkauf','buchauftrag-artikel',4,5631),('Barverkauf','buchgutschein',4,5632),('Barverkauf','buchgutschrift',4,5633),('Barverkauf','buchgutschrift-artikel',4,5634),('Barverkauf','buchkassabuch',4,5635),('Barverkauf','buchlieferschein',4,5636),('Barverkauf','buchlieferschein-artikel',4,5637),('Barverkauf','buchrech-artikel',4,5638),('Barverkauf','buchrechnung',4,5639),('Barverkauf','buchruestschein',4,5640),('Barverkauf','buchruestschein-artikel',4,5641),('Barverkauf','buchseriennummer',4,5642),('Barverkauf','buchsetartikel',4,5643),('Barverkauf','buchvorgaenge',4,5644),('Barverkauf','buchvorgaengeausdrucke',4,5645),('Barverkauf','buchvorgaengeausdruckelog',4,5646),('Barverkauf','buchvorgaengeeigenschaften',4,5647),('Barverkauf','buchvorgaengestatus',4,5648),('Barverkauf','buchvorgang-artikeldetaillager',4,5649),('Barverkauf','buchvorgangeigenschaft',4,5650),('Barverkauf','grartikel',4,5651),('Barverkauf','grartikel-kategorien',4,5652),('Barverkauf','grartikel-lagerbestand',4,5653),('Barverkauf','grartikel-lagerbewegung',4,5654),('Barverkauf','grartikel-lagerort',4,5655),('Barverkauf','grland',4,5656),('Barverkauf','grplz',4,5657),('Barverkauf','lagerlagerbuchung',4,5658),('Barverkauf','MSysAccessObjects',1,5659),('Barverkauf','MSysAccessXML',1,5660),('Barverkauf','ofadressen',4,5661),('Barverkauf','ofadressen1',4,5662),('Barverkauf','ofadressenbanken',4,5663),('Barverkauf','ofadressen-bonuspunkte',4,5664),('Barverkauf','ofadressen-kundengruppen',4,5665),('Barverkauf','ofadressen-selection1',4,5666),('Barverkauf','ofadressen-selection2',4,5667),('Barverkauf','ofadressen-seriendruck',4,5668),('Barverkauf','ofadressen-settings',4,5669),('Barverkauf','ofadressen-transportmethoden',4,5670),('Barverkauf','ofadressen-weitere',4,5671),('Barverkauf','ofadressen-zahlungsbedingungen',4,5672),('Barverkauf','ofadressen-zahlungsmethoden',4,5673),('Barverkauf','ofvars',4,5674),('Barverkauf','Tables',3,5675),('Barverkauf','Databases',3,5676),('Barverkauf','Relationships',3,5677),('Barverkauf','MSysDb',2,5678),('Statistiken','DataAccessPages',3,5679),('Statistiken','Forms',3,5680),('Statistiken','Modules',3,5681),('Statistiken','Reports',3,5682),('Statistiken','Scripts',3,5683),('Statistiken','SysRel',3,5684),('Statistiken','AccessLayout',-32757,5685),('Statistiken','SummaryInfo',-32757,5686),('Statistiken','UserDefined',-32757,5687),('Statistiken','buchRechArtikelVerkaufChart',-32768,5688),('Statistiken','buchRechArtikelVerkaufStatistik',-32768,5689),('Statistiken','buchRechArtikelVerkaufStatistik_Austria',-32768,5690),('Statistiken','statistik_austria_warengruppen',-32768,5691),('Statistiken','statistik_austria_warengruppen_uebersicht',-32768,5692),('Statistiken','addIn_stats',-32761,5693),('Statistiken','buchRechArtikelVerkauf_Statistik_Austria',-32764,5694),('Statistiken','statVerkaufNachAdressen',-32764,5695),('Statistiken','statVerkaufNachAdressenMonat',-32764,5696),('Statistiken','statVerkaufNachArtikel',-32764,5697),('Statistiken','statVerkaufNachArtikelJahr',-32764,5698),('Statistiken','statVerkaufNachArtikelMonat',-32764,5699),('Statistiken','statVerkaufNachArtikelOhneKundengruppe',-32764,5700),('Statistiken','statVerkaufNachKundengruppe',-32764,5701),('Statistiken','buchAuftragArtikelVerkauf',5,5702),('Statistiken','buchAuftragArtikelVerkaufSchnell',5,5703),('Statistiken','buchRechArtikelVerkauf',5,5704),('Statistiken','buchRechArtikelVerkauf_Statistik_Austria',5,5705),('Statistiken','buchRechArtikelVerkaufSchnell',5,5706),('Statistiken','buchVerkaufStatistikBasis',5,5707),('Statistiken','buchVerkaufStatistikChart',5,5708),('Statistiken','statAustriaOhneZuordnungEinfügen',5,5709),('Statistiken','statUmsatzZeitraumKundengruppe',5,5710),('Statistiken','statVerkaufNachKundengruppe',5,5711),('Statistiken','MSysObjects',1,5712),('Statistiken','MSysACEs',1,5713),('Statistiken','MSysQueries',1,5714),('Statistiken','MSysRelationships',1,5715),('Statistiken','buchangebot',4,5716),('Statistiken','buchangebot-artikel',4,5717),('Statistiken','buchauftrag',4,5718),('Statistiken','buchauftrag-artikel',4,5719),('Statistiken','buchfirmenkonto',4,5720),('Statistiken','buchgutschein',4,5721),('Statistiken','buchgutschrift',4,5722),('Statistiken','buchgutschrift-artikel',4,5723),('Statistiken','buchkassabuch',4,5724),('Statistiken','buchlieferantauftrag',4,5725),('Statistiken','buchlieferantauftrag-artikel',4,5726),('Statistiken','buchlieferschein',4,5727),('Statistiken','buchlieferschein-artikel',4,5728),('Statistiken','buchmahnungshistorie',4,5729),('Statistiken','buchrech-artikel',4,5730),('Statistiken','buchrech-artikel1',4,5731),('Statistiken','buchrechnung',4,5732),('Statistiken','buchretourwaren',4,5733),('Statistiken','buchretourwaren-artikel',4,5734),('Statistiken','buchruestschein',4,5735),('Statistiken','buchruestschein-artikel',4,5736),('Statistiken','buchseriennummer',4,5737),('Statistiken','buchsetartikel',4,5738),('Statistiken','buchvorgaenge',4,5739),('Statistiken','buchvorgaengeausdrucke',4,5740),('Statistiken','buchvorgaengeausdruckelog',4,5741),('Statistiken','buchvorgaengeeigenschaften',4,5742),('Statistiken','buchvorgaengestatus',4,5743),('Statistiken','buchvorgang-artikeldetaillager',4,5744),('Statistiken','buchvorgangeigenschaft',4,5745),('Statistiken','granrede',4,5746),('Statistiken','grartikel',4,5747),('Statistiken','grartikel-einheiten',4,5748),('Statistiken','grartikel-kategorien',4,5749),('Statistiken','grartikel-lagerbestand',4,5750),('Statistiken','grartikel-lagerbewegung',4,5751),('Statistiken','grartikel-lagerort',4,5752),('Statistiken','grartikel-reviews',4,5753),('Statistiken','grartikel-vertriebskosten',4,5754),('Statistiken','grartikel-verwandteartikel',4,5755),('Statistiken','grartikel-vkpreisperselection',4,5756),('Statistiken','grbranchen',4,5757),('Statistiken','grbranchenkeywords',4,5758),('Statistiken','grland',4,5759),('Statistiken','grlieferungbedingungen',4,5760),('Statistiken','grmwst',4,5761),('Statistiken','grplz',4,5762),('Statistiken','grselection1',4,5763),('Statistiken','grselection2',4,5764),('Statistiken','grtransportmethode',4,5765),('Statistiken','grwaehrung',4,5766),('Statistiken','grzahlungsbedingung',4,5767),('Statistiken','grzahlungsmethode',4,5768),('Statistiken','impetb',4,5769),('Statistiken','lagerlagerbuchung',4,5770),('Statistiken','language',4,5771),('Statistiken','lieferantenadressen',4,5772),('Statistiken','lieferantenanrufe',4,5773),('Statistiken','lieferantenartikel-preise',4,5774),('Statistiken','lieferantenbanken',4,5775),('Statistiken','MSysAccessObjects',1,5776),('Statistiken','MSysAccessXML',1,5777),('Statistiken','ofadressen',4,5778),('Statistiken','ofadressenbanken',4,5779),('Statistiken','ofadressenbanken1',4,5780),('Statistiken','ofadressen-bonuspunkte',4,5781),('Statistiken','ofadressen-kundengruppen',4,5782),('Statistiken','ofadressen-settings',4,5783),('Statistiken','ofadressen-transportmethoden',4,5784),('Statistiken','ofadressen-weitere',4,5785),('Statistiken','ofadressen-zahlungsbedingungen',4,5786),('Statistiken','ofadressen-zahlungsmethoden',4,5787),('Statistiken','ofdictionary',4,5788),('Statistiken','ofdictionarysets',4,5789),('Statistiken','offotos',4,5790),('Statistiken','ofkorespondenz',4,5791),('Statistiken','ofmitarbeiter',4,5792),('Statistiken','oftermine',4,5793),('Statistiken','oftips',4,5794),('Statistiken','ofvars',4,5795),('Statistiken','ofvars1',4,5796),('Statistiken','statistik_austria_warengruppen',4,5797),('Statistiken','statistik_austria_warengruppen_uebersicht',4,5798),('Statistiken','translations',4,5799),('Statistiken','Tables',3,5800),('Statistiken','Databases',3,5801),('Statistiken','Relationships',3,5802),('Statistiken','MSysDb',2,5803),('BMD','DataAccessPages',3,5804),('BMD','Forms',3,5805),('BMD','Modules',3,5806),('BMD','Reports',3,5807),('BMD','Scripts',3,5808),('BMD','SysRel',3,5809),('BMD','AccessLayout',-32757,5810),('BMD','SummaryInfo',-32757,5811),('BMD','UserDefined',-32757,5812),('BMD','impExportBMD',-32768,5813),('BMD','AddInBMD_functionsImpEx',-32761,5814),('BMD','exportBMDBuchungen',-32766,5815),('BMD','_export_BMD_Buchungen',5,5816),('BMD','_export_BMD_Buchungen_2',5,5817),('BMD','_export_BMD_Buchungen_3',5,5818),('BMD','_export_BMD_Buchungen_alle',5,5819),('BMD','_export_BMD_Stammdaten',5,5820),('BMD','test',5,5821),('BMD','MSysObjects',1,5822),('BMD','MSysACEs',1,5823),('BMD','MSysQueries',1,5824),('BMD','MSysRelationships',1,5825),('BMD','buchrech-artikel',4,5826),('BMD','buchrechnung',4,5827),('BMD','grartikel',4,5828),('BMD','grbanken',4,5829),('BMD','grland',4,5830),('BMD','grplz',4,5831),('BMD','impExBMD_KundengruppenKonten',1,5832),('BMD','impexBMD_Vars',1,5833),('BMD','MSysAccessObjects',1,5834),('BMD','MSysAccessXML',1,5835),('BMD','ofadressen',4,5836),('BMD','ofadressenbanken',4,5837),('BMD','ofadressen-kundengruppen',4,5838),('BMD','ofadressen-settings',4,5839),('BMD','ofvars',4,5840),('BMD','Tables',3,5841),('BMD','Databases',3,5842),('BMD','Relationships',3,5843),('BMD','MSysDb',2,5844),('Nachnahme','DataAccessPages',3,5845),('Nachnahme','Forms',3,5846),('Nachnahme','Modules',3,5847),('Nachnahme','Reports',3,5848),('Nachnahme','Scripts',3,5849),('Nachnahme','SysRel',3,5850),('Nachnahme','AccessLayout',-32757,5851),('Nachnahme','SummaryInfo',-32757,5852),('Nachnahme','UserDefined',-32757,5853),('Nachnahme','NachnameErf_Eingang',-32768,5854),('Nachnahme','NachnameErfassung',-32768,5855),('Nachnahme','AddInNachnahme_functionsImpEx',-32761,5856),('Nachnahme','testReport',-32764,5857),('Nachnahme','exportBMDBuchungen',-32766,5858),('Nachnahme','_export_BMD_Zahlungen',5,5859),('Nachnahme','_export_BMD_Zahlungen_2',5,5860),('Nachnahme','nachnameErf_Check',5,5861),('Nachnahme','nachnameErf_insertNN',5,5862),('Nachnahme','MSysObjects',1,5863),('Nachnahme','MSysACEs',1,5864),('Nachnahme','MSysQueries',1,5865),('Nachnahme','MSysRelationships',1,5866),('Nachnahme','buchrech-artikel',4,5867),('Nachnahme','buchrechnung',4,5868),('Nachnahme','grartikel',4,5869),('Nachnahme','grbanken',4,5870),('Nachnahme','grland',4,5871),('Nachnahme','grplz',4,5872),('Nachnahme','impExBMD_KundengruppenKonten',1,5873),('Nachnahme','impexBMD_Vars',1,5874),('Nachnahme','MSysAccessObjects',1,5875),('Nachnahme','MSysAccessXML',1,5876),('Nachnahme','NachnameErf_Eingang',1,5877),('Nachnahme','nachnameErf_Vars',1,5878),('Nachnahme','ofadressen',4,5879),('Nachnahme','ofadressenbanken',4,5880),('Nachnahme','ofadressen-kundengruppen',4,5881),('Nachnahme','ofadressen-settings',4,5882),('Nachnahme','ofvars',4,5883),('Nachnahme','Tables',3,5884),('Nachnahme','Databases',3,5885),('Nachnahme','Relationships',3,5886),('Nachnahme','MSysDb',2,5887),('Statistiken','DataAccessPages',3,5888),('Statistiken','Forms',3,5889),('Statistiken','Modules',3,5890),('Statistiken','Reports',3,5891),('Statistiken','Scripts',3,5892),('Statistiken','SysRel',3,5893),('Statistiken','AccessLayout',-32757,5894),('Statistiken','SummaryInfo',-32757,5895),('Statistiken','UserDefined',-32757,5896),('Statistiken','buchRechArtikelVerkaufChart',-32768,5897),('Statistiken','buchRechArtikelVerkaufStatistik',-32768,5898),('Statistiken','buchRechArtikelVerkaufStatistik_Austria',-32768,5899),('Statistiken','statistik_austria_warengruppen',-32768,5900),('Statistiken','statistik_austria_warengruppen_uebersicht',-32768,5901),('Statistiken','addIn_stats',-32761,5902),('Statistiken','buchRechArtikelVerkauf_Statistik_Austria',-32764,5903),('Statistiken','statVerkaufNachAdressen',-32764,5904),('Statistiken','statVerkaufNachAdressenMonat',-32764,5905),('Statistiken','statVerkaufNachArtikel',-32764,5906),('Statistiken','statVerkaufNachArtikelJahr',-32764,5907),('Statistiken','statVerkaufNachArtikelMonat',-32764,5908),('Statistiken','statVerkaufNachArtikelOhneKundengruppe',-32764,5909),('Statistiken','statVerkaufNachKundengruppe',-32764,5910),('Statistiken','buchAuftragArtikelVerkauf',5,5911),('Statistiken','buchAuftragArtikelVerkaufSchnell',5,5912),('Statistiken','buchRechArtikelVerkauf',5,5913),('Statistiken','buchRechArtikelVerkauf_Statistik_Austria',5,5914),('Statistiken','buchRechArtikelVerkaufSchnell',5,5915),('Statistiken','buchVerkaufStatistikBasis',5,5916),('Statistiken','buchVerkaufStatistikChart',5,5917),('Statistiken','statAustriaOhneZuordnungEinfügen',5,5918),('Statistiken','statUmsatzZeitraumKundengruppe',5,5919),('Statistiken','statVerkaufNachKundengruppe',5,5920),('Statistiken','MSysObjects',1,5921),('Statistiken','MSysACEs',1,5922),('Statistiken','MSysQueries',1,5923),('Statistiken','MSysRelationships',1,5924),('Statistiken','buchangebot',4,5925),('Statistiken','buchangebot-artikel',4,5926),('Statistiken','buchauftrag',4,5927),('Statistiken','buchauftrag-artikel',4,5928),('Statistiken','buchfirmenkonto',4,5929),('Statistiken','buchgutschein',4,5930),('Statistiken','buchgutschrift',4,5931),('Statistiken','buchgutschrift-artikel',4,5932),('Statistiken','buchkassabuch',4,5933),('Statistiken','buchlieferantauftrag',4,5934),('Statistiken','buchlieferantauftrag-artikel',4,5935),('Statistiken','buchlieferschein',4,5936),('Statistiken','buchlieferschein-artikel',4,5937),('Statistiken','buchmahnungshistorie',4,5938),('Statistiken','buchrech-artikel',4,5939),('Statistiken','buchrech-artikel1',4,5940),('Statistiken','buchrechnung',4,5941),('Statistiken','buchretourwaren',4,5942),('Statistiken','buchretourwaren-artikel',4,5943),('Statistiken','buchruestschein',4,5944),('Statistiken','buchruestschein-artikel',4,5945),('Statistiken','buchseriennummer',4,5946),('Statistiken','buchsetartikel',4,5947),('Statistiken','buchvorgaenge',4,5948),('Statistiken','buchvorgaengeausdrucke',4,5949),('Statistiken','buchvorgaengeausdruckelog',4,5950),('Statistiken','buchvorgaengeeigenschaften',4,5951),('Statistiken','buchvorgaengestatus',4,5952),('Statistiken','buchvorgang-artikeldetaillager',4,5953),('Statistiken','buchvorgangeigenschaft',4,5954),('Statistiken','granrede',4,5955),('Statistiken','grartikel',4,5956),('Statistiken','grartikel-einheiten',4,5957),('Statistiken','grartikel-kategorien',4,5958),('Statistiken','grartikel-lagerbestand',4,5959),('Statistiken','grartikel-lagerbewegung',4,5960),('Statistiken','grartikel-lagerort',4,5961),('Statistiken','grartikel-reviews',4,5962),('Statistiken','grartikel-vertriebskosten',4,5963),('Statistiken','grartikel-verwandteartikel',4,5964),('Statistiken','grartikel-vkpreisperselection',4,5965),('Statistiken','grbranchen',4,5966),('Statistiken','grbranchenkeywords',4,5967),('Statistiken','grland',4,5968),('Statistiken','grlieferungbedingungen',4,5969),('Statistiken','grmwst',4,5970),('Statistiken','grplz',4,5971),('Statistiken','grselection1',4,5972),('Statistiken','grselection2',4,5973),('Statistiken','grtransportmethode',4,5974),('Statistiken','grwaehrung',4,5975),('Statistiken','grzahlungsbedingung',4,5976),('Statistiken','grzahlungsmethode',4,5977),('Statistiken','impetb',4,5978),('Statistiken','lagerlagerbuchung',4,5979),('Statistiken','language',4,5980),('Statistiken','lieferantenadressen',4,5981),('Statistiken','lieferantenanrufe',4,5982),('Statistiken','lieferantenartikel-preise',4,5983),('Statistiken','lieferantenbanken',4,5984),('Statistiken','MSysAccessObjects',1,5985),('Statistiken','MSysAccessXML',1,5986),('Statistiken','ofadressen',4,5987),('Statistiken','ofadressenbanken',4,5988),('Statistiken','ofadressenbanken1',4,5989),('Statistiken','ofadressen-bonuspunkte',4,5990),('Statistiken','ofadressen-kundengruppen',4,5991),('Statistiken','ofadressen-settings',4,5992),('Statistiken','ofadressen-transportmethoden',4,5993),('Statistiken','ofadressen-weitere',4,5994),('Statistiken','ofadressen-zahlungsbedingungen',4,5995),('Statistiken','ofadressen-zahlungsmethoden',4,5996),('Statistiken','ofdictionary',4,5997),('Statistiken','ofdictionarysets',4,5998),('Statistiken','offotos',4,5999),('Statistiken','ofkorespondenz',4,6000),('Statistiken','ofmitarbeiter',4,6001),('Statistiken','oftermine',4,6002),('Statistiken','oftips',4,6003),('Statistiken','ofvars',4,6004),('Statistiken','ofvars1',4,6005),('Statistiken','statistik_austria_warengruppen',4,6006),('Statistiken','statistik_austria_warengruppen_uebersicht',4,6007),('Statistiken','translations',4,6008),('Statistiken','Tables',3,6009),('Statistiken','Databases',3,6010),('Statistiken','Relationships',3,6011),('Statistiken','MSysDb',2,6012),('Arfaian','DataAccessPages',3,6013),('Arfaian','Forms',3,6014),('Arfaian','Modules',3,6015),('Arfaian','Reports',3,6016),('Arfaian','Scripts',3,6017),('Arfaian','SysRel',3,6018),('Arfaian','AccessLayout',-32757,6019),('Arfaian','SummaryInfo',-32757,6020),('Arfaian','UserDefined',-32757,6021),('Arfaian','buchRech-Artikel_arfaian_2',-32764,6022),('Arfaian','buchRech-Lieferadresse_arfaian_2',-32764,6023),('Arfaian','Admin',-32758,6024),('Arfaian','qry_Adressfelder-Weitere',5,6025),('Arfaian','buchRechnung_arfaian_2',-32764,6026),('Arfaian','buchRechnung_arfaian_Notiz',-32764,6027),('Arfaian','MSysObjects',1,6028),('Arfaian','MSysACEs',1,6029),('Arfaian','MSysQueries',1,6030),('Arfaian','MSysRelationships',1,6031),('Arfaian','MSysAccessStorage',1,6032),('Arfaian','MSysAccessXML',1,6033),('Arfaian','MSysCmdbars',1,6034),('Arfaian','MSysIMEXColumns',1,6035),('Arfaian','MSysIMEXSpecs',1,6036),('Arfaian','MSysNavPaneObjectIDs',1,6037),('Arfaian','Tables',3,6038),('Arfaian','Databases',3,6039),('Arfaian','Relationships',3,6040),('Arfaian','MSysDb',2,6041);

UNLOCK TABLES;

/*Table structure for table `addins` */

DROP TABLE IF EXISTS `addins`;

CREATE TABLE `addins` (
  `AddInName` varchar(50) NOT NULL DEFAULT '',
  `AddInFile` varchar(255) DEFAULT NULL,
  `AddInStartform` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AddInName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `addins` */

LOCK TABLES `addins` WRITE;

insert  into `addins`(`AddInName`,`AddInFile`,`AddInStartform`) values ('Arfaian','..\\Intrasell\\IntraSell_AddIn_Arfaian.mdb','none'),('Barverkauf','..\\Intrasell\\IntraSell_AddIn_Barverkauf.mdb','addIn_Bar_buchRechnungBar'),('BMD','..\\Intrasell\\IntraSell_AddIn_BMD.mdb','impExportBMD'),('GLS','..\\Intrasell\\IntraSell_AddIn_GLS.mdb','addIN_gls_NachnameErfassung'),('Nachnahme','..\\Intrasell\\IntraSell_AddIn_Nachname.mdb','NachnameErfassung'),('Ptec','..\\Intrasell\\IntraSell_AddIn_ptec.mdb','none'),('Sparkasse/Paypal','..\\Intrasell\\IntraSell_AddIn_Sparkasse_PayPal.mdb','addInSparkasse_NachnahmeErfassung'),('Statistiken','..\\Intrasell\\IntraSell_AddIn_Stats.mdb','buchRechArtikelVerkaufStatistik'),('TradeBoard','..\\Intrasell\\IntraSell_AddIn_TradeBoard.mdb','tradeBoardForm');

UNLOCK TABLES;

/*Table structure for table `buchangebot` */

DROP TABLE IF EXISTS `buchangebot`;

CREATE TABLE `buchangebot` (
  `Nummer` int(10) NOT NULL,
  `KundNr` int(10) NOT NULL,
  `Datum` datetime NOT NULL,
  `Notiz` varchar(2000) DEFAULT NULL,
  `Summe` decimal(8,2) DEFAULT NULL,
  `Bezahlt` tinyint(1) NOT NULL,
  `Ausgedrukt` tinyint(1) NOT NULL,
  `anElba` tinyint(1) NOT NULL,
  `ZahlungsBedungung` varchar(250) DEFAULT NULL,
  `Woher` varchar(50) DEFAULT NULL,
  `Wohin` varchar(50) DEFAULT NULL,
  `TransportMethode` varchar(50) DEFAULT NULL,
  `ZahlungsMethode` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `NotizIntern` varchar(2000) DEFAULT NULL,
  `NotizExtern` varchar(2000) DEFAULT NULL,
  `SummeMWST` decimal(8,2) DEFAULT NULL,
  `SummeBrutto` decimal(8,2) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `MitarbeiterNr` int(10) DEFAULT NULL,
  `KundNr2` int(10) DEFAULT NULL,
  PRIMARY KEY (`Nummer`),
  KEY `Nummer` (`Nummer`),
  KEY `KundNr` (`KundNr`),
  CONSTRAINT `buchangebot_ibfk_1` FOREIGN KEY (`KundNr`) REFERENCES `ofadressen` (`IDNR`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buchangebot_ibfk_2` FOREIGN KEY (`KundNr`) REFERENCES `ofadressen` (`IDNR`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buchangebot` */

LOCK TABLES `buchangebot` WRITE;

insert  into `buchangebot`(`Nummer`,`KundNr`,`Datum`,`Notiz`,`Summe`,`Bezahlt`,`Ausgedrukt`,`anElba`,`ZahlungsBedungung`,`Woher`,`Wohin`,`TransportMethode`,`ZahlungsMethode`,`Status`,`NotizIntern`,`NotizExtern`,`SummeMWST`,`SummeBrutto`,`LieferantNr`,`MitarbeiterNr`,`KundNr2`) values (705001,1,'2009-06-11 19:04:53','		','2087.50',0,0,-1,'Nachnahme','AU705008','AR705024','DANZAS','Nachnahme',NULL,NULL,NULL,'165.00','2252.50',NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `buchangebot-artikel` */

DROP TABLE IF EXISTS `buchangebot-artikel`;

CREATE TABLE `buchangebot-artikel` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `RechNr` int(10) NOT NULL,
  `ArtNr` int(10) DEFAULT NULL,
  `PreisATS` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `PreisEuro` decimal(8,4) DEFAULT NULL,
  `Stk` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `PreisATS_Brutto` decimal(8,4) DEFAULT NULL,
  `ArtikelIdentifikation` varchar(50) DEFAULT NULL,
  `EKPreis` decimal(8,4) DEFAULT NULL,
  `Bezeichnung` varchar(255) DEFAULT NULL,
  `LieferantNR` int(10) DEFAULT NULL,
  `PositionStatus` varchar(50) DEFAULT NULL,
  `Referenz` varchar(50) DEFAULT NULL,
  `Packung` varchar(50) DEFAULT NULL,
  `Herkunft` varchar(45) DEFAULT NULL,
  `Incoterm` varchar(45) DEFAULT NULL,
  `Spezifikation` varchar(45) DEFAULT NULL,
  `Zeitpunkt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`,`RechNr`) USING BTREE,
  KEY `buchAngebotbuchAngebot-Artikel` (`RechNr`),
  KEY `ID` (`ID`),
  KEY `ofRech-ArtikelArtNr` (`ArtNr`),
  KEY `ofRech-ArtikelRechNr` (`RechNr`),
  CONSTRAINT `buchangebot-artikel_ibfk_1` FOREIGN KEY (`RechNr`) REFERENCES `buchangebot` (`Nummer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buchangebot-artikel_ibfk_2` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE,
  CONSTRAINT `buchangebot-artikel_ibfk_3` FOREIGN KEY (`RechNr`) REFERENCES `buchangebot` (`Nummer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buchangebot-artikel_ibfk_4` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `buchangebot-artikel` */

LOCK TABLES `buchangebot-artikel` WRITE;

insert  into `buchangebot-artikel`(`ID`,`RechNr`,`ArtNr`,`PreisATS`,`PreisEuro`,`Stk`,`PreisATS_Brutto`,`ArtikelIdentifikation`,`EKPreis`,`Bezeichnung`,`LieferantNR`,`PositionStatus`,`Referenz`,`Packung`,`Herkunft`,`Incoterm`,`Spezifikation`,`Zeitpunkt`) values (1,705001,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,705001,5,'0.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,705001,5,'45.0000','3.2702','1.0000',NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,705001,1005,'925.0000',NULL,'1.0000','925.0000',NULL,'925.0000','Beispiel Artikel 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,705001,1006,'870.0000',NULL,'1.0000','870.0000',NULL,'870.0000','Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,705001,4,'5.0000',NULL,'1.0000','5.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,705001,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,705001,1000,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `buchauftrag` */

DROP TABLE IF EXISTS `buchauftrag`;

CREATE TABLE `buchauftrag` (
  `Nummer` int(10) NOT NULL,
  `KundNr` int(10) NOT NULL,
  `Datum` datetime NOT NULL,
  `Notiz` varchar(2000) DEFAULT NULL,
  `Summe` decimal(8,2) DEFAULT NULL,
  `Bezahlt` tinyint(1) NOT NULL DEFAULT '0',
  `Ausgedrukt` tinyint(1) NOT NULL DEFAULT '0',
  `anElba` tinyint(1) NOT NULL DEFAULT '0',
  `ZahlungsBedungung` varchar(250) DEFAULT NULL,
  `Woher` varchar(50) DEFAULT NULL,
  `Wohin` varchar(50) DEFAULT NULL,
  `TransportMethode` varchar(50) DEFAULT NULL,
  `ZahlungsMethode` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `NotizIntern` varchar(2000) DEFAULT NULL,
  `NotizExtern` varchar(2000) DEFAULT NULL,
  `SummeMWST` decimal(8,2) DEFAULT NULL,
  `SummeBrutto` decimal(8,2) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `MitarbeiterNr` int(10) DEFAULT NULL,
  `KundNr2` int(10) DEFAULT NULL,
  PRIMARY KEY (`Nummer`),
  KEY `Nummer` (`Nummer`),
  KEY `KundNr` (`KundNr`),
  CONSTRAINT `buchauftrag_ibfk_1` FOREIGN KEY (`KundNr`) REFERENCES `ofadressen` (`IDNR`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buchauftrag_ibfk_2` FOREIGN KEY (`KundNr`) REFERENCES `ofadressen` (`IDNR`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buchauftrag` */

LOCK TABLES `buchauftrag` WRITE;

insert  into `buchauftrag`(`Nummer`,`KundNr`,`Datum`,`Notiz`,`Summe`,`Bezahlt`,`Ausgedrukt`,`anElba`,`ZahlungsBedungung`,`Woher`,`Wohin`,`TransportMethode`,`ZahlungsMethode`,`Status`,`NotizIntern`,`NotizExtern`,`SummeMWST`,`SummeBrutto`,`LieferantNr`,`MitarbeiterNr`,`KundNr2`) values (705001,0,'2009-05-26 20:39:26',NULL,'99.15',0,0,-1,'30 DAYS FROM DATE OF LOADING','AR705001',NULL,'DANZAS','American Express',NULL,NULL,NULL,'19.83','118.98',NULL,NULL,NULL),(705002,0,'2009-05-26 20:43:19',NULL,'99.15',0,0,-1,'30 DAYS FROM DATE OF LOADING','AR705003','AR705004','DANZAS','American Express',NULL,NULL,NULL,'19.83','118.98',NULL,NULL,NULL),(705003,0,'2009-05-27 21:44:43',NULL,'229.15',0,0,-1,'30 DAYS FROM DATE OF LOADING','AR705005','AR705006','DANZAS','American Express',NULL,NULL,NULL,'19.83','248.98',NULL,NULL,NULL),(705004,1,'2009-06-05 16:14:08','		','102.50',0,0,0,'Nachnahme','AR705017',NULL,'DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','102.50',NULL,NULL,NULL),(705005,1,'2009-06-11 14:28:15','		','2087.50',0,0,-1,'Nachnahme','AR705019','AR705019','DANZAS','Nachnahme',NULL,NULL,NULL,'165.00','2252.50',NULL,NULL,NULL),(705006,1,'2009-06-11 19:00:47','		','2087.50',0,0,-1,'Nachnahme','AR705020','AU705007','DANZAS','Nachnahme',NULL,NULL,NULL,'165.00','2252.50',NULL,NULL,NULL),(705007,1,'2009-06-11 19:00:50','		','2087.50',0,0,-1,'Nachnahme','AU705006','AR705021','DANZAS','Nachnahme',NULL,NULL,NULL,'165.00','2252.50',NULL,NULL,NULL),(705008,1,'2009-06-11 19:04:49','		','2087.50',0,0,-1,'Nachnahme','AR705023','AN705001','DANZAS','Nachnahme',NULL,NULL,NULL,'165.00','2252.50',NULL,NULL,NULL),(20099000,1,'2009-06-01 14:24:54','		','35.00',0,0,0,'Nachnahme',NULL,NULL,'DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','35.00',NULL,NULL,NULL),(20099001,1,'2009-06-01 14:44:34','		','210.00',0,0,0,'Nachnahme',NULL,NULL,'DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','210.00',NULL,NULL,NULL),(20099002,1,'2009-06-01 14:45:42','		','0.00',0,0,0,'Nachnahme',NULL,NULL,'DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL),(20099003,1,'2009-06-01 00:00:00','		','0.00',0,0,0,'Nachnahme',NULL,NULL,'DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL),(20099004,1,'2009-06-01 14:46:50','		','102.50',0,0,-1,'Nachnahme',NULL,'AR705008','DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','102.50',NULL,NULL,NULL),(2009090001,0,'2009-05-22 00:00:00',NULL,NULL,0,0,-1,'30 DAYS FROM DATE OF LOADING',NULL,'AU2009090002','DANZAS','American Express',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2009090002,0,'2009-05-22 21:20:41',NULL,NULL,0,0,0,'30 DAYS FROM DATE OF LOADING','AU2009090001',NULL,'DANZAS','American Express',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2009090003,1,'2009-06-01 14:20:46','		','35.00',0,0,0,'Nachnahme',NULL,NULL,'DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','35.00',NULL,NULL,NULL),(2009090004,0,'2009-06-06 23:24:55',NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2009090005,1,'2009-06-06 00:00:00',NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2009090006,1,'2009-07-15 18:59:13','		','227.50',0,0,0,'Nachnahme',NULL,NULL,'Express','Nachnahme',NULL,NULL,NULL,'45.50','273.00',NULL,NULL,NULL),(2009090007,1,'2009-07-16 17:31:46','		','37.50',0,-1,0,'Nachnahme',NULL,NULL,'DANZAS','Nachnahme',NULL,NULL,NULL,'7.50','45.00',NULL,NULL,NULL),(2009090008,1,'2009-07-22 22:14:53',' Artikel#5 wurde gewuenscht , .\r\n\r\n Artikel#5 wurde gewuenscht , .\r\n\r\n Artikel#5 wurde gewuenscht , .\r\n\r\n Artikel#5 wurde gewuenscht , .\r\n\r\n Artikel#5 wurde gewuenscht , .\r\n\r\n Artikel#5 wurde gewuenscht , .\r\n\r\n Artikel#5 wurde gewuenscht 100, Grün.\r\n\r\n Artikel#5 wurde gewuenscht 100, Rot.\r\n\r\n\r\n		','140.00',0,0,0,'Check',NULL,NULL,'Abholung','Check',NULL,NULL,NULL,'28.00','168.00',NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `buchauftrag-artikel` */

DROP TABLE IF EXISTS `buchauftrag-artikel`;

CREATE TABLE `buchauftrag-artikel` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `RechNr` int(10) NOT NULL,
  `ArtNr` int(10) NOT NULL,
  `PreisATS` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `PreisEuro` decimal(8,4) DEFAULT NULL,
  `Stk` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `PreisATS_Brutto` decimal(8,4) DEFAULT NULL,
  `ArtikelIdentifikation` varchar(50) DEFAULT NULL,
  `EKPreis` decimal(8,4) DEFAULT NULL,
  `Bezeichnung` varchar(255) NOT NULL,
  `LieferantNR` int(10) DEFAULT NULL,
  `PositionStatus` varchar(50) DEFAULT NULL,
  `Referenz` varchar(50) DEFAULT NULL,
  `Packung` varchar(50) DEFAULT NULL,
  `Herkunft` varchar(45) DEFAULT NULL,
  `Incoterm` varchar(45) DEFAULT NULL,
  `Spezifikation` varchar(45) DEFAULT NULL,
  `Zeitpunkt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`,`RechNr`) USING BTREE,
  UNIQUE KEY `ID` (`ID`),
  KEY `buchAuftragbuchAuftrag-Artikel` (`RechNr`),
  KEY `ofRech-ArtikelArtNr` (`ArtNr`),
  KEY `ofRech-ArtikelRechNr` (`RechNr`),
  CONSTRAINT `buchauftrag-artikel_ibfk_1` FOREIGN KEY (`RechNr`) REFERENCES `buchauftrag` (`Nummer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buchauftrag-artikel_ibfk_2` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE,
  CONSTRAINT `buchauftrag-artikel_ibfk_3` FOREIGN KEY (`RechNr`) REFERENCES `buchauftrag` (`Nummer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buchauftrag-artikel_ibfk_4` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

/*Data for the table `buchauftrag-artikel` */

LOCK TABLES `buchauftrag-artikel` WRITE;

insert  into `buchauftrag-artikel`(`ID`,`RechNr`,`ArtNr`,`PreisATS`,`PreisEuro`,`Stk`,`PreisATS_Brutto`,`ArtikelIdentifikation`,`EKPreis`,`Bezeichnung`,`LieferantNR`,`PositionStatus`,`Referenz`,`Packung`,`Herkunft`,`Incoterm`,`Spezifikation`,`Zeitpunkt`) values (1,20099004,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,20099004,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,20099004,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,705004,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,705004,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,705004,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,705005,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,705005,5,'0.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,705005,5,'45.0000','3.2702','1.0000',NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,705005,1005,'925.0000',NULL,'1.0000','925.0000',NULL,'925.0000','Beispiel Artikel 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,705005,1006,'870.0000',NULL,'1.0000','870.0000',NULL,'870.0000','Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,705005,4,'5.0000',NULL,'1.0000','5.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,705005,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,705005,1000,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,705006,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,705006,5,'0.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,705006,5,'45.0000','3.2702','1.0000',NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,705006,1005,'925.0000',NULL,'1.0000','925.0000',NULL,'925.0000','Beispiel Artikel 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,705006,1006,'870.0000',NULL,'1.0000','870.0000',NULL,'870.0000','Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,705006,4,'5.0000',NULL,'1.0000','5.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,705006,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,705006,1000,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,705007,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,705007,5,'0.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,705007,5,'45.0000','3.2702','1.0000',NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,705007,1005,'925.0000',NULL,'1.0000','925.0000',NULL,'925.0000','Beispiel Artikel 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,705007,1006,'870.0000',NULL,'1.0000','870.0000',NULL,'870.0000','Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,705007,4,'5.0000',NULL,'1.0000','5.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,705007,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,705007,1000,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,705008,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,705008,5,'0.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,705008,5,'45.0000','3.2702','1.0000',NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,705008,1005,'925.0000',NULL,'1.0000','925.0000',NULL,'925.0000','Beispiel Artikel 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,705008,1006,'870.0000',NULL,'1.0000','870.0000',NULL,'870.0000','Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,705008,4,'5.0000',NULL,'1.0000','5.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,705008,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,705008,1000,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,2009090006,7,'17.5000','17.5000','5.0000','21.0000',NULL,'17.8500','***Pros Pro Patriot',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,2009090006,5,'35.0000','35.0000','4.0000','42.0000',NULL,'19.4500','Challenger',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,2009090006,4,'0.0000',NULL,'1.0000','0.0000',NULL,NULL,'CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,2009090007,7,'17.5000','17.5000','1.0000','21.0000',NULL,'17.8500','***Pros Pro Patriot',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,2009090007,8,'20.0000','20.0000','1.0000','24.0000',NULL,'17.8500','***Pros Pro Victory',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,2009090007,4,'0.0000',NULL,'1.0000','0.0000',NULL,NULL,'CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,2009090008,5,'35.0000','35.0000','4.0000','42.0000','Artikel #5: 100, Rot','19.4500','Artikel #5: 100, Rot; Challenger',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,2009090008,4,'0.0000',NULL,'1.0000','0.0000',NULL,NULL,'CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `buchfirmenkonto` */

DROP TABLE IF EXISTS `buchfirmenkonto`;

CREATE TABLE `buchfirmenkonto` (
  `KontoId` int(10) NOT NULL,
  `KontoNr` varchar(11) DEFAULT NULL,
  `BLZ` int(10) DEFAULT NULL,
  `Name` varchar(38) DEFAULT NULL,
  `ELBA` tinyint(1) NOT NULL,
  PRIMARY KEY (`KontoId`),
  KEY `KontoId` (`KontoId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buchfirmenkonto` */

LOCK TABLES `buchfirmenkonto` WRITE;

insert  into `buchfirmenkonto`(`KontoId`,`KontoNr`,`BLZ`,`Name`,`ELBA`) values (1,'50982101501',12000,'BA - CA',-1),(2,'28353493700',20111,'ERSTE BANK',-1),(3,'606723',32667,'RAIFFEISEN BANK',-1),(4,'50982101501',12000,'BA - CA USD',-1),(5,'40332402500',20111,'ERSTE BANK (IMB)',-1),(6,'40332402575',20111,'ERSTE BANK (IMB USD)',-1);

UNLOCK TABLES;

/*Table structure for table `buchgutschein` */

DROP TABLE IF EXISTS `buchgutschein`;

CREATE TABLE `buchgutschein` (
  `Nummer` varchar(50) NOT NULL,
  `KundNr` int(10) DEFAULT NULL,
  `Datum` datetime DEFAULT NULL,
  `Notiz` varchar(255) DEFAULT NULL,
  `Summe` decimal(19,4) DEFAULT NULL,
  `Bezahlt` tinyint(1) NOT NULL,
  `Ausgedrukt` tinyint(1) NOT NULL,
  `anElba` tinyint(1) NOT NULL,
  `ZahlungsBedungung` varchar(250) DEFAULT NULL,
  `Woher` varchar(50) DEFAULT NULL,
  `Wohin` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `VerbrauchtDatum` datetime DEFAULT NULL,
  `Zweck` varchar(50) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `MitarbeiterNr` int(10) DEFAULT NULL,
  PRIMARY KEY (`Nummer`),
  KEY `Nummer` (`Nummer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buchgutschein` */

LOCK TABLES `buchgutschein` WRITE;

insert  into `buchgutschein`(`Nummer`,`KundNr`,`Datum`,`Notiz`,`Summe`,`Bezahlt`,`Ausgedrukt`,`anElba`,`ZahlungsBedungung`,`Woher`,`Wohin`,`Status`,`VerbrauchtDatum`,`Zweck`,`LieferantNr`,`MitarbeiterNr`) values ('GS12345FFDD123',0,'2003-07-31 00:00:00',NULL,'0.0000',-1,-1,-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `buchgutschrift` */

DROP TABLE IF EXISTS `buchgutschrift`;

CREATE TABLE `buchgutschrift` (
  `Nummer` int(10) NOT NULL,
  `KundNr` int(10) DEFAULT NULL,
  `Datum` datetime DEFAULT NULL,
  `Notiz` varchar(2000) DEFAULT NULL,
  `Summe` decimal(9,2) DEFAULT NULL,
  `Bezahlt` tinyint(1) NOT NULL,
  `Ausgedrukt` tinyint(1) NOT NULL,
  `anElba` tinyint(1) NOT NULL,
  `ZahlungsBedungung` varchar(250) DEFAULT NULL,
  `Woher` varchar(50) DEFAULT NULL,
  `Wohin` varchar(50) DEFAULT NULL,
  `TransportMethode` varchar(50) DEFAULT NULL,
  `ZahlungsMethode` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `NotizIntern` varchar(2000) DEFAULT NULL,
  `NotizExtern` varchar(2000) DEFAULT NULL,
  `SummeMWST` decimal(9,2) DEFAULT NULL,
  `SummeBrutto` decimal(9,2) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `MitarbeiterNr` int(10) unsigned DEFAULT NULL,
  `KundNr2` int(10) DEFAULT NULL,
  PRIMARY KEY (`Nummer`),
  KEY `Nummer` (`Nummer`),
  KEY `ofAdressenbuchGutschrift` (`KundNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buchgutschrift` */

LOCK TABLES `buchgutschrift` WRITE;

insert  into `buchgutschrift`(`Nummer`,`KundNr`,`Datum`,`Notiz`,`Summe`,`Bezahlt`,`Ausgedrukt`,`anElba`,`ZahlungsBedungung`,`Woher`,`Wohin`,`TransportMethode`,`ZahlungsMethode`,`Status`,`NotizIntern`,`NotizExtern`,`SummeMWST`,`SummeBrutto`,`LieferantNr`,`MitarbeiterNr`,`KundNr2`) values (705001,220199,'2009-01-28 22:00:35',NULL,'10080.00',0,0,0,'30 DAYS FROM DATE OF LOADING','AR707470',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,333143,5,NULL),(705002,1,'2009-06-11 19:00:54','		','2087.50',0,0,-1,'Nachnahme','AR705021',NULL,'DANZAS','Nachnahme',NULL,NULL,NULL,'165.00','2252.50',NULL,NULL,NULL),(2001000002,0,'2009-02-01 10:11:08',NULL,'30.00',0,0,0,'30 DAYS FROM DATE OF LOADING','AU2001000029','AN2001000002',NULL,NULL,NULL,NULL,NULL,'0.00','30.00',NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `buchgutschrift-artikel` */

DROP TABLE IF EXISTS `buchgutschrift-artikel`;

CREATE TABLE `buchgutschrift-artikel` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `RechNr` int(10) NOT NULL,
  `ArtNr` int(10) DEFAULT NULL,
  `PreisATS` decimal(19,4) DEFAULT NULL,
  `PreisEuro` decimal(19,4) DEFAULT NULL,
  `Stk` int(10) DEFAULT NULL,
  `PreisATS_Brutto` decimal(19,4) DEFAULT NULL,
  `ArtikelIdentifikation` varchar(50) DEFAULT NULL,
  `EKPreis` double(15,5) DEFAULT NULL,
  `Bezeichnung` varchar(255) DEFAULT NULL,
  `LieferantNR` int(10) DEFAULT NULL,
  `PositionStatus` varchar(50) DEFAULT NULL,
  `Referenz` varchar(50) DEFAULT NULL,
  `Packung` varchar(50) DEFAULT NULL,
  `Herkunft` varchar(45) DEFAULT NULL,
  `Incoterm` varchar(45) DEFAULT NULL,
  `Spezifikation` varchar(45) DEFAULT NULL,
  `Zeitpunkt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`,`RechNr`) USING BTREE,
  UNIQUE KEY `ID` (`ID`),
  KEY `buchGutschriftbuchGutschrift-Artikel` (`RechNr`),
  KEY `ofRech-ArtikelArtNr` (`ArtNr`),
  KEY `ofRech-ArtikelRechNr` (`RechNr`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `buchgutschrift-artikel` */

LOCK TABLES `buchgutschrift-artikel` WRITE;

insert  into `buchgutschrift-artikel`(`ID`,`RechNr`,`ArtNr`,`PreisATS`,`PreisEuro`,`Stk`,`PreisATS_Brutto`,`ArtikelIdentifikation`,`EKPreis`,`Bezeichnung`,`LieferantNR`,`PositionStatus`,`Referenz`,`Packung`,`Herkunft`,`Incoterm`,`Spezifikation`,`Zeitpunkt`) values (1,705001,2601,'0.4800','0.0348',21000,'0.4800','759',0.45000,'Hearts',333143,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,2001000002,31,'10.0000',NULL,1,'10.0000',NULL,5.21000,'Pro\'s Pro Tour 75  100 m',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,2001000002,39,'10.0000',NULL,1,'10.0000',NULL,19.43000,'Pro\'s Pro Sphere 200 m',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,2001000002,1482,'10.0000',NULL,1,'10.0000',NULL,1.00000,'Halbkugelfuß',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,705002,5,'35.0000',NULL,6,'35.0000',NULL,19.45000,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,705002,5,'0.0000',NULL,6,'35.0000',NULL,19.45000,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,705002,5,'45.0000','3.2702',1,NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,705002,1005,'925.0000',NULL,1,'925.0000',NULL,925.00000,'Beispiel Artikel 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,705002,1006,'870.0000',NULL,1,'870.0000',NULL,870.00000,'Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,705002,4,'5.0000',NULL,1,'5.0000',NULL,0.00000,'CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,705002,6,'32.5000',NULL,1,'32.5000',NULL,19.50000,'***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,705002,1000,'0.0000',NULL,1,'0.0000',NULL,0.00000,'FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `buchkassabuch` */

DROP TABLE IF EXISTS `buchkassabuch`;

CREATE TABLE `buchkassabuch` (
  `KBID` int(10) NOT NULL AUTO_INCREMENT,
  `Datum` datetime DEFAULT NULL,
  `Konto` varchar(25) DEFAULT NULL,
  `Beschreibung` varchar(255) DEFAULT NULL,
  `BetragAusgang` decimal(19,4) DEFAULT '0.0000',
  `BetragEingang` decimal(8,2) DEFAULT '0.00',
  PRIMARY KEY (`KBID`),
  KEY `ID` (`KBID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `buchkassabuch` */

LOCK TABLES `buchkassabuch` WRITE;

insert  into `buchkassabuch`(`KBID`,`Datum`,`Konto`,`Beschreibung`,`BetragAusgang`,`BetragEingang`) values (1,'2003-09-10 00:00:00','AR','AR-200305001','0.0000','6802.40'),(2,'2009-02-12 00:00:00','AR','AR-2001000044',NULL,'2.10'),(3,'2009-02-12 00:00:00','AR','AR-2001000058',NULL,'18.00'),(4,'2009-02-12 00:00:00','AR','AR-2001000074',NULL,'143.10'),(5,'2009-02-12 00:00:00','AR','AR-2001000077',NULL,'71.10'),(6,'2009-02-13 00:00:00','AR','AR-2001000079',NULL,'19.20'),(7,'2009-02-13 00:00:00','AR','AR-2001000079',NULL,'19.20'),(8,'2009-05-10 00:00:00','AR','AR-2001000083',NULL,'205.20'),(9,'2009-05-14 00:00:00','AR','AR-705010',NULL,'31.00'),(10,'2009-05-14 00:00:00','AR','AR-705010','31.0000',NULL),(11,'2009-05-14 00:00:00','AR','AR-705013',NULL,'32.50'),(12,'2009-05-14 00:00:00','AR','AR-705021',NULL,'30.00'),(13,'2009-05-14 00:00:00','AR','AR-705022',NULL,'12.00'),(14,'2009-05-14 00:00:00','AR','AR-705023',NULL,'5.00'),(15,'2009-05-14 00:00:00','AR','AR-705024',NULL,'25.00'),(16,'2009-05-14 00:00:00','AR','AR-705026',NULL,'12.50'),(17,'2009-05-14 00:00:00','AR','AR-705028',NULL,'12.50'),(18,'2009-05-14 00:00:00','AR','AR-2009090068',NULL,'36.00'),(19,'2009-05-14 00:00:00','AR','AR-2009090069',NULL,'48.00'),(20,'2009-05-14 00:00:00','AR','AR-2009090070',NULL,'36.00'),(21,'2009-05-14 00:00:00','AR','AR-2009090071',NULL,'18.00'),(22,'2009-05-14 00:00:00','AR','AR-2009090073',NULL,'24.00'),(23,'2009-05-14 00:00:00','AR','AR-2009090075',NULL,'1.20'),(24,'2009-05-14 00:00:00','AR','AR-2009090075','1.2000',NULL),(25,'2009-05-14 00:00:00','AR','AR-2009090073','24.0000',NULL);

UNLOCK TABLES;

/*Table structure for table `buchlieferantauftrag` */

DROP TABLE IF EXISTS `buchlieferantauftrag`;

CREATE TABLE `buchlieferantauftrag` (
  `Nummer` int(10) NOT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `KundNr` int(10) DEFAULT NULL,
  `Datum` datetime DEFAULT NULL,
  `Notiz` varchar(2000) DEFAULT NULL,
  `Summe` int(10) DEFAULT NULL,
  `Bezahlt` tinyint(1) NOT NULL,
  `Ausgedrukt` tinyint(1) NOT NULL,
  `anElba` tinyint(1) NOT NULL,
  `ZahlungsBedungung` varchar(250) DEFAULT NULL,
  `Woher` varchar(50) DEFAULT NULL,
  `Wohin` varchar(50) DEFAULT NULL,
  `TransportMethode` varchar(50) DEFAULT NULL,
  `ZahlungsMethode` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `NotizIntern` varchar(2000) DEFAULT NULL,
  `NotizExtern` varchar(2000) DEFAULT NULL,
  `SummeMWST` double(15,5) DEFAULT NULL,
  `SummeBrutto` double(15,5) DEFAULT NULL,
  `MitarbeiterNr` int(10) DEFAULT NULL,
  `KundNr2` int(10) DEFAULT NULL,
  PRIMARY KEY (`Nummer`),
  KEY `Nummer` (`Nummer`),
  KEY `LieferantNr` (`LieferantNr`),
  CONSTRAINT `buchlieferantauftrag_ibfk_1` FOREIGN KEY (`LieferantNr`) REFERENCES `lieferantenadressen` (`IDNR`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buchlieferantauftrag_ibfk_2` FOREIGN KEY (`LieferantNr`) REFERENCES `lieferantenadressen` (`IDNR`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buchlieferantauftrag` */

LOCK TABLES `buchlieferantauftrag` WRITE;

UNLOCK TABLES;

/*Table structure for table `buchlieferantauftrag-artikel` */

DROP TABLE IF EXISTS `buchlieferantauftrag-artikel`;

CREATE TABLE `buchlieferantauftrag-artikel` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `RechNr` int(10) NOT NULL,
  `ArtNr` int(10) DEFAULT NULL,
  `PreisATS` decimal(19,4) DEFAULT NULL,
  `PreisEuro` decimal(19,4) DEFAULT NULL,
  `Stk` decimal(19,2) DEFAULT NULL,
  `PreisATS_Brutto` decimal(19,4) DEFAULT NULL,
  `ArtikelIdentifikation` varchar(50) DEFAULT NULL,
  `EKPreis` double(15,5) DEFAULT NULL,
  `Bezeichnung` varchar(255) DEFAULT NULL,
  `LieferantNR` int(10) DEFAULT NULL,
  `PositionStatus` varchar(50) DEFAULT NULL,
  `Referenz` varchar(50) DEFAULT NULL,
  `Packung` varchar(50) DEFAULT NULL,
  `Herkunft` varchar(45) DEFAULT NULL,
  `Incoterm` varchar(45) DEFAULT NULL,
  `Spezifikation` varchar(45) DEFAULT NULL,
  `Zeitpunkt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`,`RechNr`) USING BTREE,
  UNIQUE KEY `ID` (`ID`),
  KEY `ofRech-ArtikelArtNr` (`ArtNr`),
  KEY `ofRech-ArtikelRechNr` (`RechNr`),
  CONSTRAINT `buchlieferantauftrag-artikel_ibfk_1` FOREIGN KEY (`RechNr`) REFERENCES `buchlieferantauftrag` (`Nummer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buchlieferantauftrag-artikel_ibfk_2` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE,
  CONSTRAINT `buchlieferantauftrag-artikel_ibfk_3` FOREIGN KEY (`RechNr`) REFERENCES `buchlieferantauftrag` (`Nummer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buchlieferantauftrag-artikel_ibfk_4` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buchlieferantauftrag-artikel` */

LOCK TABLES `buchlieferantauftrag-artikel` WRITE;

UNLOCK TABLES;

/*Table structure for table `buchlieferschein` */

DROP TABLE IF EXISTS `buchlieferschein`;

CREATE TABLE `buchlieferschein` (
  `Nummer` int(10) NOT NULL,
  `KundNr` int(10) DEFAULT NULL,
  `Datum` datetime DEFAULT NULL,
  `Notiz` varchar(2000) DEFAULT NULL,
  `Summe` decimal(8,2) DEFAULT NULL,
  `Bezahlt` tinyint(1) NOT NULL,
  `Ausgedrukt` tinyint(1) NOT NULL,
  `anElba` tinyint(1) NOT NULL,
  `ZahlungsBedungung` varchar(250) DEFAULT NULL,
  `Woher` varchar(50) DEFAULT NULL,
  `Wohin` varchar(50) DEFAULT NULL,
  `TransportMethode` varchar(50) DEFAULT NULL,
  `ZahlungsMethode` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `NotizIntern` varchar(2000) DEFAULT NULL,
  `NotizExtern` varchar(2000) DEFAULT NULL,
  `SummeMWST` decimal(8,2) DEFAULT NULL,
  `SummeBrutto` decimal(8,2) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `MitarbeiterNr` int(10) DEFAULT NULL,
  `KundNr2` int(10) DEFAULT NULL,
  PRIMARY KEY (`Nummer`),
  KEY `Nummer` (`Nummer`),
  KEY `ofAdressenbuchLieferschein` (`KundNr`),
  CONSTRAINT `buchlieferschein_ibfk_1` FOREIGN KEY (`KundNr`) REFERENCES `ofadressen` (`IDNR`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buchlieferschein_ibfk_2` FOREIGN KEY (`KundNr`) REFERENCES `ofadressen` (`IDNR`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buchlieferschein` */

LOCK TABLES `buchlieferschein` WRITE;

insert  into `buchlieferschein`(`Nummer`,`KundNr`,`Datum`,`Notiz`,`Summe`,`Bezahlt`,`Ausgedrukt`,`anElba`,`ZahlungsBedungung`,`Woher`,`Wohin`,`TransportMethode`,`ZahlungsMethode`,`Status`,`NotizIntern`,`NotizExtern`,`SummeMWST`,`SummeBrutto`,`LieferantNr`,`MitarbeiterNr`,`KundNr2`) values (705001,1,'2009-06-06 23:18:09','		','169.50',0,0,0,'Nachnahme','AR705015',NULL,'DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','169.50',NULL,NULL,NULL),(20099000,0,'2009-06-15 23:53:37',NULL,'162.50',0,0,0,'PREPAIMENT','AR20099001',NULL,'DANZAS','American Express',NULL,NULL,NULL,'32.50','195.00',NULL,2,NULL);

UNLOCK TABLES;

/*Table structure for table `buchlieferschein-artikel` */

DROP TABLE IF EXISTS `buchlieferschein-artikel`;

CREATE TABLE `buchlieferschein-artikel` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `RechNr` int(10) NOT NULL,
  `ArtNr` int(10) DEFAULT NULL,
  `PreisATS` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `PreisEuro` decimal(8,4) DEFAULT NULL,
  `Stk` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `PreisATS_Brutto` decimal(8,4) DEFAULT NULL,
  `ArtikelIdentifikation` varchar(50) DEFAULT NULL,
  `EKPreis` decimal(8,4) DEFAULT NULL,
  `Bezeichnung` varchar(255) DEFAULT NULL,
  `LieferantNR` int(10) DEFAULT NULL,
  `PositionStatus` varchar(50) DEFAULT NULL,
  `Referenz` varchar(50) DEFAULT NULL,
  `Packung` varchar(50) DEFAULT NULL,
  `Herkunft` varchar(45) DEFAULT NULL,
  `Incoterm` varchar(45) DEFAULT NULL,
  `Spezifikation` varchar(45) DEFAULT NULL,
  `Zeitpunkt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`,`RechNr`) USING BTREE,
  UNIQUE KEY `ID` (`ID`),
  KEY `buchLieferscheinbuchLieferschein-Artikel` (`RechNr`),
  KEY `ofRech-ArtikelArtNr` (`ArtNr`),
  KEY `ofRech-ArtikelRechNr` (`RechNr`),
  CONSTRAINT `buchlieferschein-artikel_ibfk_1` FOREIGN KEY (`RechNr`) REFERENCES `buchlieferschein` (`Nummer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buchlieferschein-artikel_ibfk_2` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE,
  CONSTRAINT `buchlieferschein-artikel_ibfk_3` FOREIGN KEY (`RechNr`) REFERENCES `buchlieferschein` (`Nummer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buchlieferschein-artikel_ibfk_4` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `buchlieferschein-artikel` */

LOCK TABLES `buchlieferschein-artikel` WRITE;

insert  into `buchlieferschein-artikel`(`ID`,`RechNr`,`ArtNr`,`PreisATS`,`PreisEuro`,`Stk`,`PreisATS_Brutto`,`ArtikelIdentifikation`,`EKPreis`,`Bezeichnung`,`LieferantNR`,`PositionStatus`,`Referenz`,`Packung`,`Herkunft`,`Incoterm`,`Spezifikation`,`Zeitpunkt`) values (1,705001,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,705001,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,20099000,6,'32.5000','8.4800','2.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,20099000,6,'32.5000',NULL,'1.0000','39.0000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,20099000,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,20099000,1006,'0.0000',NULL,'1.0000','0.0000',NULL,'870.0000','Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,20099000,1004,'0.0000',NULL,'1.0000','0.0000',NULL,'1320.0000','Beispiel Artikel 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,20099000,6,'32.5000',NULL,'1.0000','39.0000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,20099000,4,'0.0000',NULL,'1.0000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,20099000,6,'0.0000',NULL,'1.0000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `buchmahnungshistorie` */

DROP TABLE IF EXISTS `buchmahnungshistorie`;

CREATE TABLE `buchmahnungshistorie` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `VorgangTyp` varchar(2) DEFAULT NULL,
  `Nummer` int(10) DEFAULT NULL,
  `Mahnstufe` varchar(50) DEFAULT NULL,
  `GemahntAm` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`),
  KEY `Nummer` (`Nummer`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `buchmahnungshistorie` */

LOCK TABLES `buchmahnungshistorie` WRITE;

insert  into `buchmahnungshistorie`(`ID`,`VorgangTyp`,`Nummer`,`Mahnstufe`,`GemahntAm`) values (16,'AR',200300001,'MAHNSTUFE_1','2003-02-16 00:00:00'),(17,'AR',200305001,'MAHNSTUFE_1','2003-02-16 00:00:00'),(18,'AR',200300001,'MAHNSTUFE_2','2003-02-16 00:00:00'),(19,'AR',200305001,'MAHNSTUFE_2','2003-02-16 00:00:00');

UNLOCK TABLES;

/*Table structure for table `buchrech-artikel` */

DROP TABLE IF EXISTS `buchrech-artikel`;

CREATE TABLE `buchrech-artikel` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `RechNr` int(10) NOT NULL,
  `ArtNr` int(10) NOT NULL,
  `PreisATS` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `PreisEuro` decimal(8,4) DEFAULT NULL,
  `Stk` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `PreisATS_Brutto` decimal(8,4) DEFAULT NULL,
  `ArtikelIdentifikation` varchar(50) DEFAULT NULL,
  `EKPreis` decimal(8,4) DEFAULT NULL,
  `Bezeichnung` varchar(255) NOT NULL,
  `LieferantNR` int(10) DEFAULT NULL,
  `PositionStatus` varchar(50) DEFAULT NULL,
  `Referenz` varchar(50) DEFAULT NULL,
  `Packung` varchar(50) DEFAULT NULL,
  `Herkunft` varchar(45) DEFAULT NULL,
  `Incoterm` varchar(45) DEFAULT NULL,
  `Spezifikation` varchar(45) DEFAULT NULL,
  `Zeitpunkt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`,`RechNr`) USING BTREE,
  UNIQUE KEY `ID` (`ID`),
  KEY `buchRechnungbuchRech-Artikel` (`RechNr`),
  KEY `ofRech-ArtikelArtNr` (`ArtNr`),
  KEY `ofRech-ArtikelRechNr` (`RechNr`),
  CONSTRAINT `buchrech-artikel_ibfk_1` FOREIGN KEY (`RechNr`) REFERENCES `buchrechnung` (`Nummer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buchrech-artikel_ibfk_2` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE,
  CONSTRAINT `buchrech-artikel_ibfk_3` FOREIGN KEY (`RechNr`) REFERENCES `buchrechnung` (`Nummer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buchrech-artikel_ibfk_4` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=latin1;

/*Data for the table `buchrech-artikel` */

LOCK TABLES `buchrech-artikel` WRITE;

insert  into `buchrech-artikel`(`ID`,`RechNr`,`ArtNr`,`PreisATS`,`PreisEuro`,`Stk`,`PreisATS_Brutto`,`ArtikelIdentifikation`,`EKPreis`,`Bezeichnung`,`LieferantNR`,`PositionStatus`,`Referenz`,`Packung`,`Herkunft`,`Incoterm`,`Spezifikation`,`Zeitpunkt`) values (1,2009090001,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,2009090001,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,2009090002,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,2009090003,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,2009090003,4,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,2009090003,5,'32.5000',NULL,'2.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,2009090002,4,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,2009090002,5,'32.5000',NULL,'1.0000','32.5000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,2009090002,4,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,705001,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,705001,4,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,705001,5,'32.5000',NULL,'2.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,705002,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,705002,4,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,705002,5,'32.5000',NULL,'2.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,705003,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,705003,4,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,705003,5,'32.5000',NULL,'2.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,705004,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,705004,4,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,705004,5,'32.5000',NULL,'2.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,705004,5,'32.5000',NULL,'1.0000','32.5000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,705004,5,'32.5000',NULL,'1.0000','32.5000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,705004,5,'32.5000',NULL,'1.0000','32.5000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,705004,5,'32.5000',NULL,'1.0000','32.5000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,705005,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,705005,4,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,705005,5,'32.5000',NULL,'2.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,705005,5,'32.5000',NULL,'1.0000','32.5000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,705005,5,'32.5000',NULL,'1.0000','32.5000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,705005,5,'32.5000',NULL,'1.0000','32.5000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,705005,5,'32.5000',NULL,'1.0000','32.5000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,705006,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,705006,4,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,705006,5,'32.5000',NULL,'2.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,705006,5,'32.5000',NULL,'1.0000','32.5000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,705006,5,'32.5000',NULL,'1.0000','32.5000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,705006,5,'32.5000',NULL,'1.0000','32.5000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,705006,5,'32.5000',NULL,'1.0000','32.5000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,705006,5,'32.5000',NULL,'1.0000','32.5000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,705007,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,705007,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,705007,5,'32.5000',NULL,'1.0000','32.5000',NULL,'19.4500','***Pro\'s Pro Super TI 800, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,705008,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,705008,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,705008,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,705009,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,705009,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,705009,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,705009,4,'0.0000',NULL,'1.0000',NULL,NULL,NULL,'CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,705010,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,705010,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,705010,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,705010,4,'0.0000',NULL,'1.0000',NULL,NULL,NULL,'CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,705011,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,705011,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,705011,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,705011,4,'0.0000',NULL,'1.0000',NULL,NULL,NULL,'CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,705012,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(88,705012,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,705012,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(90,705012,4,'67.0000','4.8690','1.0000','67.0000',NULL,NULL,'CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(94,705013,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(95,705013,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(96,705013,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(97,705013,4,'67.0000','4.8690','1.0000','67.0000',NULL,NULL,'CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(101,705014,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(102,705014,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(103,705014,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(104,705014,4,'67.0000','4.8690','1.0000','67.0000',NULL,NULL,'CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(108,705015,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(109,705015,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(115,705016,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(116,705016,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(117,705016,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(118,705016,4,'67.0000','4.8690','1.0000','67.0000',NULL,NULL,'CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(122,705017,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,705017,5,'35.0000',NULL,'1.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,705017,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(125,705018,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(126,705018,5,'0.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(131,705018,5,'45.0000','3.2702','1.0000',NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(140,705019,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(141,705019,5,'0.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(142,705019,5,'45.0000','3.2702','1.0000',NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(143,705019,1005,'925.0000',NULL,'1.0000','925.0000',NULL,'925.0000','Beispiel Artikel 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(144,705019,1006,'870.0000',NULL,'1.0000','870.0000',NULL,'870.0000','Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(145,705019,4,'5.0000',NULL,'1.0000','5.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(146,705019,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(147,705019,1000,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(155,705020,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(156,705020,5,'0.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(157,705020,5,'45.0000','3.2702','1.0000',NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(158,705020,1005,'925.0000',NULL,'1.0000','925.0000',NULL,'925.0000','Beispiel Artikel 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(159,705020,1006,'870.0000',NULL,'1.0000','870.0000',NULL,'870.0000','Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(160,705020,4,'5.0000',NULL,'1.0000','5.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(161,705020,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(162,705020,1000,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(170,705021,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(171,705021,5,'0.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(172,705021,5,'45.0000','3.2702','1.0000',NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(173,705021,1005,'925.0000',NULL,'1.0000','925.0000',NULL,'925.0000','Beispiel Artikel 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(174,705021,1006,'870.0000',NULL,'1.0000','870.0000',NULL,'870.0000','Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(175,705021,4,'5.0000',NULL,'1.0000','5.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(176,705021,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(177,705021,1000,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(185,20099000,4,'0.0000',NULL,'1.0000','0.0000','test','0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(186,20099000,4,'0.0000',NULL,'1.0000','0.0000','test','0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(187,20099000,5,'32.5000',NULL,'1.0000','39.0000','test','19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(188,20099000,5,'32.5000',NULL,'1.0000','39.0000','test','19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(189,20099000,1000,'0.0000',NULL,'1.0000','0.0000','test','0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(190,20099000,1000,'445.0000','32.3394','1.0000','534.0000','test','0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(191,20099000,1000,'0.0000',NULL,'1.0000','0.0000','test','0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(192,20099000,1000,'0.0000',NULL,'1.0000','0.0000','test','0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(193,20099000,5,'32.5000',NULL,'1.0000','39.0000','test','19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(194,20099000,5,'32.5000',NULL,'1.0000','39.0000','ste','19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(195,20099000,5,'32.5000',NULL,'1.0000','39.0000','tset','19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(196,705022,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(197,705022,5,'0.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(198,705022,5,'45.0000','3.2702','1.0000',NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(199,705022,1005,'925.0000',NULL,'1.0000','925.0000',NULL,'925.0000','Beispiel Artikel 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(200,705022,1006,'870.0000',NULL,'1.0000','870.0000',NULL,'870.0000','Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(201,705022,4,'5.0000',NULL,'1.0000','5.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(202,705022,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(203,705022,1000,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(211,705023,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(212,705023,5,'0.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(213,705023,5,'45.0000','3.2702','1.0000',NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(214,705023,1005,'925.0000',NULL,'1.0000','925.0000',NULL,'925.0000','Beispiel Artikel 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(215,705023,1006,'870.0000',NULL,'1.0000','870.0000',NULL,'870.0000','Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(216,705023,4,'5.0000',NULL,'1.0000','5.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(217,705023,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(218,705023,1000,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(226,705024,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(227,705024,5,'0.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(228,705024,5,'45.0000','3.2702','1.0000',NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(229,705024,1005,'925.0000',NULL,'1.0000','925.0000',NULL,'925.0000','Beispiel Artikel 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230,705024,1006,'870.0000',NULL,'1.0000','870.0000',NULL,'870.0000','Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(231,705024,4,'5.0000',NULL,'1.0000','5.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(232,705024,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(233,705024,1000,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(241,705025,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(242,705025,5,'0.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(243,705025,5,'45.0000','3.2702','1.0000',NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(244,705025,1005,'925.0000',NULL,'1.0000','925.0000',NULL,'925.0000','Beispiel Artikel 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(245,705025,1006,'870.0000',NULL,'1.0000','870.0000',NULL,'870.0000','Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(246,705025,4,'5.0000',NULL,'1.0000','5.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(247,705025,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(248,705025,1000,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(271,705026,5,'35.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(272,705026,5,'0.0000',NULL,'6.0000','35.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(273,705026,5,'45.0000','3.2702','1.0000',NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(274,705026,1005,'925.0000',NULL,'1.0000','925.0000',NULL,'925.0000','Beispiel Artikel 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(275,705026,1006,'870.0000',NULL,'1.0000','870.0000',NULL,'870.0000','Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(276,705026,4,'5.0000',NULL,'1.0000','5.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(277,705026,6,'32.5000',NULL,'1.0000','32.5000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(278,705026,1000,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(279,20099001,6,'32.5000','8.4800','2.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-15 23:49:03'),(280,20099001,6,'32.5000',NULL,'1.0000','39.0000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-15 23:53:05'),(281,20099001,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-15 23:53:11'),(282,20099001,1006,'0.0000',NULL,'1.0000','0.0000',NULL,'870.0000','Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-15 23:53:13'),(283,20099001,1004,'0.0000',NULL,'1.0000','0.0000',NULL,'1320.0000','Beispiel Artikel 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-15 23:53:15'),(284,20099001,6,'32.5000',NULL,'1.0000','39.0000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-15 23:53:21'),(285,20099002,6,'32.5000','8.4800','2.0000','39.0000',NULL,'19.4500','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(286,20099002,6,'32.5000',NULL,'1.0000','39.0000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(287,20099002,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(288,20099002,1006,'0.0000',NULL,'1.0000','0.0000',NULL,'870.0000','Beispiel Artikel 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(289,20099002,1004,'0.0000',NULL,'1.0000','0.0000',NULL,'1320.0000','Beispiel Artikel 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(290,20099002,6,'32.5000',NULL,'1.0000','39.0000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(291,20099003,4,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 16:39:24'),(292,20099003,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 16:39:36'),(293,20099003,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(294,20099003,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 16:39:50'),(295,20099004,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 16:47:44'),(296,20099005,4,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 16:49:53'),(297,20099005,6,'32.5000',NULL,'1.0000','39.0000',NULL,'19.5000','***Pro\'s Pro Super TI 900, L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 16:50:02'),(298,20099006,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 16:51:34'),(299,20099007,4,'0.0000',NULL,'4.0000','0.0000',NULL,'19.4500','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 16:54:52'),(300,20099007,5,'32.5000',NULL,'3.0000','39.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(301,20099007,1000,'0.0000',NULL,'5.0000','0.0000',NULL,'19.5000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 16:55:27'),(302,20099008,5,'0.0000',NULL,'1.0000',NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 16:56:07'),(303,20099008,1000,'0.0000',NULL,'1.0000',NULL,NULL,NULL,'FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 16:56:10'),(304,20099009,1000,'0.0000',NULL,'1.0000',NULL,NULL,NULL,'FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 16:57:34'),(305,20099010,5,'32.5000',NULL,'2.0000','39.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 17:01:54'),(306,20099010,4,'0.0000',NULL,'3.0000','0.0000',NULL,'19.4500','CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 17:01:37'),(307,20099010,1000,'0.0000',NULL,'1.0000',NULL,NULL,NULL,'FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 17:00:14'),(308,20099010,5,'0.0000',NULL,'1.0000',NULL,NULL,NULL,'Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 17:00:23'),(309,20099010,1000,'0.0000',NULL,'1.0000','0.0000',NULL,NULL,'FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 17:00:31'),(310,20099010,4,'0.0000',NULL,'1.0000',NULL,NULL,NULL,'CALCULATE_MIN_ORDER_VALUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 17:00:38'),(311,20099010,1000,'0.0000',NULL,'1.0000',NULL,NULL,'19.4500','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 17:01:28'),(312,20099011,5,'32.5000',NULL,'2.0000',NULL,NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 17:05:23'),(313,20099011,5,'0.0000',NULL,'3.0000',NULL,NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 17:05:31'),(314,20099011,5,'32.5000',NULL,'4.0000',NULL,NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 17:05:40'),(315,20099011,5,'38.5000',NULL,'5.0000',NULL,NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 17:05:48'),(316,20099011,5,'0.0000',NULL,'5.0000',NULL,NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 17:05:52'),(317,20099012,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 17:08:03'),(318,20099013,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 17:09:38'),(319,20099013,5,'32.5000',NULL,'1.0000','39.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-19 17:09:41'),(320,20099014,5,'6.6700','0.4800','1.0000','8.0000',NULL,'19.4500','Challenger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(321,20099015,1000,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2009-06-22 10:45:06'),(322,2001000095,1000,'0.0000',NULL,'1.0000','0.0000',NULL,'0.0000','FREIER ARTIKEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `buchrechnung` */

DROP TABLE IF EXISTS `buchrechnung`;

CREATE TABLE `buchrechnung` (
  `Nummer` int(10) NOT NULL DEFAULT '0',
  `KundNr` int(10) NOT NULL,
  `Datum` datetime NOT NULL,
  `Notiz` varchar(2000) DEFAULT NULL,
  `Summe` decimal(8,2) DEFAULT NULL,
  `Bezahlt` tinyint(1) NOT NULL,
  `Ausgedrukt` tinyint(1) NOT NULL,
  `anElba` tinyint(1) NOT NULL,
  `ZahlungsBedungung` varchar(250) DEFAULT NULL,
  `Woher` varchar(50) DEFAULT NULL,
  `Wohin` varchar(50) DEFAULT NULL,
  `TransportMethode` varchar(50) DEFAULT NULL,
  `ZahlungsMethode` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `NotizIntern` varchar(2000) DEFAULT NULL,
  `NotizExtern` varchar(2000) DEFAULT NULL,
  `SummeMWST` decimal(8,2) DEFAULT NULL,
  `SummeBrutto` decimal(8,2) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `MitarbeiterNr` int(10) DEFAULT NULL,
  `KundNr2` int(10) DEFAULT NULL,
  PRIMARY KEY (`Nummer`),
  KEY `Nummer` (`Nummer`),
  KEY `ofAdressenbuchRechnung` (`KundNr`),
  CONSTRAINT `buchrechnung_ibfk_1` FOREIGN KEY (`KundNr`) REFERENCES `ofadressen` (`IDNR`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buchrechnung_ibfk_2` FOREIGN KEY (`KundNr`) REFERENCES `ofadressen` (`IDNR`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buchrechnung` */

LOCK TABLES `buchrechnung` WRITE;

insert  into `buchrechnung`(`Nummer`,`KundNr`,`Datum`,`Notiz`,`Summe`,`Bezahlt`,`Ausgedrukt`,`anElba`,`ZahlungsBedungung`,`Woher`,`Wohin`,`TransportMethode`,`ZahlungsMethode`,`Status`,`NotizIntern`,`NotizExtern`,`SummeMWST`,`SummeBrutto`,`LieferantNr`,`MitarbeiterNr`,`KundNr2`) values (705001,0,'2009-05-26 20:39:11',NULL,'99.15',0,0,-1,'30 DAYS FROM DATE OF LOADING','AR2009090003','AR705002','DANZAS','American Express',NULL,NULL,NULL,'19.83','118.98',NULL,NULL,NULL),(705002,0,'2009-05-26 20:42:54',NULL,'99.15',0,0,-1,'30 DAYS FROM DATE OF LOADING','AR705001','AR705003','DANZAS','American Express',NULL,NULL,NULL,'19.83','118.98',NULL,NULL,NULL),(705003,0,'2009-05-26 20:43:02',NULL,'99.15',0,0,0,'30 DAYS FROM DATE OF LOADING','AR705002','AU705002','DANZAS','American Express',NULL,NULL,NULL,'19.83','118.98',NULL,NULL,NULL),(705004,0,'2009-05-26 20:43:23',NULL,'229.15',0,0,0,'30 DAYS FROM DATE OF LOADING','AU705002','AR705005','DANZAS','American Express',NULL,NULL,NULL,'19.83','248.98',NULL,NULL,NULL),(705005,0,'2009-05-27 21:44:40',NULL,'229.15',0,0,0,'30 DAYS FROM DATE OF LOADING','AR705004','AU705003','DANZAS','American Express',NULL,NULL,NULL,'19.83','248.98',NULL,NULL,NULL),(705006,0,'2009-05-27 21:44:46',NULL,'261.65',0,0,0,'30 DAYS FROM DATE OF LOADING','AU705003',NULL,'DANZAS','American Express',NULL,NULL,NULL,'19.83','281.48',NULL,NULL,NULL),(705007,0,'2009-05-29 00:00:00',NULL,'97.50',0,0,-1,'PREPAIMENT',NULL,NULL,'DANZAS','American Express',NULL,NULL,NULL,'0.00','97.50',NULL,NULL,NULL),(705008,1,'2009-06-03 09:54:41','		','102.50',0,0,0,'Nachnahme','AU20099004','AR705017','DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','102.50',NULL,NULL,NULL),(705009,1,'2009-06-04 01:25:04','		','102.50',0,0,0,'Nachnahme','AR705008','AR705010','DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','102.50',NULL,NULL,NULL),(705010,1,'2009-06-04 23:39:59','		','102.50',0,0,0,'Nachnahme','AR705009','AR705011','DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','102.50',NULL,NULL,NULL),(705011,1,'2009-06-05 16:03:49','		','102.50',0,0,-1,'Nachnahme','AR705010','AR705012','DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','102.50',NULL,NULL,NULL),(705012,1,'2009-06-05 16:05:58','		','169.50',0,0,-1,'Nachnahme','AR705011','AR705013','DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','169.50',NULL,NULL,NULL),(705013,1,'2009-06-05 16:06:10','		','169.50',0,0,0,'Nachnahme','AR705012','AR705014','DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','169.50',NULL,NULL,NULL),(705014,1,'2009-06-05 16:10:31','		','169.50',0,0,0,'Nachnahme','AR705013','AR705015','DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','169.50',NULL,NULL,NULL),(705015,1,'2009-06-05 00:00:00','		','169.50',-1,-1,-1,'Nachnahme','AR705014','AR705019','DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','169.50',NULL,NULL,NULL),(705016,1,'2009-06-05 16:13:13','		','169.50',0,0,0,'Nachnahme','AR705015',NULL,'DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','169.50',NULL,NULL,NULL),(705017,1,'2009-06-05 16:14:05','		','102.50',0,0,0,'Nachnahme','AR705008','AU705004','DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','102.50',NULL,NULL,NULL),(705018,1,'2009-06-06 23:18:14','		','169.50',0,0,0,'Nachnahme','AR705015','AR705019','DANZAS','Nachnahme',NULL,NULL,NULL,'0.00','169.50',NULL,NULL,NULL),(705019,1,'2009-06-11 14:50:34','		','2087.50',0,0,-1,'Nachnahme','AU705005','AR705020','DANZAS','Nachnahme',NULL,NULL,NULL,'165.00','2252.50',NULL,NULL,NULL),(705020,1,'2009-06-11 19:00:37','		','2087.50',0,0,-1,'Nachnahme','AR705019','AU705006','DANZAS','Nachnahme',NULL,NULL,NULL,'165.00','2252.50',NULL,NULL,NULL),(705021,1,'2009-06-11 19:00:52','		','2087.50',0,0,0,'Nachnahme','AU705007','AR705022','DANZAS','Nachnahme',NULL,NULL,NULL,'165.00','2252.50',NULL,NULL,NULL),(705022,1,'2009-06-11 19:04:14','		','2087.50',0,0,0,'Nachnahme','AR705021','AR705023','DANZAS','Nachnahme',NULL,NULL,NULL,'165.00','2252.50',NULL,NULL,NULL),(705023,1,'2009-06-11 19:04:46','		','2087.50',0,0,0,'Nachnahme','AR705022','AU705008','DANZAS','Nachnahme',NULL,NULL,NULL,'165.00','2252.50',NULL,NULL,NULL),(705024,1,'2009-06-11 19:05:03','		','2087.50',0,0,0,'Nachnahme','AN705001','AR705025','DANZAS','Nachnahme',NULL,NULL,NULL,'165.00','2252.50',NULL,NULL,NULL),(705025,1,'2009-06-11 19:05:06','		','2087.50',0,-1,-1,'Nachnahme','AR705024','AR705026','DANZAS','Nachnahme',NULL,NULL,NULL,'165.00','2252.50',NULL,NULL,NULL),(705026,1,'2009-06-13 19:02:21','		','2087.50',0,0,-1,'Nachnahme','AR705025',NULL,'DANZAS','Nachnahme',NULL,NULL,NULL,'165.00','2252.50',NULL,NULL,NULL),(20099000,0,'2009-06-11 00:00:00',NULL,'607.50',0,0,0,'PREPAIMENT',NULL,NULL,'DANZAS','American Express',NULL,NULL,NULL,'121.50','729.00',NULL,2,NULL),(20099001,0,'2009-06-15 00:00:00','1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 XXX','162.50',0,-1,0,'PREPAIMENT',NULL,'AR20099002','DANZAS','American Express',NULL,NULL,NULL,'32.50','195.00',NULL,2,NULL),(20099002,0,'2009-06-19 15:57:44','1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890   1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 XXX','162.50',0,-1,0,'PREPAIMENT','AR20099001',NULL,'DANZAS','American Express',NULL,NULL,NULL,'32.50','195.00',NULL,2,NULL),(20099003,0,'2009-06-19 16:38:51',NULL,'97.50',0,0,0,'PREPAIMENT',NULL,NULL,'DANZAS','American Express',NULL,NULL,NULL,'19.50','117.00',NULL,NULL,NULL),(20099004,0,'2009-06-19 16:47:26',NULL,'32.50',0,0,0,'PREPAIMENT',NULL,NULL,'DANZAS','American Express',NULL,NULL,NULL,'6.50','39.00',NULL,NULL,NULL),(20099005,0,'2009-06-19 16:49:49',NULL,'32.50',0,0,0,'PREPAIMENT',NULL,NULL,'DANZAS','American Express',NULL,NULL,NULL,'6.50','39.00',NULL,NULL,NULL),(20099006,0,'2009-06-19 16:51:31',NULL,'32.50',0,0,0,'PREPAIMENT',NULL,NULL,'DANZAS','American Express',NULL,NULL,NULL,'6.50','39.00',NULL,NULL,NULL),(20099007,0,'2009-06-19 16:54:40',NULL,NULL,0,0,0,'PREPAIMENT',NULL,NULL,'DANZAS','American Express',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20099008,0,'2009-06-19 16:56:05',NULL,NULL,0,0,0,'PREPAIMENT',NULL,NULL,'DANZAS','American Express',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20099009,0,'2009-06-19 16:57:30',NULL,NULL,0,0,0,'PREPAIMENT',NULL,NULL,'DANZAS','American Express',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20099010,0,'2009-06-19 16:58:06',NULL,'65.00',0,0,0,'PREPAIMENT',NULL,NULL,'DANZAS','American Express',NULL,NULL,NULL,'13.00','78.00',NULL,NULL,NULL),(20099011,0,'2009-06-19 17:05:20',NULL,'387.50',0,0,0,'PREPAIMENT',NULL,NULL,'DANZAS','American Express',NULL,NULL,NULL,'-387.50',NULL,NULL,NULL,NULL),(20099012,0,'2009-06-19 17:07:58',NULL,'32.50',0,0,0,'PREPAIMENT',NULL,NULL,'DANZAS','American Express',NULL,NULL,NULL,'6.50','39.00',NULL,NULL,NULL),(20099013,0,'2009-06-19 17:09:35',NULL,'65.00',0,0,0,'PREPAIMENT',NULL,NULL,'DANZAS','American Express',NULL,NULL,NULL,'13.00','78.00',NULL,NULL,NULL),(20099014,0,'2009-06-19 17:43:17',NULL,'6.67',0,0,0,'PREPAIMENT',NULL,NULL,'DANZAS','American Express',NULL,NULL,NULL,'1.33','8.00',NULL,NULL,NULL),(20099015,0,'2009-06-22 00:00:00',NULL,'0.00',0,0,0,'PREPAIMENT',NULL,'AR2001000095','DANZAS','American Express',NULL,NULL,NULL,'0.00','0.00',NULL,2,NULL),(2001000095,0,'2009-08-03 20:26:16',NULL,'0.00',0,0,0,'PREPAIMENT','AR20099015',NULL,'DANZAS','American Express',NULL,NULL,NULL,'0.00','0.00',NULL,2,NULL),(2009090001,0,'2009-05-22 19:24:55',NULL,'66.65',0,0,0,'30 DAYS FROM DATE OF LOADING','AU2009090001',NULL,'DANZAS','American Express',NULL,NULL,NULL,'13.33','79.98',NULL,NULL,NULL),(2009090002,0,'2009-05-22 19:25:26','test','66.65',0,0,0,'30 DAYS FROM DATE OF LOADING','AU2009090001',NULL,'DANZAS','American Express',NULL,NULL,NULL,'6.83','73.48',NULL,NULL,NULL),(2009090003,0,'2009-05-22 00:00:00',NULL,'99.15',0,0,-1,'30 DAYS FROM DATE OF LOADING',NULL,'AR705001','DANZAS','American Express',NULL,NULL,NULL,'19.83','118.98',NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `buchretourwaren` */

DROP TABLE IF EXISTS `buchretourwaren`;

CREATE TABLE `buchretourwaren` (
  `Nummer` int(10) NOT NULL,
  `KundNr` int(10) DEFAULT NULL,
  `Datum` double(15,5) DEFAULT NULL,
  `Notiz` varchar(255) DEFAULT NULL,
  `Summe` decimal(8,2) DEFAULT NULL,
  `Bezahlt` tinyint(1) NOT NULL,
  `Ausgedrukt` tinyint(1) NOT NULL,
  `anElba` tinyint(1) NOT NULL,
  `ZahlungsBedungung` varchar(250) DEFAULT NULL,
  `Woher` varchar(50) DEFAULT NULL,
  `Wohin` varchar(50) DEFAULT NULL,
  `printKundNr` int(10) DEFAULT NULL,
  `TransportMethode` varchar(50) DEFAULT NULL,
  `ZahlungsMethode` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `NotizExtern` varchar(255) DEFAULT NULL,
  `SummeMWST` decimal(8,2) DEFAULT NULL,
  `SummeBrutto` decimal(8,2) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `KundNr2` int(10) DEFAULT NULL,
  PRIMARY KEY (`Nummer`),
  KEY `Nummer` (`Nummer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buchretourwaren` */

LOCK TABLES `buchretourwaren` WRITE;

insert  into `buchretourwaren`(`Nummer`,`KundNr`,`Datum`,`Notiz`,`Summe`,`Bezahlt`,`Ausgedrukt`,`anElba`,`ZahlungsBedungung`,`Woher`,`Wohin`,`printKundNr`,`TransportMethode`,`ZahlungsMethode`,`Status`,`NotizExtern`,`SummeMWST`,`SummeBrutto`,`LieferantNr`,`KundNr2`) values (1,0,38028.00000,NULL,'0.00',0,0,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `buchretourwaren-artikel` */

DROP TABLE IF EXISTS `buchretourwaren-artikel`;

CREATE TABLE `buchretourwaren-artikel` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `RechNr` int(10) NOT NULL,
  `ArtNr` int(10) DEFAULT NULL,
  `PreisATS` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `PreisEuro` decimal(8,4) DEFAULT NULL,
  `Stk` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `PreisATS_Brutto` decimal(8,4) DEFAULT NULL,
  `ArtikelIdentifikation` varchar(50) DEFAULT NULL,
  `EKPreis` decimal(8,4) DEFAULT NULL,
  `Bezeichnung` varchar(255) DEFAULT NULL,
  `LieferantNR` int(10) DEFAULT NULL,
  `PositionStatus` varchar(50) DEFAULT NULL,
  `Referenz` varchar(50) DEFAULT NULL,
  `Packung` varchar(50) DEFAULT NULL,
  `Herkunft` varchar(45) DEFAULT NULL,
  `Incoterm` varchar(45) DEFAULT NULL,
  `Spezifikation` varchar(45) DEFAULT NULL,
  `Zeitpunkt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`,`RechNr`) USING BTREE,
  UNIQUE KEY `ID` (`ID`),
  KEY `buchRetourwarenbuchRetourwaren-Artikel` (`RechNr`),
  KEY `ofRech-ArtikelArtNr` (`ArtNr`),
  KEY `ofRech-ArtikelRechNr` (`RechNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buchretourwaren-artikel` */

LOCK TABLES `buchretourwaren-artikel` WRITE;

UNLOCK TABLES;

/*Table structure for table `buchruestschein` */

DROP TABLE IF EXISTS `buchruestschein`;

CREATE TABLE `buchruestschein` (
  `Nummer` int(10) NOT NULL,
  `KundNr` int(10) DEFAULT NULL,
  `Datum` datetime DEFAULT NULL,
  `Notiz` varchar(2000) DEFAULT NULL,
  `Summe` int(10) DEFAULT NULL,
  `Bezahlt` tinyint(1) NOT NULL,
  `Ausgedrukt` tinyint(1) NOT NULL,
  `anElba` tinyint(1) NOT NULL,
  `ZahlungsBedungung` varchar(250) DEFAULT NULL,
  `Woher` varchar(50) DEFAULT NULL,
  `Wohin` varchar(50) DEFAULT NULL,
  `printKundNr` int(10) DEFAULT NULL,
  `TransportMethode` varchar(50) DEFAULT NULL,
  `ZahlungsMethode` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `NotizIntern` varchar(2000) DEFAULT NULL,
  `NotizExtern` varchar(2000) DEFAULT NULL,
  `SummeMWST` double(15,5) DEFAULT NULL,
  `SummeBrutto` double(15,5) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `MitarbeiterNr` int(10) DEFAULT NULL,
  PRIMARY KEY (`Nummer`),
  KEY `Nummer` (`Nummer`),
  KEY `ofAdressenbuchRüstschein` (`KundNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buchruestschein` */

LOCK TABLES `buchruestschein` WRITE;

UNLOCK TABLES;

/*Table structure for table `buchruestschein-artikel` */

DROP TABLE IF EXISTS `buchruestschein-artikel`;

CREATE TABLE `buchruestschein-artikel` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `RechNr` int(10) NOT NULL,
  `ArtNR` int(10) DEFAULT NULL,
  `PreisATS` decimal(19,4) DEFAULT NULL,
  `PreisEuro` decimal(19,4) DEFAULT NULL,
  `Stk` int(10) DEFAULT NULL,
  `PreisATS_Brutto` decimal(19,4) DEFAULT NULL,
  `ArtikelIdentifikation` varchar(50) DEFAULT NULL,
  `EKPreis` double(15,5) DEFAULT NULL,
  `Bezeichnung` varchar(255) DEFAULT NULL,
  `LieferantNR` int(10) DEFAULT NULL,
  `PositionStatus` varchar(50) DEFAULT NULL,
  `Referenz` varchar(50) DEFAULT NULL,
  `Packung` varchar(50) DEFAULT NULL,
  `Zeitpunkt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`,`RechNr`) USING BTREE,
  UNIQUE KEY `ID` (`ID`),
  KEY `buchRüstscheinbuchRüstschein-Artikel` (`RechNr`),
  KEY `ofRech-ArtikelArtNr` (`ArtNR`),
  KEY `ofRech-ArtikelRechNr` (`RechNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buchruestschein-artikel` */

LOCK TABLES `buchruestschein-artikel` WRITE;

UNLOCK TABLES;

/*Table structure for table `buchseriennummer` */

DROP TABLE IF EXISTS `buchseriennummer`;

CREATE TABLE `buchseriennummer` (
  `SerNrId` int(10) NOT NULL AUTO_INCREMENT,
  `ArtNr` int(10) DEFAULT NULL,
  `SerienNr` varchar(50) DEFAULT NULL,
  `EKPreis` decimal(19,4) DEFAULT NULL,
  `VKPreis` decimal(19,4) DEFAULT NULL,
  `EingangsDatum` datetime DEFAULT NULL,
  `RüstscheinNr` int(10) DEFAULT NULL,
  `LieferscheinNr` int(10) DEFAULT NULL,
  `RechnungsNr` int(10) DEFAULT NULL,
  `RetourenNr` int(10) DEFAULT NULL,
  `BruttoGewicht` double(15,5) DEFAULT NULL,
  `NettoGewicht` double(15,5) DEFAULT NULL,
  `TarraGewicht` double(15,5) DEFAULT NULL,
  `ErstelltAm` datetime DEFAULT NULL,
  PRIMARY KEY (`SerNrId`),
  UNIQUE KEY `SerienNr` (`SerienNr`),
  KEY `buchSeriennummerArtNr` (`ArtNr`),
  KEY `grArtikelbuchSeriennummer` (`ArtNr`),
  KEY `SerNrId` (`SerNrId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buchseriennummer` */

LOCK TABLES `buchseriennummer` WRITE;

UNLOCK TABLES;

/*Table structure for table `buchsetartikel` */

DROP TABLE IF EXISTS `buchsetartikel`;

CREATE TABLE `buchsetartikel` (
  `SetId` int(10) NOT NULL AUTO_INCREMENT,
  `ArtNr` int(10) DEFAULT NULL,
  `UnterArtNr` int(10) DEFAULT NULL,
  PRIMARY KEY (`SetId`),
  KEY `ArtNr` (`ArtNr`),
  KEY `grArtikelbuchSetArtikel` (`ArtNr`),
  KEY `grArtikelbuchSetArtikel1` (`UnterArtNr`),
  KEY `SetId` (`SetId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buchsetartikel` */

LOCK TABLES `buchsetartikel` WRITE;

UNLOCK TABLES;

/*Table structure for table `buchvorgaenge` */

DROP TABLE IF EXISTS `buchvorgaenge`;

CREATE TABLE `buchvorgaenge` (
  `Typ` varchar(2) NOT NULL,
  `RechNr` int(10) NOT NULL,
  `KundNr` int(10) NOT NULL,
  `Datum` datetime NOT NULL,
  `Notiz` varchar(50) DEFAULT NULL,
  `Summe` decimal(19,4) DEFAULT NULL,
  `Bezahlt` tinyint(1) NOT NULL,
  `Ausgedrukt` tinyint(1) NOT NULL,
  `anElba` tinyint(1) NOT NULL,
  `ZahlungsBedingung` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Typ`,`RechNr`,`KundNr`,`Datum`),
  KEY `buchAngebotRechNr` (`RechNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `buchvorgaenge` */

LOCK TABLES `buchvorgaenge` WRITE;

insert  into `buchvorgaenge`(`Typ`,`RechNr`,`KundNr`,`Datum`,`Notiz`,`Summe`,`Bezahlt`,`Ausgedrukt`,`anElba`,`ZahlungsBedingung`) values ('AU',2009090002,0,'2009-05-22 21:20:41',NULL,NULL,0,0,0,NULL),('AU',2009090004,0,'2009-06-06 23:24:55',NULL,NULL,0,0,0,NULL),('LI',20099000,0,'2009-06-15 23:53:37',NULL,'162.5000',0,0,0,NULL);

UNLOCK TABLES;

/*Table structure for table `buchvorgaengeausdrucke` */

DROP TABLE IF EXISTS `buchvorgaengeausdrucke`;

CREATE TABLE `buchvorgaengeausdrucke` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Dateiname` varchar(255) DEFAULT NULL,
  `Engine` varchar(10) DEFAULT NULL,
  `Bereich` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Dateiname` (`Dateiname`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `buchvorgaengeausdrucke` */

LOCK TABLES `buchvorgaengeausdrucke` WRITE;

insert  into `buchvorgaengeausdrucke`(`ID`,`Dateiname`,`Engine`,`Bereich`) values (1,'Vorlagen\\Vorlage_Rechnung.doc','RTF','VORGANG_AR'),(2,'Vorlagen\\Vorlage_Paketschein.doc','RTF','VORGANG_LI'),(3,'Vorlagen\\Vorlage_Paketschein_GeneralParcel.doc','RTF','VORGANG_LI'),(4,'Vorlagen\\Vorlage_Rechnung.rtf','RTF','VORGANG'),(5,'Vorlagen\\5. Angebot.dot','XML','VORGANG_AN'),(6,'Vorlagen\\1. Anfrage.dot','XML','LANFRAGE'),(7,'Vorlagen\\17. Rechnung.dot','XML','VORGANG_AR'),(8,'Vorlagen\\6. Einkaufsvertrag EU.dot','XML','VORGANG_LAU'),(9,'Vorlagen\\7. Einkaufsvertrag NICHT EU.dot','XML','VORGANG_LAU'),(10,'Vorlagen\\8. Verkaufsvertrag EU.dot','XML','VORGANG_AU'),(11,'Vorlagen\\9. Verkaufsvertrag nicht EU.dot','XML','VORGANG_AU'),(12,'Vorlagen\\12. Transport Auftrag EU.dot','XML','TRANSPORT'),(13,'Vorlagen\\12. Transport Auftrag nicht EU.dot','XML','TRANSPORT'),(15,'Vorlagen\\2. Transport Anfrage.dot','XML','TRANSPORT'),(16,'Vorlagen\\15. Lieferschein.dot','XML','VORGANG_LI'),(17,'Vorlagen\\14. Lieferanten Instruktionen.dot','XML','TRANSPORT_LI'),(18,'Vorlagen\\10. Checklist für Verladungen.dot','XML','CHECKLIST'),(19,'Vorlagen\\10. Checklist für Verladungen-eng.dot','XML','CHECKLIST'),(20,'Vorlagen\\1. Anfrage-eng.dot','XML','LANFRAGE'),(21,'Vorlagen\\5. Angebot-eng.dot','XML','VORGANG_AN'),(22,'Vorlagen\\16. Paletten Etticket.dot','XML','VORGANG_LI'),(23,'Vorlagen\\14. LI Russland.dot','XML','TRANSPORT_LI'),(24,'Vorlagen\\14. LI EU NICHT NEUTRAL.dot','XML','TRANSPORT_LI'),(25,'Vorlagen\\14. LI EU NEUTRAL.dot','XML','TRANSPORT_LI'),(26,'Vorlagen\\8. Vermittlungsvertrag.dot','XML','VORGANG_AU'),(27,'Vorlagen\\18. Lieferanten - Brief','XML','ADRESSE'),(28,'Vorlagen\\2. Transport Anfrage eng.dot','XML','TRANSPORT'),(29,'Vorlagen\\12. Transport Auftrag 2 Produkte EU.dot','XML','TRANSPORT');

UNLOCK TABLES;

/*Table structure for table `buchvorgaengeausdruckelog` */

DROP TABLE IF EXISTS `buchvorgaengeausdruckelog`;

CREATE TABLE `buchvorgaengeausdruckelog` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Dateiname` varchar(255) DEFAULT NULL,
  `GedrucktAm` datetime DEFAULT NULL,
  `Funktion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Dateiname` (`Dateiname`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `buchvorgaengeausdruckelog` */

LOCK TABLES `buchvorgaengeausdruckelog` WRITE;

insert  into `buchvorgaengeausdruckelog`(`ID`,`Dateiname`,`GedrucktAm`,`Funktion`) values (1,'Vorlagen\\17. Rechnung.dot','2009-08-03 20:26:29','Word');

UNLOCK TABLES;

/*Table structure for table `buchvorgaengeeigenschaften` */

DROP TABLE IF EXISTS `buchvorgaengeeigenschaften`;

CREATE TABLE `buchvorgaengeeigenschaften` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `VorgangTyp` varchar(3) DEFAULT NULL,
  `Nummer` int(10) DEFAULT NULL,
  `Name` varchar(50) NOT NULL DEFAULT 'x',
  `Value` varchar(50) DEFAULT NULL,
  `ErstelltAm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`),
  KEY `Name` (`Name`),
  KEY `Nummer` (`Nummer`),
  KEY `VorgangTyp` (`VorgangTyp`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=latin1;

/*Data for the table `buchvorgaengeeigenschaften` */

LOCK TABLES `buchvorgaengeeigenschaften` WRITE;

insert  into `buchvorgaengeeigenschaften`(`ID`,`VorgangTyp`,`Nummer`,`Name`,`Value`,`ErstelltAm`) values (1,'AR',1,'1','1','2009-05-26 23:11:53'),(2,'AR',1,'x',NULL,'2009-05-26 23:11:57'),(3,NULL,NULL,'2',NULL,'2009-05-26 23:11:58'),(69,'AR',2007070095,'Paketnummer','38128101709','2009-06-05 12:15:48'),(70,'AR',2007042654,'Paketnummer','38128101710','2009-06-05 12:15:48'),(71,'AR',2007070096,'Paketnummer','38128101711','2009-06-05 12:15:48'),(72,'AR',2007012834,'Paketnummer','38128101712','2009-06-05 12:15:48'),(73,'AR',2007012836,'Paketnummer','38128101713','2009-06-05 12:15:48'),(74,'AR',2007012835,'Paketnummer','38128101714','2009-06-05 12:15:48'),(75,'AR',2007042655,'Paketnummer','38128101715','2009-06-05 12:15:48'),(76,'AR',2007012838,'Paketnummer','38128101716','2009-06-05 12:15:48'),(77,'AR',2007042658,'Paketnummer','38128101717','2009-06-05 12:15:48'),(78,'AR',2007080418,'Paketnummer','38128101718','2009-06-05 12:15:48'),(79,'AR',2007080419,'Paketnummer','38128101719','2009-06-05 12:15:48'),(80,'AR',2007042663,'Paketnummer','38128101720','2009-06-05 12:15:48'),(81,'AR',2007042662,'Paketnummer','38128101721','2009-06-05 12:15:48'),(82,'AR',2007080420,'Paketnummer','38128101722','2009-06-05 12:15:48'),(83,'AR',2007030815,'Paketnummer','38128101723','2009-06-05 12:15:48'),(84,'AR',2007042659,'Paketnummer','38128101724','2009-06-05 12:15:48'),(85,'AR',2007042660,'Paketnummer','38128101725','2009-06-05 12:15:48'),(86,'AR',2007042661,'Paketnummer','38128101726','2009-06-05 12:15:48'),(87,'AR',2007012853,'Paketnummer','38128101727','2009-06-05 12:15:48'),(88,'AR',2007042664,'Paketnummer','38128101728','2009-06-05 12:15:48'),(89,'AR',2007012831,'Paketnummer','38715460006','2009-06-05 12:15:48'),(90,'AR',2007012832,'Paketnummer','38715460007','2009-06-05 12:15:48'),(91,'AR',2007012833,'Paketnummer','38715460008','2009-06-05 12:15:48'),(92,'AR',2007012837,'Paketnummer','38715460009','2009-06-05 12:15:48'),(93,'AR',2007012839,'Paketnummer','38715460010','2009-06-05 12:15:48'),(94,'AR',2007012840,'Paketnummer','38715460011','2009-06-05 12:15:48'),(95,'AR',2007012843,'Paketnummer','38715460012','2009-06-05 12:15:48'),(96,'AR',2007012841,'Paketnummer','38715460013','2009-06-05 12:15:48'),(97,'AR',2007012844,'Paketnummer','38715460014','2009-06-05 12:15:48'),(98,'AR',2007012845,'Paketnummer','38715460015','2009-06-05 12:15:48'),(99,'AR',2007012842,'Paketnummer','38715460016','2009-06-05 12:15:48'),(100,'AR',2007012846,'Paketnummer','38715460017','2009-06-05 12:15:48'),(101,'AR',2007012848,'Paketnummer','38715460018','2009-06-05 12:15:48'),(102,'AR',2007012847,'Paketnummer','38715460019','2009-06-05 12:15:48'),(103,'AR',2007012851,'Paketnummer','38715460020','2009-06-05 12:15:48'),(104,'AR',2007012850,'Paketnummer','38715460021','2009-06-05 12:15:48'),(105,'AR',2007042665,'Paketnummer','38128101729','2009-06-05 12:15:48'),(106,'AR',2009011741,'Paketnummer','38715465794','2009-06-05 12:15:48'),(107,'AR',2009011741,'Paketnummer','38715465795','2009-06-05 12:15:48'),(108,'AR',2009011748,'Paketnummer','38715465796','2009-06-05 12:15:48'),(109,'AR',2009011750,'Paketnummer','38715465797','2009-06-05 12:15:48'),(110,'AR',2009011747,'Paketnummer','38715465798','2009-06-05 12:15:48'),(111,'AR',2009011746,'Paketnummer','38715465799','2009-06-05 12:15:48'),(112,'AR',2009011743,'Paketnummer','38715465800','2009-06-05 12:15:48'),(113,'AR',2009011716,'Paketnummer','38715465801','2009-06-05 12:15:48'),(114,'AR',2009011729,'Paketnummer','38715465802','2009-06-05 12:15:48'),(115,'AR',2009011723,'Paketnummer','38715465803','2009-06-05 12:15:48'),(116,'AR',2009011711,'Paketnummer','38715465804','2009-06-05 12:15:48'),(117,'AR',2009011751,'Paketnummer','38715465805','2009-06-05 12:15:49'),(118,'AR',2009011753,'Paketnummer','38715465806','2009-06-05 12:15:49'),(119,'AR',2009011754,'Paketnummer','38715465807','2009-06-05 12:15:49'),(120,'AR',2009011767,'Paketnummer','38715465808','2009-06-05 12:15:49'),(121,'AR',2009011769,'Paketnummer','38715465809','2009-06-05 12:15:49'),(122,'AR',2009011763,'Paketnummer','38715465810','2009-06-05 12:15:49'),(123,'AR',2009011765,'Paketnummer','38715465811','2009-06-05 12:15:49'),(124,'AR',2009011759,'Paketnummer','38715465812','2009-06-05 12:15:49'),(125,'AR',2009011761,'Paketnummer','38715465813','2009-06-05 12:15:49'),(126,'AR',2009011778,'Paketnummer','38715465814','2009-06-05 12:15:49'),(127,'AR',2009011771,'Paketnummer','38715465815','2009-06-05 12:15:49'),(128,'AR',2009011758,'Paketnummer','38715465816','2009-06-05 12:15:49'),(129,'AR',2009011755,'Paketnummer','38715465817','2009-06-05 12:15:49'),(130,'AR',2009011757,'Paketnummer','38715465818','2009-06-05 12:15:49'),(131,'AR',705014,'Paketnummer','test','2009-06-05 16:10:46'),(132,'AR',705015,'Paketnummer','test','2009-06-05 16:10:47'),(133,'AR',705016,'Paketnummer','test','2009-06-05 16:13:33'),(134,'LI',705001,'Paketnummer','test','2009-06-06 23:18:09'),(135,'AR',705018,'Paketnummer','test','2009-06-06 23:18:14'),(138,'AU',705005,'Paketnummer','test','2009-06-11 14:28:15'),(139,'AU',705005,'Paketnummer','test','2009-06-11 14:28:15'),(141,'AR',705019,'Paketnummer','test','2009-06-11 14:50:34'),(142,'AR',705019,'Paketnummer','test','2009-06-11 14:50:34'),(144,'AR',705020,'Paketnummer','test','2009-06-11 19:00:37'),(145,'AR',705020,'Paketnummer','test','2009-06-11 19:00:37'),(147,'AU',705006,'Paketnummer','test','2009-06-11 19:00:47'),(148,'AU',705006,'Paketnummer','test','2009-06-11 19:00:47'),(150,'AU',705007,'Paketnummer','test','2009-06-11 19:00:50'),(151,'AU',705007,'Paketnummer','test','2009-06-11 19:00:50'),(153,'AR',705021,'Paketnummer','test','2009-06-11 19:00:52'),(154,'AR',705021,'Paketnummer','test','2009-06-11 19:00:52'),(156,'GU',705002,'Paketnummer','test','2009-06-11 19:00:54'),(157,'GU',705002,'Paketnummer','test','2009-06-11 19:00:54'),(158,'AR',20099000,'Paketnummer','test','2009-06-11 19:02:44'),(159,'AR',705022,'Paketnummer','test','2009-06-11 19:04:14'),(160,'AR',705022,'Paketnummer','test','2009-06-11 19:04:14'),(162,'AR',705023,'Paketnummer','test','2009-06-11 19:04:46'),(163,'AR',705023,'Paketnummer','test','2009-06-11 19:04:46'),(165,'AU',705008,'Paketnummer','test','2009-06-11 19:04:49'),(166,'AU',705008,'Paketnummer','test','2009-06-11 19:04:49'),(168,'AN',705001,'Paketnummer','test','2009-06-11 19:04:53'),(169,'AN',705001,'Paketnummer','test','2009-06-11 19:04:53'),(171,'AR',705024,'Paketnummer','test','2009-06-11 19:05:03'),(172,'AR',705024,'Paketnummer','test','2009-06-11 19:05:03'),(174,'AR',705025,'Paketnummer','test','2009-06-11 19:05:06'),(175,'AR',705025,'Paketnummer','test','2009-06-11 19:05:06'),(180,'AR',705026,'Paketnummer','test','2009-06-13 19:02:21'),(181,'AR',705026,'Paketnummer','test','2009-06-13 19:02:21');

UNLOCK TABLES;

/*Table structure for table `buchvorgaengestatus` */

DROP TABLE IF EXISTS `buchvorgaengestatus`;

CREATE TABLE `buchvorgaengestatus` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `VorgangTyp` varchar(3) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

/*Data for the table `buchvorgaengestatus` */

LOCK TABLES `buchvorgaengestatus` WRITE;

insert  into `buchvorgaengestatus`(`ID`,`VorgangTyp`,`Status`) values (1,'AU','neu'),(2,'AU','bestätigt'),(3,'AU','bestellt Lieferant'),(4,'AU','abgeschlossen'),(5,'LI','neu'),(6,'AU','Ware eingetroffen'),(7,'LI','gesendet'),(8,'LI','abgeschlossen'),(9,'AR','neu'),(10,'AR','gesendet'),(11,'AR','bezahlt'),(12,'AR','abgeschlossen'),(13,'AU','Teillief. Gemacht'),(14,'LI','Ware gepackt'),(15,'LI','Ware b. Kunden'),(16,'AR','Teilzahlung'),(17,'AU','VERTRAG MIT KUNDEN'),(18,'AU','VERTRAG MIT LIEFERANTEN'),(19,'AU','ANFRAGE TRANSPORPREIS'),(20,'AU','TRANSPORTAUFTRAG'),(21,'AU','VERLADEINSTRUKTIONEN'),(22,'AU','VERLADUNG'),(23,'AU','LIEFERSCHEIN'),(24,'AU','RECHNUNG'),(25,'AU','ZAHLUNGSCHECK'),(26,'AU','DOKUMENTE VORHANDEN'),(27,'AU','BUCHHALTUNG'),(28,'AU','ZAHLUNGSEINGANG'),(29,'AU','PROVISIONSBERECHNUNG'),(30,'LAU','neu'),(31,'LAU','abgeschlossen'),(32,'AN','neu'),(33,'AN','wartet auf Antwort'),(34,'AN','abgeschlossen');

UNLOCK TABLES;

/*Table structure for table `buchvorgang-artikeldetaillager` */

DROP TABLE IF EXISTS `buchvorgang-artikeldetaillager`;

CREATE TABLE `buchvorgang-artikeldetaillager` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Vorgangstyp` varchar(2) DEFAULT NULL,
  `Vorgangsnummer` int(10) DEFAULT NULL,
  `Datum` datetime DEFAULT NULL,
  `ArtNr` int(10) DEFAULT NULL,
  `Stk` double(15,5) DEFAULT NULL,
  `EKPreis` double(15,5) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `LagerOrt` int(10) DEFAULT NULL,
  `Einheiten` double DEFAULT NULL,
  `GewichtBrutto` double DEFAULT NULL,
  `GewichtNetto` double DEFAULT NULL,
  `GewichtTara` double DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`),
  KEY `Nummer` (`Vorgangstyp`),
  KEY `LagerOrt` (`LagerOrt`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

/*Data for the table `buchvorgang-artikeldetaillager` */

LOCK TABLES `buchvorgang-artikeldetaillager` WRITE;

insert  into `buchvorgang-artikeldetaillager`(`Id`,`Vorgangstyp`,`Vorgangsnummer`,`Datum`,`ArtNr`,`Stk`,`EKPreis`,`LieferantNr`,`LagerOrt`,`Einheiten`,`GewichtBrutto`,`GewichtNetto`,`GewichtTara`) values (44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,24,5555,5000,555);

UNLOCK TABLES;

/*Table structure for table `buchvorgangeigenschaft` */

DROP TABLE IF EXISTS `buchvorgangeigenschaft`;

CREATE TABLE `buchvorgangeigenschaft` (
  `VorgangTyp` varchar(2) NOT NULL,
  `Eigenschaft` varchar(50) NOT NULL,
  PRIMARY KEY (`VorgangTyp`,`Eigenschaft`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buchvorgangeigenschaft` */

LOCK TABLES `buchvorgangeigenschaft` WRITE;

insert  into `buchvorgangeigenschaft`(`VorgangTyp`,`Eigenschaft`) values ('AN','Ablaufsdatum'),('AN','Destination'),('AN','Fabrik'),('AN','Herkunft'),('AN','Incoterm'),('AU','Ablaufsdatum'),('AU','Destination'),('AU','Fabrik'),('AU','Herkunft'),('AU','Incoterm'),('LI','Ablaufsdatum'),('LI','Bruttogewicht'),('LI','Destination'),('LI','Entladeplatz'),('LI','Fabrik'),('LI','Herkunft'),('LI','ImportLicenceNr'),('LI','Incoterm'),('LI','Kondition'),('LI','Ladetag'),('LI','LKWNr'),('LI','Nettogewicht'),('LI','Packetnr'),('LI','Produktionsdatum'),('LI','Temperatur'),('LI','Vetirinardr'),('LI','ZollNr');

UNLOCK TABLES;

/*Table structure for table `calcsheet` */

DROP TABLE IF EXISTS `calcsheet`;

CREATE TABLE `calcsheet` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `AuftragNr` int(10) DEFAULT NULL,
  `Position` int(10) DEFAULT NULL,
  `Bezeichnung` varchar(255) DEFAULT NULL,
  `Col1` varchar(50) DEFAULT NULL,
  `Col2` varchar(50) DEFAULT NULL,
  `Col3` varchar(50) DEFAULT NULL,
  `Col4` varchar(50) DEFAULT NULL,
  `ErstelltAm` datetime DEFAULT NULL,
  `VorgangTyp` varchar(2) DEFAULT NULL,
  `CalcTyp` int(10) unsigned DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `AuftragNr` (`AuftragNr`),
  KEY `ErstelltAm` (`ErstelltAm`),
  KEY `Position` (`Position`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `calcsheet` */

LOCK TABLES `calcsheet` WRITE;

UNLOCK TABLES;

/*Table structure for table `calcsheetmitarbeiterprovision` */

DROP TABLE IF EXISTS `calcsheetmitarbeiterprovision`;

CREATE TABLE `calcsheetmitarbeiterprovision` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `MitarbeiterNr` int(10) DEFAULT NULL,
  `VKProvision` int(10) DEFAULT NULL,
  `EKProvision` int(10) DEFAULT NULL,
  `ErstelltAm` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ErstelltAm` (`ErstelltAm`),
  KEY `MitarbeiterNr` (`MitarbeiterNr`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `calcsheetmitarbeiterprovision` */

LOCK TABLES `calcsheetmitarbeiterprovision` WRITE;

insert  into `calcsheetmitarbeiterprovision`(`ID`,`MitarbeiterNr`,`VKProvision`,`EKProvision`,`ErstelltAm`) values (1,4,15,10,'2006-12-04 18:24:25'),(2,3,0,0,'2006-12-04 18:24:26'),(3,5,0,0,NULL),(4,11,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `calcsheetpositions` */

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

/*Data for the table `calcsheetpositions` */

LOCK TABLES `calcsheetpositions` WRITE;

insert  into `calcsheetpositions`(`Position`,`Gruppe`,`Bezeichnung`,`Col1`,`Col2`,`Col3`,`Col4`,`Operation`,`Sortierung`) values (101,'Einkauf','Position','INSERT INTO calcSheet( Col1, Col2, Col3, Bezeichnung, [Position], AuftragNr )\r\nSELECT Stk, EKPreis, Stk*EKPreis,  [buchAuftrag-Artikel].Bezeichnung, 101 AS Pos,  [AuftragNr] \r\nFROM [buchAuftrag-Artikel]\r\nWHERE RechNr=[AuftragNr]','0','select Col1*Col2 from ofVars where Id=1',NULL,NULL,102),(102,'Einkauf','LAGERKOSTEN','0','0','select Col1*Col2 from ofVars where Id=1',NULL,NULL,103),(103,'Einkauf','VETERINÄRKOSTEN','0','0','select Col1*Col2 from ofVars where Id=1',NULL,NULL,104),(104,'Einkauf','VERZOLLUNG','0','0','select Col1*Col2 from ofVars where Id=1',NULL,NULL,105),(105,'Einkauf','FREMDE PROVISION','0','0','select Col1*Col2 from ofVars where Id=1',NULL,NULL,106),(106,'Einkauf','SONSTIGE KOSTEN','1','0','select Col1*Col2 from ofVars where Id=1',NULL,NULL,107),(107,'Einkauf','SKONTO','0','select round(sum([Col3]),2) from calcSheetView where Gruppe=\'Einkauf\' and AuftragNr=[AuftragNr] and isNumeric([Col3])  and Position<>107 and Position<>199','select round(-1*Col1*Col2/100 ,2) from ofVars where Id=1',NULL,NULL,108),(199,'Einkauf','Einkauf',NULL,NULL,'select round(sum([Col3]),2) from calcSheetView where Gruppe=\'Einkauf\' and AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position<>199',NULL,NULL,109),(201,'Verkauf','Position','INSERT INTO calcSheet( Col1, Col2, Col3, Bezeichnung, [Position], AuftragNr )\r\nSELECT Stk, PreisATS, Stk*PreisATS, [buchAuftrag-Artikel].Bezeichnung, 201 AS Pos,  [AuftragNr] \r\nFROM [buchAuftrag-Artikel]\r\nWHERE RechNr=[AuftragNr]','0','select Col1*Col2 from ofVars',NULL,NULL,201),(202,'Verkauf','ZUSÄTZLICHER ERTRAG','1','0','select Col1*Col2 from ofVars where Id=1',NULL,NULL,202),(203,'Verkauf','SKONTO','0','select round(sum([Col3]),2) from calcSheetView where Gruppe=\'Verkauf\' and AuftragNr=[AuftragNr] and Position <> 203 and Position <> 299','select -1*Col1*Col2/100 from ofVars',NULL,NULL,203),(299,'Verkauf','Verkauf',NULL,NULL,'select round(sum([Col3]),2) from calcSheetView where Gruppe=\'Verkauf\' and AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position <> 299',NULL,NULL,299),(300,'Transport','Transport','1','SELECT TransportKosten FROM tradeBoardGeschaeft WHERE AuftragNr = [AuftragNr]','select round(Col1*Col2,2) from ofVars',NULL,NULL,300),(400,'Finanzierung','Zahlungs-Ziel Tage','select getZahlungZielTage([ZahlungsBedungung]) from buchAuftrag where Nummer=[AuftragNr]',NULL,NULL,NULL,NULL,400),(401,'Finanzierung','Factoring Gebühr','0,35','select col3 from calcSheetView where Bezeichnung=\'Verkauf\' and AuftragNr=[AuftragNr]','select round(Col1*Col2/100,2) from ofVars',NULL,NULL,401),(402,'Finanzierung','Verzinsung','5,5','select round(col3 * 1/360 * (select v.COL1 from calcSheetView v where v.Bezeichnung=\'Zahlungs-Ziel Tage\' and v.AuftragNr=[AuftragNr]),2)  from calcSheetView where Bezeichnung=\'Verkauf\' and AuftragNr=[AuftragNr]','select round(Col1*Col2/100,2) from ofVars',NULL,NULL,402),(403,'Finanzierung','GKZ','1','select col3 from calcSheetView where Bezeichnung=\'Verkauf\' and AuftragNr=[AuftragNr]','select round(Col1*Col2/100,2) from ofVars',NULL,NULL,403),(405,'Finanzierung','Versicherung','0,0053333333','select round(col3*(30 +  (select v.COL1 from calcSheetView v where v.Bezeichnung=\'Zahlungs-Ziel Tage\' and v.AuftragNr=[AuftragNr])),2) from calcSheetView where Bezeichnung=\'Verkauf\' and AuftragNr=[AuftragNr]','select round(Col1*Col2/100,2) from ofVars',NULL,NULL,405),(499,'Finanzierung','Finanzierungskosten',NULL,NULL,'select round(sum([Col3]) , 2) from calcSheetView where Gruppe=\'Finanzierung\' and AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position <> 499',NULL,NULL,499),(500,'Transport','Ergebnis Brutto',NULL,NULL,'select round( sum(c), 2) from (\r\nselect ([Col3])  as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3])  and Position = 299\r\nunion  \r\nselect -1*([Col3]) as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position = 199\r\nunion  \r\nselect -1*([Col3]) as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position = 300\r\nunion  \r\nselect -1*([Col3]) as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position = 499\r\n) t3',NULL,NULL,399),(501,'Ergebnis_Hide','DB1',NULL,NULL,'select round( sum(c), 2) from (\r\nselect ([Col3])  as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3])  and Position = 299\r\nunion  \r\nselect -1*([Col3]) as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position = 199\r\nunion  \r\nselect -1*([Col3]) as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position = 300\r\n) t3',NULL,NULL,399),(502,'Ergebnis_Hide','DB2',NULL,NULL,'select round( sum(c), 2) from (\r\nselect ([Col3])  as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3])  and Position = 501\r\nunion  \r\nselect -1*([Col3]) as c from calcSheetView where AuftragNr=[AuftragNr] and isNumeric([Col3]) and Position = 499\r\n) t3',NULL,NULL,705),(600,'Ergebnis','Provision Einkauf','SELECT EKProvision\r\nFROM tradeBoardGeschaeft INNER JOIN calcSheetMitarbeiterProvision ON tradeBoardGeschaeft.MitarbeiterEK = calcSheetMitarbeiterProvision.MitarbeiterNr\r\nWHERE AuftragNr =[AuftragNr]','select sum([Col3]) from calcSheetView where Position=502 and AuftragNr=[AuftragNr] and isNumeric([Col3])','select round(Col1*Col2/100,2) from ofVars',NULL,NULL,600),(700,'Ergebnis','Provision Verkauf','SELECT VKProvision\r\nFROM tradeBoardGeschaeft INNER JOIN calcSheetMitarbeiterProvision ON tradeBoardGeschaeft.MitarbeiterVK = calcSheetMitarbeiterProvision.MitarbeiterNr\r\nWHERE AuftragNr =[AuftragNr]','select sum([Col3]) from calcSheetView where  Position=502  and AuftragNr=[AuftragNr] and isNumeric([Col3])','select round(Col1*Col2/100,2) from ofVars',NULL,NULL,700),(1000,'Ergebnis','Ergebnis Netto',NULL,NULL,'select round(sum(c), 2) from (select [Col3] as c from calcSheetView where Bezeichnung=\'DB2\' and AuftragNr=[AuftragNr] \r\nunion \r\nselect -1*[Col3]  as c from calcSheetView where Bezeichnung=\'Provision Einkauf\' and AuftragNr=[AuftragNr]\r\nunion\r\nselect -1*[Col3] as c from calcSheetView where Bezeichnung=\'Provision Verkauf\' and AuftragNr=[AuftragNr]\r\n)',NULL,NULL,1000),(1001,'Ergebnis','Aufschlag','select col3 from calcSheetView where Bezeichnung=\'Einkauf\' and AuftragNr=[AuftragNr]','select col3 from calcSheetView where Bezeichnung=\'Ergebnis Netto\' and AuftragNr=[AuftragNr]','select round(100*(Col2)/Col1,2) & \" %\" from ofVars',NULL,NULL,1001);

UNLOCK TABLES;

/*Table structure for table `granrede` */

DROP TABLE IF EXISTS `granrede`;

CREATE TABLE `granrede` (
  `Anrede` varchar(20) NOT NULL,
  `Briefanrede` varchar(50) DEFAULT NULL,
  `Titel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Anrede`),
  KEY `grAnredeAnrede` (`Anrede`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `granrede` */

LOCK TABLES `granrede` WRITE;

insert  into `granrede`(`Anrede`,`Briefanrede`,`Titel`) values ('Firma','Sehr geehrte Damen und Herren','Prof.'),('Frau','Sehr geehrte Frau','Ing.'),('Herr','Sehr geehrter Herr','Dr.'),('Herr Dr.',NULL,'Dipl.Ing.'),('Herr Prof.',NULL,'Mag.'),('Ms','Dear Miss',NULL),('Sir','Dear Mister',NULL);

UNLOCK TABLES;

/*Table structure for table `grartikel` */

DROP TABLE IF EXISTS `grartikel`;

CREATE TABLE `grartikel` (
  `ArtNr` int(10) NOT NULL,
  `EAN` varchar(50) NOT NULL DEFAULT 'EAN',
  `Barcode` varchar(50) DEFAULT NULL,
  `Bezeichnung` varchar(50) DEFAULT NULL,
  `Bezeichnung1` varchar(50) DEFAULT NULL,
  `Beschreibung` longtext,
  `Einheit` varchar(50) DEFAULT NULL,
  `PreisATS` decimal(19,4) DEFAULT NULL,
  `PreisEuro` decimal(19,4) DEFAULT NULL,
  `PreisATS_Brutto` decimal(19,4) DEFAULT NULL,
  `LagerArtikel` tinyint(1) NOT NULL DEFAULT '0',
  `EKPreis` decimal(19,4) DEFAULT NULL,
  `LEKPreis` decimal(19,4) DEFAULT NULL,
  `Seriennummer` tinyint(1) NOT NULL DEFAULT '0',
  `LieferantNR` int(10) DEFAULT NULL,
  `SetArtikel` tinyint(1) NOT NULL DEFAULT '0',
  `ArtKatNr` int(10) DEFAULT NULL,
  `MWST` int(10) DEFAULT NULL,
  `Gewicht` varchar(10) DEFAULT NULL,
  `Picture` varchar(255) DEFAULT NULL,
  `HerstellerNr` int(10) DEFAULT NULL,
  `ProduktAktiv` tinyint(1) NOT NULL DEFAULT '0',
  `ShopURL` longtext,
  `HerstellerURL` longtext,
  `Modifikationen` varchar(255) DEFAULT NULL,
  `HerstellerRabatt` double(15,5) DEFAULT NULL,
  `HerstellerRabattText` varchar(50) DEFAULT NULL,
  `AngelegtAn` datetime DEFAULT NULL,
  `BruttoGewicht` double(15,5) DEFAULT NULL,
  `NettoGewicht` double(15,5) DEFAULT NULL,
  `TaraGewicht` double(15,5) DEFAULT NULL,
  `AngelegtAm` datetime DEFAULT NULL,
  `NichtBestellbar` tinyint(1) NOT NULL DEFAULT '0',
  `ProduktAktivOnline` tinyint(4) DEFAULT '-1',
  PRIMARY KEY (`ArtNr`),
  KEY `ArtKatNr` (`ArtKatNr`),
  KEY `Barcode` (`Barcode`),
  KEY `Bezeichnung` (`Bezeichnung`),
  KEY `Bezeichnung1` (`Bezeichnung1`),
  KEY `EAN` (`EAN`),
  KEY `Einheit` (`Einheit`),
  KEY `grArtikel-KategoriengrArtikel` (`ArtKatNr`),
  KEY `HerstellerNr` (`HerstellerNr`),
  KEY `LagerArtikel` (`LagerArtikel`),
  KEY `LieferantNR` (`LieferantNR`),
  KEY `PreisATS` (`PreisATS`),
  KEY `PreisATS_Brutto` (`PreisATS_Brutto`),
  KEY `PreisEuro` (`PreisEuro`),
  KEY `ProduktAktiv` (`ProduktAktiv`),
  KEY `Seriennummer` (`Seriennummer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grartikel` */

LOCK TABLES `grartikel` WRITE;

insert  into `grartikel`(`ArtNr`,`EAN`,`Barcode`,`Bezeichnung`,`Bezeichnung1`,`Beschreibung`,`Einheit`,`PreisATS`,`PreisEuro`,`PreisATS_Brutto`,`LagerArtikel`,`EKPreis`,`LEKPreis`,`Seriennummer`,`LieferantNR`,`SetArtikel`,`ArtKatNr`,`MWST`,`Gewicht`,`Picture`,`HerstellerNr`,`ProduktAktiv`,`ShopURL`,`HerstellerURL`,`Modifikationen`,`HerstellerRabatt`,`HerstellerRabattText`,`AngelegtAn`,`BruttoGewicht`,`NettoGewicht`,`TaraGewicht`,`AngelegtAm`,`NichtBestellbar`,`ProduktAktivOnline`) values (1,'EAN1',NULL,'CALCULATE_PAYMODECOSTS',NULL,'nicht löschen!',NULL,'42.5000','3.0886','51.0000',-1,'20.8000','0.0000',0,1,0,0,20,NULL,'skins/skin_nca/productImages/(keines)',0,0,'http://www.arfaian.com/default.asp?ArtNr=0',NULL,'Color:ROT,GRÜN;',NULL,NULL,NULL,NULL,NULL,NULL,NULL,-1,-1),(2,'EAN2',NULL,'CALCULATE_POSTCOSTS',NULL,'nicht löschen!',NULL,'22.0000','1.2718','21.0000',0,'20.8000','0.0000',0,0,0,0,20,NULL,'no-image',0,-1,'http://www.arfaian.com/default.asp?ArtNr=0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,-1,0),(3,'EAN3',NULL,'CALCULATE_GUTSCHEIN',NULL,'nicht löschen!',NULL,'20.0000','1.4535','24.0000',0,'13.5000','0.0000',0,0,0,0,20,NULL,'no-image',0,-1,'http://www.arfaian.com/default.asp?ArtNr=0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(4,'CALCULATE_MIN_ORDER_VALUE',NULL,'CALCULATE_MIN_ORDER_VALUE',NULL,'CAL_SYSTEM',NULL,'5.0000','5.0000','5.0000',0,'0.0000','0.0000',0,NULL,0,0,20,'1','no-image',0,-1,'http://www.arfaian.com/default.asp?ArtNr=4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(5,'D025',NULL,'Challenger',NULL,NULL,NULL,'35.0000','2.3619','39.0000',-1,'19.4500','42.5000',0,0,0,2,20,NULL,'skins/skin_nca/productImages/challenger_I.gif',0,-1,'http://www.arfaian.com/default.asp?ArtNr=0',NULL,'Size=,100,200,300; Farbe=,Grün, Rot;',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-1),(6,'D026',NULL,'PTEC KOFFER',NULL,NULL,NULL,'32.5000','2.3619','39.0000',0,'19.5000','0.0000',0,0,0,2,20,NULL,'skins/skin_nca/productImages/ptec_koffer.gif',0,-1,'http://www.arfaian.com/default.asp?ArtNr=0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-1),(7,'EAN7',NULL,'***Pro\'s Pro Patriot',NULL,NULL,NULL,'17.5000','1.2718','21.0000',-1,'17.8500','0.0000',0,0,0,2,20,NULL,'no-image',0,-1,'http://www.arfaian.com/default.asp?ArtNr=0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-1),(8,'EAN8',NULL,'***Pro\'s Pro Victory',NULL,NULL,NULL,'20.0000','1.4535','24.0000',0,'17.8500','0.0000',0,0,0,2,20,NULL,'no-image',0,-1,'http://www.arfaian.com/default.asp?ArtNr=0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-1),(9,'EAN9',NULL,'***Pro\'s Pro Titanium Magic',NULL,NULL,NULL,'30.0000','2.1802','36.0000',0,'13.5000','0.0000',0,0,0,2,20,NULL,'no-image',0,-1,'http://www.arfaian.com/default.asp?ArtNr=0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-1),(10,'EAN_1009',NULL,'***Pro\'s Pro CX-110',NULL,NULL,NULL,'20.0000','1.4535','24.0000',-1,'9.0100','9.9800',0,0,0,2,20,NULL,'no-image',0,-1,'http://www.arfaian.com/default.asp?ArtNr=0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-1),(1000,'EAN_1000',NULL,'FREIER ARTIKEL',NULL,'nicht löschen!',NULL,NULL,NULL,NULL,-1,NULL,NULL,0,NULL,0,0,20,NULL,NULL,0,-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1004,'EAN_1009',NULL,'Beispiel Artikel 1','lagernd','Das ist nur ein Beispielartikel; Techinfo:RAM=200,MZ=100; SpecialChoice:Color=Green,Red,Black;Size=100,120,170','stk','1320.0000','1320.0000',NULL,-1,'1320.0000',NULL,0,1,0,2,2,'1','1000.gif',0,-1,'http://www.arfaian.com/default.asp?ArtNr=1004',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-1),(1005,'EAN_1010',NULL,'Beispiel Artikel 2','lagernd','Das ist nur ein Beispielartikel; Techinfo:RAM=200,MZ=100','stk','925.0000','925.0000',NULL,0,'925.0000',NULL,0,1,0,2,2,'1','http://193.171.36.87/WebShop/company/images/company.gif',0,-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1006,'EAN_1011',NULL,'Beispiel Artikel 3','lagernd','','stk','870.0000','870.0000',NULL,0,'870.0000',NULL,0,1,0,2,2,'1','no-image',0,-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1007,'EAN_1012',NULL,'Beispiel Artikel 4','In krze wieder lagernd','','stk','10800.0000','10800.0000',NULL,0,'10800.0000',NULL,0,1,0,2,2,'1','1000.gif',0,-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(20000,'EAN',NULL,'Füntsteller',NULL,'Füntsteller Artikel wird hier getestet',NULL,'9000.0000','654.0555','10800.0000',-1,'800.0000',NULL,0,NULL,0,2,20,NULL,NULL,0,-1,'http://www.arfaian.com/default.asp?ArtNr=',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-1),(20001,'EAN',NULL,'test',NULL,'test',NULL,'40.0000','2.9069','48.0000',-1,NULL,NULL,0,NULL,0,2,20,NULL,NULL,0,-1,'http://www.arfaian.com/default.asp?ArtNr=',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-1),(20002,'EAN','test',NULL,NULL,NULL,NULL,'350.0000','25.4354','420.0000',-1,NULL,NULL,0,NULL,0,NULL,20,NULL,NULL,0,-1,'http://www.arfaian.com/default.asp?ArtNr=',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-1);

UNLOCK TABLES;

/*Table structure for table `grartikel-einheiten` */

DROP TABLE IF EXISTS `grartikel-einheiten`;

CREATE TABLE `grartikel-einheiten` (
  `Einheit` varchar(50) NOT NULL,
  PRIMARY KEY (`Einheit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grartikel-einheiten` */

LOCK TABLES `grartikel-einheiten` WRITE;

insert  into `grartikel-einheiten`(`Einheit`) values ('Kg.'),('Meter'),('Std.'),('Stk.');

UNLOCK TABLES;

/*Table structure for table `grartikel-htmlinfo` */

DROP TABLE IF EXISTS `grartikel-htmlinfo`;

CREATE TABLE `grartikel-htmlinfo` (
  `InfoID` int(10) NOT NULL AUTO_INCREMENT,
  `ArtNR` int(10) DEFAULT NULL,
  `HTLMInfo` longtext,
  `Autor` varchar(50) DEFAULT NULL,
  `DateCreation` datetime DEFAULT NULL,
  PRIMARY KEY (`InfoID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `grartikel-htmlinfo` */

LOCK TABLES `grartikel-htmlinfo` WRITE;

insert  into `grartikel-htmlinfo`(`InfoID`,`ArtNR`,`HTLMInfo`,`Autor`,`DateCreation`) values (1,0,'<img src=\'../productImages/carat_02b.jpg\' alt=\'../productImages/carat_02b.jpg\' />\r\n<img src=\'../productImages/carat_03.jpg\' alt=\'../productImages/carat_03.jpg\' />\r\n<img src=\'../productImages/501956.jpg\' alt=\'../productImages/501956.jpg\' />\r\n<img src=\'../productImages/carat_02b.jpg\' alt=\'../productImages/carat_02b.jpg\' />\r\n<img src=\'../productImages/carat_03.jpg\' alt=\'../productImages/carat_03.jpg\' />\r\n<img src=\'../productImages/501956.jpg\' alt=\'../productImages/501956.jpg\' />\r\n<img src=\'../productImages/carat_02b.jpg\' alt=\'../productImages/carat_02b.jpg\' />\r\n<img src=\'../productImages/carat_03.jpg\' alt=\'../productImages/carat_03.jpg\' />\r\n<img src=\'../productImages/501956.jpg\' alt=\'../productImages/501956.jpg\' />\r\n<img src=\'../productImages/carat_02b.jpg\' alt=\'../productImages/carat_02b.jpg\' />\r\n<img src=\'../productImages/carat_03.jpg\' alt=\'../productImages/carat_03.jpg\' />\r\n<img src=\'../productImages/501956.jpg\' alt=\'../productImages/501956.jpg\' />\r\n<img src=\'../productImages/carat_02b.jpg\' alt=\'../productImages/carat_02b.jpg\' />\r\n<img src=\'../productImages/carat_03.jpg\' alt=\'../productImages/carat_03.jpg\' />\r\n<img src=\'../productImages/501956.jpg\' alt=\'../productImages/501956.jpg\' />\r\n<img src=\'../productImages/carat_02b.jpg\' alt=\'../productImages/carat_02b.jpg\' />\r\n<img src=\'../productImages/carat_03.jpg\' alt=\'../productImages/carat_03.jpg\' />\r\n<img src=\'../productImages/501956.jpg\' alt=\'../productImages/501956.jpg\' />\r\n<img src=\'../productImages/carat_02b.jpg\' alt=\'../productImages/carat_02b.jpg\' />\r\n<img src=\'../productImages/carat_03.jpg\' alt=\'../productImages/carat_03.jpg\' />\r\n<img src=\'../productImages/501956.jpg\' alt=\'../productImages/501956.jpg\' />\r\n<img src=\'../productImages/carat_02b.jpg\' alt=\'../productImages/carat_02b.jpg\' />\r\n<img src=\'../productImages/carat_03.jpg\' alt=\'../productImages/carat_03.jpg\' />\r\n<img src=\'../productImages/501956.jpg\' alt=\'../productImages/501956.jpg\' />\r\n<img src=\'../productImages/carat_02b.jpg\' alt=\'../productImages/carat_02b.jpg\' />\r\n<img src=\'../productImages/carat_03.jpg\' alt=\'../productImages/carat_03.jpg\' />\r\n<img src=\'../productImages/501956.jpg\' alt=\'../productImages/501956.jpg\' />\r\n',NULL,NULL),(2,1,'<img src=\'../productImages/related_bottom.gif\' alt=\'../productImages/related_bottom.gif\' />\r\n<img src=\'../productImages/related_bottom.gif\' alt=\'../productImages/related_bottom.gif\' />\r\n\r\n\r\n',NULL,NULL),(3,5,' \r\n\r\n<table class=\"MsoNormalTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse: collapse; margin-left: .4pt\" id=\"table1\" height=\"201\">\r\n	<tr style=\"page-break-inside: avoid; height: 15.75pt\">\r\n		<td width=\"219\" valign=\"top\" style=\"width:164.05pt;padding:0cm;\r\n  height:201px\">\r\n		<p class=\"MsoNormal\" style=\"margin:0cm;margin-bottom:.0001pt\">&nbsp;</p>\r\n		<p class=\"MsoNormal\" style=\"margin:0cm;margin-bottom:.0001pt\">&nbsp;</p>\r\n		<p class=\"MsoNormal\" style=\"margin:0cm;margin-bottom:.0001pt\"><em>\r\n		<span style=\"font-size: 10.0pt; font-family: Verdana; font-style: normal\">\r\n		Sept.1990 - Juni.1994<br>\r\n		<b>Auszeichnung für Erfolg</b></span></em></p>\r\n		<p class=\"MsoNormal\" style=\"margin:0cm;margin-bottom:.0001pt\">\r\n<img src=\"../productImages/challenger_I.gif\" alt=\"../productImages/challenger_I.gif\" /></p>\r\n		</td>\r\n		<td width=\"416\" style=\"width:11.0cm;padding:0cm;height:201px\">\r\n		<p class=\"DefinitionList\" style=\"margin-left:0cm\"><em>\r\n		<span style=\"font-size: 10.0pt; font-family: Verdana; font-style: normal\">\r\n		Gymnasium mit Schwerpunkt <b>Mathematik</b> und Naturwissenschaften Haskovo,&nbsp; \r\n		Bulgarien</span></em></p>\r\n		<p class=\"MsoNormal\" style=\"margin:0cm;margin-bottom:.0001pt\"><em>\r\n		<span style=\"font-size: 10.0pt; font-family: Verdana; font-style: normal\">\r\n		Matura in Mathematik und Computersprachen <br>\r\n		(Pascal und SQL)<br>\r\n		<b>Auszeichnung für Erfolg (1.00) - </b></span></em><b>\r\n		<span style=\"font-family: Arial\">Gold Medaille</span></b></p>\r\n		</td>\r\n	</tr>\r\n</table>\r\n&nbsp;<p>&nbsp;</p>\r\n<p>\r\n&nbsp;</p>\r\n<p>&nbsp;</p>',NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `grartikel-itemtrackinghistory` */

DROP TABLE IF EXISTS `grartikel-itemtrackinghistory`;

CREATE TABLE `grartikel-itemtrackinghistory` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Barcode` varchar(50) DEFAULT NULL,
  `SerienNrOriginal` varchar(50) DEFAULT NULL,
  `Referenz` varchar(50) DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `Vorgangstyp` varchar(2) DEFAULT NULL,
  `Vorgangsnummer` int(10) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Notiz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Barcode` (`Barcode`),
  KEY `ID` (`ID`),
  KEY `SerienNrOriginal` (`SerienNrOriginal`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

/*Data for the table `grartikel-itemtrackinghistory` */

LOCK TABLES `grartikel-itemtrackinghistory` WRITE;

insert  into `grartikel-itemtrackinghistory`(`ID`,`Barcode`,`SerienNrOriginal`,`Referenz`,`Timestamp`,`Vorgangstyp`,`Vorgangsnummer`,`Status`,`Notiz`) values (94,'0001001000000001',NULL,NULL,'2003-09-09 23:10:49','LE',0,'gedruckt',NULL),(95,'0001001000000001',NULL,NULL,'2003-09-09 23:14:56','AU',200300001,'Item zugeordnet',NULL),(96,'0001005000300001',NULL,NULL,'2003-09-17 22:03:08','LE',0,'gedruckt',NULL),(97,'1257',NULL,NULL,'2007-10-11 18:08:25','LI',705027,'Lagerausgang',NULL);

UNLOCK TABLES;

/*Table structure for table `grartikel-kategorien` */

DROP TABLE IF EXISTS `grartikel-kategorien`;

CREATE TABLE `grartikel-kategorien` (
  `ArtKatNr` int(10) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `ArtKatNrParent` int(10) DEFAULT NULL,
  `Desc` varchar(255) DEFAULT NULL,
  `Template` longtext,
  `Aufschlag` double(15,5) DEFAULT NULL,
  `GewinnReferenz` double(15,5) DEFAULT NULL,
  `Stylesheet` varchar(50) DEFAULT NULL,
  `Picture` varchar(255) DEFAULT NULL,
  `TemplateForProduct` varchar(50) DEFAULT NULL,
  `Order` int(10) DEFAULT NULL,
  `Land` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ArtKatNr`),
  UNIQUE KEY `grArtikel-KategorienArtKatNr` (`ArtKatNr`),
  KEY `ArtKatNrParent` (`ArtKatNrParent`),
  KEY `Desc` (`Desc`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grartikel-kategorien` */

LOCK TABLES `grartikel-kategorien` WRITE;

insert  into `grartikel-kategorien`(`ArtKatNr`,`Name`,`ArtKatNrParent`,`Desc`,`Template`,`Aufschlag`,`GewinnReferenz`,`Stylesheet`,`Picture`,`TemplateForProduct`,`Order`,`Land`) values (0,'Hauptkategorie',-1,NULL,'\r\n',0.00000,0.00000,NULL,NULL,NULL,0,NULL),(1,'Produkte',0,NULL,'[SUBCATEGORIES]',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Kategorie 1',1,NULL,NULL,0.00000,0.00000,NULL,NULL,NULL,0,NULL),(3,'Kategorie 2',1,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Kategorie 3',1,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(5,'AGB',9997,NULL,NULL,0.00000,0.00000,NULL,NULL,NULL,0,NULL),(9997,'Informationen',-1,NULL,NULL,0.00000,0.10000,NULL,NULL,NULL,NULL,NULL),(9998,'Product Category Template  (nicht löschen)',-1,NULL,'[EMBED:template_kategorie_produkte.html]',0.00000,0.10000,NULL,NULL,NULL,NULL,NULL),(9999,'Default Template  (nicht löschen)',-1,NULL,'[EMBED:template_kategorie_default.html]',0.00000,0.10000,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `grartikel-kategorien-verwandte` */

DROP TABLE IF EXISTS `grartikel-kategorien-verwandte`;

CREATE TABLE `grartikel-kategorien-verwandte` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ArtKatNrParent` int(10) DEFAULT NULL,
  `ArtKatNrChild` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grartikel-kategorien-verwandte` */

LOCK TABLES `grartikel-kategorien-verwandte` WRITE;

UNLOCK TABLES;

/*Table structure for table `grartikel-keywords` */

DROP TABLE IF EXISTS `grartikel-keywords`;

CREATE TABLE `grartikel-keywords` (
  `KeyWordId` int(10) NOT NULL AUTO_INCREMENT,
  `ArtKatNr` int(10) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Order` int(10) DEFAULT NULL,
  `MaxSizeForComboBox` int(10) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `PflichtFuerProdukt` tinyint(1) NOT NULL DEFAULT '0',
  `Gruppe` varchar(50) DEFAULT NULL,
  `GruppeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`KeyWordId`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=latin1;

/*Data for the table `grartikel-keywords` */

LOCK TABLES `grartikel-keywords` WRITE;

insert  into `grartikel-keywords`(`KeyWordId`,`ArtKatNr`,`Name`,`Order`,`MaxSizeForComboBox`,`enabled`,`PflichtFuerProdukt`,`Gruppe`,`GruppeName`) values (1,1,'1',1,NULL,0,0,NULL,NULL),(2,1,'1',2,NULL,0,0,NULL,NULL),(3,1,'1',3,NULL,0,0,NULL,NULL),(4,1,'1',4,NULL,0,0,NULL,NULL),(5,0,'0',1,1,-1,0,NULL,NULL),(71,0,'Wohnflaeche',1,NULL,-1,0,NULL,NULL),(72,0,'Zimmeranzahl',1,NULL,-1,-1,NULL,NULL),(73,0,'Kaufpreis',1,NULL,-1,-1,NULL,NULL),(74,0,'Mietpreis',1,NULL,-1,-1,NULL,NULL),(75,0,'Betriebskosten',1,NULL,-1,0,NULL,NULL),(82,1,'Hauptbild',55,NULL,0,0,NULL,NULL),(83,1,'Grundriss',55,NULL,0,0,NULL,NULL),(84,1,'Objektbild1',55,NULL,0,0,NULL,NULL),(85,111,'Garage',100,NULL,-1,0,NULL,NULL),(86,111,'Tiefgarage',100,NULL,-1,0,NULL,NULL),(87,111,'Terasse',99,NULL,-1,0,NULL,NULL),(88,111,'Balkon',99,NULL,-1,0,NULL,NULL),(89,1,'Kontaktperson_Name',1,NULL,0,0,NULL,NULL),(90,1,'Kontaktperson_Tel',1,NULL,0,0,NULL,NULL),(91,1,'Kontaktperson_Email',1,NULL,0,0,NULL,NULL),(92,1,'Kontaktperson_Fax',1,NULL,0,0,NULL,NULL),(93,1,'Objektbild2',55,NULL,0,0,NULL,NULL),(94,1,'Objektbild3',55,NULL,0,0,NULL,NULL),(96,111,'Autoabstellplatz',100,NULL,-1,0,NULL,NULL),(97,112,'Autoabstellplatz',55,NULL,0,0,NULL,NULL),(98,111,'Loggia',99,NULL,-1,0,NULL,NULL),(99,111,'Keller',99,NULL,-1,0,NULL,NULL),(100,111,'Lift',101,NULL,-1,0,NULL,NULL),(101,111,'Erdgeschoss',101,NULL,-1,0,NULL,NULL),(102,111,'Sauna',102,NULL,-1,0,NULL,NULL),(103,111,'Fußbodenheizung',103,NULL,-1,0,NULL,NULL),(104,111,'Gasetagenheizung',103,NULL,-1,0,NULL,NULL),(105,111,'Hauszentralheizung',103,NULL,-1,0,NULL,NULL),(106,111,'unmöbliert',104,NULL,-1,0,NULL,NULL),(107,111,'möbliert',104,NULL,-1,0,NULL,NULL),(108,111,'Ablöse',104,NULL,-1,0,NULL,NULL),(109,111,'Kaution',104,NULL,-1,0,NULL,NULL),(110,111,'Schule / Kindergarten in der Nähe',105,NULL,-1,0,NULL,NULL),(111,111,'Verkehrsanbindung mit Öffis',105,NULL,-1,0,NULL,NULL),(112,111,'KabelTV',106,NULL,-1,0,NULL,NULL),(113,111,'Parkettboden',106,NULL,-1,0,NULL,NULL),(114,111,'Eigengarten',106,NULL,-1,0,NULL,NULL),(115,111,'Mitbenutzung des Gartens',106,NULL,-1,0,NULL,NULL),(116,111,'Provisionsfrei',107,NULL,-1,0,NULL,NULL),(117,111,'Hauptmiete',107,NULL,-1,0,NULL,NULL),(118,111,'Geeignet für WG',107,NULL,-1,0,NULL,NULL),(119,111,'Untermiete',107,NULL,-1,0,NULL,NULL),(120,112,'Wohnflaeche',99,NULL,-1,0,NULL,NULL),(121,112,'Garage',100,NULL,-1,0,NULL,NULL),(122,112,'Tiefgarage',100,NULL,-1,0,NULL,NULL),(123,112,'Terasse',99,NULL,-1,0,NULL,NULL),(124,112,'Balkon',99,NULL,-1,0,NULL,NULL),(125,112,'Autoabstellplatz',100,NULL,-1,0,NULL,NULL),(126,112,'Loggia',99,NULL,-1,0,NULL,NULL),(127,112,'Keller',99,NULL,-1,0,NULL,NULL),(128,112,'Lift',101,NULL,-1,0,NULL,NULL),(129,112,'Erdgeschoss',101,NULL,-1,0,NULL,NULL),(130,112,'Sauna',102,NULL,-1,0,NULL,NULL),(131,112,'Fußbodenheizung',103,NULL,-1,0,NULL,NULL),(132,112,'Gasetagenheizung',103,NULL,-1,0,NULL,NULL),(133,112,'Hauszentralheizung',103,NULL,-1,0,NULL,NULL),(134,112,'unmöbliert',104,NULL,-1,0,NULL,NULL),(135,112,'möbliert',104,NULL,-1,0,NULL,NULL),(136,112,'Ablöse',104,NULL,-1,0,NULL,NULL),(137,112,'Kaution',104,NULL,-1,0,NULL,NULL),(138,112,'Schule / Kindergarten in der Nähe',105,NULL,-1,0,NULL,NULL),(139,112,'Verkehrsanbindung mit Öffis',105,NULL,-1,0,NULL,NULL),(140,112,'KabelTV',106,NULL,-1,0,NULL,NULL),(141,112,'Parkettboden',106,NULL,-1,0,NULL,NULL),(142,112,'Eigengarten',106,NULL,-1,0,NULL,NULL),(143,112,'Mitbenutzung des Gartens',106,NULL,-1,0,NULL,NULL),(144,112,'Provisionsfrei',107,NULL,-1,0,NULL,NULL),(145,112,'Hauptmiete',107,NULL,-1,0,NULL,NULL),(146,112,'Geeignet für WG',107,NULL,-1,0,NULL,NULL),(147,112,'Untermiete',107,NULL,-1,0,NULL,NULL),(148,121,'Anlageimmobilien',100,NULL,-1,0,NULL,NULL),(149,121,'Spezielimmobilien',100,NULL,-1,0,NULL,NULL),(150,121,'Ferienhaus',100,NULL,-1,0,NULL,NULL),(151,121,'Badehaus',100,NULL,-1,0,NULL,NULL),(152,121,'Seeliegenschaft',100,NULL,-1,0,NULL,NULL),(153,121,'Rohbau',100,NULL,-1,0,NULL,NULL),(154,121,'Bauernhaus',100,NULL,-1,0,NULL,NULL),(155,121,'Schloss/Palais',100,NULL,-1,0,NULL,NULL),(156,121,'Kleingartenhaus',100,NULL,-1,0,NULL,NULL),(157,121,'Villa',100,NULL,-1,0,NULL,NULL),(158,121,'Fertigteilhaus',100,NULL,-1,0,NULL,NULL),(159,121,'Holzhaus',100,NULL,-1,0,NULL,NULL),(160,121,'Massivbau',100,NULL,-1,0,NULL,NULL),(161,141,'Atelier',100,NULL,-1,0,NULL,NULL),(162,141,'Neubau',100,NULL,-1,0,NULL,NULL),(163,141,'Altbau',100,NULL,-1,0,NULL,NULL),(164,141,'Erstbezug',100,NULL,-1,0,NULL,NULL),(165,141,'Geeignet für Ordination/Kanzlei',100,NULL,-1,0,NULL,NULL),(166,141,'Bezugsfertig',100,NULL,-1,0,NULL,NULL),(167,141,'Renovierungsbedürftig',100,NULL,-1,0,NULL,NULL),(168,141,'Autoabstelplätze',100,NULL,-1,0,NULL,NULL),(169,141,'Garage',100,NULL,-1,0,NULL,NULL),(170,141,'Lift',100,NULL,-1,0,NULL,NULL),(171,141,'Provisionsfrei',100,NULL,-1,0,NULL,NULL),(172,141,'Erdgeschoss',100,NULL,-1,0,NULL,NULL),(173,141,'Keller',100,NULL,-1,0,NULL,NULL),(174,141,'Parkettboden',100,NULL,-1,0,NULL,NULL),(175,122,'Anlageimmobilien',100,NULL,-1,0,NULL,NULL),(176,122,'Spezielimmobilien',100,NULL,-1,0,NULL,NULL),(177,122,'Ferienhaus',100,NULL,-1,0,NULL,NULL),(178,122,'Badehaus',100,NULL,-1,0,NULL,NULL),(179,122,'Seeliegenschaft',100,NULL,-1,0,NULL,NULL),(180,122,'Rohbau',100,NULL,-1,0,NULL,NULL),(181,122,'Bauernhaus',100,NULL,-1,0,NULL,NULL),(182,122,'Schloss/Palais',100,NULL,-1,0,NULL,NULL),(183,122,'Kleingartenhaus',100,NULL,-1,0,NULL,NULL),(184,122,'Villa',100,NULL,-1,0,NULL,NULL),(185,122,'Fertigteilhaus',100,NULL,-1,0,NULL,NULL),(186,122,'Holzhaus',100,NULL,-1,0,NULL,NULL),(187,122,'Massivbau',100,NULL,-1,0,NULL,NULL),(201,142,'Atelier',100,NULL,-1,0,NULL,NULL),(202,142,'Neubau',100,NULL,-1,0,NULL,NULL),(203,142,'Altbau',100,NULL,-1,0,NULL,NULL),(204,142,'Erstbezug',100,NULL,-1,0,NULL,NULL),(205,142,'Geeignet für Ordination/Kanzlei',100,NULL,-1,0,NULL,NULL),(206,142,'Bezugsfertig',100,NULL,-1,0,NULL,NULL),(207,142,'Renovierungsbedürftig',100,NULL,-1,0,NULL,NULL),(208,142,'Autoabstelplätze',100,NULL,-1,0,NULL,NULL),(209,142,'Garage',100,NULL,-1,0,NULL,NULL),(210,142,'Lift',100,NULL,-1,0,NULL,NULL),(211,142,'Provisionsfrei',100,NULL,-1,0,NULL,NULL),(212,142,'Erdgeschoss',100,NULL,-1,0,NULL,NULL),(213,142,'Keller',100,NULL,-1,0,NULL,NULL),(214,142,'Parkettboden',100,NULL,-1,0,NULL,NULL),(215,111,'ImmobilienTyp',0,NULL,-1,0,NULL,NULL),(216,112,'ImmobilienTyp',0,NULL,-1,0,NULL,NULL),(217,121,'ImmobilienTyp',0,NULL,-1,0,NULL,NULL),(218,122,'ImmobilienTyp',0,NULL,-1,0,NULL,NULL),(219,131,'ImmobilienTyp',0,NULL,-1,0,NULL,NULL),(220,132,'ImmobilienTyp',0,NULL,-1,0,NULL,NULL),(221,141,'ImmobilienTyp',0,NULL,-1,0,NULL,NULL),(222,142,'ImmobilienTyp',0,NULL,-1,0,NULL,NULL),(223,1,'Objektbild4',55,NULL,0,0,NULL,NULL),(224,1,'Objektbild5',55,NULL,0,0,NULL,NULL),(225,1,'Grundriss2',55,NULL,0,0,NULL,NULL),(226,151,'Überwacht',NULL,NULL,0,0,NULL,NULL),(227,151,'Parkpersonal/Abholung',NULL,NULL,0,0,NULL,NULL),(228,152,'Überwacht',NULL,NULL,0,0,NULL,NULL),(229,152,'Parkpersonal/Abholung',NULL,NULL,0,0,NULL,NULL),(230,1,'ObjektLand',NULL,NULL,0,0,NULL,NULL),(231,1,'ObjektBundesland',NULL,NULL,0,0,NULL,NULL),(232,1,'ObjektBezirk',NULL,NULL,0,0,NULL,NULL),(233,1,'ObjektPLZ',NULL,NULL,0,0,NULL,NULL),(234,1,'ObjektOrt',NULL,NULL,0,0,NULL,NULL),(235,1,'ObjektStrasse',NULL,NULL,0,0,NULL,NULL),(236,1,'ImmobilienHauptkategorie',NULL,NULL,0,0,NULL,NULL),(237,1,'ImmobilienKategorie',NULL,NULL,0,0,NULL,NULL),(238,1,'ImmobilienNutzung',NULL,NULL,0,0,NULL,NULL),(240,1,'Wohnflaeche',1,NULL,-1,0,NULL,NULL),(241,1,'Grundflaeche',1,NULL,-1,0,NULL,NULL),(243,1,'ImmobilienTyp',1,NULL,0,0,NULL,NULL),(244,1,'Verwendungszweck',1,NULL,-1,0,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `grartikel-keywordstoproducts` */

DROP TABLE IF EXISTS `grartikel-keywordstoproducts`;

CREATE TABLE `grartikel-keywordstoproducts` (
  `Id` int(10) NOT NULL,
  `ArtNr` int(10) NOT NULL,
  `KeyWordId` int(10) NOT NULL,
  `Value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ArtNr`,`KeyWordId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grartikel-keywordstoproducts` */

LOCK TABLES `grartikel-keywordstoproducts` WRITE;

insert  into `grartikel-keywordstoproducts`(`Id`,`ArtNr`,`KeyWordId`,`Value`) values (963,0,71,'test'),(963,0,73,'test'),(964,0,74,'test'),(964,0,75,'test'),(965,1,71,NULL),(966,1,73,NULL),(967,1,74,NULL),(962,1001,71,NULL);

UNLOCK TABLES;

/*Table structure for table `grartikel-lagerbestand` */

DROP TABLE IF EXISTS `grartikel-lagerbestand`;

CREATE TABLE `grartikel-lagerbestand` (
  `artikelLagerID` int(10) NOT NULL AUTO_INCREMENT,
  `ArtNr` int(10) DEFAULT NULL,
  `LagerOrt` int(10) DEFAULT NULL,
  `LagerBestand` int(10) DEFAULT NULL,
  `ReserviertStk` int(10) DEFAULT NULL,
  `MaxStk` int(10) DEFAULT NULL,
  `AktuellerWert` double DEFAULT NULL,
  `LagerKosten` double DEFAULT NULL,
  `Datum` datetime DEFAULT NULL,
  `Einheiten` double DEFAULT NULL,
  `GewichtBrutto` double DEFAULT NULL,
  `GewichtNetto` double DEFAULT NULL,
  `GewichtTara` double DEFAULT NULL,
  PRIMARY KEY (`artikelLagerID`),
  KEY `artikelLagerID` (`artikelLagerID`),
  KEY `grArtikelgrArtikel-Lagerbestand` (`ArtNr`),
  KEY `grArtikel-LagerbestandArtNr` (`ArtNr`),
  KEY `grArtikel-LagerortgrArtikel-Lagerbestand` (`LagerOrt`),
  KEY `LagerOrt` (`LagerOrt`),
  CONSTRAINT `grartikel-lagerbestand_ibfk_1` FOREIGN KEY (`LagerOrt`) REFERENCES `grartikel-lagerort` (`LagerNr`) ON UPDATE CASCADE,
  CONSTRAINT `grartikel-lagerbestand_ibfk_2` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE,
  CONSTRAINT `grartikel-lagerbestand_ibfk_3` FOREIGN KEY (`LagerOrt`) REFERENCES `grartikel-lagerort` (`LagerNr`) ON UPDATE CASCADE,
  CONSTRAINT `grartikel-lagerbestand_ibfk_4` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1603 DEFAULT CHARSET=latin1;

/*Data for the table `grartikel-lagerbestand` */

LOCK TABLES `grartikel-lagerbestand` WRITE;

insert  into `grartikel-lagerbestand`(`artikelLagerID`,`ArtNr`,`LagerOrt`,`LagerBestand`,`ReserviertStk`,`MaxStk`,`AktuellerWert`,`LagerKosten`,`Datum`,`Einheiten`,`GewichtBrutto`,`GewichtNetto`,`GewichtTara`) values (96,1,0,1,100,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(103,10,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(109,3,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(110,9,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(114,7,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(137,5,0,-70,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(147,2,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(151,6,0,-7,0,0,19.5,NULL,NULL,NULL,NULL,NULL,NULL),(217,8,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1576,4,0,-8,0,0,0,0,'2009-02-08 00:00:00',0,0,0,0),(1577,1005,0,0,0,0,925,0,'2009-06-11 00:00:00',0,0,0,0),(1578,1006,0,-4,0,0,0,0,'2009-06-11 00:00:00',0,0,0,0),(1579,1000,0,-7,0,0,66.67,0,'2009-06-11 00:00:00',0,0,0,0),(1580,1000,1,7,0,0,28.57,0,'2009-06-24 00:00:00',0,0,0,0),(1581,5,5,-100,0,0,19.45,0,'2009-06-24 00:00:00',0,0,0,0),(1582,5,6,20100,0,0,19.45,0,'2009-06-24 00:00:00',0,0,0,0),(1583,1007,0,2,0,0,10800,0,'2009-06-24 00:00:00',0,0,0,0),(1587,1006,5,1,0,0,870,0,'2009-06-27 00:00:00',0,0,0,0),(1597,1007,1,-1,0,0,10800,0,'2009-06-27 00:00:00',0,0,0,0),(1598,1004,1,-1,0,0,1320,0,'2009-06-27 00:00:00',0,0,0,0),(1599,1006,1,-1,0,0,870,0,'2009-06-27 00:00:00',0,0,0,0),(1601,5,3,0,0,0,19.45,0,'2009-06-27 00:00:00',0,0,0,0),(1602,20000,0,50000,0,200000,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `grartikel-lagerbewegung` */

DROP TABLE IF EXISTS `grartikel-lagerbewegung`;

CREATE TABLE `grartikel-lagerbewegung` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Datum` datetime DEFAULT NULL,
  `ArtNr` int(10) DEFAULT NULL,
  `Eingang` int(10) DEFAULT NULL,
  `Ausgang` int(10) DEFAULT NULL,
  `PreisEingang` decimal(19,4) DEFAULT NULL,
  `PreisAusgang` decimal(19,4) DEFAULT NULL,
  `Vorgangstyp` varchar(2) DEFAULT NULL,
  `Vorgangsnummer` int(10) DEFAULT NULL,
  `LagerKosten` double DEFAULT NULL,
  `Lagerort` int(11) DEFAULT NULL,
  `Einheiten` double DEFAULT NULL,
  `GewichtBrutto` double DEFAULT NULL,
  `GewichtNetto` double DEFAULT NULL,
  `GewichtTara` double DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ArtNr` (`ArtNr`),
  KEY `Ausgang` (`Ausgang`),
  KEY `Datum` (`Datum`),
  KEY `Eingang` (`Eingang`),
  KEY `Id` (`Id`),
  KEY `Vorgangnummer` (`Vorgangsnummer`),
  KEY `Vorgangstyp` (`Vorgangstyp`),
  KEY `Lagerort` (`Lagerort`),
  CONSTRAINT `grartikel-lagerbewegung_ibfk_1` FOREIGN KEY (`Lagerort`) REFERENCES `grartikel-lagerort` (`LagerNr`) ON UPDATE CASCADE,
  CONSTRAINT `grartikel-lagerbewegung_ibfk_2` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE,
  CONSTRAINT `grartikel-lagerbewegung_ibfk_3` FOREIGN KEY (`Lagerort`) REFERENCES `grartikel-lagerort` (`LagerNr`) ON UPDATE CASCADE,
  CONSTRAINT `grartikel-lagerbewegung_ibfk_4` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=300654 DEFAULT CHARSET=latin1;

/*Data for the table `grartikel-lagerbewegung` */

LOCK TABLES `grartikel-lagerbewegung` WRITE;

insert  into `grartikel-lagerbewegung`(`Id`,`Datum`,`ArtNr`,`Eingang`,`Ausgang`,`PreisEingang`,`PreisAusgang`,`Vorgangstyp`,`Vorgangsnummer`,`LagerKosten`,`Lagerort`,`Einheiten`,`GewichtBrutto`,`GewichtNetto`,`GewichtTara`) values (300499,'2009-05-22 21:06:02',5,NULL,1,NULL,'19.4500','AR',2009090003,NULL,NULL,NULL,NULL,NULL,NULL),(300501,'2009-05-22 21:06:02',4,NULL,1,NULL,'0.0000','AR',2009090003,NULL,NULL,NULL,NULL,NULL,NULL),(300502,'2009-05-22 21:06:02',5,NULL,2,NULL,'19.4500','AR',2009090003,NULL,NULL,NULL,NULL,NULL,NULL),(300503,'2009-05-26 20:39:14',5,NULL,1,NULL,'19.4500','AR',705001,NULL,NULL,NULL,NULL,NULL,NULL),(300505,'2009-05-26 20:39:15',4,NULL,1,NULL,'0.0000','AR',705001,NULL,NULL,NULL,NULL,NULL,NULL),(300506,'2009-05-26 20:39:15',5,NULL,2,NULL,'19.4500','AR',705001,NULL,NULL,NULL,NULL,NULL,NULL),(300507,'2009-05-26 20:43:00',5,NULL,1,NULL,'19.4500','AR',705002,NULL,NULL,NULL,NULL,NULL,NULL),(300509,'2009-05-26 20:43:00',4,NULL,1,NULL,'0.0000','AR',705002,NULL,NULL,NULL,NULL,NULL,NULL),(300510,'2009-05-26 20:43:00',5,NULL,2,NULL,'19.4500','AR',705002,NULL,NULL,NULL,NULL,NULL,NULL),(300511,'2009-05-29 18:55:53',6,NULL,1,NULL,'19.5000','AR',705007,NULL,NULL,NULL,NULL,NULL,NULL),(300512,'2009-05-29 18:55:54',6,NULL,1,NULL,'19.5000','AR',705007,NULL,NULL,NULL,NULL,NULL,NULL),(300513,'2009-05-29 18:55:54',5,NULL,1,NULL,'19.4500','AR',705007,NULL,NULL,NULL,NULL,NULL,NULL),(300514,'2009-06-05 16:05:50',5,NULL,1,NULL,'19.4500','AR',705011,NULL,NULL,NULL,NULL,NULL,NULL),(300515,'2009-06-05 16:05:50',5,NULL,1,NULL,'19.4500','AR',705011,NULL,NULL,NULL,NULL,NULL,NULL),(300516,'2009-06-05 16:05:50',6,NULL,1,NULL,'19.5000','AR',705011,NULL,NULL,NULL,NULL,NULL,NULL),(300517,'2009-06-05 16:05:50',4,NULL,1,NULL,'0.0000','AR',705011,NULL,NULL,NULL,NULL,NULL,NULL),(300518,'2009-06-05 16:06:05',5,NULL,1,NULL,'19.4500','AR',705012,NULL,NULL,NULL,NULL,NULL,NULL),(300519,'2009-06-05 16:06:05',5,NULL,1,NULL,'19.4500','AR',705012,NULL,NULL,NULL,NULL,NULL,NULL),(300520,'2009-06-05 16:06:05',6,NULL,1,NULL,'19.5000','AR',705012,NULL,NULL,NULL,NULL,NULL,NULL),(300521,'2009-06-05 16:06:05',4,NULL,1,NULL,'0.0000','AR',705012,NULL,NULL,NULL,NULL,NULL,NULL),(300522,'2009-06-11 14:44:40',5,NULL,6,NULL,'19.4500','AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300523,'2009-06-11 14:44:40',5,NULL,6,NULL,'19.4500','AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300524,'2009-06-11 14:44:40',5,NULL,1,NULL,'19.4500','AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300525,'2009-06-11 14:44:40',1005,NULL,1,NULL,'925.0000','AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300526,'2009-06-11 14:44:40',1006,NULL,1,NULL,'870.0000','AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300527,'2009-06-11 14:44:40',4,NULL,1,NULL,'0.0000','AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300528,'2009-06-11 14:44:40',6,NULL,1,NULL,'19.5000','AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300529,'2009-06-11 14:44:40',1000,NULL,1,NULL,'0.0000','AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300530,'2009-06-11 14:50:17',5,6,NULL,'19.4500',NULL,'AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300531,'2009-06-11 14:50:17',5,6,NULL,'19.4500',NULL,'AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300532,'2009-06-11 14:50:17',5,1,NULL,'19.4500',NULL,'AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300533,'2009-06-11 14:50:17',1005,1,NULL,'925.0000',NULL,'AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300534,'2009-06-11 14:50:17',1006,1,NULL,'870.0000',NULL,'AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300535,'2009-06-11 14:50:17',4,1,NULL,'0.0000',NULL,'AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300536,'2009-06-11 14:50:18',6,1,NULL,'19.5000',NULL,'AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300537,'2009-06-11 14:50:18',1000,1,NULL,'0.0000',NULL,'AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300538,'2009-06-11 14:50:38',5,NULL,6,NULL,'19.4500','AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300539,'2009-06-11 14:50:38',5,NULL,6,NULL,'19.4500','AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300540,'2009-06-11 14:50:38',5,NULL,1,NULL,'19.4500','AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300541,'2009-06-11 14:50:38',1005,NULL,1,NULL,'925.0000','AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300542,'2009-06-11 14:50:38',1006,NULL,1,NULL,'870.0000','AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300543,'2009-06-11 14:50:38',4,NULL,1,NULL,'0.0000','AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300544,'2009-06-11 14:50:38',6,NULL,1,NULL,'19.5000','AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300545,'2009-06-11 14:50:38',1000,NULL,1,NULL,'0.0000','AR',705019,NULL,NULL,NULL,NULL,NULL,NULL),(300546,'2009-06-11 19:00:41',5,NULL,6,NULL,'19.4500','AR',705020,NULL,NULL,NULL,NULL,NULL,NULL),(300547,'2009-06-11 19:00:41',5,NULL,6,NULL,'19.4500','AR',705020,NULL,NULL,NULL,NULL,NULL,NULL),(300548,'2009-06-11 19:00:41',5,NULL,1,NULL,'19.4500','AR',705020,NULL,NULL,NULL,NULL,NULL,NULL),(300549,'2009-06-11 19:00:41',1005,NULL,1,NULL,'925.0000','AR',705020,NULL,NULL,NULL,NULL,NULL,NULL),(300550,'2009-06-11 19:00:41',1006,NULL,1,NULL,'870.0000','AR',705020,NULL,NULL,NULL,NULL,NULL,NULL),(300551,'2009-06-11 19:00:41',4,NULL,1,NULL,'0.0000','AR',705020,NULL,NULL,NULL,NULL,NULL,NULL),(300552,'2009-06-11 19:00:41',6,NULL,1,NULL,'19.5000','AR',705020,NULL,NULL,NULL,NULL,NULL,NULL),(300553,'2009-06-11 19:00:41',1000,NULL,1,NULL,'0.0000','AR',705020,NULL,NULL,NULL,NULL,NULL,NULL),(300554,'2009-06-11 19:05:11',5,NULL,6,NULL,'19.4500','AR',705025,NULL,NULL,NULL,NULL,NULL,NULL),(300555,'2009-06-11 19:05:11',5,NULL,6,NULL,'19.4500','AR',705025,NULL,NULL,NULL,NULL,NULL,NULL),(300556,'2009-06-11 19:05:11',5,NULL,1,NULL,'19.4500','AR',705025,NULL,NULL,NULL,NULL,NULL,NULL),(300557,'2009-06-11 19:05:11',1005,NULL,1,NULL,'925.0000','AR',705025,NULL,NULL,NULL,NULL,NULL,NULL),(300558,'2009-06-11 19:05:11',1006,NULL,1,NULL,'870.0000','AR',705025,NULL,NULL,NULL,NULL,NULL,NULL),(300559,'2009-06-11 19:05:11',4,NULL,1,NULL,'0.0000','AR',705025,NULL,NULL,NULL,NULL,NULL,NULL),(300560,'2009-06-11 19:05:11',6,NULL,1,NULL,'19.5000','AR',705025,NULL,NULL,NULL,NULL,NULL,NULL),(300561,'2009-06-11 19:05:11',1000,NULL,1,NULL,'0.0000','AR',705025,NULL,NULL,NULL,NULL,NULL,NULL),(300562,'2009-06-13 19:02:23',5,NULL,6,NULL,'19.4500','AR',705026,NULL,NULL,NULL,NULL,NULL,NULL),(300563,'2009-06-13 19:02:23',5,NULL,6,NULL,'19.4500','AR',705026,NULL,NULL,NULL,NULL,NULL,NULL),(300564,'2009-06-13 19:02:23',5,NULL,1,NULL,'19.4500','AR',705026,NULL,NULL,NULL,NULL,NULL,NULL),(300565,'2009-06-13 19:02:23',1005,NULL,1,NULL,'925.0000','AR',705026,NULL,NULL,NULL,NULL,NULL,NULL),(300566,'2009-06-13 19:02:23',1006,NULL,1,NULL,'870.0000','AR',705026,NULL,NULL,NULL,NULL,NULL,NULL),(300567,'2009-06-13 19:02:23',4,NULL,1,NULL,'0.0000','AR',705026,NULL,NULL,NULL,NULL,NULL,NULL),(300568,'2009-06-13 19:02:23',6,NULL,1,NULL,'19.5000','AR',705026,NULL,NULL,NULL,NULL,NULL,NULL),(300569,'2009-06-13 19:02:23',1000,NULL,1,NULL,'0.0000','AR',705026,NULL,NULL,NULL,NULL,NULL,NULL),(300570,'2009-06-24 00:00:00',1000,0,2,'0.0000','0.0000','LE',2009624,NULL,0,0,0,0,0),(300571,'2009-06-24 00:00:00',1000,2,0,'0.0000','0.0000','LE',2009624,0,1,0,0,0,0),(300572,'2009-06-24 00:00:00',1000,0,3,'0.0000','0.0000','LE',2009624,NULL,0,0,0,0,0),(300573,'2009-06-24 00:00:00',1000,3,0,'0.0000','0.0000','LE',2009624,0,1,0,0,0,0),(300574,'2009-06-24 00:00:00',1000,0,1,'0.0000','0.0000','LE',2009624,NULL,0,0,0,0,0),(300575,'2009-06-24 00:00:00',1000,1,0,'0.0000','0.0000','LE',2009624,0,1,0,0,0,0),(300576,'2009-06-24 00:00:00',5,0,100,'0.0000','19.4500','LE',2009624,NULL,5,0,0,0,0),(300577,'2009-06-24 00:00:00',5,100,0,'19.4500','0.0000','LE',2009624,0,6,0,0,0,0),(300578,'2009-06-24 00:00:00',1005,1,0,'925.0000','0.0000','LE',2009624,0,0,0,0,0,0),(300579,'2009-06-24 00:00:00',1005,1,0,'925.0000','0.0000','LE',2009624,0,0,0,0,0,0),(300580,'2009-06-24 00:00:00',1007,1,0,'10800.0000','0.0000','LE',2009624,0,0,0,0,0,0),(300587,'2009-06-24 00:00:00',1000,1,0,'0.0000','0.0000','LE',2009624,0,0,0,0,0,0),(300588,'2009-06-24 00:00:00',1005,1,0,'925.0000','0.0000','LE',2009624,0,0,0,0,0,0),(300589,'2009-06-24 00:00:00',1007,1,0,'10800.0000','0.0000','LE',2009624,0,0,0,0,0,0),(300590,'2009-06-27 00:00:00',1005,1,0,'925.0000','0.0000','LE',2009627,0,0,0,0,0,0),(300598,'2009-06-27 00:00:00',4,1,0,'0.0000','0.0000','LE',2009627,0,0,0,0,0,0),(300599,'2009-06-27 00:00:00',6,1,0,'19.5000','0.0000','LE',2009627,0,0,0,0,0,0),(300600,'2009-06-27 00:00:00',1000,1,0,'0.0000','0.0000','LE',2009627,0,0,0,0,0,0),(300601,'2009-06-27 00:00:00',1006,1,0,'870.0000','0.0000','LE',2009627,0,5,0,0,0,0),(300645,'2009-06-27 00:00:00',1000,1,0,'200.0000','0.0000','LE',2009628,0,1,0,0,0,0),(300646,'2009-06-27 00:00:00',1007,0,1,'0.0000','10800.0000','LA',2009628,NULL,1,0,0,0,0),(300647,'2009-06-27 00:00:00',1004,0,1,'0.0000','1320.0000','LA',2009628,NULL,1,0,0,0,0),(300648,'2009-06-27 00:00:00',1006,0,1,'0.0000','870.0000','LA',2009628,NULL,1,0,0,0,0),(300649,'2009-06-27 00:00:00',1000,1,0,'66.6700','0.0000','LE',2009627,0,0,0,0,0,0),(300650,'2009-06-27 00:00:00',4,1,0,'0.0000','0.0000','LE',2009627,0,0,0,0,0,0),(300652,'2009-06-27 00:00:00',5,0,1,'0.0000','19.4500','LE',2009627,NULL,3,0,0,0,0),(300653,'2009-06-27 00:00:00',5,1,0,'19.4500','0.0000','LE',2009627,0,3,0,0,0,0);

UNLOCK TABLES;

/*Table structure for table `grartikel-lagerort` */

DROP TABLE IF EXISTS `grartikel-lagerort`;

CREATE TABLE `grartikel-lagerort` (
  `LagerNr` int(10) NOT NULL,
  `LagerOrt` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LagerNr`),
  UNIQUE KEY `LagerNr` (`LagerNr`),
  KEY `grArtikel-LagerortLagerOrt` (`LagerOrt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grartikel-lagerort` */

LOCK TABLES `grartikel-lagerort` WRITE;

insert  into `grartikel-lagerort`(`LagerNr`,`LagerOrt`) values (0,'Lagerort 1'),(1,'Lagerort 2'),(3,'Lagerort 3'),(5,'Lagerort 4'),(6,'Lagerort 5'),(7,'Lagerort III');

UNLOCK TABLES;

/*Table structure for table `grartikel-orderrabatt` */

DROP TABLE IF EXISTS `grartikel-orderrabatt`;

CREATE TABLE `grartikel-orderrabatt` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `GesamtPreisVon` int(10) DEFAULT NULL,
  `GesamtPreisBis` int(10) DEFAULT NULL,
  `Rabatt` double(15,5) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `grartikel-orderrabatt` */

LOCK TABLES `grartikel-orderrabatt` WRITE;

insert  into `grartikel-orderrabatt`(`ID`,`GesamtPreisVon`,`GesamtPreisBis`,`Rabatt`) values (1,0,750,0.00000),(2,750,999,5.00000),(3,1000,1499,10.00000),(4,1500,1999,15.00000),(5,2000,2999,20.00000),(6,3000,999999,25.00000);

UNLOCK TABLES;

/*Table structure for table `grartikel-reviews` */

DROP TABLE IF EXISTS `grartikel-reviews`;

CREATE TABLE `grartikel-reviews` (
  `ReviewID` int(10) NOT NULL AUTO_INCREMENT,
  `ArtNR` int(10) DEFAULT NULL,
  `Review` longtext,
  `Autor` varchar(50) DEFAULT NULL,
  `DateCreation` datetime DEFAULT NULL,
  `Points` int(10) DEFAULT NULL,
  PRIMARY KEY (`ReviewID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Data for the table `grartikel-reviews` */

LOCK TABLES `grartikel-reviews` WRITE;

insert  into `grartikel-reviews`(`ReviewID`,`ArtNR`,`Review`,`Autor`,`DateCreation`,`Points`) values (26,1000,'Sehr Scnell und Perfekt Design','Anonym','2002-06-27 13:20:38',3),(27,1044,'Best Design ','Andreas','2002-06-27 13:21:17',5),(30,1044,'Interessantes Buch','Anonym','2002-08-01 08:38:25',5),(33,1000,'super ausführung','Anonym','2002-08-05 14:33:53',3),(34,1000,'Beitrag von Anonym\r\n Datum:6/27/2002 1:20:38 PM ','Anonym',NULL,3),(35,1000,'Beitrag von Anonym\r\n Datum:6/27/2002 1:20:38 PM \r\nSehr Scnell und Perfekt Design  \r\n','Anonym',NULL,3),(36,1047,'sadfasdf','Anonym',NULL,3),(37,1020,'12341234','Anonym',NULL,3),(38,1020,'WQTWETQWETQW','Anonym',NULL,3);

UNLOCK TABLES;

/*Table structure for table `grartikel-staffelpreise` */

DROP TABLE IF EXISTS `grartikel-staffelpreise`;

CREATE TABLE `grartikel-staffelpreise` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ArtNr` int(10) DEFAULT NULL,
  `StkAb` int(10) DEFAULT NULL,
  `ProzentRabatt` double(15,5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `grartikel-staffelpreise` */

LOCK TABLES `grartikel-staffelpreise` WRITE;

insert  into `grartikel-staffelpreise`(`ID`,`ArtNr`,`StkAb`,`ProzentRabatt`) values (1,1000,2,0.10000),(2,1000,5,0.20000);

UNLOCK TABLES;

/*Table structure for table `grartikel-vertriebskosten` */

DROP TABLE IF EXISTS `grartikel-vertriebskosten`;

CREATE TABLE `grartikel-vertriebskosten` (
  `TKId` int(10) NOT NULL AUTO_INCREMENT,
  `Methode` varchar(50) DEFAULT NULL,
  `Typ` varchar(50) DEFAULT NULL,
  `Destination` varchar(50) DEFAULT NULL,
  `GewichtVon` double(15,5) DEFAULT NULL,
  `GewichtBis` double(15,5) DEFAULT NULL,
  `FixeKosten` double(15,5) DEFAULT NULL,
  `VariableKostenNachGewicht` double(15,5) DEFAULT NULL,
  `VariableKostenNachUmsatz` double(15,5) DEFAULT NULL,
  PRIMARY KEY (`TKId`),
  KEY `TKId` (`TKId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `grartikel-vertriebskosten` */

LOCK TABLES `grartikel-vertriebskosten` WRITE;

insert  into `grartikel-vertriebskosten`(`TKId`,`Methode`,`Typ`,`Destination`,`GewichtVon`,`GewichtBis`,`FixeKosten`,`VariableKostenNachGewicht`,`VariableKostenNachUmsatz`) values (1,'Nachnahme','PAYMENT','AT',0.00000,99999.00000,20.00000,0.00000,0.00000),(2,'Nachnahme','PAYMENT','DE',0.00000,99999.00000,25.00000,0.00000,0.00000),(3,'Check','PAYMENT','AT',0.00000,99999.00000,10.00000,0.00000,0.00000),(4,'DHL','TRANSPORT','AT',0.00000,10000.00000,2.00000,0.00000,0.00000),(5,'DANZAS','TRANSPORT','AT',0.00000,10000.00000,2.00000,0.00000,0.00000),(6,'POST','TRANSPORT','AT',0.00000,10000.00000,10.00000,0.00000,0.00000),(7,'POST','TRANSPORT','DE',0.00000,10000.00000,10.00000,0.00000,0.00000),(8,'POST','TRANSPORT','DE',0.00000,10000.00000,10.00000,0.00000,0.00000),(9,'Vorkasse','PAYMENT','AT',0.00000,10000.00000,0.00000,0.00000,0.00000),(10,'Vorkasse','PAYMENT','DE',0.00000,10000.00000,0.00000,0.00000,0.00000),(11,'Abholung','TRANSPORT','AT',0.00000,10000.00000,0.00000,0.00000,0.00000),(12,'Abholung','TRANSPORT','DE',0.00000,10000.00000,0.00000,0.00000,0.00000),(13,'PAYPAL','PAYMENT','AT',0.00000,999.00000,0.00000,0.00000,0.00000),(14,'PAYPAL','PAYMENT','DE',0.00000,999.00000,0.00000,0.00000,0.00000),(16,'Versand','TRANSPORT','EU',0.00000,10000.00000,0.00000,0.00000,0.00000),(17,'Vorkasse','PAYMENT','EU',0.00000,10000.00000,0.00000,0.00000,0.00000),(18,'PAYPAL','PAYMENT','EU',0.00000,10000.00000,0.00000,0.00000,0.00000);

UNLOCK TABLES;

/*Table structure for table `grartikel-verwandteartikel` */

DROP TABLE IF EXISTS `grartikel-verwandteartikel`;

CREATE TABLE `grartikel-verwandteartikel` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ArtNr` int(10) DEFAULT NULL,
  `UnterArtNr` int(10) DEFAULT NULL,
  `Bezeichnung` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ArtNr` (`ArtNr`),
  KEY `ArtNr1` (`UnterArtNr`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `grartikel-verwandteartikel` */

LOCK TABLES `grartikel-verwandteartikel` WRITE;

insert  into `grartikel-verwandteartikel`(`ID`,`ArtNr`,`UnterArtNr`,`Bezeichnung`) values (5,1045,1049,'Empfehlung'),(6,1045,1050,'Empfehlung'),(9,1000,1000,'Empfehlung'),(10,1000,1005,'Empfehlung'),(11,5,6,'Empfehlung'),(12,5,7,'Empfehlung'),(13,5,8,'Empfehlung');

UNLOCK TABLES;

/*Table structure for table `grartikel-vkpreisperselection` */

DROP TABLE IF EXISTS `grartikel-vkpreisperselection`;

CREATE TABLE `grartikel-vkpreisperselection` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Datum` datetime DEFAULT NULL,
  `VKPreis` decimal(19,4) DEFAULT NULL,
  `AufschlagVKPreis` double(15,5) DEFAULT '0.00000',
  `AufschlagEKPreis` double(15,5) DEFAULT '0.00000',
  `PreislisteName` varchar(50) DEFAULT NULL,
  `ArtKatNr` int(10) DEFAULT '-1',
  `ArtNr` int(10) DEFAULT NULL,
  `IDNR` int(10) DEFAULT '-1',
  `StkAb` int(10) DEFAULT '-1',
  PRIMARY KEY (`Id`),
  KEY `grArtikelVKPreisPerSelectionSelection` (`PreislisteName`),
  KEY `Id` (`Id`),
  KEY `IDNR` (`IDNR`)
) ENGINE=InnoDB AUTO_INCREMENT=9330 DEFAULT CHARSET=latin1;

/*Data for the table `grartikel-vkpreisperselection` */

LOCK TABLES `grartikel-vkpreisperselection` WRITE;

insert  into `grartikel-vkpreisperselection`(`Id`,`Datum`,`VKPreis`,`AufschlagVKPreis`,`AufschlagEKPreis`,`PreislisteName`,`ArtKatNr`,`ArtNr`,`IDNR`,`StkAb`) values (1341,NULL,'42.5000',0.00000,0.00000,'1-Letztverbraucher',-1,1,-1,-1),(1342,NULL,'32.5000',0.00000,0.00000,'1-Letztverbraucher',-1,5,-1,-1),(1348,NULL,'17.5000',0.00000,0.00000,'1-Letztverbraucher',-1,2,-1,-1),(1349,NULL,'16.0000',0.00000,0.00000,'2-GH-Kunden Inland',-1,2,-1,-1),(1350,NULL,'16.0000',0.00000,0.00000,'3-Exportkunden DE',-1,2,-1,-1),(1351,NULL,'16.0000',0.00000,0.00000,'4-Exportkunden EUROPA',-1,2,-1,-1),(1356,NULL,'20.0000',0.00000,0.00000,'2-GH-Kunden Inland',-1,5,-1,-1),(1357,NULL,'20.0000',0.00000,0.00000,'3-Exportkunden DE',-1,5,-1,-1),(1358,NULL,'20.0000',0.00000,0.00000,'4-Exportkunden EUROPA',-1,5,-1,-1),(1359,NULL,'32.5000',0.00000,0.00000,'1-Letztverbraucher',-1,6,-1,-1),(1360,NULL,'15.0000',0.00000,0.00000,'2-GH-Kunden Inland',-1,6,-1,-1),(1361,NULL,'15.0000',0.00000,0.00000,'3-Exportkunden DE',-1,6,-1,-1),(1362,NULL,'15.0000',0.00000,0.00000,'4-Exportkunden EUROPA',-1,6,-1,-1),(1363,NULL,'17.5000',0.00000,0.00000,'1-Letztverbraucher',-1,7,-1,-1),(1364,NULL,'14.0000',0.00000,0.00000,'2-GH-Kunden Inland',-1,7,-1,-1),(1365,NULL,'12.0000',0.00000,0.00000,'3-Exportkunden DE',-1,7,-1,-1),(1366,NULL,'12.0000',0.00000,0.00000,'4-Exportkunden EUROPA',-1,7,-1,-1),(1367,NULL,'15.0000',0.00000,0.00000,'1-Letztverbraucher',-1,8,-1,-1),(1368,NULL,'12.0000',0.00000,0.00000,'2-GH-Kunden Inland',-1,8,-1,-1),(1369,NULL,'12.0000',0.00000,0.00000,'3-Exportkunden DE',-1,8,-1,-1),(1370,NULL,'12.0000',0.00000,0.00000,'4-Exportkunden EUROPA',-1,8,-1,-1),(1371,NULL,'30.0000',0.00000,0.00000,'1-Letztverbraucher',-1,9,-1,-1),(1372,NULL,'19.0000',0.00000,0.00000,'2-GH-Kunden Inland',-1,9,-1,-1),(1373,NULL,'18.0000',0.00000,0.00000,'3-Exportkunden EU',-1,9,-1,-1),(1374,NULL,'18.0000',0.00000,0.00000,'4-Exportkunden Non-EU',-1,9,-1,-1),(1375,NULL,'20.0000',0.00000,0.00000,'1-Letztverbraucher',-1,3,-1,-1),(1376,NULL,'14.0000',0.00000,0.00000,'2-GH-Kunden Inland',-1,3,-1,-1),(1377,NULL,'14.0000',0.00000,0.00000,'3-Exportkunden EU',-1,3,-1,-1),(1378,NULL,'14.0000',0.00000,0.00000,'4-Exportkunden Non-EU',-1,3,-1,-1),(1379,NULL,'20.0000',0.00000,0.00000,'1-Letztverbraucher',-1,10,-1,-1),(1380,NULL,'13.5000',0.00000,0.00000,'2-GH-Kunden Inland',-1,10,-1,-1),(1381,NULL,'12.5000',0.00000,0.00000,'3-Exportkunden EU',-1,10,-1,-1),(1382,NULL,'12.0000',0.00000,0.00000,'4-Exportkunden Non-EU',-1,10,-1,-1),(2261,NULL,'27.5000',0.00000,0.00000,'2-GH-Kunden Inland',-1,1,-1,-1),(2295,NULL,'27.5000',0.00000,0.00000,'3-Exportkunden EU',-1,1,-1,-1),(2296,NULL,'25.5000',0.00000,0.00000,'4-Exportkunden Non-EU',-1,1,-1,-1),(2341,NULL,'0.0000',0.00000,0.00000,NULL,-1,2,0,-1),(2425,NULL,'20.0000',0.00000,0.00000,NULL,-1,7,230025,-1),(2444,NULL,'35.0000',0.00000,0.00000,NULL,-1,5,210252,-1),(2445,NULL,'30.0000',0.00000,0.00000,NULL,-1,7,210252,-1),(2617,NULL,'25.0000',0.00000,0.00000,NULL,-1,9,211039,-1),(3336,NULL,'22.0000',0.00000,0.00000,NULL,-1,2,250047,-1),(7737,NULL,'1.6500',0.00000,0.00000,'1-Letztverbraucher',-1,0,-1,-1),(7738,NULL,'1.1500',0.00000,0.00000,'2-GH-Kunden Inland',-1,0,-1,-1),(7739,NULL,'1.0000',0.00000,0.00000,'2-GH-Kunden Inland',-1,0,-1,24),(7740,NULL,'1.1000',0.00000,0.00000,'3-Exportkunden DE',-1,0,-1,-1),(7741,NULL,'1.0000',0.00000,0.00000,'3-Exportkunden DE',-1,0,-1,24),(7742,NULL,'1.1000',0.00000,0.00000,'4-Exportkunden EUROPA',-1,0,-1,-1),(7743,NULL,'1.0000',0.00000,0.00000,'4-Exportkunden EUROPA',-1,0,-1,24),(9328,'2009-02-05 00:00:00',NULL,0.00000,0.00000,NULL,-1,-1,1,-1),(9329,NULL,NULL,0.10000,NULL,NULL,NULL,5,0,5);

UNLOCK TABLES;

/*Table structure for table `grbanken` */

DROP TABLE IF EXISTS `grbanken`;

CREATE TABLE `grbanken` (
  `BankNr` int(10) NOT NULL,
  `SWIFT` varchar(50) DEFAULT NULL,
  `BLZ` int(10) DEFAULT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Adresse` varchar(50) DEFAULT NULL,
  `PLZ` int(10) DEFAULT NULL,
  `AsP` int(10) DEFAULT NULL,
  `Tel` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `e-mail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`BankNr`),
  KEY `grBankenBLZ` (`BLZ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grbanken` */

LOCK TABLES `grbanken` WRITE;

insert  into `grbanken`(`BankNr`,`SWIFT`,`BLZ`,`Name`,`Adresse`,`PLZ`,`AsP`,`Tel`,`Fax`,`e-mail`) values (1,'123',21000,'Test Bank','Unsere Strasse 123',4040,6,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `grblz` */

DROP TABLE IF EXISTS `grblz`;

CREATE TABLE `grblz` (
  `BLZ` int(10) NOT NULL,
  `Bankname` varchar(50) DEFAULT NULL,
  `SWIFT` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`BLZ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grblz` */

LOCK TABLES `grblz` WRITE;

insert  into `grblz`(`BLZ`,`Bankname`,`SWIFT`) values (10000,'BNB','0003'),(21000,'CA','0002'),(34000,'Reiffeissen','0001');

UNLOCK TABLES;

/*Table structure for table `grbranchen` */

DROP TABLE IF EXISTS `grbranchen`;

CREATE TABLE `grbranchen` (
  `BrNR` int(10) NOT NULL,
  `Bezeichnung` varchar(50) DEFAULT NULL,
  `Gruppe` varchar(50) DEFAULT NULL,
  `Integriert` tinyint(1) NOT NULL,
  PRIMARY KEY (`BrNR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grbranchen` */

LOCK TABLES `grbranchen` WRITE;

insert  into `grbranchen`(`BrNR`,`Bezeichnung`,`Gruppe`,`Integriert`) values (0,'Keine',NULL,-1),(1,'Beef','Fleisch',0),(3,'Pork','Fleisch',0),(5,'Veal','Fleisch',0),(7,'Lamb','Fleisch',0),(10,'Chicken','Fleisch',0),(12,'Turkey','Fleisch',0),(15,'Bioprojekt','Bioprojekt',0);

UNLOCK TABLES;

/*Table structure for table `grbranchenkeywords` */

DROP TABLE IF EXISTS `grbranchenkeywords`;

CREATE TABLE `grbranchenkeywords` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `BrNr` int(10) DEFAULT NULL,
  `Keyword` varchar(50) DEFAULT NULL,
  `DefaultValue` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `branchenId` (`BrNr`),
  KEY `Id` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `grbranchenkeywords` */

LOCK TABLES `grbranchenkeywords` WRITE;

insert  into `grbranchenkeywords`(`Id`,`BrNr`,`Keyword`,`DefaultValue`) values (1,10,'Erste Zulassung',NULL),(2,10,'Farbe',NULL),(3,10,'Kilometerstand',NULL),(4,10,'Verbrauch',NULL),(5,10,'Max. Geschw.',NULL),(6,10,'Gewicht',NULL),(7,10,'Typ',NULL),(8,10,'Kategorie',NULL),(9,10,'KW Leistung',NULL),(10,10,'Extras',NULL),(11,114,'Temperatur','-18o'),(12,114,'Herkunft','-'),(13,114,'EU-Nummer','-');

UNLOCK TABLES;

/*Table structure for table `grland` */

DROP TABLE IF EXISTS `grland`;

CREATE TABLE `grland` (
  `IdNr` int(10) NOT NULL,
  `VWahl` varchar(5) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Currency` varchar(50) DEFAULT NULL,
  `PLZPraefix` varchar(2) DEFAULT NULL,
  `ISO2` varchar(22) DEFAULT NULL,
  `ISO3` varchar(3) DEFAULT NULL,
  `language_Code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`IdNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grland` */

LOCK TABLES `grland` WRITE;

insert  into `grland`(`IdNr`,`VWahl`,`Name`,`Currency`,`PLZPraefix`,`ISO2`,`ISO3`,`language_Code`) values (1,'004','AUSTRALIA',NULL,NULL,NULL,NULL,NULL),(2,NULL,'SOUTH AFRICA',NULL,NULL,NULL,NULL,NULL),(3,'0032','BELGIEN',NULL,NULL,'BE',NULL,NULL),(4,NULL,'Blumberg',NULL,NULL,NULL,NULL,NULL),(5,NULL,'GREENLAND',NULL,NULL,'-',NULL,NULL),(6,NULL,'SCHWEIZ',NULL,NULL,'-',NULL,NULL),(7,'007','KROATIEN','RUB','RU','RU','RU',NULL),(8,NULL,'Belgien',NULL,NULL,'-',NULL,NULL),(9,NULL,'DÄNEMARK',NULL,NULL,'-',NULL,NULL),(10,NULL,'ESTLAND',NULL,NULL,'-',NULL,NULL),(11,NULL,'Lichtenstein',NULL,NULL,'-',NULL,NULL),(12,NULL,'FRANKREICH',NULL,NULL,'-',NULL,NULL),(13,NULL,'FINNLAND',NULL,NULL,'-',NULL,NULL),(14,NULL,'GROSSBRITANNIEN',NULL,NULL,'-',NULL,NULL),(15,NULL,'GRIECHENLAND',NULL,NULL,'-',NULL,NULL),(16,NULL,'ITALIEN',NULL,NULL,'-',NULL,NULL),(17,NULL,'IRLAND',NULL,NULL,'-',NULL,NULL),(18,'00423','LIECHTENSTEIN',NULL,NULL,NULL,NULL,NULL),(19,'00389','MAZEDONIEN',NULL,NULL,NULL,NULL,NULL),(20,'0031','NIEDERLANDE',NULL,NULL,'NL',NULL,NULL),(21,'0048','POLEN',NULL,NULL,'PL',NULL,NULL),(22,'0040','RUMÄNIEN',NULL,NULL,'RO',NULL,NULL),(23,'0046','SCHWEDEN',NULL,NULL,'SE',NULL,NULL),(24,'0041','SCHWEIZ',NULL,NULL,'CH',NULL,NULL),(25,'00386','SLOWENIEN',NULL,NULL,'SI',NULL,NULL),(26,'00421','SLOWAKISCHE REPUBLIK',NULL,NULL,'SK',NULL,NULL),(27,'0027','SPANIEN',NULL,NULL,NULL,NULL,NULL),(28,'00420','TSCHECHISCHE REPUBLIK',NULL,NULL,'CZ',NULL,NULL),(29,'0036','UNGARN',NULL,NULL,'HU',NULL,NULL),(30,'0030','WEISSRUSSLAND','EUR',NULL,NULL,NULL,NULL),(31,'0031','JUGOSLAWIEN','Euro','NL','NL','NL',NULL),(32,'0032','NORWEGEN','Euro','BE','BE','BE',NULL),(33,'0033','KOLUMBIEN','EUR','FR','FR','FR',NULL),(34,'0034','TENERIFFA - KANARISCHE INSELN','Euro','ES','ES','ES',NULL),(35,NULL,'Bosnien-Herzegowina',NULL,NULL,'BA',NULL,NULL),(36,'0036','Hungary','HUF','HU','HU','HU',NULL),(38,'0038','FUERTEVENTURA - KANARAISCHE INSELN',NULL,NULL,NULL,NULL,NULL),(39,'0039','Italy','EUR','IT','IT','IT',NULL),(40,'0040','Romania','RON','RO','RO','RO',NULL),(41,'0041','Switzerland',NULL,NULL,NULL,NULL,NULL),(43,'0043','Österreich','Euro','A','AT','AUT',NULL),(44,'0044','United Kingdom','EUR','UK','UK','UK',NULL),(45,'0045','Danemark','Euro','DK','DK','DK',NULL),(48,'0048','Poland','PLN','PL','PL','PL',NULL),(49,'0049','DEUTSCHLAND','Euro','D','DE','GER',NULL),(50,NULL,'PORTUGAL',NULL,NULL,'PT',NULL,NULL),(51,'0020','EGYPT',NULL,NULL,NULL,NULL,NULL),(52,NULL,'MAROC',NULL,NULL,NULL,NULL,NULL),(54,'0054','ARGENTINIEN',NULL,'AR',NULL,NULL,NULL),(55,'0055','BRAZIL',NULL,NULL,NULL,NULL,NULL),(57,'0057','Colombia','PES','CO','CO','CO',NULL),(60,NULL,'Albanien',NULL,NULL,'-',NULL,NULL),(61,'0067','Bosnien-Herzegowina',NULL,NULL,'-',NULL,NULL),(62,NULL,'Bulgarien',NULL,NULL,'-',NULL,NULL),(63,'0063','Estland','PHP','PH','PH','PH',NULL),(64,NULL,'Griechenland',NULL,NULL,'-',NULL,NULL),(65,NULL,'Irland',NULL,NULL,'-',NULL,NULL),(66,'0066','Island',NULL,NULL,NULL,NULL,NULL),(67,NULL,'Kroatien',NULL,NULL,'-',NULL,NULL),(68,NULL,'Lettland',NULL,NULL,'-',NULL,NULL),(69,NULL,'Litauen',NULL,NULL,'-',NULL,NULL),(70,NULL,'Malta',NULL,NULL,'-',NULL,NULL),(71,NULL,'Mazedonien ',NULL,NULL,'-',NULL,NULL),(72,NULL,'Moldawien',NULL,NULL,'-',NULL,NULL),(73,NULL,'other',NULL,NULL,'-',NULL,NULL),(74,NULL,'Polen',NULL,NULL,'-',NULL,NULL),(75,NULL,'Rumänien',NULL,NULL,'-',NULL,NULL),(76,NULL,'Serbien & Montenegro',NULL,NULL,'-',NULL,NULL),(77,NULL,'Slowakei',NULL,NULL,'-',NULL,NULL),(78,NULL,'Slowenien',NULL,NULL,'-',NULL,NULL),(79,NULL,'Tschechien',NULL,NULL,'-',NULL,NULL),(80,NULL,'Türkei',NULL,NULL,'-',NULL,NULL),(81,NULL,'Ukraine',NULL,NULL,'-',NULL,NULL),(82,'0082','Ungarn','KRW','KR','KR','KR',NULL),(83,NULL,'Weißrussland',NULL,NULL,'-',NULL,NULL),(84,NULL,'VIETNAM',NULL,NULL,'-',NULL,NULL),(85,NULL,'TAIWAN',NULL,NULL,NULL,NULL,NULL),(86,'0086','China','CNY','CN','CN','CN',NULL),(90,'0090','TÜRKEI',NULL,NULL,NULL,NULL,NULL),(91,NULL,'LITAUEN',NULL,NULL,'LT',NULL,NULL),(92,NULL,'MALTA',NULL,NULL,'MT',NULL,NULL),(93,NULL,'ZYPERN',NULL,NULL,'CY',NULL,NULL),(94,'001','UNITED STATES OF AMERICA',NULL,NULL,NULL,NULL,NULL),(95,NULL,'NEUSEELAND',NULL,NULL,NULL,NULL,NULL),(96,'96','MONTENEGRO',NULL,NULL,NULL,NULL,NULL),(97,NULL,'REPUBLIC OF MOLDOVA',NULL,NULL,NULL,NULL,NULL),(98,'0098','IRAN',NULL,NULL,NULL,NULL,NULL),(123,'00123','Finnland','Euro','F','FI','FIN',NULL),(216,'00216','TUNESIEN',NULL,NULL,NULL,NULL,NULL),(237,'00237','KAMERUN','CAM',NULL,NULL,NULL,NULL),(264,'00264','NAMIBIA',NULL,NULL,NULL,NULL,NULL),(352,'00352','LUXEMBURG',NULL,NULL,'LU',NULL,NULL),(359,'00359','BULGARIEN','Lv.','BG','BG','BUL',NULL),(370,'00370','Lithuania','EUR','LT','LT','LT',NULL),(371,'00371','LETTLAND','LTV','LT','LT','LT',NULL),(372,'00372','Estonia','EUR','EE','EE','EE',NULL),(375,'00375','Belarus',NULL,'BY','BY','BY',NULL),(380,'00380','UKRAINE','GRV','UA','UA','UA',NULL),(381,'00381','SERBIA','DNR','YU','YU','YU',NULL),(382,'00382','Montenegro','EUR','MG','MG','MG',NULL),(385,'00385','Kroatian','EUR','HR','HR','HR',NULL),(386,'00386','Slovenia','EUR','SL','SL','SL',NULL),(387,'00387','Bosnia','EUR','BO','BO','BO',NULL),(389,'00389','Mazedonia','MKD','MK','MK','MK',NULL),(420,'00420','Czech Republik','CZK','CZ','CZ','CZ',NULL),(421,'00421','Slovakia','SKK','SK','SK','SK',NULL),(509,'00509','Haiti','HTG','HT','HAT','HAT',NULL),(961,'00961','LIBANON',NULL,NULL,NULL,NULL,NULL),(972,'00972','ISRAEL',NULL,NULL,NULL,NULL,NULL),(974,'00974','KATAR',NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `grlieferungbedingungen` */

DROP TABLE IF EXISTS `grlieferungbedingungen`;

CREATE TABLE `grlieferungbedingungen` (
  `Nr` int(10) NOT NULL AUTO_INCREMENT,
  `Bedingung` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Nr`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `grlieferungbedingungen` */

LOCK TABLES `grlieferungbedingungen` WRITE;

insert  into `grlieferungbedingungen`(`Nr`,`Bedingung`) values (1,'POST');

UNLOCK TABLES;

/*Table structure for table `grmwst` */

DROP TABLE IF EXISTS `grmwst`;

CREATE TABLE `grmwst` (
  `ID` int(10) NOT NULL,
  `MWSTGROUP` int(10) NOT NULL,
  `Land` varchar(50) NOT NULL,
  `Prozent` int(10) DEFAULT NULL,
  PRIMARY KEY (`MWSTGROUP`,`Land`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grmwst` */

LOCK TABLES `grmwst` WRITE;

insert  into `grmwst`(`ID`,`MWSTGROUP`,`Land`,`Prozent`) values (1,0,'AT',0),(4,0,'DE',0),(7,2,'AT',20),(2,10,'AT',10),(5,10,'DE',8),(3,20,'AT',20),(6,20,'DE',16);

UNLOCK TABLES;

/*Table structure for table `grplz` */

DROP TABLE IF EXISTS `grplz`;

CREATE TABLE `grplz` (
  `IdNr` varchar(20) NOT NULL DEFAULT '',
  `BLand` varchar(50) DEFAULT NULL,
  `PLZ` varchar(20) DEFAULT NULL,
  `Ort` varchar(255) DEFAULT NULL,
  `TelVWahl` varchar(50) DEFAULT NULL,
  `Land` int(10) DEFAULT NULL,
  PRIMARY KEY (`IdNr`),
  KEY `grLandgrPLZ` (`Land`),
  KEY `grPLZPLZ` (`PLZ`),
  KEY `IdNr` (`IdNr`),
  CONSTRAINT `grplz_ibfk_1` FOREIGN KEY (`Land`) REFERENCES `grland` (`IdNr`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grplz` */

LOCK TABLES `grplz` WRITE;

insert  into `grplz`(`IdNr`,`BLand`,`PLZ`,`Ort`,`TelVWahl`,`Land`) values ('-555555',NULL,'555555','Durban',NULL,2),('A-1010',NULL,'1010','Wien',NULL,43),('A-4040',NULL,'4040','Linz',NULL,43);

UNLOCK TABLES;

/*Table structure for table `grselection1` */

DROP TABLE IF EXISTS `grselection1`;

CREATE TABLE `grselection1` (
  `Selection` varchar(50) NOT NULL,
  PRIMARY KEY (`Selection`),
  KEY `grSelection1Selection` (`Selection`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grselection1` */

LOCK TABLES `grselection1` WRITE;

insert  into `grselection1`(`Selection`) values ('Beef'),('Chicken'),('Kühlhaus'),('Lamp'),('Pork'),('Turkey'),('Veal');

UNLOCK TABLES;

/*Table structure for table `grselection2` */

DROP TABLE IF EXISTS `grselection2`;

CREATE TABLE `grselection2` (
  `Selection` varchar(50) NOT NULL,
  PRIMARY KEY (`Selection`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grselection2` */

LOCK TABLES `grselection2` WRITE;

insert  into `grselection2`(`Selection`) values ('Händler'),('Produzent'),('Vermittler');

UNLOCK TABLES;

/*Table structure for table `grservices` */

DROP TABLE IF EXISTS `grservices`;

CREATE TABLE `grservices` (
  `Nr` int(10) NOT NULL AUTO_INCREMENT,
  `Service` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Nr`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `grservices` */

LOCK TABLES `grservices` WRITE;

insert  into `grservices`(`Nr`,`Service`) values (1,'POST');

UNLOCK TABLES;

/*Table structure for table `grtransportmethode` */

DROP TABLE IF EXISTS `grtransportmethode`;

CREATE TABLE `grtransportmethode` (
  `Methode` varchar(50) NOT NULL,
  PRIMARY KEY (`Methode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grtransportmethode` */

LOCK TABLES `grtransportmethode` WRITE;

insert  into `grtransportmethode`(`Methode`) values ('DANZAS'),('DHL'),('EIGENE ABHOLUNG'),('POST'),('SPEDITION');

UNLOCK TABLES;

/*Table structure for table `grwaehrung` */

DROP TABLE IF EXISTS `grwaehrung`;

CREATE TABLE `grwaehrung` (
  `Zeichen` varchar(50) NOT NULL,
  `Kurs` double(15,5) DEFAULT NULL,
  `ErstelltAm` datetime DEFAULT NULL,
  PRIMARY KEY (`Zeichen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `grwaehrung` */

LOCK TABLES `grwaehrung` WRITE;

insert  into `grwaehrung`(`Zeichen`,`Kurs`,`ErstelltAm`) values ('EUR',1.00000,NULL),('USD',1.00000,NULL);

UNLOCK TABLES;

/*Table structure for table `grzahlungsbedingung` */

DROP TABLE IF EXISTS `grzahlungsbedingung`;

CREATE TABLE `grzahlungsbedingung` (
  `Nr` int(10) NOT NULL AUTO_INCREMENT,
  `Methode` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Nr`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

/*Data for the table `grzahlungsbedingung` */

LOCK TABLES `grzahlungsbedingung` WRITE;

insert  into `grzahlungsbedingung`(`Nr`,`Methode`) values (1,'30 DAYS FROM DATE OF LOADING'),(2,'PREPAIMENT'),(3,'PAYMENT AGAINST DOCUMENTS'),(4,'14 DAYS FROM DATE OF LOADING'),(5,'21 DAYS FROM DATE OF LOADING'),(6,'7 DAYS FROM DATE OF LOADING'),(7,'7 DAYS FROM DATE OF LOADING - WITH 1 % DISCOUNT'),(8,'10 DAYS FROM DATE OF LOADING - WITH 1 % DISCOUNT'),(9,'45 DAYS FROM DATE OF LOADING'),(10,'60 DAYS FROM DATE OF LOADING'),(11,'90 DAYS FROM DATE OF LOADING'),(12,'30 DAYS FROM DATE OF LOADING'),(13,'PREPAIMENT'),(14,'PAYMENT AGAINST DOCUMENTS'),(15,'14 DAYS FROM DATE OF LOADING'),(16,'21 DAYS FROM DATE OF LOADING'),(17,'7 DAYS FROM DATE OF LOADING'),(18,'7 DAYS FROM DATE OF LOADING - WITH 1 % DISCOUNT'),(19,'10 DAYS FROM DATE OF LOADING - WITH 1 % DISCOUNT'),(20,'45 DAYS FROM DATE OF LOADING'),(21,'60 DAYS FROM DATE OF LOADING'),(22,'90 DAYS FROM DATE OF LOADING'),(27,'Nachnahme'),(28,'Netto Kassa'),(29,'DHL'),(30,'UPS'),(31,'Check'),(32,'POST'),(33,'Zahlschein'),(34,'Nachnahme'),(35,'Netto Kassa'),(36,'DHL'),(37,'UPS'),(38,'Check'),(39,'POST'),(40,'Zahlschein'),(41,'Nachnahme'),(42,'Netto Kassa'),(43,'DHL'),(44,'UPS'),(45,'Check'),(46,'POST'),(47,'Zahlschein'),(48,'30 DAYS FROM DATE OF LOADING'),(49,'PREPAIMENT'),(50,'PAYMENT AGAINST DOCUMENTS'),(51,'14 DAYS FROM DATE OF LOADING'),(52,'21 DAYS FROM DATE OF LOADING'),(53,'7 DAYS FROM DATE OF LOADING'),(54,'7 DAYS FROM DATE OF LOADING - WITH 1 % DISCOUNT'),(55,'10 DAYS FROM DATE OF LOADING - WITH 1 % DISCOUNT'),(56,'45 DAYS FROM DATE OF LOADING'),(57,'60 DAYS FROM DATE OF LOADING'),(58,'90 DAYS FROM DATE OF LOADING'),(59,'30 DAYS FROM DATE OF LOADING'),(60,'PREPAIMENT'),(61,'PAYMENT AGAINST DOCUMENTS'),(62,'14 DAYS FROM DATE OF LOADING'),(63,'21 DAYS FROM DATE OF LOADING'),(64,'7 DAYS FROM DATE OF LOADING'),(65,'7 DAYS FROM DATE OF LOADING - WITH 1 % DISCOUNT'),(66,'10 DAYS FROM DATE OF LOADING - WITH 1 % DISCOUNT'),(67,'45 DAYS FROM DATE OF LOADING'),(68,'60 DAYS FROM DATE OF LOADING'),(69,'90 DAYS FROM DATE OF LOADING'),(70,'Nachnahme'),(71,'Netto Kassa'),(72,'DHL'),(73,'UPS'),(74,'Check'),(75,'POST'),(76,'Zahlschein'),(77,'Nachnahme'),(78,'Netto Kassa'),(79,'DHL'),(80,'UPS'),(81,'Check'),(82,'POST'),(83,'Zahlschein'),(84,'Nachnahme'),(85,'Netto Kassa'),(86,'DHL'),(87,'UPS'),(88,'Check'),(89,'POST'),(90,'Zahlschein');

UNLOCK TABLES;

/*Table structure for table `grzahlungsmethode` */

DROP TABLE IF EXISTS `grzahlungsmethode`;

CREATE TABLE `grzahlungsmethode` (
  `Methode` varchar(50) NOT NULL,
  PRIMARY KEY (`Methode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grzahlungsmethode` */

LOCK TABLES `grzahlungsmethode` WRITE;

insert  into `grzahlungsmethode`(`Methode`) values ('American Express'),('Amex'),('Bankomat'),('Diners'),('Electronic cash transfer'),('Express'),('Master Card'),('Nachnahme'),('Normal'),('paypal'),('Quick'),('VISA');

UNLOCK TABLES;

/*Table structure for table `impetb` */

DROP TABLE IF EXISTS `impetb`;

CREATE TABLE `impetb` (
  `IDNR` int(10) NOT NULL AUTO_INCREMENT,
  `Branche` int(10) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Firma` varchar(100) DEFAULT NULL,
  `Adresse` varchar(100) DEFAULT NULL,
  `PLZ` smallint(5) DEFAULT NULL,
  `Tel1` varchar(50) DEFAULT NULL,
  `Tel2` varchar(50) DEFAULT NULL,
  `Tel3` varchar(50) DEFAULT NULL,
  `Export` tinyint(1) NOT NULL,
  `AngelegtAn` datetime DEFAULT NULL,
  `MAInnen` int(10) DEFAULT NULL,
  PRIMARY KEY (`IDNR`),
  KEY `IDNRa` (`IDNR`),
  KEY `PLZ` (`PLZ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `impetb` */

LOCK TABLES `impetb` WRITE;

UNLOCK TABLES;

/*Table structure for table `impexlieferantbestellung` */

DROP TABLE IF EXISTS `impexlieferantbestellung`;

CREATE TABLE `impexlieferantbestellung` (
  `SpezifikationId` int(10) NOT NULL AUTO_INCREMENT,
  `SpezifikationName` varchar(50) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `SQLBeschreibung` longtext,
  `SpezifikationBeschreibung` longtext,
  `ExportFilename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SpezifikationId`),
  KEY `SpezifikationId` (`SpezifikationId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `impexlieferantbestellung` */

LOCK TABLES `impexlieferantbestellung` WRITE;

insert  into `impexlieferantbestellung`(`SpezifikationId`,`SpezifikationName`,`LieferantNr`,`SQLBeschreibung`,`SpezifikationBeschreibung`,`ExportFilename`) values (1,'Techdata CSV',2,'select * from lieferantenBestellgrundlage where lieferantNr=2 and (PositionStatus<>\'bestellt\' or PositionStatus is null)','nicht in Verwendung','c:\\techdata.csv'),(2,'Ingram CSV',1,'SELECT \"AT\" AS LC, 44 AS BNR, \"TODO123456\" AS MeComNR, lieferantenBestellgrundlage.Nummer, \"TODO123456\" & Month(Date()) & Day(Date()) & Hour(Now()) & Minute(Now()) & Second(Now()) AS [Index], Now() AS Bestell_datum, 1 AS pos_nr, lieferantenBestellgrundlage.ArtikelNrLieferant, lieferantenBestellgrundlage.Stk, lieferantenBestellgrundlage.LieferantVKPreis, [LieferantVKPreis]*[stk] AS [sum], \"\" AS LiefName1, \"\" AS LiefName2, \"\" AS LiefStrasse, \"\" AS LiefPLZ, \"\" AS LiefOrt, \"\" AS LiefLandKenn, \"\" AS Bemerkung, \"\" AS PosBemerkung, \"TODOxxxxx\" AS Passwort, \"\" AS Typ\r\nFROM lieferantenBestellgrundlage\r\nwhere lieferantNr=1 and (PositionStatus<>\'bestellt\' or PositionStatus is null)','nicht in Verwendung','c:\\ingram.csv'),(3,'Assmann',3,'select * from lieferantenBestellgrundlage where lieferantNr=3 and (PositionStatus<>\'bestellt\' or PositionStatus is null)','nicht in Verwendung','c:\\assmann.csv');

UNLOCK TABLES;

/*Table structure for table `impkorrekt` */

DROP TABLE IF EXISTS `impkorrekt`;

CREATE TABLE `impkorrekt` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Tel` varchar(50) DEFAULT NULL,
  `Rubrik` varchar(50) DEFAULT NULL,
  `Inserat` longtext,
  `Datum` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `impkorrekt` */

LOCK TABLES `impkorrekt` WRITE;

insert  into `impkorrekt`(`id`,`Tel`,`Rubrik`,`Inserat`,`Datum`) values (1,NULL,'1',NULL,'2002-12-15 00:00:00');

UNLOCK TABLES;

/*Table structure for table `impkorrekt_rubrik_suchtext` */

DROP TABLE IF EXISTS `impkorrekt_rubrik_suchtext`;

CREATE TABLE `impkorrekt_rubrik_suchtext` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Rubrik` varchar(30) DEFAULT NULL,
  `Haupt` varchar(50) DEFAULT NULL,
  `Suchtext` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;

/*Data for the table `impkorrekt_rubrik_suchtext` */

LOCK TABLES `impkorrekt_rubrik_suchtext` WRITE;

insert  into `impkorrekt_rubrik_suchtext`(`Id`,`Rubrik`,`Haupt`,`Suchtext`) values (1,'ABLAUGEN','A-Z',NULL),(2,'AKTION','A-Z',NULL),(3,'AKTUELLES','A-Z',NULL),(4,'ANTIQUITÄTEN','A-Z',NULL),(5,'BÜCHER','A-Z',NULL),(6,'BÜROMÖBEL','A-Z',NULL),(7,'BÜROMASCHINEN','A-Z',NULL),(8,'BADEZIMMERMÖBEL','A-Z',NULL),(9,'BEKLEIDUNG','A-Z',NULL),(10,'BETRIEBSOBJEKTE','A-Z',NULL),(11,'BILDER','A-Z',NULL),(12,'BIOWASCHMITTEL','A-Z',NULL),(13,'BLUMEN','A-Z',NULL),(14,'BRAUTKLEIDER','A-Z',NULL),(15,'BRIEFMARKEN','A-Z',NULL),(16,'COMPACT-DISC','A-Z',NULL),(17,'DESK-TOP-PUBLISHING','A-Z',NULL),(18,'DETEKTIVE','A-Z',NULL),(19,'EDV','A-Z',NULL),(20,'EINRICHTUNG','A-Z',NULL),(21,'EIS','A-Z',NULL),(22,'ELEKTRO','A-Z',NULL),(23,'ESSEN U. TRINKEN','A-Z',NULL),(24,'FAHRSCHULE','A-Z',NULL),(25,'FARBBERATUNG','A-Z',NULL),(26,'FISCH','A-Z',NULL),(27,'FITNEß','A-Z',NULL),(28,'FLOHMARKT','A-Z',NULL),(29,'FOTO','A-Z',NULL),(30,'FREIZEIT','A-Z',NULL),(31,'FRISEUR','A-Z',NULL),(32,'FUßPFLEGE','A-Z',NULL),(33,'FUSSBODEN','A-Z',NULL),(34,'GARTEN','A-Z',NULL),(35,'GASTRO','A-Z',NULL),(36,'GEFLÜGEL','A-Z',NULL),(37,'GESCHÄFTLICHES','A-Z',NULL),(38,'GESCHENKE','A-Z',NULL),(39,'GESUNDHEIT','A-Z',NULL),(40,'GRATULATIONEN','A-Z',NULL),(41,'HANDARBEITEN','A-Z',NULL),(42,'HAUSRAT','A-Z',NULL),(43,'HEIMTEXTILIEN','A-Z',NULL),(44,'HOBBY','Kontakte',NULL),(45,'HOCHZEIT','Kontakte',NULL),(46,'JAGD','A-Z',NULL),(47,'KÜCHEN','A-Z',NULL),(48,'KAUFGESUCHE','A-Z',NULL),(49,'KINDERARTIKEL','A-Z',NULL),(50,'KINDERWAGEN','A-Z',NULL),(51,'KONTAKTE-Gesell.','Kontakte',NULL),(52,'KONTAKTE-Privat','Kontakte',NULL),(53,'KOSMETIK','A-Z',NULL),(54,'KREDITE','A-Z',NULL),(55,'KUNSTSTOPFEREI','A-Z',NULL),(56,'KURSE','A-Z',NULL),(57,'LANDMASCHINEN','A-Z',NULL),(58,'LEBENSHILFE','A-Z',NULL),(59,'LEDER','A-Z',NULL),(60,'LEIHMASCHINEN','A-Z',NULL),(61,'MÜNZEN','A-Z',NULL),(62,'MALERARBEITEN','A-Z',NULL),(63,'MASCHINEN','A-Z',NULL),(64,'MODE','A-Z',NULL),(65,'MODELLBAU','A-Z',NULL),(66,'MUSIK','A-Z',NULL),(67,'PARKETT','A-Z',NULL),(68,'PARKETT','A-Z',NULL),(69,'PARKETTBODEN','A-Z',NULL),(70,'PELZE','A-Z',NULL),(71,'PERÜCKEN','A-Z',NULL),(72,'PFERDEFLEISCH','A-Z',NULL),(73,'PLANUNG','A-Z',NULL),(74,'REISE','A-Z',NULL),(75,'SATELITTENEMPFANG','A-Z',NULL),(76,'SAUNA','A-Z',NULL),(77,'SAUNA,SCHWIMMBAD','A-Z',NULL),(78,'SCHÖN SEIN','A-Z',NULL),(79,'SCHLEIFDIENST','A-Z',NULL),(80,'SCHMUCK','A-Z',NULL),(81,'SCHULDENREGULIERUNG','A-Z',NULL),(82,'SEIDE','A-Z',NULL),(83,'SICHERHEIT','A-Z',NULL),(84,'SNOWBOARD,SCHI','A-Z',NULL),(85,'SPIELSACHEN','A-Z',NULL),(86,'SPORT','A-Z',NULL),(87,'STÖRUNGSDIENST','A-Z',NULL),(88,'SURFEN','A-Z',NULL),(89,'SURFEN','A-Z',NULL),(90,'TAPETEN','A-Z',NULL),(91,'TAUCHEN','A-Z',NULL),(92,'TELEFONKONTAKTE','Kontakte',NULL),(93,'TEPPICHBÖDEN','A-Z',NULL),(94,'TIEFKÜHLKOST','A-Z',NULL),(95,'TIERBEDARF','A-Z',NULL),(96,'TIERE','A-Z',NULL),(97,'TODESFÄLLE','A-Z',NULL),(98,'UNTERRICHT','A-Z',NULL),(99,'URLAUB','A-Z',NULL),(100,'URLAUB AM BAUERNHOF','A-Z',NULL),(101,'VERANSTALTUNGEN','A-Z',NULL),(102,'VERANSTALTUNGEN','A-Z',NULL),(103,'VERKAUF','A-Z',NULL),(104,'VERLUST','A-Z',NULL),(105,'VERSCHIEDENES','A-Z',NULL),(106,'VERSICHERUNGEN','A-Z',NULL),(107,'VERSTEIGERUNG','A-Z',NULL),(108,'VORHÄNGE','A-Z',NULL),(109,'WAFFEN','A-Z',NULL),(110,'WERKZEUG','A-Z',NULL),(111,'WOLLE','A-Z',NULL),(112,'ZEITSCHRIFTEN','A-Z',NULL),(113,'  Alles für das Wohnen','A-Z',NULL),(114,'ÖFEN UND HERDE','A-Z',NULL),(115,'MÖBEL','A-Z',NULL),(116,'TEPPICHE','A-Z',NULL),(117,'  Computer','A-Z',NULL),(118,'  Film - Foto - Funk','A-Z',NULL),(119,'FERNSEHEN','A-Z',NULL),(120,'FILM, FOTO','A-Z',NULL),(121,'FREIZEIT - HOBBY','A-Z',NULL),(122,'FUNK','A-Z',NULL),(123,'MOBILTELEFON','A-Z',NULL),(124,'VIDEO','A-Z',NULL),(125,'BERSIEDLUNG','Realitäten',NULL),(126,'BAUSTOFFE','Realitäten',NULL),(127,'BETEILIGUNGEN','Realitäten',NULL),(128,'EIG. WOHNUNG','Realitäten',NULL),(129,'EIGENTUMSWOHN. VERKAUF','Realitäten',NULL),(130,'EIGENTUMSWOHNG. KAUF','Realitäten',NULL),(131,'GESCHÄFTSLOKALE','Realitäten',NULL),(132,'GEWERBE-BÜRORÄUME','Realitäten',NULL),(133,'GEWERBL. REALITÄTEN','Realitäten',NULL),(134,'GRUNDKAUF','Realitäten',NULL),(135,'GRUNDSTÜCKE','Realitäten',NULL),(136,'GRUNDSTÜCKE VERKAUF','Realitäten',NULL),(137,'HÄUSER','Realitäten',NULL),(138,'HÄUSER KAUF','Realitäten',NULL),(139,'HÄUSER VERKAUF','Realitäten',NULL),(140,'HAUSBAU','Realitäten',NULL),(141,'IMMOBILIEN','Realitäten',NULL),(142,'KREDITVERMITTLUNG','Realitäten',NULL),(143,'MIETGESUCHE','Realitäten',NULL),(144,'PACHT','Realitäten',NULL),(145,'Real. TAUSCH','Realitäten',NULL),(146,'Real. VERKAUF','Realitäten',NULL),(147,'Realit?ten KAUF','Realitäten',NULL),(148,'VERMIETUNGEN','Realitäten',NULL),(149,'BÜRO- VERKAUFSPERS.','Stellenmarkt',NULL),(150,'FERIALJOBS','Stellenmarkt',NULL),(151,'GASTGEWERBE','Stellenmarkt',NULL),(152,'GASTGEWERBE','Stellenmarkt',NULL),(153,'OFFENE LEHRSTELLEN','Stellenmarkt',NULL),(154,'OFFENE LEHRSTELLEN','Stellenmarkt',NULL),(155,'PERSONENSUCHE','Stellenmarkt',NULL),(156,'STELLENANGEBOTE','Stellenmarkt',NULL),(157,'STELLENGESUCHE','Stellenmarkt',NULL),(158,'TEILZEIT','Stellenmarkt',NULL),(159,'TEILZEIT STELLENANGEB.','Stellenmarkt',NULL),(160,'ALFA ROMEO','Autobasar',NULL),(161,'ALLRAD','Autobasar',NULL),(162,'ANHÄNGER','Autobasar',NULL),(163,'ANKAUF (Auto)','Autobasar',NULL),(164,'AUDI','Autobasar',NULL),(165,'AUTOLACKE','Autobasar',NULL),(166,'AUTOMATIC','Autobasar',NULL),(167,'AUTOMATIC (Kfz)','Autobasar',NULL),(168,'AUTOPFLEGE','Autobasar',NULL),(169,'BILLIGES ECK','Autobasar',NULL),(170,'BMW','Autobasar',NULL),(171,'CABRIO','Autobasar',NULL),(172,'CHRYSLER','Autobasar',NULL),(173,'CITROEN','Autobasar',NULL),(174,'DAIHATSU','Autobasar',NULL),(175,'FIAT','Autobasar',NULL),(176,'FORD','Autobasar',NULL),(177,'GEBRAUCHTWAGEN','Autobasar',NULL),(178,'HONDA','Autobasar',NULL),(179,'HYUNDAI','Autobasar',NULL),(180,'JAGUAR','Autobasar',NULL),(181,'KIA','Autobasar',NULL),(182,'KRAFTFAHRZEUGE','Autobasar',NULL),(183,'LADA','Autobasar',NULL),(184,'LANCIA','Autobasar',NULL),(185,'LANDMASCHINEN','Autobasar',NULL),(186,'LEASING (Kfz)','Autobasar',NULL),(187,'LEIHWAGEN','Autobasar',NULL),(188,'MAZDA','Autobasar',NULL),(189,'MERCEDES','Autobasar',NULL),(190,'MITSUBISHI','Autobasar',NULL),(191,'NISSAN','Autobasar',NULL),(192,'NUTZFAHRZEUGE','Autobasar',NULL),(193,'OLDIES','Autobasar',NULL),(194,'OPEL','Autobasar',NULL),(195,'PEUGEOT','Autobasar',NULL),(196,'PORSCHE','Autobasar',NULL),(197,'REIFEN & FELGEN','Autobasar',NULL),(198,'RENAULT','Autobasar',NULL),(199,'REPARATUR (Kfz)','Autobasar',NULL),(200,'SAAB','Autobasar',NULL),(201,'SEAT','Autobasar',NULL),(202,'SKODA','Autobasar',NULL),(203,'SONSTIGE (Kfz)','Autobasar',NULL),(204,'SUBARU','Autobasar',NULL),(205,'SUZUKI','Autobasar',NULL),(206,'TALBOT','Autobasar',NULL),(207,'TOYOTA','Autobasar',NULL),(208,'UNFALLFAHRZEUGE','Autobasar',NULL),(209,'US-CARS','Autobasar',NULL),(210,'VOLKSWAGEN','Autobasar',NULL),(211,'VOLVO','Autobasar',NULL),(212,'ZUBEHÖR (Kfz)','Autobasar',NULL),(213,'APRILIA','Zweirad',NULL),(214,'BMW (Zweirad)','Zweirad',NULL),(215,'BOOTE','Zweirad',NULL),(216,'CAMPING','Zweirad',NULL),(217,'FAHRRÄDER','Zweirad',NULL),(218,'HARLEY DAVIDSON','Zweirad',NULL),(219,'HARLEY DAVIDSONS','Zweirad',NULL),(220,'HONDA (Zweirad)','Zweirad',NULL),(221,'KAWASAKI','Zweirad',NULL),(222,'KLEINMOTORRÄDER','Zweirad',NULL),(223,'KTM','Zweirad',NULL),(224,'MOPED','Zweirad',NULL),(225,'MOTORRÄDER','Zweirad',NULL),(226,'PUCH (Zweirad)','Zweirad',NULL),(227,'SUZUKI (Zweirad)','Zweirad',NULL),(228,'VESPA','Zweirad',NULL),(229,'YAMAHA','Zweirad',NULL),(230,'ZUBEHÖR (Zweirad)','Zweirad',NULL),(231,'Computer','A-Z','Pentium'),(232,'Computer','A-Z','486'),(233,'Computer','A-Z','386'),(234,'Computer','A-Z','MMX'),(235,'Computer','A-Z','MB'),(236,'Computer','A-Z','Mouse'),(237,'Computer','A-Z','Access'),(238,'Computer','A-Z','Nintendo'),(239,'Computer','A-Z','Spiele');

UNLOCK TABLES;

/*Table structure for table `impkundendaten` */

DROP TABLE IF EXISTS `impkundendaten`;

CREATE TABLE `impkundendaten` (
  `Nachname` varchar(255) NOT NULL,
  `Vorname` varchar(255) NOT NULL,
  `Kundengruppe` varchar(255) NOT NULL,
  `Anrede` varchar(255) DEFAULT NULL,
  `Titel` varchar(255) DEFAULT NULL,
  `Firma` varchar(255) DEFAULT NULL,
  `Anschrift` varchar(255) DEFAULT NULL,
  `PLZ` varchar(255) DEFAULT NULL,
  `Ort` varchar(255) DEFAULT NULL,
  `Land` varchar(255) DEFAULT NULL,
  `Telefon` varchar(255) DEFAULT NULL,
  `Fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `Web` varchar(255) DEFAULT NULL,
  `Preisliste` varchar(255) DEFAULT NULL,
  `UID-Nr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Nachname`,`Vorname`,`Kundengruppe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `impkundendaten` */

LOCK TABLES `impkundendaten` WRITE;

insert  into `impkundendaten`(`Nachname`,`Vorname`,`Kundengruppe`,`Anrede`,`Titel`,`Firma`,`Anschrift`,`PLZ`,`Ort`,`Land`,`Telefon`,`Fax`,`email`,`Web`,`Preisliste`,`UID-Nr`) values ('Musterfrau 2','Roman','Exportkunden Non-EU','Herr',NULL,NULL,'Topolova 2264/50','95501','Topolcany','Slowakei',NULL,NULL,NULL,NULL,NULL,NULL),('Mustermann 1','Fabian','Exportkunden Non-EU','Herr',NULL,NULL,'Luterstraáe 25','CH-3065','Bollingen','Schweiz',NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `lagerlagerbuchung` */

DROP TABLE IF EXISTS `lagerlagerbuchung`;

CREATE TABLE `lagerlagerbuchung` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Vorgangstyp` varchar(2) DEFAULT NULL,
  `Vorgangsnummer` int(10) DEFAULT NULL,
  `Datum` datetime DEFAULT NULL,
  `ArtNr` int(10) DEFAULT NULL,
  `Stk` double(15,5) DEFAULT NULL,
  `EKPreis` double(15,5) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `LagerOrt` int(10) DEFAULT NULL,
  `Einheiten` double DEFAULT NULL,
  `GewichtBrutto` double DEFAULT NULL,
  `GewichtNetto` double DEFAULT NULL,
  `GewichtTara` double DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`),
  KEY `Nummer` (`Vorgangstyp`),
  KEY `LieferantNr_2` (`LieferantNr`),
  KEY `LagerOrt` (`LagerOrt`),
  CONSTRAINT `lagerlagerbuchung_ibfk_1` FOREIGN KEY (`LieferantNr`) REFERENCES `lieferantenadressen` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `lagerlagerbuchung_ibfk_2` FOREIGN KEY (`LagerOrt`) REFERENCES `grartikel-lagerort` (`LagerNr`) ON UPDATE CASCADE,
  CONSTRAINT `lagerlagerbuchung_ibfk_3` FOREIGN KEY (`LieferantNr`) REFERENCES `lieferantenadressen` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `lagerlagerbuchung_ibfk_4` FOREIGN KEY (`LagerOrt`) REFERENCES `grartikel-lagerort` (`LagerNr`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `lagerlagerbuchung` */

LOCK TABLES `lagerlagerbuchung` WRITE;

insert  into `lagerlagerbuchung`(`Id`,`Vorgangstyp`,`Vorgangsnummer`,`Datum`,`ArtNr`,`Stk`,`EKPreis`,`LieferantNr`,`LagerOrt`,`Einheiten`,`GewichtBrutto`,`GewichtNetto`,`GewichtTara`) values (2,'LE',2009715,'2009-07-15 00:00:00',6,1.00000,19.50000,NULL,0,0,0,0,0),(3,'LE',2009715,'2009-07-15 00:00:00',2,1.00000,20.80000,NULL,0,0,0,0,0),(4,'LA',2009715,'2009-07-15 00:00:00',1000,1.00000,66.67000,NULL,0,0,0,0,0),(5,'LA',2009715,'2009-07-15 00:00:00',1004,1.00000,1320.00000,NULL,0,0,0,0,0),(6,'LE',2009715,'2009-07-15 00:00:00',3,1.00000,13.50000,NULL,NULL,0,0,0,0),(7,'LE',2009715,'2009-07-15 00:00:00',3,1.00000,13.50000,NULL,0,0,0,0,0),(8,'LE',2009715,'2009-07-15 00:00:00',4,1.00000,0.00000,NULL,NULL,0,0,0,0),(9,'LE',2009715,'2009-07-15 00:00:00',4,4.00000,0.00000,NULL,0,0,0,0,0);

UNLOCK TABLES;

/*Table structure for table `language` */

DROP TABLE IF EXISTS `language`;

CREATE TABLE `language` (
  `Code` varchar(3) NOT NULL DEFAULT 'DEU',
  `Language` varchar(45) NOT NULL DEFAULT 'Deutsch',
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `language` */

LOCK TABLES `language` WRITE;

insert  into `language`(`Code`,`Language`) values ('DEU','Deutsch'),('ENG','Englisch'),('RUS','Russisch');

UNLOCK TABLES;

/*Table structure for table `lieferantenadressen` */

DROP TABLE IF EXISTS `lieferantenadressen`;

CREATE TABLE `lieferantenadressen` (
  `IDNR` int(10) NOT NULL,
  `Rolle` varchar(50) DEFAULT NULL,
  `Land` int(10) DEFAULT NULL,
  `Branche` int(10) DEFAULT NULL,
  `Briefanrede` varchar(50) DEFAULT NULL,
  `Titel` varchar(50) DEFAULT NULL,
  `Anrede` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Vorname` varchar(45) DEFAULT NULL,
  `Name1` varchar(50) DEFAULT NULL,
  `Firma` varchar(255) DEFAULT NULL,
  `Adresse` varchar(100) DEFAULT NULL,
  `PLZ` varchar(20) DEFAULT NULL,
  `Ort` varchar(50) DEFAULT NULL,
  `Tel` varchar(50) DEFAULT NULL,
  `Tel2` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `Fax2` varchar(50) DEFAULT NULL,
  `Mobil` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Web` varchar(50) DEFAULT NULL,
  `AngelegtAn` datetime DEFAULT NULL,
  `MAAusen` int(10) DEFAULT NULL,
  `MAInnen` int(10) DEFAULT NULL,
  `Abbuchung` tinyint(1) DEFAULT NULL,
  `Picture` varchar(255) DEFAULT NULL,
  `UID` varchar(50) DEFAULT NULL,
  `SkypeAdresse` varchar(45) DEFAULT NULL,
  `MessengerAdresse` varchar(45) DEFAULT NULL,
  `Geburtstag` datetime DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `EUNummer` varchar(100) DEFAULT NULL,
  `EUNummer1` varchar(100) DEFAULT NULL,
  `EUNummer2` varchar(100) DEFAULT NULL,
  `BHReferenz` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDNR`),
  KEY `Firma` (`Firma`),
  KEY `keyField` (`IDNR`),
  KEY `Mobil` (`Mobil`),
  KEY `ofAdressenAnrede` (`Anrede`),
  KEY `ofAdressenBriefanrede` (`Briefanrede`),
  KEY `PLZ` (`PLZ`),
  KEY `Tel` (`Tel`),
  KEY `Tel2` (`Tel2`),
  KEY `UID` (`UID`),
  KEY `Land` (`Land`),
  CONSTRAINT `lieferantenadressen_ibfk_1` FOREIGN KEY (`Land`) REFERENCES `grland` (`IdNr`) ON UPDATE CASCADE,
  CONSTRAINT `lieferantenadressen_ibfk_2` FOREIGN KEY (`PLZ`) REFERENCES `grplz` (`IdNr`) ON UPDATE CASCADE,
  CONSTRAINT `lieferantenadressen_ibfk_3` FOREIGN KEY (`Land`) REFERENCES `grland` (`IdNr`) ON UPDATE CASCADE,
  CONSTRAINT `lieferantenadressen_ibfk_4` FOREIGN KEY (`PLZ`) REFERENCES `grplz` (`IdNr`) ON UPDATE CASCADE,
  CONSTRAINT `lieferantenadressen_ibfk_5` FOREIGN KEY (`Land`) REFERENCES `grland` (`IdNr`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lieferantenadressen` */

LOCK TABLES `lieferantenadressen` WRITE;

insert  into `lieferantenadressen`(`IDNR`,`Rolle`,`Land`,`Branche`,`Briefanrede`,`Titel`,`Anrede`,`Name`,`Vorname`,`Name1`,`Firma`,`Adresse`,`PLZ`,`Ort`,`Tel`,`Tel2`,`Fax`,`Fax2`,`Mobil`,`Email`,`Web`,`AngelegtAn`,`MAAusen`,`MAInnen`,`Abbuchung`,`Picture`,`UID`,`SkypeAdresse`,`MessengerAdresse`,`Geburtstag`,`Status`,`EUNummer`,`EUNummer1`,`EUNummer2`,`BHReferenz`) values (0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,'Hersteller',43,0,NULL,NULL,NULL,'ARFAIAN',NULL,'ARFAIAN','inkl. Mwst + ggf. zzgl. Versandkosten','ARFAIAN',NULL,'-',NULL,NULL,NULL,NULL,NULL,'p','http://www.arfaian.com','2004-07-13 00:00:00',0,0,-1,NULL,NULL,NULL,NULL,NULL,NULL,'-','-','-',NULL);

UNLOCK TABLES;

/*Table structure for table `lieferantenanrufe` */

DROP TABLE IF EXISTS `lieferantenanrufe`;

CREATE TABLE `lieferantenanrufe` (
  `AnrufNr` int(10) NOT NULL AUTO_INCREMENT,
  `AdrNr` int(10) DEFAULT NULL,
  `LAenderung` datetime DEFAULT NULL,
  `LKontakt` datetime DEFAULT NULL,
  `NAnruf` varchar(50) DEFAULT NULL,
  `Notizen` longtext,
  `MitarbeiterNr` int(10) DEFAULT NULL,
  `BeginZeit` datetime DEFAULT NULL,
  `EndeZeit` datetime DEFAULT NULL,
  `Verrechnung` tinyint(1) NOT NULL,
  PRIMARY KEY (`AnrufNr`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `lieferantenanrufe` */

LOCK TABLES `lieferantenanrufe` WRITE;

insert  into `lieferantenanrufe`(`AnrufNr`,`AdrNr`,`LAenderung`,`LKontakt`,`NAnruf`,`Notizen`,`MitarbeiterNr`,`BeginZeit`,`EndeZeit`,`Verrechnung`) values (1,3,'2002-09-27 00:00:00','2002-09-27 00:00:00',NULL,'kkkk',0,'2002-09-27 00:50:58','2002-09-27 00:51:01',0),(2,195,NULL,NULL,NULL,'Schlachthof, Zerlege\r\nVerarbeitungbetrieb\r\n100-130Tonen/Tag',NULL,NULL,NULL,0),(3,333102,NULL,NULL,NULL,'Liefern nur an Naturkostläden in Deutschland\r\nKleine Mengen nach Holland, Belgien, Spanien, CZ (€5000-7000/Monat), Finland\r\n60 - 70% der Erzeugung aus Eigener Tierhaltung\r\nBio Land Zertifiziert',NULL,'2007-04-18 12:24:34','2007-04-18 12:24:41',0),(4,333166,NULL,NULL,NULL,'Rind, Lamm, Schein (eher nicht bis gar nicht)',NULL,'2007-05-02 11:27:58','2007-05-02 11:28:18',0),(5,333166,NULL,NULL,NULL,'Rind, Lamm, Schwein (eher wenig bis gar nicht)',NULL,'2007-05-02 11:28:37',NULL,0),(6,333166,NULL,NULL,NULL,'fff',NULL,'2007-05-02 11:29:26',NULL,0),(7,333167,NULL,NULL,NULL,'Keine Schweine verfügbar. Preisidee € 3,-/kg (Hälften)',NULL,NULL,NULL,0),(8,333168,NULL,NULL,NULL,'Rind, Lamm !!! ,',NULL,NULL,NULL,0),(9,0,NULL,NULL,NULL,'asdfasdfa',NULL,'2007-05-10 12:06:42','2007-05-10 12:06:45',0),(10,333198,NULL,NULL,NULL,'LIEFERANTEN VON FRANCEXPORT ÜBER DELCO - ( KAUFT VON IHM SPARE RIBS FÜR ENGLAND)',NULL,NULL,NULL,0),(11,333209,NULL,NULL,NULL,'BIO PUTEN. Gehört zu Puten Fahrenzhausen (D)',NULL,NULL,NULL,0),(12,333110,NULL,NULL,NULL,'SCHWIRIGER TYP (IDIOT)',NULL,NULL,NULL,0),(13,0,NULL,NULL,NULL,'änmjlbhklöghuklglukgklhglkuhulkhklhuklhkluhu',NULL,'2007-10-18 14:28:35',NULL,0),(14,0,NULL,NULL,NULL,'afseasdfasdf',NULL,'2007-10-18 14:30:32','2007-10-18 14:30:38',0),(15,333143,NULL,NULL,NULL,'test',NULL,NULL,NULL,0),(16,333414,NULL,NULL,NULL,'hat im Oktober die firma LAVAMEAT gekauft um seine exporte nach russland weiterführen zu können.',NULL,NULL,NULL,0),(17,333303,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(18,333062,NULL,NULL,NULL,'Franziska Stolle GmbH & Co. KG \r\nAm Brenzer Kanal 2\r\n19306 Brenz',NULL,NULL,NULL,0);

UNLOCK TABLES;

/*Table structure for table `lieferantenartikel-preise` */

DROP TABLE IF EXISTS `lieferantenartikel-preise`;

CREATE TABLE `lieferantenartikel-preise` (
  `PreisId` int(10) NOT NULL AUTO_INCREMENT,
  `LieferantNr` int(10) DEFAULT NULL,
  `ArtikelNr` int(10) DEFAULT NULL,
  `ArtikelNrLieferant` varchar(50) DEFAULT NULL,
  `EKPreis` decimal(19,4) DEFAULT NULL,
  `VKPreis` decimal(19,4) DEFAULT NULL,
  `Rabatt` varchar(50) DEFAULT NULL,
  `PreisDatum` datetime DEFAULT NULL,
  `Bezeichnung` varchar(255) DEFAULT NULL,
  `Lagerinfo` varchar(50) DEFAULT NULL,
  `Bestellmenge` double(15,5) DEFAULT NULL,
  `Kategorie` varchar(255) DEFAULT NULL,
  `Prioritaet` int(10) DEFAULT NULL,
  `EAN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PreisId`),
  UNIQUE KEY `MyTableConstraint` (`LieferantNr`,`ArtikelNr`),
  KEY `grArtikellieferantenArtikel-Preise` (`ArtikelNr`),
  KEY `lieferantenAdressenlieferantenArtikel-Preise` (`LieferantNr`),
  KEY `PreisId` (`PreisId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lieferantenartikel-preise` */

LOCK TABLES `lieferantenartikel-preise` WRITE;

UNLOCK TABLES;

/*Table structure for table `lieferantenbanken` */

DROP TABLE IF EXISTS `lieferantenbanken`;

CREATE TABLE `lieferantenbanken` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `KundenNR` int(10) DEFAULT NULL,
  `Bank1` int(10) DEFAULT NULL,
  `Konto1` varchar(11) DEFAULT NULL,
  `Währung` varchar(50) DEFAULT NULL,
  `ELBA` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `lieferantenbanken` */

LOCK TABLES `lieferantenbanken` WRITE;

insert  into `lieferantenbanken`(`ID`,`KundenNR`,`Bank1`,`Konto1`,`Währung`,`ELBA`) values (1,1,34000,'3232234234',NULL,0),(2,0,NULL,'test',NULL,-1);

UNLOCK TABLES;

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `DATUM` datetime DEFAULT NULL,
  `PATH_TRANSLATED` varchar(200) DEFAULT NULL,
  `REMOTE_ADDR` varchar(100) DEFAULT NULL,
  `REMOTE_HOST` varchar(100) DEFAULT NULL,
  `REMOTE_USER` varchar(100) DEFAULT NULL,
  `HTTP_REFERER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

LOCK TABLES `login` WRITE;

insert  into `login`(`Id`,`DATUM`,`PATH_TRANSLATED`,`REMOTE_ADDR`,`REMOTE_HOST`,`REMOTE_USER`,`HTTP_REFERER`) values (35,'2004-01-26 21:50:43','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(36,'2004-01-26 21:51:22','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(37,'2004-01-26 21:52:21','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(38,'2004-01-26 21:52:45','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(39,'2004-01-26 21:53:11','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(40,'2004-01-26 21:53:12','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(41,'2004-01-26 21:53:12','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(42,'2004-01-26 21:53:12','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(43,'2004-01-26 21:53:12','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(44,'2004-01-26 21:53:13','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(45,'2004-01-26 21:53:13','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(46,'2004-01-26 21:53:13','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(47,'2004-01-26 21:53:13','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(48,'2004-01-26 21:53:13','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(49,'2004-01-26 21:53:14','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(50,'2004-01-26 21:53:14','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(51,'2004-01-26 21:53:21','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/buyFromMerchant.asp?LieferantNr=3&ArtNr=1001&ArtikelNrLieferant=123123'),(53,'2004-01-26 21:53:52','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(54,'2004-01-26 21:54:12','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(55,'2004-01-26 21:55:33','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(56,'2004-01-26 21:55:34','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(57,'2004-01-26 21:55:43','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(58,'2004-01-26 21:57:15','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(59,'2004-01-26 21:59:31','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(60,'2004-01-26 22:00:08','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(61,'2004-01-26 22:01:32','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(62,'2004-01-26 22:01:42','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(63,'2004-01-26 22:02:47','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(64,'2004-01-26 22:04:21','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(65,'2004-01-26 22:04:47','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(66,'2004-01-26 22:05:12','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(67,'2004-01-26 22:06:38','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(68,'2004-01-26 22:08:51','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(69,'2004-01-26 22:09:47','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(70,'2004-01-26 22:10:42','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(71,'2004-01-26 22:12:06','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(72,'2004-01-26 22:12:55','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor',''),(73,'2004-01-26 22:13:55','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/WebShop/cgi/priceCompare/merchantPage.asp?merchantId=3'),(74,'2004-02-01 23:42:47','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/webshop/default.asp?ArtNr=1017'),(75,'2004-02-01 23:43:27','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/webshop/default.asp?ArtNr=1017'),(76,'2004-02-01 23:43:50','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/webshop/default.asp?ArtNr=1017'),(77,'2004-02-01 23:44:20','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/webshop/default.asp?ArtNr=1017'),(78,'2004-02-01 23:44:37','merchantPage.asp?merchantId=3&MERCHANT_HOME=','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/webshop/cgi/priceCompare/merchantPage.asp?merchantId=3'),(79,'2004-02-01 23:46:52','merchantPage.asp?merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/webshop/default.asp?ArtNr=1017'),(80,'2004-02-01 23:49:51','merchantPage.asp?MERCHANT_HOME=&merchantId=3','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/webshop/default.asp?ArtNr=1001'),(81,'2004-02-06 23:42:34','merchantPage.asp?merchantId=6','127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/webshop/default.asp?ArtNr=1017');

UNLOCK TABLES;

/*Table structure for table `mailstosend` */

DROP TABLE IF EXISTS `mailstosend`;

CREATE TABLE `mailstosend` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Recipient` varchar(255) DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `MailText` longtext,
  `from_email` varchar(255) DEFAULT NULL,
  `Priority` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mailstosend` */

LOCK TABLES `mailstosend` WRITE;

UNLOCK TABLES;

/*Table structure for table `ofadressen` */

DROP TABLE IF EXISTS `ofadressen`;

CREATE TABLE `ofadressen` (
  `IDNR` int(10) NOT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `Branche` int(10) DEFAULT NULL,
  `Briefanrede` varchar(50) DEFAULT NULL,
  `Titel` varchar(50) DEFAULT NULL,
  `Anrede` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Vorname` varchar(50) DEFAULT NULL,
  `Name1` varchar(50) DEFAULT NULL,
  `Firma` varchar(255) DEFAULT NULL,
  `Adresse` varchar(100) DEFAULT NULL,
  `Land` int(10) DEFAULT NULL,
  `PLZ` varchar(20) DEFAULT NULL,
  `Ort` varchar(50) DEFAULT NULL,
  `Tel` varchar(50) DEFAULT NULL,
  `Tel2` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `Fax2` varchar(50) DEFAULT NULL,
  `Mobil` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Web` varchar(50) DEFAULT NULL,
  `Export` tinyint(1) DEFAULT NULL,
  `AngelegtAn` datetime DEFAULT NULL,
  `MAAusen` int(10) DEFAULT NULL,
  `MAInnen` int(10) DEFAULT NULL,
  `Abbuchung` tinyint(1) DEFAULT NULL,
  `hasMenu` tinyint(1) DEFAULT NULL,
  `Passwort` varchar(50) DEFAULT NULL,
  `nextIDNR` int(10) DEFAULT NULL,
  `mandant` smallint(5) DEFAULT NULL,
  `Geburtstag` datetime DEFAULT NULL,
  `UID` varchar(50) DEFAULT NULL,
  `SkypeAdresse` varchar(45) DEFAULT NULL,
  `MessengerAdresse` varchar(45) DEFAULT NULL,
  `EUNummer` varchar(20) DEFAULT NULL,
  `EUNummer1` varchar(100) DEFAULT NULL,
  `EUNummer2` varchar(100) DEFAULT NULL,
  `BHReferenz` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDNR`),
  KEY `grBranchenofAdressen` (`Branche`),
  KEY `IDNR` (`IDNR`),
  KEY `Mobil` (`Mobil`),
  KEY `ofAdressenAnrede` (`Anrede`),
  KEY `ofAdressenBriefanrede` (`Briefanrede`),
  KEY `ofAdressenMAAusen` (`MAAusen`),
  KEY `PLZ` (`PLZ`),
  KEY `Tel` (`Tel`),
  KEY `Tel2` (`Tel2`),
  KEY `UID` (`UID`),
  KEY `Land` (`Land`),
  CONSTRAINT `ofadressen_ibfk_1` FOREIGN KEY (`Land`) REFERENCES `grland` (`IdNr`) ON UPDATE CASCADE,
  CONSTRAINT `ofadressen_ibfk_2` FOREIGN KEY (`PLZ`) REFERENCES `grplz` (`IdNr`) ON UPDATE CASCADE,
  CONSTRAINT `ofadressen_ibfk_3` FOREIGN KEY (`Land`) REFERENCES `grland` (`IdNr`) ON UPDATE CASCADE,
  CONSTRAINT `ofadressen_ibfk_4` FOREIGN KEY (`PLZ`) REFERENCES `grplz` (`IdNr`) ON UPDATE CASCADE,
  CONSTRAINT `ofadressen_ibfk_5` FOREIGN KEY (`Land`) REFERENCES `grland` (`IdNr`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ofadressen` */

LOCK TABLES `ofadressen` WRITE;

insert  into `ofadressen`(`IDNR`,`Status`,`Branche`,`Briefanrede`,`Titel`,`Anrede`,`Name`,`Vorname`,`Name1`,`Firma`,`Adresse`,`Land`,`PLZ`,`Ort`,`Tel`,`Tel2`,`Fax`,`Fax2`,`Mobil`,`Email`,`Web`,`Export`,`AngelegtAn`,`MAAusen`,`MAInnen`,`Abbuchung`,`hasMenu`,`Passwort`,`nextIDNR`,`mandant`,`Geburtstag`,`UID`,`SkypeAdresse`,`MessengerAdresse`,`EUNummer`,`EUNummer1`,`EUNummer2`,`BHReferenz`) values (0,'Kunde',NULL,'Herr',NULL,'Herr','***nicht löschen**',NULL,NULL,'MUSTER','***nicht löschen***',43,'A-4040',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,0,'2009-06-22 10:45:18',0,2,-1,0,'test',0,0,NULL,'DE999999999',NULL,NULL,NULL,NULL,NULL,NULL),(1,'Kunde',0,'Herr',NULL,NULL,'Tonkov','Grigor',NULL,'GRITON EU','Hauserstr. 12',43,'A-4040',NULL,'0676-6063036',NULL,NULL,'',NULL,'grigor.tonkov@gmx.at','x',0,'2009-05-22 19:21:27',0,0,-1,0,'test',2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `ofadressen-bonuspunkte` */

DROP TABLE IF EXISTS `ofadressen-bonuspunkte`;

CREATE TABLE `ofadressen-bonuspunkte` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Datum` datetime DEFAULT NULL,
  `IDNR` int(10) DEFAULT NULL,
  `Eingang` int(10) DEFAULT NULL,
  `Ausgang` int(10) DEFAULT NULL,
  `PreisEingang` decimal(19,4) DEFAULT NULL,
  `PreisAusgang` decimal(19,4) DEFAULT NULL,
  `Bemerkung` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;

/*Data for the table `ofadressen-bonuspunkte` */

LOCK TABLES `ofadressen-bonuspunkte` WRITE;

insert  into `ofadressen-bonuspunkte`(`Id`,`Datum`,`IDNR`,`Eingang`,`Ausgang`,`PreisEingang`,`PreisAusgang`,`Bemerkung`) values (112,NULL,1,20,NULL,NULL,NULL,'Order, Order# 2009080091'),(114,NULL,1,20,NULL,NULL,NULL,'Order, Order# 2009080097'),(115,NULL,1,20,NULL,NULL,NULL,'Order, Order# 2009080098'),(116,NULL,1,20,NULL,NULL,NULL,'Order, Order# 2009080100'),(117,NULL,1,20,NULL,NULL,NULL,'Order, Order# 2009080102'),(118,NULL,1,20,NULL,NULL,NULL,'Order, Order# 2009080103'),(119,NULL,1,20,NULL,NULL,NULL,'Order, Order# 2009080060'),(120,NULL,1,20,NULL,NULL,NULL,'Order, Order# 2009080062'),(127,NULL,1,20,NULL,NULL,NULL,'Order, Order# 2009080070'),(128,NULL,1,20,NULL,NULL,NULL,'Order, Order# 2009090003'),(129,NULL,1,20,NULL,NULL,NULL,'Order, Order# 20099000'),(130,NULL,1,20,NULL,NULL,NULL,'Order, Order# 20099001'),(131,NULL,1,20,NULL,NULL,NULL,'Order, Order# 20099002'),(132,NULL,1,20,NULL,NULL,NULL,'Order, Order# 20099003'),(133,NULL,1,20,NULL,NULL,NULL,'Order, Order# 20099004'),(134,NULL,1,20,NULL,NULL,NULL,'Order, Order# 2009090006'),(135,NULL,1,20,NULL,NULL,NULL,'Order, Order# 2009090007'),(136,NULL,1,20,NULL,NULL,NULL,'Order, Order# 2009090008');

UNLOCK TABLES;

/*Table structure for table `ofadressen-kundengruppen` */

DROP TABLE IF EXISTS `ofadressen-kundengruppen`;

CREATE TABLE `ofadressen-kundengruppen` (
  `KGR` int(10) NOT NULL AUTO_INCREMENT,
  `Gruppe` varchar(50) DEFAULT NULL,
  `KundenNrKreisVon` int(10) DEFAULT NULL,
  `KundenNrKreisBis` int(10) DEFAULT NULL,
  `VorgangNrKreisVon` int(10) DEFAULT NULL,
  `VorgangNrKreisBis` int(10) DEFAULT NULL,
  `RechungenMitMWST` tinyint(1) NOT NULL,
  PRIMARY KEY (`KGR`),
  UNIQUE KEY `Gruppe` (`Gruppe`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `ofadressen-kundengruppen` */

LOCK TABLES `ofadressen-kundengruppen` WRITE;

insert  into `ofadressen-kundengruppen`(`KGR`,`Gruppe`,`KundenNrKreisVon`,`KundenNrKreisBis`,`VorgangNrKreisVon`,`VorgangNrKreisBis`,`RechungenMitMWST`) values (1,'Inland',201000,209999,705001,709999,-1),(2,'Ausland',210000,219999,705001,709999,0),(3,'EU',220000,229999,705001,709999,0),(4,'Barverkauf',0,1,2009090001,2009099999,-1),(5,'Online',300000,309999,20099000,20099999,-1);

UNLOCK TABLES;

/*Table structure for table `ofadressen-selection1` */

DROP TABLE IF EXISTS `ofadressen-selection1`;

CREATE TABLE `ofadressen-selection1` (
  `IdNr` int(10) NOT NULL,
  `Selection` varchar(50) NOT NULL,
  PRIMARY KEY (`IdNr`,`Selection`),
  KEY `IdNr` (`IdNr`),
  KEY `ofAdressenofAdressen-Selection1` (`IdNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ofadressen-selection1` */

LOCK TABLES `ofadressen-selection1` WRITE;

insert  into `ofadressen-selection1`(`IdNr`,`Selection`) values (0,'Chicken'),(0,'Inland'),(0,'Opel Händler'),(0,'VW Händler'),(1,'Ausland'),(1,'Opel Händler');

UNLOCK TABLES;

/*Table structure for table `ofadressen-selection2` */

DROP TABLE IF EXISTS `ofadressen-selection2`;

CREATE TABLE `ofadressen-selection2` (
  `IdNr` int(10) NOT NULL,
  `Selection` varchar(50) NOT NULL,
  PRIMARY KEY (`IdNr`,`Selection`),
  KEY `IdNr` (`IdNr`),
  KEY `ofAdressenofAdressen-Selection2` (`IdNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ofadressen-selection2` */

LOCK TABLES `ofadressen-selection2` WRITE;

insert  into `ofadressen-selection2`(`IdNr`,`Selection`) values (0,'Grossbetrieb'),(0,'Hersteller'),(0,'Produzent'),(2,'Hersteller'),(2,'KMU'),(26,'Produzent'),(26,'Vermittler'),(252,'Grossbetrieb'),(210004,'Händler'),(210017,'fleisch'),(220199,'Händler'),(333089,'Produzent'),(333122,'Produzent'),(333173,'Händler');

UNLOCK TABLES;

/*Table structure for table `ofadressen-seriendruck` */

DROP TABLE IF EXISTS `ofadressen-seriendruck`;

CREATE TABLE `ofadressen-seriendruck` (
  `IDNR` int(10) NOT NULL,
  `Land` int(10) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `Branche` int(10) DEFAULT NULL,
  `Briefanrede` varchar(50) DEFAULT NULL,
  `Titel` varchar(50) DEFAULT NULL,
  `Anrede` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Name1` varchar(50) DEFAULT NULL,
  `Firma` varchar(100) DEFAULT NULL,
  `Adresse` varchar(100) DEFAULT NULL,
  `Ort` varchar(50) DEFAULT NULL,
  `PLZ` int(10) DEFAULT NULL,
  `Tel` varchar(50) DEFAULT NULL,
  `Tel2` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `Fax2` varchar(50) DEFAULT NULL,
  `Mobil` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Web` varchar(50) DEFAULT NULL,
  `Export` tinyint(1) NOT NULL,
  `AngelegtAn` datetime DEFAULT NULL,
  `MAAusen` int(10) DEFAULT NULL,
  `MAInnen` int(10) DEFAULT NULL,
  `Abbuchung` tinyint(1) NOT NULL,
  `hasMenu` tinyint(1) NOT NULL,
  PRIMARY KEY (`IDNR`),
  KEY `IDNR` (`IDNR`),
  KEY `Mobil` (`Mobil`),
  KEY `ofAdressenAnrede` (`Anrede`),
  KEY `ofAdressenBriefanrede` (`Briefanrede`),
  KEY `ofAdressenMAAusen` (`MAAusen`),
  KEY `PLZ` (`PLZ`),
  KEY `Tel` (`Tel`),
  KEY `Tel2` (`Tel2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ofadressen-seriendruck` */

LOCK TABLES `ofadressen-seriendruck` WRITE;

UNLOCK TABLES;

/*Table structure for table `ofadressen-settings` */

DROP TABLE IF EXISTS `ofadressen-settings`;

CREATE TABLE `ofadressen-settings` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `IDNR` int(10) DEFAULT NULL,
  `Kundengruppe` varchar(50) DEFAULT NULL,
  `Preisliste` varchar(50) DEFAULT NULL,
  `language_code` varchar(3) DEFAULT 'DEU',
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`),
  KEY `IDNR` (`IDNR`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `ofadressen-settings` */

LOCK TABLES `ofadressen-settings` WRITE;

insert  into `ofadressen-settings`(`Id`,`IDNR`,`Kundengruppe`,`Preisliste`,`language_code`) values (1,0,'Online Kunden','1-Letztverbraucher','DEU'),(4,1,'Online Kunden','1-Letztverbraucher','DEU');

UNLOCK TABLES;

/*Table structure for table `ofadressen-transportmethoden` */

DROP TABLE IF EXISTS `ofadressen-transportmethoden`;

CREATE TABLE `ofadressen-transportmethoden` (
  `IdNr` int(10) NOT NULL DEFAULT '0',
  `Methode` varchar(50) NOT NULL,
  `Standart` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdNr`,`Methode`),
  KEY `IdNr` (`IdNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ofadressen-transportmethoden` */

LOCK TABLES `ofadressen-transportmethoden` WRITE;

insert  into `ofadressen-transportmethoden`(`IdNr`,`Methode`,`Standart`) values (0,'DANZAS',0),(0,'DHL',0),(0,'EIGENE ABHOLUNG',0),(0,'POST',0),(1,'DHL',0),(1,'test',0);

UNLOCK TABLES;

/*Table structure for table `ofadressen-weitere` */

DROP TABLE IF EXISTS `ofadressen-weitere`;

CREATE TABLE `ofadressen-weitere` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Anrede` varchar(50) DEFAULT NULL,
  `Typ` varchar(50) DEFAULT NULL,
  `Branche` int(10) DEFAULT NULL,
  `IDNR` int(10) DEFAULT NULL,
  `Land` int(10) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Vorname` varchar(50) DEFAULT NULL,
  `Name1` varchar(50) DEFAULT NULL,
  `Firma` varchar(100) DEFAULT NULL,
  `Adresse` varchar(100) DEFAULT NULL,
  `PLZ` varchar(20) DEFAULT NULL,
  `Ort` varchar(50) DEFAULT NULL,
  `Tel` varchar(50) DEFAULT NULL,
  `Tel2` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `Mobil` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Web` varchar(50) DEFAULT NULL,
  `AngelegtAn` datetime DEFAULT NULL,
  `Passwort` varchar(50) DEFAULT NULL,
  `Geburtstag` datetime DEFAULT NULL,
  `UID` varchar(50) DEFAULT NULL,
  `EUNummer` varchar(20) DEFAULT NULL,
  `EUNummer1` varchar(100) DEFAULT NULL,
  `EUNummer2` varchar(100) DEFAULT NULL,
  `Titel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Anrede` (`Anrede`),
  KEY `ID` (`ID`),
  KEY `IDNR` (`IDNR`),
  KEY `Mobil` (`Mobil`),
  KEY `ofAdressenofAdressen-Weitere` (`IDNR`),
  KEY `PLZ` (`PLZ`),
  KEY `Tel` (`Tel`),
  KEY `Tel1` (`Tel2`),
  KEY `UID` (`UID`),
  KEY `Land` (`Land`),
  CONSTRAINT `ofadressen-weitere_ibfk_1` FOREIGN KEY (`Land`) REFERENCES `grland` (`IdNr`) ON UPDATE CASCADE,
  CONSTRAINT `ofadressen-weitere_ibfk_2` FOREIGN KEY (`PLZ`) REFERENCES `grplz` (`IdNr`) ON UPDATE CASCADE,
  CONSTRAINT `ofadressen-weitere_ibfk_3` FOREIGN KEY (`Land`) REFERENCES `grland` (`IdNr`) ON UPDATE CASCADE,
  CONSTRAINT `ofadressen-weitere_ibfk_4` FOREIGN KEY (`PLZ`) REFERENCES `grplz` (`IdNr`) ON UPDATE CASCADE,
  CONSTRAINT `ofadressen-weitere_ibfk_5` FOREIGN KEY (`Land`) REFERENCES `grland` (`IdNr`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2104 DEFAULT CHARSET=latin1;

/*Data for the table `ofadressen-weitere` */

LOCK TABLES `ofadressen-weitere` WRITE;

insert  into `ofadressen-weitere`(`ID`,`Anrede`,`Typ`,`Branche`,`IDNR`,`Land`,`Name`,`Vorname`,`Name1`,`Firma`,`Adresse`,`PLZ`,`Ort`,`Tel`,`Tel2`,`Fax`,`Mobil`,`Email`,`Web`,`AngelegtAn`,`Passwort`,`Geburtstag`,`UID`,`EUNummer`,`EUNummer1`,`EUNummer2`,`Titel`) values (2101,NULL,'LI',NULL,0,43,NULL,NULL,NULL,'Lieferfirma I','Lieferstr. 1','A-4040',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2102,NULL,'LI',NULL,0,43,NULL,NULL,NULL,'Lieferfirma II','Lieferfirmastr.  I','A-1010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2103,NULL,'AR',NULL,0,2,NULL,NULL,NULL,'Test',NULL,'-555555',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `ofadressen-zahlungsbedingungen` */

DROP TABLE IF EXISTS `ofadressen-zahlungsbedingungen`;

CREATE TABLE `ofadressen-zahlungsbedingungen` (
  `IdNr` int(10) NOT NULL DEFAULT '0',
  `Bedingung` int(10) NOT NULL,
  `Standart` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdNr`,`Bedingung`),
  KEY `grZahlungsbedingungofAdressen-Zahlungsbedingungen` (`Bedingung`),
  KEY `IdNr` (`IdNr`),
  KEY `ofAdressenofAdressen-Zahlungsbedingungen` (`IdNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ofadressen-zahlungsbedingungen` */

LOCK TABLES `ofadressen-zahlungsbedingungen` WRITE;

insert  into `ofadressen-zahlungsbedingungen`(`IdNr`,`Bedingung`,`Standart`) values (0,2,0),(0,3,-1),(0,4,0),(0,5,0),(0,6,0),(0,7,0),(1,5,0),(1,6,0),(1,9,0);

UNLOCK TABLES;

/*Table structure for table `ofadressen-zahlungsmethoden` */

DROP TABLE IF EXISTS `ofadressen-zahlungsmethoden`;

CREATE TABLE `ofadressen-zahlungsmethoden` (
  `IdNr` int(10) NOT NULL DEFAULT '0',
  `Methode` varchar(50) NOT NULL,
  `Standart` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdNr`,`Methode`),
  KEY `grZahlungsmethodeofAdressen-Zahlungsmethoden` (`Methode`),
  KEY `IdNr` (`IdNr`),
  KEY `ofAdressenofAdressen-Zahlungsmethoden` (`IdNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ofadressen-zahlungsmethoden` */

LOCK TABLES `ofadressen-zahlungsmethoden` WRITE;

insert  into `ofadressen-zahlungsmethoden`(`IdNr`,`Methode`,`Standart`) values (0,'American Express',0),(0,'Dankend erhalten!',0),(0,'Diners',0),(0,'Master Card',0),(0,'SPARKASSE O.Ö., BLZ 20320, Konto Nr. 168 0000 5778',0),(0,'SPARKASSE PASSAU, BLZ 74050000, Konto Nr.8.794.661',0),(0,'xx',0);

UNLOCK TABLES;

/*Table structure for table `ofadressenbanken` */

DROP TABLE IF EXISTS `ofadressenbanken`;

CREATE TABLE `ofadressenbanken` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `KundenNR` int(10) DEFAULT NULL,
  `Bank1` int(10) DEFAULT NULL,
  `Konto1` varchar(11) DEFAULT NULL,
  `Währung` varchar(50) DEFAULT NULL,
  `ELBA` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ofAdressenofAdressenBanken2` (`KundenNR`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `ofadressenbanken` */

LOCK TABLES `ofadressenbanken` WRITE;

insert  into `ofadressenbanken`(`ID`,`KundenNR`,`Bank1`,`Konto1`,`Währung`,`ELBA`) values (2,0,34000,'1234567889','EUR',-1),(3,1,10000,'1234565555','EUR',0),(4,5001,10000,'123123123',NULL,0),(5,2,21000,'12312312312',NULL,0);

UNLOCK TABLES;

/*Table structure for table `ofanrufe` */

DROP TABLE IF EXISTS `ofanrufe`;

CREATE TABLE `ofanrufe` (
  `AnrufNr` int(10) NOT NULL AUTO_INCREMENT,
  `AdrNr` int(10) DEFAULT NULL,
  `LAenderung` datetime DEFAULT NULL,
  `LKontakt` datetime DEFAULT NULL,
  `NAnruf` varchar(50) DEFAULT NULL,
  `Notizen` longtext,
  `MitarbeiterNr` int(10) DEFAULT NULL,
  `BeginZeit` datetime DEFAULT NULL,
  `EndeZeit` datetime DEFAULT NULL,
  `Verrechnung` tinyint(1) NOT NULL,
  PRIMARY KEY (`AnrufNr`),
  KEY `ofAdressenofAnrufe` (`AdrNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ofanrufe` */

LOCK TABLES `ofanrufe` WRITE;

UNLOCK TABLES;

/*Table structure for table `ofasppartner` */

DROP TABLE IF EXISTS `ofasppartner`;

CREATE TABLE `ofasppartner` (
  `IdNR` int(10) NOT NULL AUTO_INCREMENT,
  `LieferantNr` int(10) DEFAULT NULL,
  `KundenNr` int(10) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  `Anrede` varchar(20) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Vorname` varchar(50) DEFAULT NULL,
  `Geschlecht` varchar(1) DEFAULT NULL,
  `Adresse` varchar(50) DEFAULT NULL,
  `Land` int(10) DEFAULT NULL,
  `PLZ` varchar(10) DEFAULT NULL,
  `Ort` varchar(50) DEFAULT NULL,
  `TelPrivat` varchar(50) DEFAULT NULL,
  `TelFirma` varchar(50) DEFAULT NULL,
  `FaxFirma` varchar(50) DEFAULT NULL,
  `Mobil` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdNR`),
  KEY `IdNR1` (`IdNR`),
  KEY `Name` (`Name`),
  KEY `ofAdressenofAspPartner` (`KundenNr`),
  KEY `ofAspPartnerAnrede` (`Anrede`),
  KEY `PLZ` (`PLZ`),
  KEY `Vorname` (`Vorname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ofasppartner` */

LOCK TABLES `ofasppartner` WRITE;

UNLOCK TABLES;

/*Table structure for table `ofdictionary` */

DROP TABLE IF EXISTS `ofdictionary`;

CREATE TABLE `ofdictionary` (
  `DicId` int(10) NOT NULL AUTO_INCREMENT,
  `DEU` varchar(255) DEFAULT NULL,
  `ENG` varchar(255) DEFAULT NULL,
  `BUL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DicId`),
  KEY `DicId` (`DicId`)
) ENGINE=InnoDB AUTO_INCREMENT=3695 DEFAULT CHARSET=latin1;

/*Data for the table `ofdictionary` */

LOCK TABLES `ofdictionary` WRITE;

insert  into `ofdictionary`(`DicId`,`DEU`,`ENG`,`BUL`) values (1,'Artikel','Product','Produkti'),(2,'Erster','First','?????'),(11,'A R T I K E L V E R W A L T U N G ','P R O D U C T   M A N G E R','? ? ? ? ? ? ? ?'),(19,'Artikel Nr:','Product ID','??????? ??.'),(23,'Beschreibung:','Description:','????????'),(24,'LieferantenPreise','Merchant prices','???? ?? ??????????'),(25,'Lieferanten','Merchants','Dostav\'ici'),(37,'Barcode:','Barcode','??????'),(41,'Lieferant:','Merchant:','?????????:'),(44,'Gewicht (in Kg):','Weight (Kg)','????'),(51,'Hersteller:','Manufacturer:','????????????'),(81,'Listen && Ausdrucke','List && Printouts','??????????'),(248,'A N R U F E','C A L L S','? ? ? ? ? ? ? ? ? ? ? ?'),(249,'Termine','Date','?????'),(250,'Kunden','Clients','Klienti'),(251,'letzte Aenderung','last change','???????? ????????'),(252,'letzter Kontakt','last Contact','???????? ???????'),(253,'nächter Anruf','next call','??????'),(254,'Notiz','Note','???????'),(255,'Mitarbeiter','Employee','Swtrudnici'),(256,'ofAnrufe Mitarbeiter subform','Employeees','??????????'),(257,'Wählen Sie einen Ausenmitarbeiter aus!','Select an Employee!','???????? ????????!'),(258,'I M P O R T && E X P O R T ','DATAI M P O R T && E X P O R T','? ? ? ? ? ? && ? ? ? ? ? ? ?'),(259,'Import Händler Preise','Import Merchant Prices','?????? ?? ???? ?? ??????????'),(260,'Export Produkte (my e-Store)','Export Products (my e-store)','??????? ???????? (???)'),(261,'Export Produkte (CSV)','Export Products (CSV)','??????? ????????'),(262,'Export nach ELBA','Export ELBA','??????? ????'),(263,'Import Daten von  ETB','Import Data from ETB','?????? ?? ???. ?????'),(265,'Synchronisieren','Synchronize','??????????????'),(266,'E i n s t e l l u n g e n ','S e t t i n g s','? ? ? ? ?'),(267,'Adressen','Addresses','??????'),(268,'Buchhaltung','book keeping','????????????'),(269,'Einstellungen','Settings','Opcii'),(270,'Nummer','Number','?????'),(271,'KundNr','ClientNr','??????'),(272,'Datum','Date','????'),(273,'Summe','Sum','????'),(274,'Bezahlt','paid','??????'),(275,'Druckukt','Print','?????'),(276,'Abgeschl.','closed','?????'),(277,'R E C H N U N G S L I S T E ','I N V O I C E S','? ? ? ? ? ? ?'),(278,'Wählen Sie einen Vorgangtyp aus:','Select a process type!','???????? ??? ??????!'),(279,'nur nicht abgeschlossene','not closed','???? ???????????'),(281,'Filter Kategorie:','Filter category:','?????? ?????????'),(282,'Neu','new','???'),(283,'Suchen','Search','???????'),(284,'Rabattierung','Discount','????????'),(285,'Zahlungsbedingungen','Pay conditions','?????? ?? ???????'),(286,'Befehl285','Command','???????'),(287,'Liste','List','?????'),(288,'Bez1/Lagerinfo:','Name1/store info','?????'),(289,'EK','BP','??'),(290,'Bezeichnung*:','Name*:','???þ:'),(291,'Set Artikel','Set product','??????? ?????'),(292,'Seriennummer','Ser.number','?????? ?????'),(295,'Lagerbewegung','Store movement','???????? ???????'),(296,'Preislisten','price lists','?????? ?????'),(297,'Staffelpreise','block pricing','???? ?? ????'),(298,'Eigenschaften','Features','??????????????'),(299,'verwandte Artikel','related products','?????? ????????'),(300,'<- geben Sie hier Artikel die z.B. als Empfehlung für den Warenkorb stehen müssen','<- add products, that should be recommended to the customers','< ????????, ????? ?? ??????????? ?? ???'),(302,'letzter EK','last BP','???????? ???. ????'),(303,'VK Preis:','Price:','????'),(304,'VK Euro :','Price:','????'),(305,'Lagerartikel','Store product','??????? ???????'),(306,'durchschn. EK','avg.BP','?????? ???.????'),(307,'MWSt (in %):','VAT (in %)','??? %'),(308,'Kategorie:','Category:','?????????:'),(309,'EAN Nr:','EAN Nr:','??? ??:'),(310,'Bild:','Picture:','????????:'),(311,'lstArtNrSearch','can be searched?','???????'),(312,'alle preise excl. MWST Definieren Sie keine EK und VK Preise wenn die nach Preisliste kalkuliert werden!','prices are without VAT','?????? ?? ??? ???'),(313,'edit',NULL,'???'),(314,'ProduktAktiv','activ?','??????????'),(316,'Hersteller Link','manufacturer Link','???? ????????????'),(332,'Max Stk.','Max amount','????. ???.'),(333,'Min Stk.','Min amount','???. ???.'),(334,'Bestand','Stock','?????????'),(335,'LagerOrt:','Store place:','?????:'),(336,'Bezeichnung:','Name:','???:'),(337,'ArtNr:','Product ID:','??????? ??.'),(338,'Filter nach LagerOrt','Filter store','?????? ?????'),(339,'L A G E R  V E R W A L T U N G ','S T O R E   M A N A G E R','? ? ? ? ? ? ? ?   ? ? ? ? ? ? ? ? ? ?'),(340,'Lagerort erfassen','new Store','????? ???'),(341,'Fehlender Bestand Stk','missing amount','???????? ????????'),(342,'Detail','detail','??????'),(343,'KGR','Client group','?????? ?????'),(344,'Gruppe','Group','?????'),(345,'KundenNr Kreis Von','ClientNr to','????????. ??'),(346,'KundenNr Kreis Bis','ClientNr from','????????. ??'),(347,'VorgangNr Kreis Von','Processes nr from','?????? ??. ??'),(348,'VorgangNr Kreis Bis','Processes nr to','?????? ??. ??'),(349,'Rechungen Mit MWST','Invoice mit VAT','??????? ? ???'),(350,'K U N D E N G R U P P E N  ','C L I E N T   G R O U P S','? ? ? ? ? ? ?? ?   ? ? ? ? ?'),(351,' A D R E S S V E R W A L T U N G','C O N T A C T S','? ? ? ? ? ?'),(352,'Filter Gruppe.:','Filter group.:','?????? ?????'),(353,'Befehl719','Command','???????'),(354,'Kdnr.*','ClientNr.*','???.þ'),(355,'Firma*','Company*','?????:'),(356,'Adresse','Address','?????'),(357,'Tel','Tel','???.'),(358,'Mobil','Mobile','???.???'),(361,'PLZ*:','ZIP*:','???.???þ:'),(362,'Geändert am:','changed at:','???????? ??:'),(363,'MAInnen:','mployee internal','????????? 2'),(364,'MAAusen:','Employee1:','????????? 1'),(365,'Name*','Name*','???þ'),(366,'Name1*','Name1*','???1þ'),(367,'Anrede:','Salutation','?????????'),(368,'Tel2','Tel2','???.2'),(369,'Fax','Fax','????'),(370,'Fax2','Fax2','????2'),(371,'Rechnung','Invoice','???????'),(372,'Angebot','Offer','??????'),(373,'Ansprechpartner','contact person','???????'),(374,'Bankverbindung','Banc','?????'),(375,'Gespräche - Notizen','Notes','?????????'),(379,'Sonstiges','More','?????'),(380,'Export','Export','???????'),(381,'Branche','Branch','?????'),(382,'hat Menu','has menu','????'),(383,'Filter nach Selektion','Filter selection','?????? ?????'),(387,'Land:','Country:','???????:'),(388,'neue PLZ','new ZIP','??? ???.???'),(389,'Auftrag','Order','???????'),(390,'Rüstschein','XXX','????? ????'),(391,'Lieferschein','Delivery note','?????????????'),(392,'Retourwaren','reclamation','Reklamacii'),(393,'Gutschrift','Bonus','?????'),(394,'Titel','Title','????????'),(395,'Vorgänge','Processes','Proces'),(396,'Etiketten','Labels','???????'),(397,'Adresskl.','address label','???????'),(398,'Kundengruppe und Preisliste','Client groups and price list','????????? ????? ? ???????'),(399,'Umsatz','sales volume','??????'),(400,'Status:','State:','??????:'),(401,'A','A','?'),(402,'B','B','?'),(405,'Brief','Letter','?????'),(408,'A R T I K E L K A T E G O R I E N M A N A G E R ','C A T E G O R Y   M A N A G E R','? ? ? ? ? ? ? ?'),(409,'Nr','Nr','??.'),(410,'Name','Name','???'),(411,'Parent','Parent','???????'),(412,'Desc',NULL,'????????'),(413,'Template','Template','?????'),(414,'Aufschlag EKpreis ','charge on BP','???????? ?????'),(415,'Gewinn Referenz','Win reference','?????? ?????????'),(417,'Subkategorien','Subcategories','??? ?????????'),(426,NULL,NULL,'? ? ? ? ?   ???????? ????????????????????????????????????????????????????????????'),(431,'Intra Sell 2.07','Intra Sell 2.07','???????? 2.07'),(432,'db ändern','change DB','????? ??'),(433,'Kundenliste','Client list','??????? ???????'),(434,'Set - Artikel','Set product','??????? ?????'),(435,'Rechnungsliste','Invoices','??????? ???????'),(436,'Adressenaufkleber','address label','??????? ?? ??????'),(437,'Daten Import && Export','Data Import && Export','????? ?????? ? ???????'),(438,'Bar Verkauf','bar','???????'),(439,'Bestellvorschlag','Aut. Order','???. ???????'),(440,'Lagerbestand','Store','Spravka Sklad'),(441,'Artikel Einlieferung','ongoing delivery','Sklad izhod'),(442,'Artikel Auslieferung','product delivery','Sklad vhod'),(443,'Lagerverwaltung','Store management','Skladovo stopanstvo'),(444,'Kunden && Produkte','Clients && Products','??????? && ????????'),(445,'Import Export && Optionen','Import Export && Options','?????? ?? ?????'),(446,'Verkaufsstatistik','Sell statictics','Spravka Oborot'),(447,'Artikelkategorien','Product categories','????????? ????????'),(448,'Kundengruppen','Client groups','Grupi Klienti'),(449,'Anrufe && Termine','Calls && Dates','????????? && ?????'),(450,'Anrufe','Calls','Telefonirane'),(451,'Artikelliste','Product list','??????? ????????'),(452,'Preiskalkulation','price calculation','??????????????'),(453,'Mahnwesen (test)','Dunning process','???????? ???????'),(454,'Die Rechnung wird so leicht wie mit Bleistift auf Papier gemacht. ','new way to make Business','??? ????? ?? ?? ????? ??????'),(455,'Korrespondenz','Corespondency','??????????????'),(456,'offene Rechnungen','open invoices','????????? ???????'),(457,'offene Aufträge','open orders','????????? ???????'),(458,'offene Angebote','open offers','????????? ??????'),(459,'Sammelauftrag','collective order','???? ???????'),(544,'4.Preisliste ','4.Price group','4.?????? ?????'),(545,'2.Artikel','2.Product','2.???????'),(546,'1.fixer VKPreis','1.Price','1.????.????'),(547,'Preisliste','price list','?????? ?????'),(548,'P R E I S K A L K U L A T I O N ','P R I C E   C A L C U L T I O N','? ? ? ? ? ? ? ? ? ? ? ? ? ?'),(549,'2.VKPreis Aufschlag/ Rabatt','2.Price/','2.????.???? ? % /????????'),(550,'3.EKPreis Aufschlag','3.buy Price','3.???.????'),(551,'3.Artikel Kategorie','3.Category','3.?????????'),(552,'1.Kunden','1.Client','1.??????'),(553,'Artikel Kategorie','Category','??????? ?????????'),(554,'Wählen Sie Preisliste/Kategorie/Produkt/Kunden aus  und geben Sie die Preisberechnung in den Zellen unten!','Select pricelist/category/product/client and then set the price calculation!','???????? ???.?????/?????./???????/?????? ? ?????????? ??? ?? ?? ???????? ???????? ????'),(555,'Artikel EAN','Product EAN','??????? ???'),(556,'Filter','Filter','??????'),(557,'nur ein Feld definieren! ','define only one field!','???? ???? ???? ?????????'),(558,'Die Matchkriterien sind nach Priorität / Wichtigkeit geordnet!','The match criteries are ordered by priority','?????????? ?? ????????? ?? ???????'),(559,'Vorsichtig: VKPreis ist entweder der VKPreis im Artikelansicht oder wenn nicht definiert EKpreis + Aufschlag der Kategorie (siehe Katgeorienmanager auch)','Warning! Price is the defined Price or the ...','???? ?? ????.???? ? ??? ????.???? ?? ???????? ??? ???.????'),(560,'EKpreis ist der günstigste Preis eines Lieferantes oder  der eingegebene EKPreis im Artikelansicht',NULL,'???.???? ? ???ø????????? ???? ?? ??????????'),(596,'Letzter','last','????????'),(597,'Hinten','Back','?????'),(598,'Vorne','Foreward','??????'),(599,'Kind','child','????'),(600,'Entfernen','remove','???????'),(601,'Löschen','delete','??????'),(602,'Save','Save','??????'),(603,'laden','load','??????'),(604,'Sel.','Sel.','?????'),(605,'FormToOpen:','Formname:','??????:'),(607,'CanBeDeleted','can be deleted','?????? ???'),(608,'CanBeRenamed','can be renamed','??????? ???'),(609,'Admin mode?','Admin mode?','??????????????'),(611,'Mahnstufe','Dunning level','??????'),(612,'Ausgedruckt','printed','??????????'),(613,'Zahlungsbedungung','Pay condition','????? ?? ???????'),(614,'Mahnstufenfilter','Dunning level filter','??????'),(615,'M A H N W E S E N  ','Dunning process','? ? ? ? ?  ? ?  ? ? ? ? ? ? ? ? ? ? ?    ? ? ? ? ? ? ?'),(616,'Mahnbriefe drucken','print dunning letters','?????'),(617,'Hier können Sie den Mahntext ändern! Verwenden Sie Textelemente wie \"[Betrag]\" um die Mahnungen wirkunsvoller beim Kunden zu gelangen!','Set the letter text here!','???? ???? ?? ????????? ?????? ?? ???????????? ?? ??????????? ???????'),(618,'Parent Nr','Parent Nr','??????? ??.'),(619,'K A T E G O R I E  N ','C A TE G O R I E S','? ? ?  ? ? ? ? ? ?'),(620,'Filter Kategorien','Filter category','?????? ?????????'),(621,'EKpreis Aufschlag','BP price charge','???????? ???.????'),(622,'K O R R E S P O N D E N Z','C O R E S P O N D E N C Y','? ? ? ? ? ? ? ? ? ? ? ? ? ?'),(623,'Gehen Sie mit der Maus in einem Brieftext und dann nach Word exportieren!','Select a letter with the mouse and then send it to word!','??????? ? ?????? ?? ??????? ? ?????? úîðä'),(624,'Befehl15','Command','???????'),(625,'wählen Sie eine Firma / Kunden aus','select a company/client','???????? ????? ??? ??????'),(626,'Betreff','Subject','????'),(627,'an','to','??'),(628,'IDNR','IDNR','?????'),(629,'Firma','Company','?????'),(630,'PLZ','ZIP','???.???'),(632,'Status','State:','??????'),(633,'Ort','Town','????'),(634,'Seriendruck','mail merge','????? ???.'),(635,'Filtrieren','Filter','??????'),(636,'K U N D E N L I S T E  ','C L I E N T S','? ? ? ? ? ? ?   ? ? ? ? ? ??'),(638,'abgeschloßen','closed','?????.'),(639,'Ausdruck','Print','?????'),(640,'Nummer:','Number:','?????:'),(641,' Vorgänge','Processes',' ???????'),(642,'an Elba','ELBA','?? ????'),(643,'Alle ZB','all pay cond.','????? ??? ???????'),(644,'Adresskleber','address label','???????'),(645,'Zahlsch.','payment form','???????? ?????????'),(646,'Storno','Return','?????'),(647,'Abschließen','close','?????.'),(648,'Befehl60','Command','???????'),(649,'Notiz:','Note:','???????:'),(726,'L I E F E R A N T E N V E R W A L T U N G ','M E R C H A N T   M A N A G E R','? ? ? ? ? ? ? ? ? ?'),(727,'KDNR','ClientNr.','??.??.'),(730,'PLZ:','ZIP:','???.???:'),(731,'Name1','Name1','???1'),(732,'neu PLZ','new ZIP','??? ???.???'),(733,'zur Preisliste','price list','?????? ?????'),(734,'Rolle:','Role:','????'),(737,'Lieferant','Merchant','?????????'),(738,' Preis für ArtikelNr','price for product',' ???? ?? ???????'),(739,'EKPreis','BP price','???.????'),(740,'Rabatt','Discount','????????'),(741,'P R E I S L I S T E N','P R I C E   L I S T S','? ? ? ? ? ?   ? ? ? ? ?'),(742,'Bezeichnung','Name','???'),(743,'Lagerinfo','Store info','?????'),(744,'Bestellmenge','amount order','??????????'),(745,'Kategorie','Category','?????????'),(746,'Kategorie (beim Lieferanten)','Category (Merchant)','????????? (?????????)'),(747,'Priorität','priority','?????????'),(748,'nach Priorität wird der Lieferant gewählt!!!!','the merchant is selected by priority!','????? ????????? ?? ?????????'),(749,'Nr beim Lieferant','Merchant nr.','??. ?? ??????????'),(999,'ArtNr','Product ID','????.??.'),(1000,'VK Preis','Price','????'),(1001,'EK Preis','BP price','???.????'),(1002,'PreisATS Brutto','price VAT','????+???'),(1003,' A R T I K E L L I S T E ','P R O D U C T S','? ? ? ? ? ? ? ?'),(1004,'MWSt','VAT','???'),(1010,'S E T A R T I K E L V E R W A L T U N G ','S E T   P R O D U C T S','? ? ? ? ? ? ?   ? ? ? ? ?'),(1011,'EAN','EAN','???'),(1012,'Barcode','Barcode','??????'),(1017,'Vorname','Firstname','???'),(1019,'TelFirma','Tel. company','???.?????'),(1020,'FaxFirma','Fax company','????'),(1022,'Bankname','Banc','?????'),(1023,'Kontonummer','Account','??. ??????'),(1024,'Währung','currency','??????'),(1025,'ELBA','ELBA','????'),(1026,'BLZ','Banc Code','????.???'),(1027,'Notizen','Notes','??.'),(1028,'BeginZeit:','Start:','?????:'),(1029,'EndeZeit:','end time','????:'),(1030,'Verrechnung','Accounting','??????'),(1031,'Bedingung','Condition','???????'),(1032,'Zahlungsmittel','Payart','??????? ?? ???????'),(1033,'Selektion 1','Selectgion 1','????? 1'),(1034,'Selektion 2','Selectgion 2','????? 2'),(1035,'Preislistename','price lists','?????? ?????'),(1036,'fixer VKPreis','sell Price','????.????'),(1037,'VKPreis Rabatt','discount on sell price','% ?? ?????? ????'),(1038,'Kundengruppe','Client group','????? ??????'),(1039,'UnterArtNr','sub product','????.??.'),(1041,'Min Bestand','Min amount','???. ???.'),(1042,'LagerOrt','Store palce','?????'),(1043,'Eing.','incl.','???.'),(1044,'Ausg.','printed','????.'),(1045,'VArt','Art','???'),(1046,'VNummer','Number','?????'),(1047,'Summe:','Sum:','????:'),(1048,'Saldo (Ausgang- Eingang)','account balance','?????'),(1049,'VKPreis','Price','????'),(1050,'VKPreis Aufschlag od. Rabatt','discount on sell price','% ?? ????'),(1051,'Stück ab','am.from','?? ???.'),(1052,'Prozent Rabatt auf VK Preis','discount on sell price','???????? ?/? ????.????'),(1053,'Eigenschaft','Feature','??????????????'),(1054,'Wert','Value','????????'),(1056,'Start','Start','?????'),(1057,'Command73','Command','???????'),(1058,'Command74','Command','???????'),(1063,'Liste bearbeiten ','change list','?????. ?????'),(1065,'PLZ/Ort','ZIP','???.???:'),(1066,'Artikelbezeichnung','Product','??????????'),(1067,'Netto Preis','net price','????'),(1068,'Preis Euro','price','????'),(1069,'Stk','amount','???.'),(1070,'Netto+MwSt','net+VAT','????+???'),(1071,'Ser.Nr.:','ser.nr.','???. ??.:'),(1072,'Befehl70','Command','???????'),(1073,'Total','Total','?????'),(1074,'Rech.:','Invoice:','???????:'),(1075,'Total + MWSt','Total + VAT','?????+???'),(1076,'T E R M I NE ','D A T E S','? ? ? ? ?'),(1077,'Mitarbeiter Extern','Employee external','????????? 1'),(1078,'Mitarbeiter Intern','Employee internal','????????? 2'),(1079,'TerminText','Note','?????'),(1080,'TerminDatum','Date','????'),(1081,'Wiedervorlage','Template','???????'),(1082,'Terminzettel','Note','???????'),(1083,'Termin!','Date!','?????'),(1095,'delete','delete','??????'),(1111,'Datum von:','Date from:','???? ??:'),(1112,' bis:','to:','??:'),(1113,'Anzeigen','show','??????'),(1114,'Kunde','Client','??????'),(1115,' V E R K A U F S  S T A T I S T I K ','S E L L S   S T A T I S T I C S','? ? ? ? ? ? ?   ? ? ? ? ? ? ? ?'),(1116,'Artikelgruppe','Product group','?????'),(1117,'Neue Suche','new search','???? ???????'),(1118,'Einsatz','Costs','?????'),(1119,'Gewinn','Profit','???????'),(1120,'Ausdruck nach Kunden','Print','?????'),(1121,'Ausdruck nach Produkte','Print / after products','????? ?? ????????'),(1141,'Wählen Sie hier die Artikel die diesen Set Artikel umfassen wird','Select the child products','???????? ??? ??????????'),(1148,'Order','Order','???????'),(1150,'Aktiv ?','active?','???????'),(1157,'Home','Home','Start'),(1158,'Daten Import&Export','Data Import&Export','Danni'),(1159,'Statistiken','Statistics','Statistiki'),(1160,'Mahnwesen','Payment reminders','Neizplateni Fakturi'),(1161,'Angebote','Offers','Oferti'),(1162,'Auftraege','Orders','Dogovori'),(1163,'Lieferscheine','Delivery notes','Tovaritelnici'),(1164,'Rechnungen','Invoices','Fakturi'),(1165,'Rüstscheine','XXX','Vhod Sklad'),(1166,'Gutschriften','credit note','Kredit'),(1167,'Artikel nach ArtNr','Product/ProdNr.','Produkti po prod.nr.'),(1168,'Artikel nach Bezeichnung','Product/Name','Produkti po ime'),(1169,'Artikel nach EAN','Product/EAN','Produkti po EAN'),(1170,'Artikel nach Kategorie','Product/Category','Produkti po Kategoriq'),(1171,'Artikelkategorien Manager','Categories','Kategorii'),(1172,'Kunden Alle','Clients All','Klienti'),(1173,'Kunden A-K','Clients A-K','Klienti 1'),(1174,'Kunden L-Z','Clients L-Z','Klienti 2'),(1175,'Kunden Firmen','Companies','Klienti Firmi'),(1176,'Stufe I','Level I','Stepen 1'),(1177,'Stufe II','Level II','Stepen 2'),(1178,'Stufe III','Level III','Stepen 3'),(1315,'Vorgaenge','Processes','Proces'),(1316,'Produktbilder anzeigen','Show product images',NULL),(1318,'Preis aufsteigend','Price descending',NULL),(1319,'Preis absteigend','Price ascending',NULL),(1322,'ALLE','ALL',NULL),(1324,'Anzeige Produkte von','show products from',NULL),(1327,'Preis','Price',NULL),(1328,'Artikel Nr','product nr',NULL),(1334,'alle Kategorien','all categories',NULL),(1343,'Passwort','password',NULL),(1344,'Min 6 Zeichen!','Min 6 characters',NULL),(1345,'Passwort bestätigung','password confirmation',NULL),(1348,'Frau','Mrs.',NULL),(1350,'Geburtstag','Birthday',NULL),(1352,'PLZ / Ort','ZIP / Town',NULL),(1353,'Land','Country',NULL),(1362,'Lieferadresse','Delivery address',NULL),(1363,'Rechnungsadresse','invoice address',NULL),(1364,'Kunden Nr.','Client Nr.',NULL),(1367,'offene Vorgänge','open Processes',NULL),(1373,'abgeschlossene Vorgänge','closed Processes',NULL),(1430,'konvertieren','convert',NULL),(1431,'ansehen','show',NULL),(1432,'Gedruckt','printed',NULL),(1433,'Abgeschlossen','closed',NULL),(1434,'konvertiert von','convert from',NULL),(1435,'konvertiert nach','convert to',NULL),(1436,'Druck','Print',NULL),(1439,'Produkt','Product',NULL),(1440,'einfügen','insert',NULL),(1441,'Aktualisieren','update',NULL),(1489,'Suche','Search',NULL),(1490,'Suchen. Für eine erfolgreiche suche, wählen Sie einige Kriterien aus den Komboboxen!','Choose values from the drop down boxes!',NULL),(1491,'Sie haben kein Produkte ausgewählt!','Please select products first!',NULL),(1492,'Sie müssen zwei oder mehrere Produkte auswählen um ein Vergleich machen zu können!','You have to select at least 2 products to start comparison!',NULL),(1493,'Nachricht','Message',NULL),(1494,'Ziel','Destination',NULL),(1495,'Die Suche hat leider keine Ergebnisse gebracht!','Your search returned no result! Please try with less criteria!',NULL),(1496,'Transportauswahl für Ziel','Select transport for your destination',NULL),(1497,'compareTwoProducts','compare two or more products',NULL),(1499,'Load','Load','??????'),(1500,'child','child',NULL),(1501,'remove','remove',NULL),(1502,'HTML Info','detailed information',NULL),(1503,'Status Bearbeitung','state of processing',NULL),(1504,'Warenkorb','Basket',NULL),(1505,'LEER','is Empty',NULL),(1506,'ProductView','product view',NULL),(1507,'Nur registrierte Benutzer können Bewertungen abgeben!','Only registered users can write reviews!',NULL),(1508,'ProductQuery','product query',NULL),(1509,'PutInWarenkorb','put in the basket',NULL),(1510,'Sie haben ein Produkt in den Warenkorb eingefügt.','You put a product in the basket.',NULL),(1511,'warenkorbStep1','shopping basket - step 1',NULL),(1512,'Anzahl','PCS',NULL),(1513,'Transportkosten','Delivery expenses',NULL),(1514,'Bestellung-/Zahlungsart:','Payment mode:',NULL),(1515,'Wählen Sie Transportart für Ihre  Lieferung:','Choose the delivery mode:',NULL),(1516,'Keine Postmethoden sind für diese Destination definiert!','We do not deliver to this destination!',NULL),(1517,'Help: Wählen Sie eine gültige PLZ im Shipping Calculator!','Help: Choose ZIP code for your delivery destination!',NULL),(1518,'warenkorbStep3','shopping basket - step 3',NULL),(1519,'MyBookmarks','my bookmarks',NULL),(1520,'ClearanceCenter','Clearance Center',NULL),(1521,'DetailSearchForm','detail search',NULL),(1522,'Produktliste','product list',NULL),(1523,'productSearchOnKeywords','product search result',NULL),(1524,'Search in ','search in',NULL),(1525,'Text','Text',NULL),(1526,'senden','send',NULL),(1527,'NewAccount','new account',NULL),(1528,'Account Login','Account Login',NULL),(1529,'Email','Email',NULL),(1530,'Ihr Account','Your Account',NULL),(1531,'Tel(abend)','Tel(home)',NULL),(1532,'Geben Sie Ihre Bemerkungen zu dieser Bestellung an (Farbe, Grösse, usw):','Write your note for this order (Color, Size, etc.):',NULL),(1533,'Aktuelle Rechnungsadresse','current invoice address',NULL),(1534,'Ich habe die AGB gelesen und akzeptiert!','I accept the tearms of use!',NULL),(1535,'(nur wenn Lieferadresse von Acount abweicht)','(only when the delivery address is different)',NULL),(1536,'Sie haben keine Bookmarks!','You have no bookmarks!',NULL),(1537,'Sie haben erfolgreich ein Bookmark angelegt!','Your bookmark was saved!',NULL),(1538,'Warenkorb wurde vom Speicher geholt!','Your basket was restored!',NULL),(1539,'FAQ','FAQ',NULL),(1540,'weiter','next',NULL),(1541,'kein Top Deal für Heute!','no Top Deals for today selected!',NULL),(1542,'ProductMap','product map',NULL),(1543,'DetailSearchResult','result on detail search',NULL),(1544,'Speichern','Save',NULL),(1545,'MerchantList','merchant list',NULL),(1546,'Ihr Warenkorb ist leer!','Your shopping basket is empty',NULL),(1547,'top5','Top 5',NULL),(1548,'Keine Daten vorhanden!','No Data!',NULL),(1549,'MyProfile','my profile',NULL),(1550,'Help: Wählen Sie eine gültige PLZ im Shipping Calculator!','Help: select your ZIP code for this delivery im shipping calculator!',NULL),(1551,'Anrede','Title',NULL),(1552,'pageToShow','current page',NULL),(1553,'Suchergebnisse','Search results',NULL),(1554,'Transportkosten','Delivery expenses',NULL),(1555,'Hersteller','Manufacturer',NULL),(1556,'Total (+MWST)','Total (+VAT)',NULL),(1557,'Lieferung','delivery note',NULL),(1558,'Sortieren nach:','Sort by:',NULL),(1559,'Dienst','Service',NULL),(1560,'Subtotal','Subtotal',NULL),(1561,'Max 255 Zeichen erlaubt!','Max 255 characters allowed!',NULL),(1562,'Transport:','Transport:',NULL),(1563,'Destination der Lieferung:','Destionation for the delivery:',NULL),(1564,'Produktempfehlung','product recomendation',NULL),(1565,'createUpdateAddressSpecial','save addresses',NULL),(1566,'Webadresse','WWW address',NULL),(1567,'Ihre Aufträge/Lieferscheine/Rechnungen','Your orders/ delivery notes/ invoices',NULL),(1568,'Zurück zu meinem Konto','back to my Account',NULL),(1569,'Aktuelle Lieferadresse','current delivery address',NULL),(1570,'Rechnungs','Invoice',NULL),(1571,'Derzeit keine Bewertungen vorhanden.','No reviews at this time.',NULL),(1572,'In Kürze erhalten Sie eine Bestätigung per E-Mail.','You will get a confirmation via email.',NULL),(1573,'Warenkorb','Basket',NULL),(1574,'Wählen Sie Transportart für Ihre  Lieferung:','Select delivery mode for this delivery:',NULL),(1575,'LEER','is Empty',NULL),(1576,'ändern','change',NULL),(1577,'ProductList','product list',NULL),(1578,'Paketnummer','packet number',NULL),(1579,'Bestätigung Ausdrucken','Print Invoice',NULL),(1580,'Keine Postmethoden sind für diese Destination definiert!','No delivery infomation was provides for this destination!',NULL),(1581,'Status Position','state of product',NULL),(1582,'Zahlungskosten','payment expenses',NULL),(1583,'Beschreibung','Description',NULL),(1584,'Anzahl','Count',NULL),(1585,'Ihre Bestellung','Your order',NULL),(1586,'Artikel#','Product#',NULL),(1587,'Stück','Pcs.',NULL),(1588,'MyAccount','my account',NULL),(1589,'Ihre Produkte','Your products',NULL),(1590,'Vielen Dank für Ihren Einkauf.','Thank you for your order.',NULL),(1591,'Herr','Mr.',NULL),(1592,'Es sind gerade keine Informationen über diesen Artikel vorhanden!','No information for this product at this time.',NULL),(1593,'Bestellung-/Zahlungsart:','Payment mode:',NULL),(1594,'WebPage','web page',NULL),(1595,'Bild','Picture',NULL),(1596,'Rechnung#','Inovoice#',NULL),(1597,'Strasse / Nr.','Street / Nr.',NULL),(1598,'RechnungsArtikel','products',NULL),(1599,' wurde gewünscht ','selected',NULL),(1600,'AGB lesen ...','read Tearms fo Use',NULL),(1601,'Position','position',NULL),(1602,'warenkorbStep4','shopping basket - step 4',NULL),(1603,'warenkorbStep2','shopping basket - step 2',NULL),(1604,'Warten Sie bis die Berechnung läuft!','Wait please ...',NULL),(1605,'Aktion','Action',NULL),(1606,'Sie sind nicht angemeldet!','You must login firstly!',NULL),(1607,'Suchergebnis... moment, bitte...','Search result... Please wait...',NULL),(1608,'bis','to',NULL),(1609,' bis ',' til',NULL),(1610,'ändern','EDIT',NULL),(1611,'createUpdateDeliveryAddresses','save address for delivery',NULL),(1612,'SaveBookmark','save bookmark',NULL),(1613,'Aktuelle Adresse','current address',NULL),(1614,'MyProfileInfo','my profile information',NULL),(1615,'Produktanzahl','product count',NULL),(1616,'Buy','Buy',NULL),(1617,'Zurück','back',NULL),(1618,'Zum Seitenanfang','top of the page',NULL),(1619,'Hersteller Nr:','Manufacturer Nr:',NULL),(1620,'compareManyProducts','compare many products',NULL),(1621,'I want to subscribe for Smartefox','I want to subscribe for Smartefox',NULL),(1622,'Erstellen','Create',NULL),(1623,'(nur wenn Rechnungsadresse von Acount abweicht)','(only when the invoice address is different)',NULL),(1624,'Ihre Bestellung wurde erfolgreich gespeichert!','Your order was saved!',NULL),(1625,'RestoreWarenkorb','restore basket',NULL),(1626,'zum Warenkorb','go to basket',NULL),(1627,'Sie haben gesucht nach:','Your search criteria:',NULL),(1628,'Hersteller auswählen:','Choose manufacturer:',NULL),(1629,'Seite','Page',NULL),(1630,'in','in',NULL),(1631,'Sie müssen ArtNr, Bezeichnung oder Hersteller eingeben.','Your search criterias must include product Id, description or manufracturer.',NULL),(1633,NULL,NULL,'? ? ? ? ?   ???????? ????????????????????????????????????????????????????????????'),(1694,'Daten Import/Export','Data Import/Export',NULL),(1695,'Produkte importieren','import products',NULL),(1696,'Produkte exportieren','export products',NULL),(1697,'upload Produktbilder','upload product images',NULL),(1698,'upload Firmenlogo','upload company logo',NULL),(1699,'import Produkte / ITAll','import Products / ITALL',NULL),(1700,'Category Mapping/ ITAll',NULL,NULL),(1701,'Produkte und Preise','products and prices',NULL),(1702,'Produkte/Suche','search in products',NULL),(1703,'Produkte','Products',NULL),(1704,'Kategorien','Categories',NULL),(1705,'Top Products','Top Products',NULL),(1706,'Price Hits','Price Hits',NULL),(1707,'Transportkosten','Post Expenses',NULL),(1708,'Sessions','Sessions',NULL),(1709,'Verkauf','sales',NULL),(1710,'Tabellen','Tables',NULL),(1711,'Adressen/Suche','Addresses/Search',NULL),(1712,'Adressen/PLZ','Addresses/ZIP',NULL),(1713,'Newsletter','Newsletter',NULL),(1714,'Referers','Referers',NULL),(1715,'Admin Menus',NULL,NULL),(1716,'Zahlungsbedingung','payment conditions',NULL),(1717,'Zahlungsmethode','payment methods',NULL),(1718,'Serial Email Newsletter','Serial Email Newsletter',NULL),(1719,'Serial Email Clients','Serial Email Clients',NULL),(1720,'Hilfe','Help',NULL),(1721,'Shop','Shop',NULL),(1722,'Setup Wizzard','Setup Wizzard',NULL),(1723,'Die gleiche Adresse wie im Profil.','The same address like im profile.',NULL),(1724,'Bruttopreis','gross price',NULL),(1725,'NEW','new',NULL),(1727,'Der Verkaufspreis wurde mit dem Aufschlag der dazugehörige Kategorie aktualisiert.','The price was updated with the category charge condition.',NULL),(1728,'Fertig! Die Produkte / Preise wurden aktualisiert.','Ready!',NULL),(1729,'Statistik','Statistics',NULL),(1730,'Neue Produkte','new products',NULL),(1731,'Neue Preise','new prices',NULL),(1732,'Fehler','Error',NULL),(1733,'Produkte importieren CSV','import products (CSV)',NULL),(1734,'AU',NULL,NULL),(1735,'Kunden nach Groupen','Cients in Groups',NULL),(1736,'Rutourwaren','Reclamation',NULL),(1737,'Einzelpreis','Single Price',NULL),(1738,'Gesamtsumme','Total amount',NULL),(1739,'closed',NULL,NULL),(1740,'YES','YES',NULL),(1741,'NO',NULL,NULL),(1742,'Serienemail Newsletter','Serial Email Newsletter',NULL),(1743,'Serienemail Kunden','Serial Email Clients',NULL),(1744,'Serienemail Absenden','Serial Email send',NULL),(1745,'Wartung','Backup and Restore',NULL),(1746,'Ich möchte Newsletter bekommen',NULL,NULL),(1747,'Bitte füllen Sie alle mit * gekennzeichneten Felder aus!',NULL,NULL),(1748,'Dieses Account ist schon besetzt, bitte mit Email und Passwort anmelden um Änderungen vorzunehmen!',NULL,NULL),(1749,'Vielen Dank! Ihre Daten wurden erfolgreich gespeichert.',NULL,NULL),(1750,'Herzlich willkommen bei',NULL,NULL),(1751,'Sie sind neu angemeldet als:',NULL,NULL),(1752,'In Kürze werden Sie eine Anmeldebestätigung per E-Mail erhalten!',NULL,NULL),(1753,'Weiter zum Konto',NULL,NULL),(1754,'Das Passwort oder der Name stimmt nicht!',NULL,NULL),(1755,'Benutzen Sie die Zurück Schaltfläche!',NULL,NULL),(1756,'To Change Password Click',NULL,NULL),(1757,'Händler',NULL,NULL),(1758,'als Ergebnisliste',NULL,NULL),(1759,'in Kategoriebaum',NULL,NULL),(1760,'Möchten Sie die Produkte in den folgenden Kategorien auch ansehen?',NULL,NULL),(1761,'CSV Datei Upload',NULL,NULL),(1762,'Pages',NULL,NULL),(1763,'Vorgangstabellen',NULL,NULL),(1764,'Kunden nach Gruppen',NULL,NULL),(1765,'offene Vorg&#228;nge',NULL,NULL),(1766,'abgeschlossene Vorg&#228;nge',NULL,NULL),(1767,'&Auml;ndern',NULL,NULL),(1768,'Hier ist der gewünschte Ausdruck!',NULL,NULL),(1769,'Ihr/e Angebot/Rechnung wurde erfolgreich erstellt!',NULL,NULL),(1770,'Fehler: ArtKatNr ist keine Zahl!',NULL,NULL),(1771,'Es sind keine weitere Unterkategorien vorhanden.',NULL,NULL),(1772,'Suchen. F&uuml;r eine erfolgreiche suche, w&auml;hlen Sie einige Kriterien aus den Komboboxen!',NULL,NULL),(1773,'Sie haben kein Produkte ausgew&auml;hlt!',NULL,NULL),(1774,'Die selektierte Objekte vergleichen.',NULL,NULL),(1775,'Die selektierte Objektliste ausdrucken.',NULL,NULL),(1776,'Kaufen',NULL,NULL),(1777,' wurde gewuenscht ',NULL,NULL),(1778,'Warten Sie bis die Berechnung fertig ist!',NULL,NULL),(1779,' Tipp: Browser Symbol dreht sich nicht mehr.',NULL,NULL),(1780,'Frei Haus Lieferung ab:',NULL,NULL),(1781,'Verwandte Produkte',NULL,NULL),(1782,'Sessions Tag',NULL,NULL),(1783,'Sie haben kein Produkte ausgewaehlt!',NULL,NULL),(1784,'AngelegtAm',NULL,NULL),(1785,'Es sind keine Daten fuer diesen Produkt verfuegbar!',NULL,NULL),(1786,'Sie müssen ArtNr, ArtKatNr, Bezeichnung, Hersteller oder Lieferant eingeben.',NULL,NULL),(1787,'Sie muessen zwei oder mehrere Produkte auswaehlen um ein Vergleich machen zu koennen!',NULL,NULL),(1788,'Benutzen Sie unbedingt die Zurueck Schaltflaeche um Ihre Eingaben nicht zu verlieren!',NULL,NULL),(1789,'Zurueck',NULL,NULL),(1790,'Ihre Angaben sind nicht korrekt!',NULL,NULL),(1791,'M&ouml;chten Sie die Produkte in den folgenden Kategorien auch ansehen?',NULL,NULL),(1792,'Es sind gerade keine Informationen &uuml;ber diesen Artikel vorhanden!',NULL,NULL),(1793,'Waehlen Sie Transportart fuer Ihre Lieferung:',NULL,NULL),(1794,'Help: W&auml;hlen Sie eine gültige PLZ im Shipping Calculator!',NULL,NULL),(1795,'Es sind keine Daten fuer dieses Produkt verfuegbar!',NULL,NULL),(1796,'Geben Sie Ihre Bemerkungen zu dieser Bestellung an (Farbe, Groesse, usw):',NULL,NULL),(1797,'aendern',NULL,NULL),(1798,'Informationen zum Fernabsatzgesetz gelesen!',NULL,NULL),(1799,'Informationen zum Fernabsatzgesetz lesen ...',NULL,NULL),(1800,'Bestellung aendern',NULL,NULL),(1801,'Ihre Session ist abgelaufen! Bitte erneut die Zahlungskosten kalkulieren',NULL,NULL),(1802,'zum Warenkorb Step 1',NULL,NULL),(1803,'Stueck',NULL,NULL),(1804,'Produkte der Kategorie',NULL,NULL),(1805,'Sie müssen unsere AGB akzeptieren!',NULL,NULL),(1806,'zur&uuml;ck',NULL,NULL),(1807,'Sie müssen das Fernabsatzgesetz lesen und akzeptieren!',NULL,NULL),(1808,'Ihre Session ist abgelaufen. Bitte erneut die Zahlungskosten kalkulieren!',NULL,NULL),(1809,'Ihre Bestellung #',NULL,NULL),(1810,'In Kuerze erhalten Sie eine Bestaetigung per E-Mail.',NULL,NULL),(1811,'Dieses E-Mail wurde an Sie via nachfolgender gesendet.',NULL,NULL),(1812,'Es beinhaltet Produktinformationen welche Ihnen ein Freund mitteilen m&ouml;chte:',NULL,NULL),(1813,'printManyProducts',NULL,NULL),(1814,'Anmeldeinformation',NULL,NULL),(1815,'Emailwiederholung',NULL,NULL),(1816,'Passwortbest&auml;tigung',NULL,NULL),(1817,'Bundesland',NULL,NULL),(1818,'Web',NULL,NULL),(1819,'Ich m&ouml;chte Newsletter bekommen',NULL,NULL),(1820,'Mindestwert ist ',NULL,NULL),(1821,'Suche ungültig!',NULL,NULL),(1822,'Die Suche muss mindestens 3 Symbole enthalten!',NULL,NULL),(1823,'Solche Abfrage wurde bereits gespeichert!',NULL,NULL),(1824,'Versandkosten wurden nicht verrechnet!',NULL,NULL),(1825,'Zahlungskosten wurden nicht verrechnet!',NULL,NULL),(1826,'Zahlungsformular wird gerade gestartet!',NULL,NULL),(1827,'(nur wenn Lieferadresse vom Account abweicht)',NULL,NULL),(1828,'(nur wenn Rechnungsadresse vom Account abweicht)',NULL,NULL),(1829,'Ihre Session ist abgelaufen. Bitte erneut die Versandkosten kalkulieren.',NULL,NULL),(1830,'Ihre Produktliste',NULL,NULL),(1831,'Bestellinfo',NULL,NULL),(1832,'RMA',NULL,NULL),(1833,'ausdrucken',NULL,NULL),(1834,'Zurueck zu meinem Konto',NULL,NULL),(1835,'Ihr/e Angebot/Auftrag/Rechnung wurde erfolgreich erstellt!',NULL,NULL),(1836,'Von',NULL,NULL),(1837,'Ihre Auftr&auml;ge/Lieferscheine/Rechnungen',NULL,NULL),(1838,'Zur&uuml;ck zu meinem Konto',NULL,NULL),(1839,'ChangePassword',NULL,NULL),(1840,'Wir bieten derzeit Produkt mit dieser Nummer nicht!',NULL,NULL),(1841,'Sie haben eine Position im Warenkorb aktualisiert.',NULL,NULL),(1842,'Bitte eine Selektion in den Komboboxen vornehmen! ',NULL,NULL),(1843,'Wir haben kein Produkt mit dieser Nr.',NULL,NULL),(1844,'Jetzt anmelden',NULL,NULL),(1845,'Paketverfolgung',NULL,NULL),(1846,'Bitte vorher anmelden!',NULL,NULL),(1847,'mehr',NULL,NULL),(1848,'zur Kasse',NULL,NULL),(1849,'Ihre Angaben sind nicht richtig!',NULL,NULL),(1850,'Es wurde leider kein Passwort für die angegebene Name und Email gefunden!',NULL,NULL),(1851,'Ihr Passwort',NULL,NULL),(1852,'Ihr Passwort konnte nicht gesendet werden. Versuchen Sie wieder später!',NULL,NULL),(1853,'Ich möchte Newsletter erhalten',NULL,NULL),(1854,'ProfileSave',NULL,NULL),(1855,'Ungueltige TelNr!?!',NULL,NULL),(1856,'Bitte fuellen Sie alle mit * gekennzeichneten Felder aus!',NULL,NULL),(1857,'Vielen Dank! Ihre Daten wurden erfolgreich geändert.',NULL,NULL),(1858,'keine Paketnummer vergeben',NULL,NULL),(1859,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1860,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1861,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1862,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1863,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1864,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1865,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1866,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1867,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1868,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1869,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1870,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1871,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1872,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1873,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1874,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1875,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1876,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1877,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1878,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1879,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1880,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1881,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1882,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1883,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1884,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1885,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1886,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1887,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1888,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1889,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1890,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1891,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1892,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1893,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1894,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1895,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1896,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1897,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1898,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1899,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1900,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1901,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1902,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1903,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1904,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1905,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1906,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1907,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1908,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1909,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1910,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1911,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1912,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1913,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1914,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1915,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1916,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1917,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1918,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1919,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1920,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1921,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1922,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1923,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1924,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1925,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1926,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1927,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1928,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1929,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1930,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1931,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1932,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1933,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1934,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1935,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1936,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1937,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1938,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1939,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1940,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1941,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1942,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1943,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1944,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1945,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1946,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1947,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1948,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1949,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1950,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1951,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1952,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1953,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1954,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1955,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1956,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1957,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1958,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1959,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1960,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1961,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1962,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1963,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1964,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1965,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1966,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1967,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1968,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1969,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1970,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1971,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1972,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1973,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1974,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1975,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1976,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1977,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1978,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1979,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1980,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1981,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1982,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1983,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1984,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1985,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1986,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1987,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1988,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1989,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1990,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1991,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1992,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1993,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1994,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1995,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1996,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1997,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1998,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(1999,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2000,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2001,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2002,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2003,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2004,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2005,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2006,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2007,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2008,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2009,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2010,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2011,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2012,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2013,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2014,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2015,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2016,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2017,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2018,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2019,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2020,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2021,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2022,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2023,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2024,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2025,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2026,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2027,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2028,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2029,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2030,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2031,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2032,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2033,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2034,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2035,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2036,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2037,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2038,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2039,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2040,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2041,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2042,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2043,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2044,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2045,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2046,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2047,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2048,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2049,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2050,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2051,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2052,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2053,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2054,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2055,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2056,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2057,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2058,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2059,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2060,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2061,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2062,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2063,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2064,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2065,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2066,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2067,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2068,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2069,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2070,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2071,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2072,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2073,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2074,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2075,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2076,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2077,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2078,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2079,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2080,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2081,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2082,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2083,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2084,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2085,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2086,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2087,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2088,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2089,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2090,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2091,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2092,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2093,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2094,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2095,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2096,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2097,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2098,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2099,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2100,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2101,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2102,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2103,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2104,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2105,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2106,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2107,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2108,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2109,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2110,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2111,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2112,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2113,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2114,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2115,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2116,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2117,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2118,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2119,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2120,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2121,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2122,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2123,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2124,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2125,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2126,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2127,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2128,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2129,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2130,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2131,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2132,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2133,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2134,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2135,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2136,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2137,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2138,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2139,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2140,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2141,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2142,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2143,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2144,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2145,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2146,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2147,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2148,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2149,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2150,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2151,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2152,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2153,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2154,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2155,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2156,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2157,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2158,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2159,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2160,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2161,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2162,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2163,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2164,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2165,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2166,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2167,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2168,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2169,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2170,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2171,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2172,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2173,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2174,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2175,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2176,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2177,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2178,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2179,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2180,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2181,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2182,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2183,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2184,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2185,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2186,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2187,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2188,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2189,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2190,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2191,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2192,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2193,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2194,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2195,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2196,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2197,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2198,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2199,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2200,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2201,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2202,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2203,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2204,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2205,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2206,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2207,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2208,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2209,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2210,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2211,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2212,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2213,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2214,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2215,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2216,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2217,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2218,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2219,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2220,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2221,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2222,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2223,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2224,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2225,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2226,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2227,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2228,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2229,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2230,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2231,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2232,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2233,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2234,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2235,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2236,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2237,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2238,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2239,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2240,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2241,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2242,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2243,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2244,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2245,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2246,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2247,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2248,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2249,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2250,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2251,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2252,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2253,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2254,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2255,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2256,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2257,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2258,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2259,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2260,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2261,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2262,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2263,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2264,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2265,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2266,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2267,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2268,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2269,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2270,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2271,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2272,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2273,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2274,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2275,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2276,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2277,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2278,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2279,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2280,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2281,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2282,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2283,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2284,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2285,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2286,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2287,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2288,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2289,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2290,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2291,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2292,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2293,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2294,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2295,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2296,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2297,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2298,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2299,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2300,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2301,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2302,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2303,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2304,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2305,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2306,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2307,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2308,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2309,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2310,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2311,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2312,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2313,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2314,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2315,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2316,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2317,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2318,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2319,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2320,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2321,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2322,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2323,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2324,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2325,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2326,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2327,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2328,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2329,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2330,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2331,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2332,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2333,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2334,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2335,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2336,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2337,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2338,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2339,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2340,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2341,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2342,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2343,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2344,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2345,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2346,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2347,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2348,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2349,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2350,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2351,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2352,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2353,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2354,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2355,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2356,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2357,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2358,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2359,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2360,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2361,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2362,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2363,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2364,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2365,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2366,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2367,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2368,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2369,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2370,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2371,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2372,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2373,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2374,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2375,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2376,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2377,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2378,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2379,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2380,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2381,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2382,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2383,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2384,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2385,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2386,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2387,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2388,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2389,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2390,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2391,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2392,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2393,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2394,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2395,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2396,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2397,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2398,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2399,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2400,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2401,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2402,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2403,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2404,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2405,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2406,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2407,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2408,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2409,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2410,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2411,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2412,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2413,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2414,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2415,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2416,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2417,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2418,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2419,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2420,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2421,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2422,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2423,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2424,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2425,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2426,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2427,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2428,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2429,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2430,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2431,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2432,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2433,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2434,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2435,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2436,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2437,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2438,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2439,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2440,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2441,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2442,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2443,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2444,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2445,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2446,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2447,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2448,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2449,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2450,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2451,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2452,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2453,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2454,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2455,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2456,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2457,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2458,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2459,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2460,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2461,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2462,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2463,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2464,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2465,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2466,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2467,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2468,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2469,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2470,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2471,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2472,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2473,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2474,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2475,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2476,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2477,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2478,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2479,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2480,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2481,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2482,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2483,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2484,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2485,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2486,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2487,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2488,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2489,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2490,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2491,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2492,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2493,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2494,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2495,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2496,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2497,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2498,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2499,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2500,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2501,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2502,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2503,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2504,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2505,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2506,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2507,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2508,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2509,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2510,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2511,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2512,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2513,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2514,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2515,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2516,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2517,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2518,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2519,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2520,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2521,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2522,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2523,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2524,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2525,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2526,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2527,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2528,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2529,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2530,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2531,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2532,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2533,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2534,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2535,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2536,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2537,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2538,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2539,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2540,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2541,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2542,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2543,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2544,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2545,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2546,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2547,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2548,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2549,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2550,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2551,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2552,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2553,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2554,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2555,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2556,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2557,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2558,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2559,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2560,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2561,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2562,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2563,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2564,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2565,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2566,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2567,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2568,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2569,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2570,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2571,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2572,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2573,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2574,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2575,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2576,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2577,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2578,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2579,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2580,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2581,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2582,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2583,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2584,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2585,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2586,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2587,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2588,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2589,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2590,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2591,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2592,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2593,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2594,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2595,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2596,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2597,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2598,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2599,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2600,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2601,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2602,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2603,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2604,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2605,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2606,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2607,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2608,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2609,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2610,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2611,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2612,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2613,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2614,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2615,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2616,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2617,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2618,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2619,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2620,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2621,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2622,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2623,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2624,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2625,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2626,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2627,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2628,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2629,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2630,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2631,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2632,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2633,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2634,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2635,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2636,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2637,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2638,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2639,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2640,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2641,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2642,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2643,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2644,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2645,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2646,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2647,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2648,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2649,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2650,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2651,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2652,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2653,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2654,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2655,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2656,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2657,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2658,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2659,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2660,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2661,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2662,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2663,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2664,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2665,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2666,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2667,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2668,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2669,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2670,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2671,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2672,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2673,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2674,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2675,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2676,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2677,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2678,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2679,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2680,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2681,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2682,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2683,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2684,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2685,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2686,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2687,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2688,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2689,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2690,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2691,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2692,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2693,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2694,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2695,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2696,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2697,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2698,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2699,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2700,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2701,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2702,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2703,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2704,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2705,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2706,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2707,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2708,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2709,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2710,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2711,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2712,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2713,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2714,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2715,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2716,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2717,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2718,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2719,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2720,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2721,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2722,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2723,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2724,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2725,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2726,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2727,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2728,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2729,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2730,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2731,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2732,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2733,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2734,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2735,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2736,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2737,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2738,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2739,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2740,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2741,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2742,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2743,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2744,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2745,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2746,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2747,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2748,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2749,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2750,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2751,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2752,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2753,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2754,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2755,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2756,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2757,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2758,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2759,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2760,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2761,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2762,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2763,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2764,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2765,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2766,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2767,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2768,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2769,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2770,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2771,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2772,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2773,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2774,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2775,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2776,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2777,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2778,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2779,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2780,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2781,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2782,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2783,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2784,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2785,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2786,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2787,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2788,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2789,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2790,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2791,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2792,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2793,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2794,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2795,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2796,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2797,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2798,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2799,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2800,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2801,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2802,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2803,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2804,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2805,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2806,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2807,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2808,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2809,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2810,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2811,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2812,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2813,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2814,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2815,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2816,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2817,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2818,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2819,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2820,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2821,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2822,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2823,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2824,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2825,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2826,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2827,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2828,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2829,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2830,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2831,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2832,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2833,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2834,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2835,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2836,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2837,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2838,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2839,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2840,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2841,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2842,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2843,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2844,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2845,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2846,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2847,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2848,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2849,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2850,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2851,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2852,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2853,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2854,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2855,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2856,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2857,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2858,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2859,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2860,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2861,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2862,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2863,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2864,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2865,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2866,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2867,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2868,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2869,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2870,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2871,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2872,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2873,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2874,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2875,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2876,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2877,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2878,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2879,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2880,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2881,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2882,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2883,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2884,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2885,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2886,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2887,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2888,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2889,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2890,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2891,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2892,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2893,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2894,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2895,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2896,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2897,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2898,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2899,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2900,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2901,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2902,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2903,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2904,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2905,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2906,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2907,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2908,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2909,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2910,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2911,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2912,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2913,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2914,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2915,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2916,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2917,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2918,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2919,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2920,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2921,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2922,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2923,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2924,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2925,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2926,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2927,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2928,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2929,'MEIN ACCOUNT LOGIN]</spa',NULL,NULL),(2930,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2931,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2932,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2933,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2934,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2935,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2936,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2937,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2938,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2939,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2940,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2941,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2942,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2943,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2944,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2945,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2946,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2947,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2948,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2949,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2950,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2951,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2952,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2953,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2954,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2955,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2956,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2957,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2958,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2959,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2960,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2961,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2962,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2963,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2964,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2965,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2966,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2967,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2968,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2969,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2970,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2971,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2972,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2973,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2974,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2975,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2976,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2977,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2978,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2979,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2980,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2981,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2982,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2983,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2984,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2985,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2986,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2987,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2988,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2989,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2990,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2991,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2992,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2993,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2994,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2995,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2996,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2997,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2998,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(2999,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3000,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3001,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3002,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3003,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3004,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3005,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3006,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3007,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3008,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3009,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3010,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3011,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3012,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3013,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3014,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3015,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3016,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3017,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3018,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3019,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3020,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3021,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3022,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3023,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3024,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3025,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3026,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3027,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3028,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3029,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3030,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3031,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3032,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3033,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3034,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3035,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3036,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3037,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3038,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3039,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3040,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3041,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3042,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3043,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3044,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3045,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3046,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3047,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3048,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3049,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3050,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3051,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3052,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3053,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3054,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3055,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3056,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3057,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3058,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3059,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3060,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3061,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3062,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3063,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3064,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3065,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3066,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3067,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3068,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3069,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3070,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3071,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3072,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3073,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3074,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3075,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3076,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3077,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3078,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3079,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3080,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3081,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3082,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3083,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3084,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3085,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3086,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3087,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3088,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3089,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3090,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3091,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3092,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3093,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3094,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3095,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3096,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3097,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3098,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3099,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3100,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3101,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3102,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3103,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3104,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3105,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3106,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3107,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3108,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3109,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3110,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3111,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3112,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3113,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3114,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3115,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3116,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3117,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3118,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3119,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3120,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3121,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3122,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3123,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3124,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3125,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3126,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3127,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3128,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3129,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3130,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3131,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3132,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3133,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3134,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3135,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3136,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3137,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3138,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3139,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3140,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3141,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3142,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3143,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3144,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3145,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3146,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3147,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3148,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3149,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3150,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3151,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3152,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3153,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3154,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3155,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3156,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3157,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3158,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3159,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3160,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3161,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3162,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3163,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3164,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3165,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3166,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3167,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3168,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3169,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3170,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3171,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3172,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3173,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3174,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3175,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3176,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3177,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3178,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3179,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3180,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3181,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3182,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3183,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3184,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3185,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3186,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3187,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3188,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3189,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3190,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3191,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3192,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3193,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3194,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3195,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3196,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3197,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3198,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3199,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3200,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3201,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3202,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3203,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3204,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3205,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3206,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3207,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3208,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3209,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3210,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3211,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3212,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3213,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3214,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3215,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3216,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3217,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3218,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3219,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3220,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3221,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3222,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3223,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3224,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3225,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3226,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3227,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3228,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3229,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3230,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3231,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3232,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3233,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3234,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3235,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3236,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3237,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3238,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3239,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3240,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3241,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3242,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3243,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3244,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3245,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3246,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3247,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3248,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3249,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3250,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3251,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3252,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3253,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3254,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3255,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3256,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3257,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3258,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3259,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3260,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3261,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3262,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3263,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3264,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3265,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3266,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3267,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3268,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3269,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3270,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3271,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3272,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3273,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3274,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3275,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3276,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3277,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3278,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3279,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3280,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3281,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3282,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3283,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3284,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3285,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3286,'MEIN ACCOUNT LOGIN]</sp',NULL,NULL),(3287,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3288,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3289,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3290,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3291,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3292,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3293,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3294,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3295,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3296,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3297,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3298,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3299,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3300,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3301,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3302,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3303,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3304,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3305,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3306,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3307,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3308,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3309,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3310,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3311,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3312,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3313,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3314,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3315,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3316,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3317,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3318,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3319,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3320,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3321,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3322,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3323,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3324,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3325,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3326,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3327,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3328,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3329,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3330,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3331,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3332,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3333,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3334,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3335,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3336,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3337,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3338,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3339,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3340,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3341,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3342,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3343,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3344,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3345,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3346,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3347,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3348,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3349,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3350,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3351,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3352,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3353,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3354,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3355,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3356,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3357,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3358,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3359,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3360,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3361,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3362,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3363,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3364,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3365,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3366,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3367,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3368,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3369,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3370,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3371,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3372,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3373,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3374,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3375,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3376,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3377,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3378,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3379,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3380,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3381,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3382,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3383,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3384,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3385,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3386,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3387,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3388,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3389,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3390,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3391,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3392,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3393,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3394,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3395,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3396,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3397,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3398,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3399,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3400,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3401,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3402,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3403,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3404,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3405,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3406,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3407,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3408,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3409,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3410,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3411,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3412,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3413,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3414,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3415,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3416,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3417,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3418,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3419,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3420,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3421,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3422,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3423,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3424,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3425,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3426,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3427,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3428,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3429,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3430,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3431,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3432,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3433,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3434,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3435,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3436,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3437,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3438,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3439,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3440,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3441,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3442,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3443,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3444,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3445,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3446,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3447,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3448,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3449,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3450,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3451,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3452,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3453,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3454,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3455,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3456,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3457,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3458,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3459,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3460,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3461,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3462,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3463,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3464,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3465,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3466,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3467,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3468,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3469,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3470,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3471,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3472,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3473,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3474,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3475,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3476,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3477,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3478,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3479,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3480,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3481,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3482,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3483,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3484,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3485,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3486,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3487,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3488,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3489,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3490,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3491,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3492,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3493,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3494,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3495,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3496,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3497,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3498,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3499,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3500,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3501,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3502,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3503,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3504,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3505,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3506,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3507,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3508,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3509,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3510,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3511,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3512,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3513,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3514,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3515,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3516,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3517,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3518,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3519,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3520,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3521,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3522,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3523,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3524,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3525,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3526,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3527,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3528,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3529,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3530,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3531,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3532,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3533,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3534,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3535,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3536,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3537,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3538,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3539,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3540,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3541,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3542,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3543,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3544,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3545,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3546,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3547,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3548,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3549,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3550,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3551,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3552,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3553,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3554,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3555,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3556,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3557,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3558,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3559,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3560,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3561,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3562,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3563,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3564,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3565,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3566,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3567,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3568,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3569,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3570,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3571,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3572,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3573,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3574,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3575,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3576,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3577,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3578,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3579,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3580,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3581,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3582,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3583,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3584,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3585,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3586,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3587,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3588,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3589,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3590,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3591,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3592,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3593,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3594,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3595,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3596,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3597,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3598,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3599,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3600,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3601,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3602,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3603,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3604,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3605,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3606,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3607,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3608,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3609,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3610,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3611,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3612,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3613,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3614,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3615,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3616,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3617,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3618,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3619,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3620,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3621,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3622,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3623,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3624,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3625,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3626,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3627,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3628,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3629,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3630,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3631,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3632,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3633,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3634,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3635,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3636,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3637,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3638,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3639,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3640,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3641,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3642,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3643,'MEIN ACCOUNT LOGIN]</s',NULL,NULL),(3644,'MEIN ACCOUNT LOGIN',NULL,NULL),(3645,'Registrierter Kunde',NULL,NULL),(3646,'Neukunde',NULL,NULL),(3647,'MEIN ACCOUNT',NULL,NULL),(3648,'ABMELDEN','LOG OUT',NULL),(3649,'Produkt \r\n						Suche',NULL,NULL),(3650,'KATALOG NUMMER',NULL,NULL),(3651,'Produkt einem Freund empfehlen',NULL,NULL),(3652,'Für Produktneugkeiten anmelden',NULL,NULL),(3653,'Seite ausdrucken',NULL,NULL),(3654,'Emailbenachrichtung bei Lieferbarkeit aktivieren',NULL,NULL),(3655,'Ihre Anfrage wurde erfolgreich gespiechert!',NULL,NULL),(3656,'Warenkorb Step',NULL,NULL),(3657,'UID',NULL,NULL),(3658,'Produkt speichern',NULL,NULL),(3659,'Rückruf',NULL,NULL),(3660,'Email bei Lieferbarkeit aktivieren',NULL,NULL),(3661,'Bookmark Liste',NULL,NULL),(3662,'Bookmark wurde bereits gespeichert!',NULL,NULL),(3663,'Bookmark wurde erfolgreich gelöscht!',NULL,NULL),(3664,'pruductQuery',NULL,NULL),(3665,'Hauptseite',NULL,NULL),(3666,'BESTEHENDES KUNDENKONTO',NULL,NULL),(3667,'NEUES \r\n					KUNDENKONTO ANLEGEN',NULL,NULL),(3668,'PASSWORT VERGESSEN',NULL,NULL),(3669,'NEUES KUNDENKONTO\r\n                                ANLEGEN',NULL,NULL),(3670,'Sie sind angemeldet! Bitte zuerst abmelden!',NULL,NULL),(3671,'Produkt\r\n                                            einem Freund empfehlen',NULL,NULL),(3672,'Seite\r\n                                            ausdrucken',NULL,NULL),(3673,'MEIN\r\n                            ACCOUNT LOGIN',NULL,NULL),(3674,'Ihre Anmeldedaten sind nicht korrekt!',NULL,NULL),(3675,'ChangeEmail',NULL,NULL),(3676,'Das Passwort muss 6 Zeichen lang sein!',NULL,NULL),(3677,'Tipp: \'%\' und \'*\' sind als Sonderzeichen nicht erlaubt!',NULL,NULL),(3678,'Convert',NULL,NULL),(3679,'AR',NULL,NULL),(3680,'Produktsuche',NULL,NULL),(3681,'Ihre Suche hat leider keine Ergebnisse gebracht!',NULL,NULL),(3682,'KATALOG \r\n							NUMMER',NULL,NULL),(3683,'KATALOG \r\n						NUMMER',NULL,NULL),(3684,'Warenkorb aktualisieren',NULL,NULL),(3685,'weiter suchen',NULL,NULL),(3686,'bestellen',NULL,NULL),(3687,'Bestellung ändern',NULL,NULL),(3688,'NEUES KUNDENKONTO ANLEGEN',NULL,NULL),(3689,'Hauptadresse',NULL,NULL),(3690,'Registrierter \r\n										Kunde',NULL,NULL),(3691,'Registrierter \r\n							Kunde',NULL,NULL),(3692,'MEIN \r\n					ACCOUNT LOGIN',NULL,NULL),(3693,'Suche...',NULL,NULL),(3694,'Wichtig: Bitte eine Selektion in den Komboboxen in der Artikel Detailseite vornehmen! ',NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `ofdictionarysets` */

DROP TABLE IF EXISTS `ofdictionarysets`;

CREATE TABLE `ofdictionarysets` (
  `CHARSET` varchar(10) NOT NULL,
  `SET` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CHARSET`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ofdictionarysets` */

LOCK TABLES `ofdictionarysets` WRITE;

insert  into `ofdictionarysets`(`CHARSET`,`SET`) values ('CYRASCII','àáâãäåæçèéêëìíîïðñòóôõö÷øùúüþÿÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÜÞß'),('CYRUNICODE','????????????????????????????????????????????????????????????'),('ENG','abvgdejziyklmnoprstufhc\'-$wx*qABVGDEJZIYKLMNOPRSTUFHC46?WXµQ');

UNLOCK TABLES;

/*Table structure for table `ofdokumente` */

DROP TABLE IF EXISTS `ofdokumente`;

CREATE TABLE `ofdokumente` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `DokumenteName` varchar(255) NOT NULL,
  `TabelleName` varchar(50) NOT NULL,
  `FilterString` varchar(50) NOT NULL,
  `ErstelltAm` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ofdokumente` */

LOCK TABLES `ofdokumente` WRITE;

UNLOCK TABLES;

/*Table structure for table `offotos` */

DROP TABLE IF EXISTS `offotos`;

CREATE TABLE `offotos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TabelleName` varchar(50) DEFAULT NULL,
  `Filter` varchar(50) DEFAULT NULL,
  `FotoName` varchar(50) DEFAULT NULL,
  `FotoLink` mediumtext,
  `ErstelltAm` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `offotos` */

LOCK TABLES `offotos` WRITE;

insert  into `offotos`(`ID`,`TabelleName`,`Filter`,`FotoName`,`FotoLink`,`ErstelltAm`) values (1,'grArtikel','ArtNR=0',NULL,'Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\skins\\skin_ptec\\productImages\\carat_02b.jpg#Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\skins\\skin_ptec\\productImages\\carat_02b.jpg#','2009-05-30 00:00:00'),(3,'grArtikel','ArtNR=0',NULL,'Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\skins\\skin_ptec\\productImages\\carat_03.jpg#Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\skins\\skin_ptec\\productImages\\carat_03.jpg#','2009-05-30 00:00:00'),(4,'grArtikel','ArtNR=0',NULL,'Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\productImages\\501956.jpg#Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\productImages\\501956.jpg#','2009-05-19 00:00:00'),(5,'grArtikel','ArtNR=5',NULL,'Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\skins\\skin_arfaian_2009\\productImages\\challenger_I.gif#Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\skins\\skin_arfaian_2009\\productImages\\challenger_I.gif#','2009-06-01 00:00:00'),(6,'grArtikel','ArtNR=6',NULL,'Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\skins\\skin_nca\\productImages\\ptec_koffer.jpg#Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\skins\\skin_nca\\productImages\\ptec_koffer.jpg#','2009-07-17 00:00:00'),(7,'grArtikel-Kategorien','ArtKatNr=0',NULL,'Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\skins\\skin_nca\\productImages\\ptec_koffer.jpg#Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\skins\\skin_nca\\productImages\\ptec_koffer.jpg#','2009-07-21 00:00:00'),(8,'grArtikel','ArtNR=9',NULL,'Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\skins\\skin_nca\\productImages\\ptec_koffer.jpg#Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\skins\\skin_nca\\productImages\\ptec_koffer.jpg#','2009-07-21 00:00:00'),(10,'grArtikel','ArtNR=5',NULL,'Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\skins\\skin_nca\\productImages\\ptec_koffer.gif#Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\skins\\skin_nca\\productImages\\ptec_koffer.gif#','2009-07-21 00:00:00');

UNLOCK TABLES;

/*Table structure for table `ofkorespondenz` */

DROP TABLE IF EXISTS `ofkorespondenz`;

CREATE TABLE `ofkorespondenz` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `IDNR` int(10) DEFAULT NULL,
  `Datum` datetime DEFAULT NULL,
  `Subjekt` varchar(50) DEFAULT NULL,
  `Text` longtext,
  `Status` varchar(50) DEFAULT NULL,
  `Vorlage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDNR` (`IDNR`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

/*Data for the table `ofkorespondenz` */

LOCK TABLES `ofkorespondenz` WRITE;

insert  into `ofkorespondenz`(`ID`,`IDNR`,`Datum`,`Subjekt`,`Text`,`Status`,`Vorlage`) values (78,1229,'2009-02-07 23:19:06','RMA Request #1','RMA Request # 1\n\rBestellnummer: AU2009080063\n\rArtNr: \n\rUrsache: Produkt defekt\n\rFrom: \n\rTel: \n\rMailtext/Notiz: grigor.tonkov@gmx.at, Bitte erledigen Sie das folgende Problem mit Produkt #5105:\n\rDiese Anforderung finden Sie auch in der Tabelle ofKorrespondenz und Form Korrespondenz.',NULL,NULL),(79,1229,'2009-02-07 23:19:59','RMA Request #79','RMA Request # 79\n\r\nBestellnummer: AU2009080063\n\r\nArtNr: \n\r\nUrsache: Produkt defekt\n\r\nFrom: \n\r\nTel: \n\r\nMailtext/Notiz: grigor.tonkov@gmx.at, Bitte erledigen Sie das folgende Problem mit Produkt #5105:\n\r\nDiese Anforderung finden Sie auch in der Tabelle ofKorrespondenz und Form Korrespondenz.',NULL,NULL),(80,1,NULL,'Request #80',' Request # 80\r\n JobDescription: Request `EmailBeiLieferbarkeit` about Order # , Product # 1023\r\n From: \r\n Tel: \r\n Mail: grigor.tonkov@gmx.at',NULL,NULL),(81,1,'2009-02-15 19:46:33','Request #81',' Request # 81\r\n JobDescription: Request `EmailBeiLieferbarkeit` about Order # , Product # 1023\r\n From: \r\n Tel: \r\n Mail: grigor.tonkov@gmx.at',NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `ofmitarbeiter` */

DROP TABLE IF EXISTS `ofmitarbeiter`;

CREATE TABLE `ofmitarbeiter` (
  `IDNR` int(10) NOT NULL AUTO_INCREMENT,
  `Position` varchar(50) DEFAULT NULL,
  `Anrede` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Vorname` varchar(50) DEFAULT NULL,
  `Geschlecht` varchar(1) DEFAULT NULL,
  `Adresse` varchar(50) DEFAULT NULL,
  `Land` int(10) DEFAULT NULL,
  `PLZ` varchar(10) DEFAULT NULL,
  `Ort` varchar(50) DEFAULT NULL,
  `TelPrivat` varchar(50) DEFAULT NULL,
  `TelFirma` varchar(50) DEFAULT NULL,
  `FaxFirma` varchar(50) DEFAULT NULL,
  `Mobil` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `SVN` varchar(50) DEFAULT NULL,
  `BankNr` int(10) DEFAULT NULL,
  `KontoNr` varchar(50) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Passwort` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDNR`),
  KEY `IDNR1` (`IDNR`),
  KEY `Name` (`Name`),
  KEY `ofMitarbeiterAnrede` (`Anrede`),
  KEY `ofMitarbeiterBankNr` (`BankNr`),
  KEY `PLZ` (`PLZ`),
  KEY `Vorname` (`Vorname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `ofmitarbeiter` */

LOCK TABLES `ofmitarbeiter` WRITE;

insert  into `ofmitarbeiter`(`IDNR`,`Position`,`Anrede`,`Name`,`Vorname`,`Geschlecht`,`Adresse`,`Land`,`PLZ`,`Ort`,`TelPrivat`,`TelFirma`,`FaxFirma`,`Mobil`,`Email`,`SVN`,`BankNr`,`KontoNr`,`Username`,`Passwort`) values (2,'NO Dealer','Herr Dr.','Tonkov','Grigor','m',NULL,43,'1060',NULL,NULL,NULL,NULL,NULL,'test@test.at',NULL,1,NULL,'GT','GT');

UNLOCK TABLES;

/*Table structure for table `oftermine` */

DROP TABLE IF EXISTS `oftermine`;

CREATE TABLE `oftermine` (
  `AnrufNr` int(10) NOT NULL,
  `Datum` datetime DEFAULT NULL,
  `MaAusen` int(10) DEFAULT NULL,
  `MaInnen` int(10) DEFAULT NULL,
  `TerminText` varchar(50) DEFAULT NULL,
  `AdrNr` int(10) DEFAULT NULL,
  `Termin` datetime DEFAULT NULL,
  `WiederVorlage` datetime DEFAULT NULL,
  PRIMARY KEY (`AnrufNr`),
  KEY `ofAdressenofTermine` (`AdrNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oftermine` */

LOCK TABLES `oftermine` WRITE;

insert  into `oftermine`(`AnrufNr`,`Datum`,`MaAusen`,`MaInnen`,`TerminText`,`AdrNr`,`Termin`,`WiederVorlage`) values (0,'2002-04-21 00:00:00',2,2,'Testtermin',1,'2002-04-21 00:00:00','2002-04-21 00:00:00');

UNLOCK TABLES;

/*Table structure for table `oftips` */

DROP TABLE IF EXISTS `oftips`;

CREATE TABLE `oftips` (
  `TipId` int(10) NOT NULL AUTO_INCREMENT,
  `TipName` varchar(50) DEFAULT NULL,
  `Description` longtext,
  `DoNotShowAnymore` tinyint(1) NOT NULL,
  PRIMARY KEY (`TipId`),
  KEY `TipId` (`TipId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `oftips` */

LOCK TABLES `oftips` WRITE;

insert  into `oftips`(`TipId`,`TipName`,`Description`,`DoNotShowAnymore`) values (1,'FORM_KUNDEN','Erfassen Sie Kunden, Rechnungen, Lieferscheine und Aufträge hier!',-1),(2,'FORM_LIEFERANTEN','Verwalten Sie die Lieferanten hier! Speichern Sie die Adressen Ihre Lieferanten hier!',-1),(3,'FORM_ARTIKEL','Verwalten Sie die Artikel hier!',-1),(4,'WELCOME','Willkommen bei IntraSell! Mit deisem Programm können Sie Kunden und Artikel verwalten, Rechnungen, Lieferscheine, etc. erstellen und ausdrucken. Eine Statistikfunktion steht auch zur Verfühgung.',-1),(5,'PLZ_MISSING','Falls die gesuchte PLZ fehlt, geben Sie eine neue PLZ mit Hilfe dem nebenstehenden Butten ein!',-1),(6,'YELLOW_HELP','Diese gelbe Zettelchen werden Sie währen Ihrer Arbeit begleiten. Sie können diese Texte auch erweitern. Klicken sie auf dem Checkbox, um das System dieses Zettel nicht mehr einzuschalten.',-1),(7,'BAR_VERKAUF_KUNDE_0','Der Kunde, mit KundenNummer 0, ist der Kunde beim welchen die Barverkäufe getätigt werden.',-1),(8,'SET_ARTIKEL_ZUSAMMENSTELLEN','Der Preis eines Setartikel entsteht aus das Zusammenzehlen von den Preise den Subartikeln. Änderung des Preises ist auch möglich.',-1),(9,'ZAHLUNGSBEDINGUNGEN_KUNDE','Da können Sie einstelen welche Zahlungsbedingungen diesem Kunden erlaubt sind. Das wirkt bei der Erstellung einer Rechnung aus!',-1),(10,'GESPRAECH_START_STOP','Benutzen Sie diese Schaltfäche um den Begin- Endszeitpunkt eines Kontaktes mit dem Kunden zu speichern.',-1),(11,'ZAHLUNGSBEDINGUNGEN_KUNDE_NICHT_DEFINIERT','Sie sollten für diesen Kunden Zahlungsbedingungen definieren, sonst werden Sie keine Zahlungbedingungen bei der Rechnungserstellung definieren können!',-1),(12,'RETOURWAREN_LAGERBEWEGUNG','Nachdem Sie einen Retourwaren ausdrucken werden die Artikel als Lagereingang gerechnet.',-1),(13,'LIEFERSCHEIN_LAGERBEWEGUNG','Nachdem Sie einen Lieferschein ausdrucken werden die Artikel als Lagerausgang gerechnet.',-1),(14,'SET_ARTIKEL_ANSICHT','Hier ist nur eine Ansicht allen Setartikeln möglich!',-1),(15,'HOW_TO_MANDANT','Hier können Sie die Datenbank wechseln. Kopieren Sie die bestehende Datenbank, bennen Sie sie richtig und dann wechseln Sie die Datenbank mit Hilfe der Schaltfläche \"ändern\".',-1);

UNLOCK TABLES;

/*Table structure for table `ofvars` */

DROP TABLE IF EXISTS `ofvars`;

CREATE TABLE `ofvars` (
  `Id` int(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Wert` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `Id` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ofvars` */

LOCK TABLES `ofvars` WRITE;

insert  into `ofvars`(`Id`,`Name`,`Wert`) values (1,'ADMIN','WebShop'),(2,'ADMINPASS','123'),(322,'ADMIN_EMAIL','admin@arfaian.com'),(121,'ALLOW_PURCHASING_ONLY_FOR_CUSTOMERS','FALSE'),(3,'AnzahlAusdruecke','1'),(4,'Auftragannehmer','9'),(5,'Bank','11000'),(6,'BenutzeEAN','TRUE'),(87,'BenutzeImageResize','TRUE'),(51,'BLZ','11000'),(86,'Branche','0'),(317,'CALCULATE_CHANGE_DESTINATION','TRUE'),(122,'CALCULATE_MIN_ORDER_VALUE','100'),(82,'CALCULATE_PAYMODECOSTS','TRUE'),(81,'CALCULATE_POSTCOSTS','TRUE'),(30,'COMPANY_FULL_NAME','Ihre Firma test'),(31,'COMPANY_LOGO_IMAGE','company.gif'),(100,'DBTYPE','MySQL'),(207,'DB_CONN_STRING','driver={MySQL ODBC 5.1 Driver};DATABASE=IntraSell_Daten_2;SERVER=localhost;USER=root;PASSWORD=a1060'),(407,'DB_DATA_FILENAME',''),(119,'DB_FOLDER','c:\\interdel\\IntraSell_Daten_2.mdb'),(77,'DB_MASTER_FILENAME','IntraSell_Daten_2.06.mdb'),(203,'DB_NAME','IntraSell_Daten_2'),(78,'DB_ONLINE_FILENAME','IntraSell_Daten_2.06_replicat.mdb'),(206,'DB_PASS','a1060'),(204,'DB_SERVER_NAME','localhost'),(205,'DB_USER','root'),(98,'DEFAULT_LAND_NR','43'),(340,'DEFAULT_PAYMODE','Nachnahme'),(341,'DEFAULT_POSTMODE','Express'),(342,'DEFAULT_POSTMODE_DESTINATION','AT'),(92,'DEFAULT_SHOP_LAND','AT'),(201,'DEFAULT_SHOP_LANGUAGE','DEU'),(32,'DOMAIN','IhreFirma.at'),(7,'Email','arfaian@arfaian.com'),(33,'EMAIL_AUTOCONFIRM','arfaian@arfaian.com'),(85,'EMAIL_REGISTER','register@ihreFirma.at'),(34,'EMAIL_SALE','arfaian@arfaian.com'),(8,'etbBranche',NULL),(9,'etbDir','C:\\Business\\Branchenbuch\\ETB\\ADRESSEN\\gasthof\\'),(10,'Eurokurs','13,7603'),(11,'Fax','+43/676/1231231'),(12,'Firma','Arfaian'),(403,'FTP_SERVER','92.51.141.139'),(404,'FTP_SERVER_PATH','skin_nca/productImages'),(405,'FTP_USER','Josef'),(406,'FTP_USER_PASS','Hannah'),(140,'GLS_EXPORT_FILENAME','z:\\intrasell2gls.csv'),(35,'itallCategoryMapping','JA'),(13,'Konto','123-123-123'),(14,'korrekt_Dir','d:\\business\\branchenbuch\\korrekt\\'),(36,'KTO','1234'),(80,'LANGUAGE','ENG'),(202,'LANGUAGE_DOK_','DEU'),(401,'LANGUAGE_DOK_2','ENG'),(402,'LANGUAGE_DOK_3','ENG'),(15,'LastExport','8/31/1998'),(16,'letzteAngebotNummer','2001000003'),(17,'letzteAuftragNummer','2001000030'),(18,'letzteGutschriftNummer','2001000002'),(125,'letzteLieferantAuftragNummer','700643'),(19,'letzteLieferscheinNummer','2001000007'),(1,'letzteNummer_AddInObjects','2'),(137,'letzteNummer_buchAuftrag','705419'),(136,'letzteNummer_buchLieferantAuftrag','705024'),(130,'letzteNummer_buchVorgaengeEigenschaften','158'),(131,'letzteNummer_calcSheet','5747'),(134,'letzteNummer_grArtikel','20002'),(139,'letzteNummer_lagerLagerBuchung','9'),(135,'letzteNummer_lieferantenAdressen','333435'),(133,'letzteNummer_ofAdressen','333474'),(128,'letzteNummer_tradeBoardLieferantenAnfrage','7100535'),(325,'letzteNummer_Translations','91'),(129,'letzteNummer_transportAnfrage','7200415'),(132,'letzteNummer_transportAuftrag','97'),(138,'letzteNummer_transportLieferantGruppe','29'),(127,'letzteNummer_[lieferantenArtikel-Preise]','1'),(20,'letzteRechnungsNummer','2001000095'),(21,'letzteRetourwarenNummer','2001000001'),(22,'letzteRüstscheinNummer','2001000001'),(23,'Lizenzcode','nifAOIGO'),(116,'LOG_FILENAME','c:\\intrasell.log'),(37,'MAILER_COMPONENT_NAME','PERSISTS'),(89,'MIN_UMSATZ_FREI_HAUS','200'),(400,'MSACCESS_VORGANG_BERICHTNAME','buchRechnung_Arfaian_2'),(24,'MWSt','20'),(38,'Ort','Linz'),(25,'Passwort','123'),(67,'PLZ','4020'),(26,'PLZOrt','4020 Linz'),(323,'PLZ_IDNR_AUTONUMBER','FALSE'),(39,'RECHNUNG_FREIER_TEXT ','Vielen Dank!'),(40,'RECHNUNG_FREIER_TEXT_AGB ','Für Lieferungen gelten ausschließlich unsere AGB.'),(41,'REFRESH_INTERVAL','30'),(109,'SHOP_ALLOW_DROPDOWN_SORTING','true'),(108,'SHOP_ALLOW_SORTING','true'),(411,'SHOP_GENERATE_THUMBNAILS','TRUE'),(339,'SHOP_LINK_PAKETVERFOLGUNG','http://www.dhl.at?paketnummer='),(318,'SHOP_PAYPAL_BUSINESS','office@arfaian.com'),(319,'SHOP_PAYPAL_CURRENCY','EUR'),(409,'SHOP_PRODUCTLIST_ROW_COLOR','#C60C30'),(410,'SHOP_PRODUCTLIST_ROW_COLOR_ALT','#CA1C3E'),(417,'SHOP_PRODUCTLIST_SORT','ArtNr'),(412,'SHOP_PRODUCT_IMAGE_BIG_MAX_SIZE','400'),(413,'SHOP_PRODUCT_IMAGE_MIDDLE_MAX_SIZE','200'),(414,'SHOP_PRODUCT_IMAGE_SMALL_MAX_SIZE','100'),(416,'SHOP_PRODUCT_LIST','ArtNr'),(415,'SHOP_PROUCTLIST_SORT','ArtKatNr'),(118,'SHOP_RESULT_LIST_ITEMS_PER_PAGE','20'),(112,'SHOP_SAVE_QUERY','false'),(120,'SHOP_SEARCH_IN_DESCRIPTION','true'),(320,'SHOP_SEND_MAILS_AFTER_ORDER','false'),(200,'SHOP_SHOW_ANGELEGTAM','true'),(123,'SHOP_SHOW_BASKET_VAT_ON_STEP_1','true'),(124,'SHOP_SHOW_BASKET_VAT_ON_STEP_2','true'),(106,'SHOP_SHOW_COMPARE','true'),(107,'SHOP_SHOW_DRUCKEN','true'),(110,'SHOP_SHOW_HERSTELLER','true'),(99,'SHOP_SHOW_LAGERINFO','true'),(105,'SHOP_SHOW_PRICE','true'),(103,'SHOP_SHOW_PRODUCT_DESCRIPTIONS','true'),(111,'SHOP_SHOW_THUMBNAILS','true'),(408,'SHOP_THUMBNAIL_MAX_SIZE','160'),(102,'SHOP_TOPCATPRODUCTS_PRODUCTS_IN_ROW','3'),(324,'SHOP_USER_MUST_ACCEPT_LAW','TRUE'),(336,'SHOP_USE_AUFSCHLAG_KATEGORIE','false'),(321,'SHOP_USE_BRANCHE_ACCOUNT','false'),(114,'SHOP_USE_HIGHLIGHT','false'),(101,'SHOP_USE_LOCAL_THUMBS','false'),(113,'SHOP_USE_RTF_ORDER_PRINT','true'),(115,'SHOP_USE_SORT_IMPORTANCY','false'),(337,'SHOP_USE_STAFFELPREISE','false'),(338,'SHOP_USE_VORKALKULIERTE_VKPREISE','false'),(201,'SHOW_SEND_EMAIL_FOR_EMPTY_SEARCH','FALSE'),(94,'SKINNUMBER','_nca'),(83,'SMTP','localhost'),(84,'STORNO_BUTTON','TRUE'),(27,'Strasse','Fröbelstrasse 24'),(43,'TEL','+43 732 660101'),(28,'Telefon','+43 732 660101'),(96,'TEMPLATE_EXPORT_DIR','Z:\\Business\\IntraSell_System\\IntraSell_WebShop\\skins\\skin_nca\\pages\\'),(45,'UID','000000000'),(88,'VORGANG_TYP_FUER_LAGER_ABGANG','AR'),(97,'WEB_EDITOR_EXECFILE','C:\\Program Files (x86)\\Microsoft Office\\OFFICE11\\FRONTPG.EXE'),(29,'WWW','www.arfaian.com'),(126,'XMLVIEWER','C:\\Programme\\Internet Explorer\\IEXPLORE.EXE');

UNLOCK TABLES;

/*Table structure for table `pricecomparecattophandlers` */

DROP TABLE IF EXISTS `pricecomparecattophandlers`;

CREATE TABLE `pricecomparecattophandlers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `CatID` int(10) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `mandant` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CatID` (`CatID`),
  KEY `id` (`id`),
  KEY `ProductID` (`LieferantNr`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `pricecomparecattophandlers` */

LOCK TABLES `pricecomparecattophandlers` WRITE;

insert  into `pricecomparecattophandlers`(`id`,`CatID`,`LieferantNr`,`mandant`) values (1,0,1,0),(2,0,2,0),(3,0,3,0),(4,0,4,0),(5,3,5,0),(6,3,6,0);

UNLOCK TABLES;

/*Table structure for table `pricecomparehaendler` */

DROP TABLE IF EXISTS `pricecomparehaendler`;

CREATE TABLE `pricecomparehaendler` (
  `LieferantNr` int(10) NOT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Passwort` varchar(50) DEFAULT NULL,
  `PaymentMode` varchar(50) DEFAULT NULL,
  `Stars` int(10) DEFAULT NULL,
  `ftpserver` varchar(50) DEFAULT NULL,
  `ftpusername` varchar(50) DEFAULT NULL,
  `ftppassword` varchar(50) DEFAULT NULL,
  `filename` varchar(50) DEFAULT NULL,
  `parcingrule` varchar(50) DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `deliveryPrice` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LieferantNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pricecomparehaendler` */

LOCK TABLES `pricecomparehaendler` WRITE;

insert  into `pricecomparehaendler`(`LieferantNr`,`UserName`,`Passwort`,`PaymentMode`,`Stars`,`ftpserver`,`ftpusername`,`ftppassword`,`filename`,`parcingrule`,`delivery`,`isActive`,`deliveryPrice`) values (1,NULL,NULL,'middle',5,NULL,NULL,NULL,NULL,NULL,-1,0,NULL),(2,'Intel',NULL,'middle',5,'193.171.36.179','Ivo','Ivo','example_file_for_import.csv',NULL,-1,0,NULL),(3,NULL,NULL,'base',2,NULL,NULL,NULL,NULL,NULL,-1,0,NULL),(4,NULL,NULL,'base',0,NULL,NULL,NULL,NULL,NULL,-1,0,NULL),(5,NULL,NULL,'base',0,NULL,NULL,NULL,NULL,NULL,-1,0,NULL),(6,NULL,NULL,'base',0,NULL,NULL,NULL,NULL,NULL,-1,0,NULL);

UNLOCK TABLES;

/*Table structure for table `pricecomparehaendler_lieferungbedingungen` */

DROP TABLE IF EXISTS `pricecomparehaendler_lieferungbedingungen`;

CREATE TABLE `pricecomparehaendler_lieferungbedingungen` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `IDNR` int(10) DEFAULT NULL,
  `BedingungNr` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`),
  KEY `IDNR` (`IDNR`),
  KEY `ZahlungsModusId` (`BedingungNr`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `pricecomparehaendler_lieferungbedingungen` */

LOCK TABLES `pricecomparehaendler_lieferungbedingungen` WRITE;

insert  into `pricecomparehaendler_lieferungbedingungen`(`ID`,`IDNR`,`BedingungNr`) values (1,1,5),(2,1,3),(3,1,2),(4,1,3),(5,1,4),(6,2,1),(7,2,1),(8,2,2),(9,2,3),(10,2,4),(11,3,3),(12,3,2),(13,3,3);

UNLOCK TABLES;

/*Table structure for table `pricecomparehaendler_services` */

DROP TABLE IF EXISTS `pricecomparehaendler_services`;

CREATE TABLE `pricecomparehaendler_services` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `IDNR` int(10) DEFAULT NULL,
  `ServiceNr` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`),
  KEY `IDNR` (`IDNR`),
  KEY `ZahlungsModusId` (`ServiceNr`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `pricecomparehaendler_services` */

LOCK TABLES `pricecomparehaendler_services` WRITE;

insert  into `pricecomparehaendler_services`(`ID`,`IDNR`,`ServiceNr`) values (1,1,5),(2,1,3),(3,1,2),(4,1,3),(5,1,4),(6,2,5),(7,2,3),(8,2,2),(9,2,3),(10,2,4),(11,3,3),(12,3,2),(13,3,3);

UNLOCK TABLES;

/*Table structure for table `pricecomparehaendlerreviews` */

DROP TABLE IF EXISTS `pricecomparehaendlerreviews`;

CREATE TABLE `pricecomparehaendlerreviews` (
  `ReviewID` int(10) NOT NULL AUTO_INCREMENT,
  `LieferantNr` int(10) DEFAULT NULL,
  `Review` longtext,
  `Autor` varchar(50) DEFAULT NULL,
  `DateCreation` datetime DEFAULT NULL,
  `Points` int(10) DEFAULT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `ReviewID` (`ReviewID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pricecomparehaendlerreviews` */

LOCK TABLES `pricecomparehaendlerreviews` WRITE;

UNLOCK TABLES;

/*Table structure for table `pricecomparelieferantenartikelpreisearchive` */

DROP TABLE IF EXISTS `pricecomparelieferantenartikelpreisearchive`;

CREATE TABLE `pricecomparelieferantenartikelpreisearchive` (
  `PreisId` int(10) NOT NULL AUTO_INCREMENT,
  `ArtikelNr` int(10) DEFAULT NULL,
  `ArtikelNrLieferant` varchar(50) DEFAULT NULL,
  `EKPreis` decimal(19,4) DEFAULT NULL,
  `VKPreis` decimal(19,4) DEFAULT NULL,
  `Rabatt` varchar(50) DEFAULT NULL,
  `PreisDatum` datetime DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  PRIMARY KEY (`PreisId`),
  KEY `PreisId` (`PreisId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `pricecomparelieferantenartikelpreisearchive` */

LOCK TABLES `pricecomparelieferantenartikelpreisearchive` WRITE;

insert  into `pricecomparelieferantenartikelpreisearchive`(`PreisId`,`ArtikelNr`,`ArtikelNrLieferant`,`EKPreis`,`VKPreis`,`Rabatt`,`PreisDatum`,`LieferantNr`) values (1,1001,'1001','123.0000','3.0000','0','2004-01-20 00:00:00',1),(2,1001,'1001','149.0000','5.0000','0','2004-01-20 00:00:00',1),(3,1001,'1001','150.0000','7.0000','0','2004-01-20 00:00:00',1),(4,1001,'1001','111.0000','8.0000','0','2004-01-20 00:00:00',1),(5,1001,'1001','112.0000','9.0000','0','2004-01-20 00:00:00',1),(6,1001,'1001','160.0000','12.0000','0','2004-01-20 00:00:00',1),(12,1001,'1001','160.0000','12.0000','0','2004-01-01 00:00:00',1),(13,1001,'1001','160.0000','3.0000','0','2004-01-05 00:00:00',1),(14,1001,'1001','160.0000','22.0000','0','2004-07-20 00:00:00',1),(15,1001,'1001','160.0000','4.0000','0','2004-01-07 00:00:00',1),(16,1001,'1001','123.0000','14.0000','0','2004-01-20 00:00:00',2),(17,1001,'1001','149.0000','17.0000','0','2004-01-20 00:00:00',2),(18,1001,'1001','150.0000','19.0000','0','2004-01-20 00:00:00',2),(19,1001,'1001','111.0000','20.0000','0','2004-01-20 00:00:00',2),(20,1001,'ABCDF','112.0000','22.0000','0','2004-01-20 00:00:00',2),(21,1001,'1001','160.0000','23.0000','0','2004-01-25 00:00:00',2),(22,1001,'ABCDF','160.0000','22.0000','0','2004-01-30 00:00:00',2),(23,1001,'ABCDF','160.0000','10.0000','0','2002-07-20 00:00:00',2),(24,1001,'ABCDF','160.0000','11.0000','0','2003-07-20 00:00:00',2),(25,1001,'ABCDF','160.0000','15.0000','0','2004-01-20 00:00:00',2),(26,1017,NULL,NULL,'1000.0000','0','2004-04-24 00:00:00',6);

UNLOCK TABLES;

/*Table structure for table `pricecomparenextplz` */

DROP TABLE IF EXISTS `pricecomparenextplz`;

CREATE TABLE `pricecomparenextplz` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PLZID` int(10) DEFAULT NULL,
  `NextPLZID` int(10) DEFAULT NULL,
  `Distance` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`),
  KEY `NextPLZID` (`NextPLZID`),
  KEY `PLZID` (`PLZID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pricecomparenextplz` */

LOCK TABLES `pricecomparenextplz` WRITE;

UNLOCK TABLES;

/*Table structure for table `pricecomparepriceclicks` */

DROP TABLE IF EXISTS `pricecomparepriceclicks`;

CREATE TABLE `pricecomparepriceclicks` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Timestamp` datetime DEFAULT NULL,
  `ArtNr` int(10) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `ArtikelPreis` varchar(50) DEFAULT NULL,
  `ArtikelLagerinfo` varchar(50) DEFAULT NULL,
  `Erfolgreich` tinyint(1) NOT NULL,
  `IPAdress` varchar(50) DEFAULT NULL,
  `Browser` varchar(50) DEFAULT NULL,
  `Aufloesung` varchar(50) DEFAULT NULL,
  `Domain` varchar(50) DEFAULT NULL,
  `PATH_TRANSLATED` varchar(200) DEFAULT NULL,
  `REMOTE_ADDR` varchar(100) DEFAULT NULL,
  `REMOTE_HOST` varchar(100) DEFAULT NULL,
  `REMOTE_USER` varchar(100) DEFAULT NULL,
  `HTTP_REFERER` varchar(255) DEFAULT NULL,
  `Abgerechnet` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `pricecomparepriceclicks` */

LOCK TABLES `pricecomparepriceclicks` WRITE;

insert  into `pricecomparepriceclicks`(`Id`,`Timestamp`,`ArtNr`,`LieferantNr`,`ArtikelPreis`,`ArtikelLagerinfo`,`Erfolgreich`,`IPAdress`,`Browser`,`Aufloesung`,`Domain`,`PATH_TRANSLATED`,`REMOTE_ADDR`,`REMOTE_HOST`,`REMOTE_USER`,`HTTP_REFERER`,`Abgerechnet`) values (1,'2004-02-01 22:54:10',1001,3,'1452',NULL,-1,NULL,NULL,NULL,NULL,NULL,'127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/webshop/default.asp?ArtNr=1017',0),(2,'2004-02-01 22:55:28',1001,3,'1452',NULL,-1,NULL,NULL,NULL,NULL,NULL,'127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/webshop/default.asp?ArtNr=1017',0),(3,'2004-02-01 23:36:36',1001,3,'1452',NULL,-1,NULL,NULL,NULL,NULL,NULL,'127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/webshop/default.asp?ArtNr=1017',0),(4,'2004-02-01 23:36:44',1001,3,'1452',NULL,-1,NULL,NULL,NULL,NULL,NULL,'127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/webshop/default.asp?ArtNr=1017',0),(5,'2004-02-01 23:36:47',1001,3,'1452',NULL,-1,NULL,NULL,NULL,NULL,NULL,'127.0.0.1 ','127.0.0.1','VEGSYS\\Grigor','http://localhost/webshop/default.asp?ArtNr=1017',0),(6,'2004-04-28 00:00:00',1017,3,'1210',NULL,-1,NULL,NULL,NULL,NULL,NULL,'127.0.0.1 ','127.0.0.1','DPAT\\gt00537','http://localhost/webshop/default.asp?ArtNr=1017',0);

UNLOCK TABLES;

/*Table structure for table `statistik_austria_warengruppen` */

DROP TABLE IF EXISTS `statistik_austria_warengruppen`;

CREATE TABLE `statistik_austria_warengruppen` (
  `ArtNr` int(10) NOT NULL,
  `Warennr` varchar(255) DEFAULT NULL,
  `Gewicht` double(15,5) DEFAULT NULL,
  PRIMARY KEY (`ArtNr`),
  KEY `Warennr` (`Warennr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `statistik_austria_warengruppen` */

LOCK TABLES `statistik_austria_warengruppen` WRITE;

insert  into `statistik_austria_warengruppen`(`ArtNr`,`Warennr`,`Gewicht`) values (1,'9506 5900',0.00000),(2,'9506 5900',0.00000),(3,'9506 5900',0.00000),(4,'N.A.',1.00000),(5,'9506 6100',0.00000),(6,'xxxx 3323',0.00000),(7,'N.A.',0.00000),(8,'N.A.',0.00000),(9,'N.A.',0.00000),(10,'N.A.',0.00000),(1000,'9506 6100',0.00000),(1004,'N.A.',1.00000),(1005,'N.A.',1.00000),(1006,'N.A.',1.00000),(1007,'N.A.',1.00000);

UNLOCK TABLES;

/*Table structure for table `statistik_austria_warengruppen_uebersicht` */

DROP TABLE IF EXISTS `statistik_austria_warengruppen_uebersicht`;

CREATE TABLE `statistik_austria_warengruppen_uebersicht` (
  `Warennr` varchar(255) NOT NULL,
  `Bezeichnung` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Warennr`),
  KEY `Warennr` (`Warennr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `statistik_austria_warengruppen_uebersicht` */

LOCK TABLES `statistik_austria_warengruppen_uebersicht` WRITE;

insert  into `statistik_austria_warengruppen_uebersicht`(`Warennr`,`Bezeichnung`) values ('3916 9019','Tennis-, Squash- u. Badminotnseiten'),('3921 1310','3921 1310'),('4202 9291','4202 9291'),('4819 1000','4819 1000'),('4911 1010','4911 1010'),('6109 1000','6109 1000'),('6117 8010','6117 8010'),('7326 9097','7326 9097'),('8205 7000','8205 7000'),('8479 8998','8479 8998'),('9506 5100','9506 5100'),('9506 5900','9506 5900'),('9506 6100','9506 6100'),('9506 9990','9506 9990'),('N.A',NULL),('N.A.','ohne Zuordnung'),('xxxx 3323','xxxx 3323'),('xxxx 3333','xxxx 3333');

UNLOCK TABLES;

/*Table structure for table `tradeboardchecklist` */

DROP TABLE IF EXISTS `tradeboardchecklist`;

CREATE TABLE `tradeboardchecklist` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Pos` int(10) DEFAULT NULL,
  `AuftragNr` int(10) DEFAULT NULL,
  `Aufgabe` varchar(50) DEFAULT NULL,
  `Erledigt` tinyint(1) DEFAULT NULL,
  `MitarbeiterNr` int(10) DEFAULT NULL,
  `ErstelltAm` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unique_check` (`AuftragNr`,`Aufgabe`),
  KEY `Aufgabe` (`Aufgabe`),
  KEY `AuftragNr` (`AuftragNr`),
  KEY `MitarbeiterNr` (`MitarbeiterNr`),
  CONSTRAINT `tradeboardchecklist_ibfk_1` FOREIGN KEY (`MitarbeiterNr`) REFERENCES `ofmitarbeiter` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardchecklist_ibfk_2` FOREIGN KEY (`AuftragNr`) REFERENCES `buchauftrag` (`Nummer`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardchecklist_ibfk_3` FOREIGN KEY (`MitarbeiterNr`) REFERENCES `ofmitarbeiter` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardchecklist_ibfk_4` FOREIGN KEY (`AuftragNr`) REFERENCES `buchauftrag` (`Nummer`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tradeboardchecklist` */

LOCK TABLES `tradeboardchecklist` WRITE;

UNLOCK TABLES;

/*Table structure for table `tradeboardchecks` */

DROP TABLE IF EXISTS `tradeboardchecks`;

CREATE TABLE `tradeboardchecks` (
  `Nummer` int(10) NOT NULL,
  `Aufgabe` varchar(255) DEFAULT NULL,
  `Pos` int(10) DEFAULT NULL,
  `Geschaeftstyp` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Nummer`),
  KEY `Aufgabe` (`Aufgabe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tradeboardchecks` */

LOCK TABLES `tradeboardchecks` WRITE;

insert  into `tradeboardchecks`(`Nummer`,`Aufgabe`,`Pos`,`Geschaeftstyp`) values (1,'INTERDEL INVOICE',1,'EU'),(2,'TIR Carnet',2,'EU'),(3,'Veterinary certificate',3,'EU'),(4,'Certificate of origin',4,'EU'),(5,'Certificate of conformity',5,'EU'),(6,'Certificate of quality',6,'EU'),(7,'Packing list Net/Gross/Tara weight',7,'EU'),(8,'Label with Net/Gross weight',8,'EU'),(9,'Export Declaration',9,'EU'),(100,'Contract Interdel – client / Contract retourned from client',0,'CHECK_ENG'),(101,'Contract Interdel – seller / Contract retourned from seller',1,'CHECK_ENG'),(102,'Negotiations with transport company',2,'CHECK_ENG'),(103,'Sending of loading instructions to transport company',3,'CHECK_ENG'),(104,'Confirmation from transport company retourned',4,'CHECK_ENG'),(105,'Pro Forma invoice to Client',5,'CHECK_ENG'),(106,'Obtaining of Loading instructions from Client',6,'CHECK_ENG'),(107,'Providing of Loading instructions to Seller',7,'CHECK_ENG'),(108,'Receiving of loading documents for checking',8,'CHECK_ENG'),(109,'Receiving of prepayment – if prepaiment is agreed (before the loading starts)',9,'CHECK_ENG'),(110,'Sending the loading documents to Client/getting approval from Client',10,'CHECK_ENG'),(111,'Receipt of invoice and delivery note from seller',11,'CHECK_ENG'),(112,'Delivery note from Interdel which goes with the truck',12,'CHECK_ENG'),(113,'Invoice done',13,'CHECK_ENG'),(114,'Truck is allowed to go',14,'CHECK_ENG'),(115,'CMR + Export declaration confirmed retourned by Client',15,'CHECK_ENG'),(201,'Kontrakt - Käufer gefaxt / retour',1,'CHECK_DE'),(202,'EK – Bestätigung gefaxt / retour',2,'CHECK_DE'),(203,'Transportorganisation (falls notwendig)',3,'CHECK_DE'),(204,'LKW – Bestellung/Loading instructions',4,'CHECK_DE'),(205,'LKW – Best – Bestätigt retour',5,'CHECK_DE'),(206,'Pro Forma',6,'CHECK_DE'),(207,'Loading instructions von Kunden erhalten',7,'CHECK_DE'),(208,'Loading instructions an Lieferanten weitergegeben',8,'CHECK_DE'),(209,'Verladungsdokumente zur Prüfung erhalten',9,'CHECK_DE'),(210,'Zahlung erhalten / bei Vorauskassa',10,'CHECK_DE'),(211,'Dokumente zur Prüfung an den Kunden geschickt / ok von Kunden erhalten',11,'CHECK_DE'),(212,'Lieferschein erhalten / Rechnung erhalten',12,'CHECK_DE'),(213,'Lieferschein von uns geht mit LKW',13,'CHECK_DE'),(214,'Rechnung gelegt',14,'CHECK_DE'),(215,'LKW kann abfahren',15,'CHECK_DE'),(216,'CMR + Export declaration bestätigt v. Kunden erhalten',16,'CHECK_DE');

UNLOCK TABLES;

/*Table structure for table `tradeboardgeschaeft` */

DROP TABLE IF EXISTS `tradeboardgeschaeft`;

CREATE TABLE `tradeboardgeschaeft` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `AuftragNr` int(10) DEFAULT NULL,
  `Datum` datetime DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `AngebotNr` int(10) DEFAULT NULL,
  `RechnungNr` int(10) DEFAULT NULL,
  `LieferscheinNr` int(10) DEFAULT NULL,
  `KundNr` int(10) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `TransporteurNr` int(10) DEFAULT NULL,
  `TransportRechnungNr` varchar(50) DEFAULT NULL,
  `Einkauf` double(15,5) DEFAULT NULL,
  `Verkauf` double(15,5) DEFAULT NULL,
  `TransportKosten` double(9,2) NOT NULL DEFAULT '0.00',
  `ZusatzKosten` double(15,5) DEFAULT NULL,
  `MarginBrutto` double(15,5) DEFAULT NULL,
  `MitarbeiterEK` int(10) DEFAULT NULL,
  `ProvisionEK` double(15,5) DEFAULT NULL,
  `ProvisionEKProzent` double(15,5) DEFAULT NULL,
  `MitarbeiterVK` int(10) DEFAULT NULL,
  `ProvisionVK` double(15,5) DEFAULT NULL,
  `ProvisionVKProzent` double(15,5) DEFAULT NULL,
  `MarginNetto` double(15,5) DEFAULT NULL,
  `ErstelltAm` datetime DEFAULT NULL,
  `LieferantenAuftragNr` int(10) DEFAULT NULL,
  `VerladeTag` datetime DEFAULT NULL,
  `verladeGewicht` double DEFAULT NULL,
  `ProvisionEKBezahltAm` datetime DEFAULT NULL,
  `ProvisionVKBezahltAm` datetime DEFAULT NULL,
  `EinkaufRechnungNr` varchar(45) DEFAULT NULL,
  `ProvisionVermittlung` double(9,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`ID`),
  KEY `AngebotNr` (`AngebotNr`),
  KEY `AuftragNr` (`AuftragNr`),
  KEY `Datum` (`Datum`),
  KEY `ErstelltAm` (`ErstelltAm`),
  KEY `ID` (`ID`),
  KEY `KundNr` (`KundNr`),
  KEY `LieferantNr` (`LieferantNr`),
  KEY `LieferscheinNr` (`LieferscheinNr`),
  KEY `MitarbeiterEK` (`MitarbeiterEK`),
  KEY `MitarbeiterVK` (`MitarbeiterVK`),
  KEY `RechnungNr` (`RechnungNr`),
  KEY `Status` (`Status`),
  KEY `TransporteurNr` (`TransporteurNr`),
  KEY `TransportRechnungNr` (`TransportRechnungNr`),
  CONSTRAINT `tradeboardgeschaeft_ibfk_1` FOREIGN KEY (`MitarbeiterEK`) REFERENCES `ofmitarbeiter` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardgeschaeft_ibfk_10` FOREIGN KEY (`AuftragNr`) REFERENCES `buchauftrag` (`Nummer`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardgeschaeft_ibfk_2` FOREIGN KEY (`MitarbeiterVK`) REFERENCES `ofmitarbeiter` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardgeschaeft_ibfk_3` FOREIGN KEY (`LieferscheinNr`) REFERENCES `buchlieferschein` (`Nummer`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardgeschaeft_ibfk_4` FOREIGN KEY (`RechnungNr`) REFERENCES `buchrechnung` (`Nummer`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardgeschaeft_ibfk_5` FOREIGN KEY (`AuftragNr`) REFERENCES `buchauftrag` (`Nummer`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardgeschaeft_ibfk_6` FOREIGN KEY (`MitarbeiterEK`) REFERENCES `ofmitarbeiter` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardgeschaeft_ibfk_7` FOREIGN KEY (`MitarbeiterVK`) REFERENCES `ofmitarbeiter` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardgeschaeft_ibfk_8` FOREIGN KEY (`LieferscheinNr`) REFERENCES `buchlieferschein` (`Nummer`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardgeschaeft_ibfk_9` FOREIGN KEY (`RechnungNr`) REFERENCES `buchrechnung` (`Nummer`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tradeboardgeschaeft` */

LOCK TABLES `tradeboardgeschaeft` WRITE;

UNLOCK TABLES;

/*Table structure for table `tradeboardkundenanfrage` */

DROP TABLE IF EXISTS `tradeboardkundenanfrage`;

CREATE TABLE `tradeboardkundenanfrage` (
  `Nr` int(10) NOT NULL AUTO_INCREMENT,
  `Datum` datetime DEFAULT NULL,
  `GueltigBis` datetime DEFAULT NULL,
  `MitarbeiterNr` int(10) DEFAULT NULL,
  `KundeNr` int(10) DEFAULT NULL,
  `ArtNr` int(10) DEFAULT NULL,
  `Spezifikation` varchar(255) DEFAULT NULL,
  `Packing` varchar(10) DEFAULT NULL,
  `Menge` int(10) DEFAULT NULL,
  `Qualitaet` varchar(10) DEFAULT NULL,
  `Währung` varchar(3) DEFAULT NULL,
  `Preis` double DEFAULT NULL,
  `Incoterm` varchar(50) DEFAULT NULL,
  `Plant` varchar(25) DEFAULT NULL,
  `PLZ` varchar(20) DEFAULT NULL,
  `Land` varchar(50) DEFAULT NULL,
  `PlantNr` varchar(25) DEFAULT NULL,
  `Packung` varchar(50) DEFAULT NULL,
  `ETD` varchar(10) DEFAULT NULL,
  `ETA` varchar(10) DEFAULT NULL,
  `Storniert` tinyint(1) NOT NULL,
  `StorniertAm` datetime DEFAULT NULL,
  PRIMARY KEY (`Nr`),
  KEY `ArtNr` (`ArtNr`),
  KEY `Datum` (`Datum`),
  KEY `GueltigBis` (`GueltigBis`),
  KEY `ID` (`Nr`),
  KEY `Incoterm` (`Incoterm`),
  KEY `KundeNr` (`KundeNr`),
  KEY `Land` (`Land`),
  KEY `MitarbeiterNr` (`MitarbeiterNr`),
  KEY `Plant` (`Plant`),
  KEY `PLZ` (`PLZ`),
  KEY `StorniertAm` (`StorniertAm`),
  KEY `KundeNr_2` (`KundeNr`),
  CONSTRAINT `tradeboardkundenanfrage_ibfk_1` FOREIGN KEY (`MitarbeiterNr`) REFERENCES `ofmitarbeiter` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardkundenanfrage_ibfk_2` FOREIGN KEY (`KundeNr`) REFERENCES `ofadressen` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardkundenanfrage_ibfk_3` FOREIGN KEY (`MitarbeiterNr`) REFERENCES `ofmitarbeiter` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardkundenanfrage_ibfk_4` FOREIGN KEY (`KundeNr`) REFERENCES `ofadressen` (`IDNR`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tradeboardkundenanfrage` */

LOCK TABLES `tradeboardkundenanfrage` WRITE;

UNLOCK TABLES;

/*Table structure for table `tradeboardlieferantenanfrage` */

DROP TABLE IF EXISTS `tradeboardlieferantenanfrage`;

CREATE TABLE `tradeboardlieferantenanfrage` (
  `AnfrageNr` int(10) NOT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `ErstelltAm` datetime DEFAULT NULL,
  PRIMARY KEY (`AnfrageNr`),
  KEY `ErstelltAm` (`ErstelltAm`),
  KEY `LieferantNr` (`LieferantNr`),
  KEY `LieferantNr_2` (`LieferantNr`),
  CONSTRAINT `tradeboardlieferantenanfrage_ibfk_1` FOREIGN KEY (`LieferantNr`) REFERENCES `lieferantenadressen` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardlieferantenanfrage_ibfk_2` FOREIGN KEY (`LieferantNr`) REFERENCES `lieferantenadressen` (`IDNR`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tradeboardlieferantenanfrage` */

LOCK TABLES `tradeboardlieferantenanfrage` WRITE;

UNLOCK TABLES;

/*Table structure for table `tradeboardlieferantenanfrageartikel` */

DROP TABLE IF EXISTS `tradeboardlieferantenanfrageartikel`;

CREATE TABLE `tradeboardlieferantenanfrageartikel` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `AnfrageNr` int(10) DEFAULT NULL,
  `ArtNr` int(10) DEFAULT NULL,
  `Menge` varchar(50) DEFAULT NULL,
  `Packung` varchar(50) DEFAULT NULL,
  `Preis` int(10) DEFAULT NULL,
  `ErstelltAm` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AnfrageNr` (`AnfrageNr`),
  KEY `ArtNr` (`ArtNr`),
  KEY `ErstelltAm` (`ErstelltAm`),
  KEY `AnfrageNr_2` (`AnfrageNr`),
  CONSTRAINT `tradeboardlieferantenanfrageartikel_ibfk_1` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardlieferantenanfrageartikel_ibfk_2` FOREIGN KEY (`AnfrageNr`) REFERENCES `tradeboardlieferantenanfrage` (`AnfrageNr`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardlieferantenanfrageartikel_ibfk_3` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardlieferantenanfrageartikel_ibfk_4` FOREIGN KEY (`AnfrageNr`) REFERENCES `tradeboardlieferantenanfrage` (`AnfrageNr`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tradeboardlieferantenanfrageartikel` */

LOCK TABLES `tradeboardlieferantenanfrageartikel` WRITE;

UNLOCK TABLES;

/*Table structure for table `tradeboardlieferantenangebot` */

DROP TABLE IF EXISTS `tradeboardlieferantenangebot`;

CREATE TABLE `tradeboardlieferantenangebot` (
  `Nummer` int(10) NOT NULL AUTO_INCREMENT,
  `Datum` datetime DEFAULT NULL,
  `GueltigBis` datetime DEFAULT NULL,
  `AngebotNr` varchar(25) DEFAULT NULL,
  `MitarbeiterNr` int(10) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `ArtNr` int(10) DEFAULT NULL,
  `Spezifikation` varchar(255) DEFAULT NULL,
  `Qualitaet` varchar(50) DEFAULT NULL,
  `Menge` double(15,5) DEFAULT NULL,
  `Packung` varchar(50) DEFAULT NULL,
  `EKPreis` double(15,5) NOT NULL,
  `Währung` varchar(50) DEFAULT NULL,
  `Incoterm` varchar(10) DEFAULT NULL,
  `PLZ` varchar(20) DEFAULT NULL,
  `Land` varchar(50) DEFAULT NULL,
  `FromTo` varchar(50) DEFAULT NULL,
  `Plant` varchar(25) DEFAULT NULL,
  `ETD` varchar(10) DEFAULT NULL,
  `ETA` varchar(10) DEFAULT NULL,
  `Storniert` tinyint(1) NOT NULL,
  `StorniertAm` datetime DEFAULT NULL,
  `StorniertMitarbeiterNr` int(10) DEFAULT NULL,
  `StorniertNotiz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Nummer`),
  KEY `AngebotNr` (`AngebotNr`),
  KEY `ArtNr` (`ArtNr`),
  KEY `Datum` (`Datum`),
  KEY `ETA` (`ETA`),
  KEY `ETD` (`ETD`),
  KEY `Incoterm` (`Incoterm`),
  KEY `LieferantNr` (`LieferantNr`),
  KEY `MitarbeiterNr` (`MitarbeiterNr`),
  KEY `PlantNr` (`Plant`),
  KEY `Qualitaet` (`Qualitaet`),
  KEY `Spezifikation` (`Spezifikation`),
  KEY `StorniertAm` (`StorniertAm`),
  CONSTRAINT `tradeboardlieferantenangebot_ibfk_1` FOREIGN KEY (`LieferantNr`) REFERENCES `lieferantenadressen` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardlieferantenangebot_ibfk_2` FOREIGN KEY (`MitarbeiterNr`) REFERENCES `ofmitarbeiter` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardlieferantenangebot_ibfk_3` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardlieferantenangebot_ibfk_4` FOREIGN KEY (`LieferantNr`) REFERENCES `lieferantenadressen` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardlieferantenangebot_ibfk_5` FOREIGN KEY (`MitarbeiterNr`) REFERENCES `ofmitarbeiter` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardlieferantenangebot_ibfk_6` FOREIGN KEY (`ArtNr`) REFERENCES `grartikel` (`ArtNr`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tradeboardlieferantenangebot` */

LOCK TABLES `tradeboardlieferantenangebot` WRITE;

UNLOCK TABLES;

/*Table structure for table `tradeboardlieferantenangebotfoto` */

DROP TABLE IF EXISTS `tradeboardlieferantenangebotfoto`;

CREATE TABLE `tradeboardlieferantenangebotfoto` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `AngebotNr` int(10) DEFAULT NULL,
  `FotoLink` longtext,
  `ErstelltAm` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AngebotNr` (`AngebotNr`),
  CONSTRAINT `tradeboardlieferantenangebotfoto_ibfk_1` FOREIGN KEY (`AngebotNr`) REFERENCES `tradeboardlieferantenangebot` (`Nummer`) ON UPDATE CASCADE,
  CONSTRAINT `tradeboardlieferantenangebotfoto_ibfk_2` FOREIGN KEY (`AngebotNr`) REFERENCES `tradeboardlieferantenangebot` (`Nummer`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tradeboardlieferantenangebotfoto` */

LOCK TABLES `tradeboardlieferantenangebotfoto` WRITE;

UNLOCK TABLES;

/*Table structure for table `translations` */

DROP TABLE IF EXISTS `translations`;

CREATE TABLE `translations` (
  `TableName` varchar(50) NOT NULL DEFAULT '',
  `Key` varchar(50) NOT NULL DEFAULT '',
  `LandId` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) NOT NULL DEFAULT '',
  `Translation` mediumtext,
  `language_Code` varchar(3) DEFAULT NULL,
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `Index_UNIQUE` (`TableName`,`Key`,`language_Code`,`FieldName`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;

/*Data for the table `translations` */

LOCK TABLES `translations` WRITE;

insert  into `translations`(`TableName`,`Key`,`LandId`,`FieldName`,`Translation`,`language_Code`,`ID`) values ('grArtikel','5720',43,'Bezeichnung','Haut','DEU',1),('grArtikel','5720',49,'Bezeichnung','Haut','DEU',2),('grArtikel-Kategorien','2',45,'Name','Kategorie 1 DE','DEU',5),('grArtikel-Kategorien','4',49,'Name','Kategorie 3 DE','DEU',6),('grArtikel-Kategorien','5',43,'Name','AGB','DEU',7),('grArtikel-Kategorien','9',7,'Name','Fruits & Vegetables','DEU',10),('grArtikel-Kategorien','0',0,'Name','Hauptkategorie DE','DEU',12),('grArtikel-Kategorien','0',0,'Name','Hauptkategorie EN','ENG',14),('grArtikel','57',0,'Bezeichnung','test','DEU',16),('grArtikel','57',0,'Bezeichnung','test','ENG',18),('grArtikel','0',0,'Beschreibung','sdfsfsdf','DEU',20),('grArtikel','0',0,'Beschreibung','dfsdfsdf','ENG',22),('grArtikel','0',0,'Bezeichnung','sdf','DEU',24),('grArtikel','0',0,'Bezeichnung','df','ENG',26),('grArtikel-Kategorien','16',0,'Name','Taschenlampen','DEU',28),('grArtikel-Kategorien','16',0,'Name','Pocket Lamps','ENG',30),('grArtikel','2642',0,'Bezeichnung','Pro’s Pro 801 TI POWER in ENG','ENG',32),('grArtikel','2642',0,'Bezeichnung','Pro’s Pro 801 TI POWER in DEU','DEU',34),('grArtikel','2642',0,'Beschreibung','Ths is the english text Modern, robuste Graphite-Fusion-Technologie gepaart mit Fehler verzeihender \r\nGroßkopfgeometrie qualifiziert dieses hervorragende Allroundracket für Freizeitspieler\r\nund für den Schulsport. Garantiert viel Spaß am Spiel. Bespannt. Inkl. Hülle. \r\nGewicht besaitet:  ca.  98 Gramm.  Preis ab 5 Stück: € 13.20\r\n<br><br><a target=\"_blank\" href=\"http://www.arfaian.com/lieferung.htm\">inkl. Mwst + ggf. zzgl. Versandkosten</a><br>','ENG',36),('grArtikel','2642',0,'Beschreibung','Moderne, robuste Graphite-Fusion-Technologie gepaart mit Fehler verzeihender \r\nGroßkopfgeometrie qualifiziert dieses hervorragende Allroundracket für Freizeitspieler\r\nund für den Schulsport. Garantiert viel Spaß am Spiel. Bespannt. Inkl. Hülle. \r\nGewicht besaitet:  ca.  98 Gramm.  Preis ab 5 Stück: € 13.20\r\n<br><br><a target=\"_blank\" href=\"http://www.arfaian.com/lieferung.htm\">inkl. Mwst + ggf. zzgl. Versandkosten</a><br>','DEU',38),('grArtikel-Kategorien','90',0,'Name','ball baskets','ENG',40),('grArtikel-Kategorien','35',0,'Name',' Basket balls','ENG',42),('grArtikel-Kategorien','13',0,'Name','Stringing Machines','ENG',44),('grArtikel-Kategorien','14',0,'Name','Stringing Machines','ENG',46),('grArtikel-Kategorien','25',0,'Name','Adult','ENG',48),('grArtikel-Kategorien','50',0,'Name','Tennis Grips','ENG',50),('grArtikel-Kategorien','88',0,'Name','Wrist- and Headbands','ENG',52),('grArtikel-Kategorien','98',0,'Name','Socks','ENG',54),('grArtikel-Kategorien','5',49,'Name','CONDITIONS','ENG',55),('grArtikel-Kategorien','60',0,'Name','Bags','ENG',57),('grArtikel-Kategorien','76',0,'Name','Flash Lights','ENG',59),('grArtikel-Kategorien','75',0,'Name','Tennis Balls','ENG',61),('grArtikel-Kategorien','7',0,'Name','Tennis Racquets','ENG',63),('grArtikel-Kategorien','33',0,'Name','Table Tennis','ENG',65),('grArtikel-Kategorien','89',0,'Name','Vibrationdamper','ENG',67),('grArtikel-Kategorien','95',0,'Name','Jogging','ENG',68),('grArtikel-Kategorien','10',7,'Name','Ersatzteile','ENG',69),('grArtikel-Kategorien','77',0,'Name','Tools','ENG',71),('grArtikel-Kategorien','94',0,'Name','Biking','ENG',73),('grArtikel-Kategorien','8',0,'Name','Tennis Strings','ENG',75),('grArtikel-Kategorien','40',0,'Name','Caps','ENG',77),('grArtikel-Kategorien','78',0,'Name','Spare Parts','ENG',79),('grArtikel-Kategorien','93',0,'Name','Fitness','ENG',81),('grArtikel-Kategorien','6',49,'Name','Parts','ENG',82),('grArtikel-Kategorien','30',0,'Name','Parts','ENG',84),('grArtikel','12204',0,'Beschreibung','MIRO','ENG',86),('grArtikel','1',0,'Bezeichnung','jzudfkudzf','ENG',87),('grArtikel','1',0,'Bezeichnung',NULL,'RUS',89),('grArtikel-Kategorien','2',0,'Name','Kategorie 1EN','ENG',91);

UNLOCK TABLES;

/*Table structure for table `transportanfrage` */

DROP TABLE IF EXISTS `transportanfrage`;

CREATE TABLE `transportanfrage` (
  `AnfrageNr` int(10) NOT NULL,
  `AuftragNr` int(10) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `LKWArt` varchar(25) DEFAULT NULL,
  `Anforderung` varchar(50) DEFAULT NULL,
  `Temperatur` varchar(50) DEFAULT NULL,
  `ArtWare` varchar(50) DEFAULT NULL,
  `Verpackung` varchar(50) DEFAULT NULL,
  `Verladetermin` varchar(50) DEFAULT NULL,
  `PLZVon` varchar(5) DEFAULT NULL,
  `OrtLandVon` varchar(50) DEFAULT NULL,
  `PLZNach` varchar(5) DEFAULT NULL,
  `OrtLandNach` varchar(50) DEFAULT NULL,
  `Gewicht` varchar(10) DEFAULT NULL,
  `Versicherung` varchar(50) DEFAULT NULL,
  `Abladetermin` varchar(50) DEFAULT NULL,
  `ErstelltAm` datetime DEFAULT NULL,
  PRIMARY KEY (`AnfrageNr`),
  KEY `AuftragNr` (`AuftragNr`),
  KEY `ErstelltAm` (`ErstelltAm`),
  KEY `LieferantNr` (`LieferantNr`),
  KEY `LKWArt` (`LKWArt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transportanfrage` */

LOCK TABLES `transportanfrage` WRITE;

UNLOCK TABLES;

/*Table structure for table `transportauftrag` */

DROP TABLE IF EXISTS `transportauftrag`;

CREATE TABLE `transportauftrag` (
  `Nr` int(10) NOT NULL,
  `Datum` datetime DEFAULT NULL,
  `AuftragNr` int(10) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `LieferantNr` int(10) DEFAULT NULL,
  `AuftragNrLieferant` varchar(50) DEFAULT NULL,
  `LadeplatzNr` int(10) DEFAULT NULL,
  `ConsigneeNr` int(10) DEFAULT NULL,
  `EntladeplatzNr` int(10) DEFAULT NULL,
  `Paletten` varchar(50) DEFAULT NULL,
  `Anforderung` varchar(50) DEFAULT NULL,
  `Temperatur` varchar(50) DEFAULT NULL,
  `ArtWare` varchar(50) DEFAULT NULL,
  `Verpackung` varchar(50) DEFAULT NULL,
  `Route` varchar(50) DEFAULT NULL,
  `Grenzeuebergang` varchar(50) DEFAULT NULL,
  `Zoll` varchar(50) DEFAULT NULL,
  `LKWNr` varchar(50) DEFAULT NULL,
  `Versicherung` varchar(50) DEFAULT NULL,
  `Ladetag` varchar(50) DEFAULT NULL,
  `Entladetag` varchar(50) DEFAULT NULL,
  `Preis` varchar(50) DEFAULT NULL,
  `Dokumentliste` varchar(255) DEFAULT NULL,
  `Notiz` longtext,
  `ErstelltAm` datetime DEFAULT NULL,
  `Gewicht` varchar(50) DEFAULT NULL,
  `LKWArt` varchar(50) DEFAULT NULL,
  `MitarbeiterNr` int(10) unsigned DEFAULT NULL,
  `ImportLizenzNr` varchar(45) DEFAULT NULL,
  `IntrastatNr` varchar(45) DEFAULT NULL,
  `VetArzt` varchar(45) DEFAULT NULL,
  `Export_ZollAmtNr` int(11) DEFAULT NULL,
  `Import_ZollAmtNr` int(11) DEFAULT NULL,
  PRIMARY KEY (`Nr`),
  UNIQUE KEY `AuftragNr` (`AuftragNr`),
  KEY `ConsigneeNr` (`ConsigneeNr`),
  KEY `Datum` (`Datum`),
  KEY `ErstelltAm` (`ErstelltAm`),
  KEY `KundNr` (`EntladeplatzNr`),
  KEY `LadeplatzNr` (`LadeplatzNr`),
  KEY `LieferantNr` (`LieferantNr`),
  KEY `Nummer` (`Nr`),
  KEY `Status` (`Status`),
  KEY `EntladeplatzNr` (`EntladeplatzNr`),
  CONSTRAINT `transportauftrag_ibfk_1` FOREIGN KEY (`AuftragNr`) REFERENCES `buchauftrag` (`Nummer`) ON UPDATE CASCADE,
  CONSTRAINT `transportauftrag_ibfk_10` FOREIGN KEY (`EntladeplatzNr`) REFERENCES `ofadressen` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `transportauftrag_ibfk_2` FOREIGN KEY (`LieferantNr`) REFERENCES `lieferantenadressen` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `transportauftrag_ibfk_3` FOREIGN KEY (`ConsigneeNr`) REFERENCES `ofadressen` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `transportauftrag_ibfk_4` FOREIGN KEY (`LadeplatzNr`) REFERENCES `ofadressen` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `transportauftrag_ibfk_5` FOREIGN KEY (`EntladeplatzNr`) REFERENCES `ofadressen` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `transportauftrag_ibfk_6` FOREIGN KEY (`AuftragNr`) REFERENCES `buchauftrag` (`Nummer`) ON UPDATE CASCADE,
  CONSTRAINT `transportauftrag_ibfk_7` FOREIGN KEY (`LieferantNr`) REFERENCES `lieferantenadressen` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `transportauftrag_ibfk_8` FOREIGN KEY (`ConsigneeNr`) REFERENCES `ofadressen` (`IDNR`) ON UPDATE CASCADE,
  CONSTRAINT `transportauftrag_ibfk_9` FOREIGN KEY (`LadeplatzNr`) REFERENCES `ofadressen` (`IDNR`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transportauftrag` */

LOCK TABLES `transportauftrag` WRITE;

UNLOCK TABLES;

/*Table structure for table `transportauftrag_beladung` */

DROP TABLE IF EXISTS `transportauftrag_beladung`;

CREATE TABLE `transportauftrag_beladung` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AuftragNr` int(10) unsigned NOT NULL DEFAULT '0',
  `BeladeplatzNr` int(10) unsigned DEFAULT NULL,
  `Beladetag` datetime DEFAULT NULL,
  `ErstelltAm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Notiz` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transportauftrag_beladung` */

LOCK TABLES `transportauftrag_beladung` WRITE;

UNLOCK TABLES;

/*Table structure for table `transportauftrag_entladung` */

DROP TABLE IF EXISTS `transportauftrag_entladung`;

CREATE TABLE `transportauftrag_entladung` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AuftragNr` int(10) unsigned NOT NULL DEFAULT '0',
  `EntladeplatzNr` int(10) unsigned DEFAULT NULL,
  `Entladetag` datetime DEFAULT NULL,
  `ErstelltAm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Notiz` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transportauftrag_entladung` */

LOCK TABLES `transportauftrag_entladung` WRITE;

UNLOCK TABLES;

/*Table structure for table `transportauftragdokumente` */

DROP TABLE IF EXISTS `transportauftragdokumente`;

CREATE TABLE `transportauftragdokumente` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `AuftragNr` int(10) DEFAULT NULL,
  `Dokument` varchar(50) DEFAULT NULL,
  `Notwendig` tinyint(1) NOT NULL,
  `ErstelltAm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Unique_AuftragNr_Dokument` (`AuftragNr`,`Dokument`),
  KEY `AuftragNr` (`AuftragNr`),
  KEY `Dokument` (`Dokument`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=latin1;

/*Data for the table `transportauftragdokumente` */

LOCK TABLES `transportauftragdokumente` WRITE;

insert  into `transportauftragdokumente`(`ID`,`AuftragNr`,`Dokument`,`Notwendig`,`ErstelltAm`) values (22,200300007,'TIR Carnet',0,'2006-11-30 16:54:54'),(142,705215,NULL,-1,'2007-10-16 09:22:22'),(143,705215,NULL,-1,'2007-10-16 09:22:22'),(144,705215,NULL,-1,'2007-10-16 09:22:22'),(145,705215,NULL,-1,'2007-10-16 09:22:22'),(146,705249,NULL,-1,'2007-10-16 09:22:22'),(147,705249,NULL,-1,'2007-10-16 09:22:22'),(148,705249,NULL,-1,'2007-10-16 09:22:22'),(149,705249,NULL,-1,'2007-10-16 09:22:22'),(150,705250,'asfdSAFD',-1,'2007-10-16 09:22:22'),(151,705043,'INTERDEL INVOICE',0,'2007-10-16 09:22:22'),(152,705043,'TIR Carnet',0,'2007-10-16 09:22:22'),(153,705043,'Veterinary certificate',0,'2007-10-16 09:22:22'),(154,705043,'Certificate of origin',0,'2007-10-16 09:22:22'),(155,705043,'Certificate of conformity',0,'2007-10-16 09:22:22'),(156,705043,'Certificate of quality',0,'2007-10-16 09:22:22'),(157,705043,'Packing list Net/Gross/Tara weight',0,'2007-10-16 09:22:22'),(158,705043,'Label with Net/Gross weight',0,'2007-10-16 09:22:22'),(159,705043,'Export Declaration',0,'2007-10-16 09:22:22'),(160,700133,NULL,0,'2007-10-16 09:22:22'),(161,705065,NULL,-1,'2007-10-16 09:22:22'),(162,705311,'INTERDEL INVOICE',0,'2007-11-02 11:54:21'),(163,705311,'TIR Carnet',0,'2007-11-02 11:54:21'),(164,705311,'Veterinary certificate',0,'2007-11-02 11:54:21'),(165,705311,'Certificate of origin',0,'2007-11-02 11:54:21'),(166,705311,'Certificate of conformity',0,'2007-11-02 11:54:21'),(167,705311,'Certificate of quality',0,'2007-11-02 11:54:21'),(168,705311,'Packing list Net/Gross/Tara weight',0,'2007-11-02 11:54:21'),(169,705311,'Label with Net/Gross weight',0,'2007-11-02 11:54:21'),(170,705311,'Export Declaration',0,'2007-11-02 11:54:21');

UNLOCK TABLES;

/*Table structure for table `transportdokumente` */

DROP TABLE IF EXISTS `transportdokumente`;

CREATE TABLE `transportdokumente` (
  `Nummer` int(10) NOT NULL,
  `Dokument` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Nummer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transportdokumente` */

LOCK TABLES `transportdokumente` WRITE;

insert  into `transportdokumente`(`Nummer`,`Dokument`) values (1,'INTERDEL INVOICE'),(2,'TIR Carnet'),(3,'Veterinary certificate'),(4,'Certificate of origin'),(5,'Certificate of conformity'),(6,'Certificate of quality'),(7,'Packing list Net/Gross/Tara weight'),(8,'Label with Net/Gross weight'),(9,'Export Declaration');

UNLOCK TABLES;

/*Table structure for table `transportgruppe` */

DROP TABLE IF EXISTS `transportgruppe`;

CREATE TABLE `transportgruppe` (
  `GruppeNr` int(10) NOT NULL,
  `Bezeichung` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`GruppeNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transportgruppe` */

LOCK TABLES `transportgruppe` WRITE;

insert  into `transportgruppe`(`GruppeNr`,`Bezeichung`) values (1,'Destination'),(2,'Transportart'),(3,'Sondergruppe');

UNLOCK TABLES;

/*Table structure for table `transportincotermcode` */

DROP TABLE IF EXISTS `transportincotermcode`;

CREATE TABLE `transportincotermcode` (
  `Code` varchar(3) NOT NULL,
  `Beschreibung` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`),
  KEY `Code` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transportincotermcode` */

LOCK TABLES `transportincotermcode` WRITE;

insert  into `transportincotermcode`(`Code`,`Beschreibung`) values ('CFR','Cost and Freight'),('CIF','Cost, Insurance and Freight'),('CIP','Carriage + Insurance paid to (named place)'),('CPT','Carriage paid to ( named place )'),('DAF','Delivered at Frontier'),('DDP','Delivered Duty Paid'),('DDU','Delivered Duty Unpaid'),('DEQ','Delivered ex Quay'),('DES','Delivered ex Ship'),('EXW','Ex Works'),('FAS','Free alongside Ship'),('FCA','Free Carrier'),('FOB','Free on Board');

UNLOCK TABLES;

/*Table structure for table `transportladezeiten` */

DROP TABLE IF EXISTS `transportladezeiten`;

CREATE TABLE `transportladezeiten` (
  `IDNR` int(10) unsigned NOT NULL DEFAULT '0',
  `Von` varchar(45) NOT NULL DEFAULT '',
  `Bis` varchar(45) NOT NULL DEFAULT '',
  `Notiz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDNR`,`Von`,`Bis`),
  KEY `Index_IDNR` (`IDNR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transportladezeiten` */

LOCK TABLES `transportladezeiten` WRITE;

insert  into `transportladezeiten`(`IDNR`,`Von`,`Bis`,`Notiz`) values (89,'','20:00 Freitag',NULL),(220204,'10','15',NULL),(220447,'','',NULL),(333005,'MO 10:00','15:00','Gate 15'),(333222,'13-14','',NULL),(333253,'08','12',NULL);

UNLOCK TABLES;

/*Table structure for table `transportladunginstruktionen` */

DROP TABLE IF EXISTS `transportladunginstruktionen`;

CREATE TABLE `transportladunginstruktionen` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `AuftragNr` varchar(50) DEFAULT NULL,
  `LoadingDay` varchar(50) DEFAULT NULL,
  `TruckNr` varchar(50) DEFAULT NULL,
  `GoodsToLoad` varchar(50) DEFAULT NULL,
  `Kunden` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AuftragNr` (`AuftragNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transportladunginstruktionen` */

LOCK TABLES `transportladunginstruktionen` WRITE;

UNLOCK TABLES;

/*Table structure for table `transportlieferantgruppe` */

DROP TABLE IF EXISTS `transportlieferantgruppe`;

CREATE TABLE `transportlieferantgruppe` (
  `Nr` int(10) NOT NULL AUTO_INCREMENT,
  `LieferantNr` int(10) DEFAULT NULL,
  `Gruppe` int(10) DEFAULT NULL,
  `Wert` varchar(50) DEFAULT NULL,
  `ErstelltAm` datetime DEFAULT NULL,
  PRIMARY KEY (`Nr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transportlieferantgruppe` */

LOCK TABLES `transportlieferantgruppe` WRITE;

UNLOCK TABLES;

/*Table structure for table `treecats` */

DROP TABLE IF EXISTS `treecats`;

CREATE TABLE `treecats` (
  `ID` int(10) DEFAULT NULL,
  `IDParent` int(10) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `FormToOpen` varchar(50) DEFAULT NULL,
  `SQLQueryForChilds` longtext,
  `CanBeDeleted` tinyint(1) NOT NULL,
  `CanBeRenamed` tinyint(1) NOT NULL,
  PRIMARY KEY (`Name`),
  KEY `ID` (`ID`),
  KEY `IDParent` (`IDParent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `treecats` */

LOCK TABLES `treecats` WRITE;

insert  into `treecats`(`ID`,`IDParent`,`Name`,`FormToOpen`,`SQLQueryForChilds`,`CanBeDeleted`,`CanBeRenamed`) values (112,111,'Angebote',NULL,'SELECT \"AN-\" & [Nummer] & \"-\" & [Datum] & \",\" & [Firma] & \" \" & [Name] AS namen, \"\" AS frm, \"select \"\"open\"\",\"\"\"\", openVorgangFunctionByNummer(\"\"AN\"\",\" & [nummer] & \"),7 from ofVars Where name=\"\"Passwort\"\"\" AS [sql], 11 +4*anElba AS icon\r\nFROM ofAdressen INNER JOIN buchAngebot ON ofAdressen.IDNR = buchAngebot.KundNr\r\nWHERE Datum>Date()-60\r\nORDER BY Datum DESC',0,0),(119,1,'Artikel',NULL,NULL,0,0),(28,25,'Artikel Auslieferung',NULL,NULL,0,0),(27,25,'Artikel Einlieferung',NULL,NULL,0,0),(120,119,'Artikel nach ArtNr',NULL,'SELECT grArtikel.artnr, \"artikelArtikel, ArtNr=\" & [artNr] AS frm,\"\",4 as icon\r\nFROM grArtikel where ProduktAktiv<>0 Order By ArtNr',0,0),(121,119,'Artikel nach Bezeichnung',NULL,'SELECT grArtikel.Bezeichnung, \"artikelArtikel, ArtNr=\" & [artNr] AS frm,\"\",4\r\nFROM grArtikel  where ProduktAktiv<>0 order by bezeichnung',0,0),(122,119,'Artikel nach EAN',NULL,'SELECT grArtikel.EAN, \"artikelArtikel, ArtNr=\" & [artNr] AS frm,\"\" ,4 as icon\r\nFROM grArtikel where len(EAN)>1 order by grArtikel.EAN',0,0),(123,119,'Artikel nach Kategorie',NULL,'SELECT Name, \"\" AS form, makeQueryForArtikelGruppen([ArtKatNr]) AS qry, 1 AS icon\r\nFROM [grArtikel-Kategorien] WHERE ArtKatNr=0',0,0),(124,119,'Artikelkategorien Manager',NULL,'SELECT Name, \"grArtikel-KategorienDetail,ArtKatNr=\"&ArtKatNR AS form, makeQueryForKategorien([ArtKatNr]) AS qry, 1 AS icon\r\nFROM [grArtikel-Kategorien] WHERE ArtKatNr=0',0,0),(113,111,'Auftraege',NULL,'SELECT \"AU-\" & [Nummer] & \"-\" & [Datum] & \",\" & [Firma] & \" \" & [Name] AS namen, \"\" AS frm, \"select \"\"open\"\",\"\"\"\", openVorgangFunctionByNummer(\"\"AU\"\",\" & [nummer] & \"),7 from ofVars Where name=\"\"Passwort\"\"\" AS [sql], 11 +4*anElba AS icon\r\nFROM ofAdressen INNER JOIN buchAuftrag ON ofAdressen.IDNR = buchAuftrag.KundNr\r\nWHERE Datum>Date()-60\r\nORDER BY Datum DESC',0,0),(106,1,'Daten Import&Export','impMain',NULL,0,0),(108,1,'Einstellungen','ofVariables',NULL,0,0),(118,111,'Gutschriften',NULL,'SELECT \"GU-\" & [Nummer] & \"-\" & [Datum] & \",\" & [Firma] & \" \" & [Name] AS namen, \"\" AS frm, \"select \"\"open\"\",\"\"\"\", openVorgangFunctionByNummer(\"\"GU\"\",\" & [nummer] & \"),7 from ofVars Where name=\"\"Passwort\"\"\" AS [sql], 11 +4*anElba AS icon\r\nFROM ofAdressen INNER JOIN buchGutschrift ON ofAdressen.IDNR = buchGutschrift.KundNr\r\nWHERE Datum>Date()-60\r\nORDER BY Datum DESC',0,0),(1,0,'Home','Main',NULL,0,0),(106,1,'Import&Export','impMain',NULL,0,0),(4,1,'Kunden',NULL,NULL,0,0),(30,4,'Kunden A-K',NULL,'SELECT DISTINCT  [Name] & \" \" & [Name1] AS Label, \"ofKunden,idnr=\" & [idnr] AS FormNameAndWherePart, \"\", 3\r\nFROM ofAdressen where lcase(mid(Name,1)) <= \"k\"',0,0),(29,4,'Kunden Alle',NULL,'SELECT DISTINCT  [Name] & \" \" & [Name1] AS Label, \"ofKunden,idnr=\" & [idnr] AS FormNameAndWherePart, \"\", 3 as icon\r\nFROM ofAdressen',0,0),(73,4,'Kunden Firmen',NULL,'SELECT DISTINCT  [Firma]  AS Label, \"ofKunden,idnr=\" & [idnr] AS FormNameAndWherePart, \"\", 3 as icon\r\nFROM ofAdressen where Firma <> \"\"',0,0),(39,4,'Kunden L-Z',NULL,'SELECT DISTINCT  [Name] & \" \" & [Name1] AS Label, \"ofKunden,idnr=\" & [idnr] AS FormNameAndWherePart, \"\",3 as Icon\r\nFROM ofAdressen where lcase(mid(Name,1)) > \"k\"',0,0),(102,4,'Kunden nach Gruppen',NULL,'SELECT DISTINCT Gruppe AS Label, \"\" AS FormNameAndWherePart, \r\n\"SELECT DISTINCT  [Name] & \"\" \"\" & [VorName] AS Label, \"\"ofKunden,idnr=\"\" & [idnr] AS FormNameAndWherePart, \"\"\"\", 3\r\nFROM ofAdressen where idnr in (select idnr from [ofAdressen-Settings] where Kundengruppe=\"\"\" & Gruppe & \"\"\")\" AS Ausdr1, 3 AS Icon\r\nFROM [ofAdressen-KundenGruppen]',0,0),(101,4,'Kundengruppen','ofAdressen-KundenGruppen',NULL,0,0),(26,25,'Lagerbestand','lagerBestand',NULL,0,0),(25,1,'Lagerverwaltung',NULL,NULL,0,0),(99,1,'Lieferanten','lieferantenAdressen','SELECT DISTINCT  [Firma]  AS Label, \"lieferantenAdressen,idnr=\" & [idnr] AS FormNameAndWherePart, \"\" as SQL, 8 as ICon FROM lieferantenAdressen where Firma <> \"\" order by Firma',0,0),(114,111,'Lieferscheine',NULL,'SELECT \"LI-\" & [Nummer] & \"-\" & [Datum] & \",\" & [Firma] & \" \" & [Name] AS namen, \"\" AS frm, \"select \"\"open\"\",\"\"\"\", openVorgangFunctionByNummer(\"\"LI\"\",\" & [nummer] & \"),7 from ofVars Where name=\"\"Passwort\"\"\" AS [sql], 11 +4*anElba AS icon\r\nFROM ofAdressen INNER JOIN buchLieferschein ON ofAdressen.IDNR = buchLieferschein.KundNr\r\nWHERE Datum>Date()-60\r\nORDER BY Datum DESC',0,0),(80,1,'Mahnwesen','mahnwesen',NULL,0,0),(12,1,'Mitarbeiter','ofMitarbeiter','Select Name,\"ofMitarbeiter, idnr=\"& idnr, \"\", 3 as Icon from ofMitarbeiter',0,0),(107,2,'Preislisten','grArtikel-VKPreisPerSelection',NULL,0,0),(116,111,'Rechnungen',NULL,'SELECT \"AR-\" & [buchRechnung].[Nummer] & \"-\" & [buchRechnung].[Datum] & \",\" & [ofAdressen].[Firma] & \" \" & [ofAdressen].[Name] AS namen, \"\" AS frm, \"select \"\"open\"\",\"\"\"\", openVorgangFunctionByNummer(\"\"AR\"\",\" & [nummer] & \"),7 from ofVars Where name=\"\"Passwort\"\"\" AS [sql], 11 +4*anElba AS icon\r\nFROM ofAdressen INNER JOIN buchRechnung ON ofAdressen.IDNR = buchRechnung.KundNr\r\nWHERE (((buchRechnung.Datum)>Date()-60))\r\nORDER BY buchRechnung.Datum DESC',0,0),(115,111,'Retourwaren',NULL,'SELECT \"LI-\" & [Nummer] & \"-\" & [Datum] & \",\" & [Firma] & \" \" & [Name] AS namen, \"\" AS frm, \"select \"\"open\"\",\"\"\"\", openVorgangFunctionByNummer(\"\"LI\"\",\" & [nummer] & \"),7 from ofVars Where name=\"\"Passwort\"\"\" AS [sql], 11 +4*anElba AS icon\r\nFROM ofAdressen INNER JOIN buchLieferschein ON ofAdressen.IDNR = buchLieferschein.KundNr\r\nWHERE Datum>Date()-60\r\nORDER BY Datum DESC',0,0),(117,111,'Rüstscheine',NULL,'SELECT \"RÜ-\" & [Nummer] & \"-\" & [Datum] & \",\" & [Firma] & \" \" & [Name] AS namen, \"\" AS frm, \"select \"\"open\"\",\"\"\"\", openVorgangFunctionByNummer(\"\"RÜ\"\",\" & [nummer] & \"),7 from ofVars Where name=\"\"Passwort\"\"\" AS [sql], 11 +4*anElba AS icon\r\nFROM ofAdressen INNER JOIN buchRüstschein ON ofAdressen.IDNR = buchRüstschein.KundNr\r\nWHERE Datum>Date()-60\r\nORDER BY Datum DESC',0,0),(53,1,'Statistiken',NULL,NULL,0,0),(82,80,'Stufe I',NULL,NULL,0,0),(83,80,'Stufe II',NULL,NULL,0,0),(84,80,'Stufe III',NULL,NULL,0,0),(100,1,'Termine','ofTermine',NULL,0,0),(109,53,'Verkaufsstatistik','buchRechArtikelVerkaufStatistik',NULL,0,0),(111,1,'Vorgaenge','buchRechnungListe',NULL,0,0);

UNLOCK TABLES;

/*Table structure for table `treeviewtable` */

DROP TABLE IF EXISTS `treeviewtable`;

CREATE TABLE `treeviewtable` (
  `key` varchar(4) DEFAULT NULL,
  `parent` varchar(4) DEFAULT NULL,
  `text` varchar(100) DEFAULT NULL,
  `image` smallint(5) DEFAULT NULL,
  `selectedimage` smallint(5) DEFAULT NULL,
  UNIQUE KEY `text` (`text`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `treeviewtable` */

LOCK TABLES `treeviewtable` WRITE;

insert  into `treeviewtable`(`key`,`parent`,`text`,`image`,`selectedimage`) values ('122_','119_','Artikel nach EAN',1,2),('123_','119_','Artikel nach Kategorie',1,2),('12_','1_','Mitarbeiter',3,3),('25_','1_','Lagerverwaltung',12,12),('26_','25_','Lagerbestand',1,2),('27_','25_','Artikel Einlieferung',1,2),('28_','25_','Artikel Auslieferung',1,2),('4_','1_','Kunden',3,3),('101_','4_','Kundengruppen',1,2),('29_','4_','Kunden Alle',1,2),('30_','4_','Kunden A-K',1,2),('39_','4_','Kunden L-Z',1,2),('73_','4_','Kunden Firmen',1,2),('53_','1_','Statistiken',9,9),('109_','53_','Verkaufsstatistik',9,9),('80_','1_','Mahnwesen',11,11),('82_','80_','Stufe I',1,2),('83_','80_','Stufe II',1,2),('84_','80_','Stufe III',1,2),('99_','1_','Lieferanten',8,8),('1_','0_','Home',1,1),('100_','1_','Termine',10,10),('106_','1_','Daten Import&Export',13,13),('108_','1_','Einstellungen',6,6),('111_','1_','Vorgaenge',1,2),('112_','111_','Angebote',1,2),('113_','111_','Auftraege',1,2),('114_','111_','Lieferscheine',1,2),('115_','111_','Retourwaren',1,2),('116_','111_','Rechnungen',1,2),('117_','111_','Rüstscheine',1,2),('118_','111_','Gutschriften',1,2),('119_','1_','Artikel',1,2),('120_','119_','Artikel nach ArtNr',1,2),('121_','119_','Artikel nach Bezeichnung',1,2),('124_','119_','Artikelkategorien Manager',1,2),('102_','4_','Kunden nach Gruppen',1,2);

UNLOCK TABLES;

/*Table structure for table `userbookmarks` */

DROP TABLE IF EXISTS `userbookmarks`;

CREATE TABLE `userbookmarks` (
  `BookmarkId` int(10) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  `PreBookmarkId` int(10) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BookmarkId`),
  KEY `DocumentId` (`URL`),
  KEY `PreBookmarkId` (`PreBookmarkId`),
  KEY `UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userbookmarks` */

LOCK TABLES `userbookmarks` WRITE;

insert  into `userbookmarks`(`BookmarkId`,`URL`,`UserId`,`PreBookmarkId`,`Name`,`Description`) values (1,'../default.asp?ArtNR=1000',0,0,'BMW 316','Produkte'),(3,'../default.asp?ArtNR=1010',0,0,'TEST','Produkte');

UNLOCK TABLES;

/*Table structure for table `userqueries` */

DROP TABLE IF EXISTS `userqueries`;

CREATE TABLE `userqueries` (
  `Id` int(10) NOT NULL,
  `SQLString` longtext,
  `SQLDescription` longtext,
  `SID` int(10) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `IntervalInDays` int(10) DEFAULT NULL,
  `NextRun` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `DocumentId` (`SQLString`(45)),
  KEY `PreBookmarkId` (`SID`),
  KEY `UserId` (`SQLDescription`(45))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userqueries` */

LOCK TABLES `userqueries` WRITE;

insert  into `userqueries`(`Id`,`SQLString`,`SQLDescription`,`SID`,`CreatedOn`,`IntervalInDays`,`NextRun`) values (1,'../default.asp?ArtNR=1000','0',0,NULL,NULL,NULL),(3,'../default.asp?ArtNR=1010','0',0,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `usersearches` */

DROP TABLE IF EXISTS `usersearches`;

CREATE TABLE `usersearches` (
  `QueryId` int(10) NOT NULL,
  `SQLString` longtext,
  `SQLDescription` longtext,
  `SID` int(10) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`QueryId`),
  KEY `DocumentId` (`SQLString`(45)),
  KEY `PreBookmarkId` (`SID`),
  KEY `UserId` (`SQLDescription`(45))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usersearches` */

LOCK TABLES `usersearches` WRITE;

insert  into `usersearches`(`QueryId`,`SQLString`,`SQLDescription`,`SID`,`CreatedOn`) values (1,'../default.asp?ArtNR=1000','0',0,NULL),(3,'../default.asp?ArtNR=1010','0',0,NULL),(4,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1  AND grArtikel.ArtKatNr like ~2~)','und Produktkategorie ist wie Pork',97,NULL),(5,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1  AND grArtikel.ArtKatNr like ~9~)','und Produktkategorie ist wie Obst & Gemüse',98,NULL),(6,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1  AND grArtikel.ArtKatNr like ~12~)','und Produktkategorie ist wie Bio Pork',98,NULL),(7,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1  AND grArtikel.ArtKatNr like ~2~)','und Produktkategorie ist wie Pork',98,NULL),(8,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1  AND grArtikel.ArtKatNr like ~5~)','und Produktkategorie ist wie Chicken',98,NULL),(9,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND `ArtNr` like ~%123%~)','und Produktnummer ist wie 123',102,NULL),(10,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND `ArtNr` like ~%1000%~)','und Produktnummer ist wie 1000',102,NULL),(11,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND `ArtNr` like ~%1001%~)','und Produktnummer ist wie 1001',102,NULL),(12,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%test%~ OR `EAN` like ~%test%~  OR `Beschreibung` like ~%test%~  OR `Firma` like ~%test%~) )','test',106,NULL),(13,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%test%~ OR `EAN` like ~%test%~  OR `Beschreibung` like ~%test%~  OR `Firma` like ~%test%~) )','test',107,NULL),(14,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%stirn%~ OR `EAN` like ~%stirn%~  OR `Beschreibung` like ~%stirn%~  OR `Firma` like ~%stirn%~) )','stirn',107,NULL),(15,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%seiten%~ OR `EAN` like ~%seiten%~  OR `Beschreibung` like ~%seiten%~  OR `Firma` like ~%seiten%~) )','seiten',110,NULL),(16,'SELECT  IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (`ArtNr` =801 OR `EAN` like ~801~)','801',114,NULL),(17,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%801%~ OR `EAN` like ~%801%~  OR `Beschreibung` like ~%801%~  OR `Firma` like ~%801%~) AND (`Bezeichnung` like ~%TI%~ OR `EAN` like ~%TI%~  OR `Beschreibung` like ~%TI%~  OR `Firma` like ~%TI%~) AND (`Bezeichnung` like ~%POWER%~ OR `EAN` like ~%POWER%~  OR `Beschreibung` like ~%POWER%~  OR `Firma` like ~%POWER%~) )','801 TI POWER',114,NULL),(18,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%POWER%~ OR `EAN` like ~%POWER%~  OR `Beschreibung` like ~%POWER%~  OR `Firma` like ~%POWER%~) )','POWER',115,NULL),(19,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%801%~ OR `EAN` like ~%801%~  OR `Beschreibung` like ~%801%~  OR `Firma` like ~%801%~) AND (`Bezeichnung` like ~%POWER%~ OR `EAN` like ~%POWER%~  OR `Beschreibung` like ~%POWER%~  OR `Firma` like ~%POWER%~) )','801 POWER',115,NULL),(20,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%test%~ OR `EAN` like ~%test%~  OR `Beschreibung` like ~%test%~  OR `Firma` like ~%test%~) )','test',115,NULL),(21,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%refwerfwerf%~ OR `EAN` like ~%refwerfwerf%~  OR `Beschreibung` like ~%refwerfwerf%~  OR `Firma` like ~%refwerfwerf%~) )','refwerfwerf',115,NULL),(22,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%wergvwervwervwe%~ OR `EAN` like ~%wergvwervwervwe%~  OR `Beschreibung` like ~%wergvwervwervwe%~  OR `Firma` like ~%wergvwervwervwe%~) )','wergvwervwervwe',115,NULL),(23,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%UA95615b%~ OR `EAN` like ~%UA95615b%~  OR `Beschreibung` like ~%UA95615b%~  OR `Firma` like ~%UA95615b%~) )','UA95615b',162,NULL),(24,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%tst%~ OR `EAN` like ~%tst%~  OR `Beschreibung` like ~%tst%~  OR `Firma` like ~%tst%~) )','tst',168,NULL),(25,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%D025%~ OR `EAN` like ~%D025%~  OR `Beschreibung` like ~%D025%~  OR `Firma` like ~%D025%~) )','D025',184,NULL),(26,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%D024c%~ OR `EAN` like ~%D024c%~  OR `Beschreibung` like ~%D024c%~  OR `Firma` like ~%D024c%~) )','D024c',184,NULL),(27,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%Tacky%~ OR `EAN` like ~%Tacky%~  OR `Beschreibung` like ~%Tacky%~  OR `Firma` like ~%Tacky%~  OR EXISTS (SELECT 1 FROM  translations t where t.tablename = ~grAatikel~ and t.tanslation like ~%Tacky%~ )))','Tacky',185,NULL),(28,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%lamp%~ OR `EAN` like ~%lamp%~  OR `Beschreibung` like ~%lamp%~  OR `Firma` like ~%lamp%~  OR EXISTS (SELECT 1 FROM  translations t where t.tablename = ~grAatikel~ and t.translation like ~%lamp%~ )))','lamp',185,NULL),(29,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%Grigor%~ OR `EAN` like ~%Grigor%~  OR `Beschreibung` like ~%Grigor%~  OR `Firma` like ~%Grigor%~  OR EXISTS (SELECT 1 FROM  translations t where t.tablename = ~grAatikel~ and t.translation like ~%Grigor%~ )))','Grigor',185,NULL),(30,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%MIRO%~ OR `EAN` like ~%MIRO%~  OR `Beschreibung` like ~%MIRO%~  OR `Firma` like ~%MIRO%~  OR EXISTS (SELECT 1 FROM  translations t where t.tablename = ~grAatikel~ and t.translation like ~%MIRO%~ )))','MIRO',185,NULL),(31,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%rrr%~ OR `EAN` like ~%rrr%~  OR `Beschreibung` like ~%rrr%~  OR `Firma` like ~%rrr%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%rrr%~ )))','rrr',185,NULL),(32,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%D025%~ OR `EAN` like ~%D025%~  OR `Beschreibung` like ~%D025%~  OR `Firma` like ~%D025%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%D025%~ )))','D025',186,NULL),(33,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%test%~ OR `EAN` like ~%test%~  OR `Beschreibung` like ~%test%~  OR `Firma` like ~%test%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%test%~ )))','test',186,NULL),(34,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%fffrfrf%~ OR `EAN` like ~%fffrfrf%~  OR `Beschreibung` like ~%fffrfrf%~  OR `Firma` like ~%fffrfrf%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%fffrfrf%~ )))','fffrfrf',186,NULL),(35,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%xxxx%~ OR `EAN` like ~%xxxx%~  OR `Beschreibung` like ~%xxxx%~  OR `Firma` like ~%xxxx%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%xxxx%~ )))','xxxx',186,NULL),(36,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%cccc%~ OR `EAN` like ~%cccc%~  OR `Beschreibung` like ~%cccc%~  OR `Firma` like ~%cccc%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%cccc%~ )))','cccc',186,NULL),(37,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%test%~ OR `EAN` like ~%test%~  OR `Beschreibung` like ~%test%~  OR `Firma` like ~%test%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%test%~ )))','test',194,NULL),(38,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%ten%~ OR `EAN` like ~%ten%~  OR `Beschreibung` like ~%ten%~  OR `Firma` like ~%ten%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%ten%~ )))','ten',6,NULL),(39,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%pro%~ OR `EAN` like ~%pro%~  OR `Beschreibung` like ~%pro%~  OR `Firma` like ~%pro%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%pro%~ )))','pro',6,NULL),(40,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%pro%~ OR `EAN` like ~%pro%~  OR `Beschreibung` like ~%pro%~  OR `Firma` like ~%pro%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%pro%~ )))','pro',7,NULL),(41,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%pro%~ OR `EAN` like ~%pro%~  OR `Beschreibung` like ~%pro%~  OR `Firma` like ~%pro%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%pro%~ )))','pro',8,NULL),(42,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%chall%~ OR `EAN` like ~%chall%~  OR `Beschreibung` like ~%chall%~  OR `Firma` like ~%chall%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%chall%~ )))','chall',9,NULL),(43,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%chal%~ OR `EAN` like ~%chal%~  OR `Beschreibung` like ~%chal%~  OR `Firma` like ~%chal%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%chal%~ )))','chal',9,NULL),(44,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%pro%~ OR `EAN` like ~%pro%~  OR `Beschreibung` like ~%pro%~  OR `Firma` like ~%pro%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%pro%~ )))','pro',13,NULL),(45,'SELECT  IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=0 and preisATS<>0 AND (`ArtNr` =1000 OR `EAN` like ~1000~)','1000',24,NULL),(46,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%cara%~ OR `EAN` like ~%cara%~  OR `Beschreibung` like ~%cara%~  OR `Firma` like ~%cara%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%cara%~ )))','cara',28,NULL),(47,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%test%~ OR `EAN` like ~%test%~  OR `Beschreibung` like ~%test%~  OR `Firma` like ~%test%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%test%~ )))','test',28,NULL),(48,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%suche%~ OR `EAN` like ~%suche%~  OR `Beschreibung` like ~%suche%~  OR `Firma` like ~%suche%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%suche%~ )))','suche',30,NULL),(49,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%suche%~ OR `EAN` like ~%suche%~  OR `Beschreibung` like ~%suche%~  OR `Firma` like ~%suche%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%suche%~ )))','suche',31,NULL),(50,'SELECT  IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (`ArtNr` =1000 OR `EAN` like ~1000~)','1000',32,NULL),(51,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%test%~ OR `EAN` like ~%test%~  OR `Beschreibung` like ~%test%~  OR `Firma` like ~%test%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%test%~ )))','test',32,NULL),(52,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%test%~ OR `EAN` like ~%test%~  OR `Beschreibung` like ~%test%~  OR `Firma` like ~%test%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%test%~ )))','test',34,NULL),(53,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%cha%~ OR `EAN` like ~%cha%~  OR `Beschreibung` like ~%cha%~  OR `Firma` like ~%cha%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%cha%~ )))','cha',34,NULL),(54,'SELECT  IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (`ArtNr` =1000 OR `EAN` like ~1000~)','1000',41,NULL),(55,'SELECT  IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (`ArtNr` =1000 OR `EAN` like ~1000~)','1000',47,NULL),(56,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%test%~ OR `EAN` like ~%test%~  OR `Beschreibung` like ~%test%~  OR `Firma` like ~%test%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%test%~ )))','test',47,NULL),(57,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%test%~ OR `EAN` like ~%test%~  OR `Beschreibung` like ~%test%~  OR `Firma` like ~%test%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%test%~ )))','test',56,NULL),(58,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%xenon%~ OR `EAN` like ~%xenon%~  OR `Beschreibung` like ~%xenon%~  OR `Firma` like ~%xenon%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%xenon%~ )))','xenon',56,NULL),(59,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%test%~ OR `EAN` like ~%test%~  OR `Beschreibung` like ~%test%~  OR `Firma` like ~%test%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%test%~ )))','test',65,NULL),(60,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%xenon%~ OR `EAN` like ~%xenon%~  OR `Beschreibung` like ~%xenon%~  OR `Firma` like ~%xenon%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%xenon%~ )))','xenon',65,NULL),(61,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%Suche...%~ OR `EAN` like ~%Suche...%~  OR `Beschreibung` like ~%Suche...%~  OR `Firma` like ~%Suche...%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%Suche...%~ )))','Suche...',69,NULL),(62,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%bogen%~ OR `EAN` like ~%bogen%~  OR `Beschreibung` like ~%bogen%~  OR `Firma` like ~%bogen%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%bogen%~ )))','bogen',69,NULL),(63,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%kurs%~ OR `EAN` like ~%kurs%~  OR `Beschreibung` like ~%kurs%~  OR `Firma` like ~%kurs%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%kurs%~ )))','kurs',69,NULL),(64,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%Suche...%~ OR `EAN` like ~%Suche...%~  OR `Beschreibung` like ~%Suche...%~  OR `Firma` like ~%Suche...%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%Suche...%~ )))','Suche...',72,NULL),(65,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%bogen%~ OR `EAN` like ~%bogen%~  OR `Beschreibung` like ~%bogen%~  OR `Firma` like ~%bogen%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%bogen%~ )))','bogen',72,NULL),(66,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%cha%~ OR `EAN` like ~%cha%~  OR `Beschreibung` like ~%cha%~  OR `Firma` like ~%cha%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%cha%~ )))','cha',75,NULL),(67,'SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung  FROM grArtikel, lieferantenAdressen   Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR  AND ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0 AND (1=1 AND (`Bezeichnung` like ~%xenon%~ OR `EAN` like ~%xenon%~  OR `Beschreibung` like ~%xenon%~  OR `Firma` like ~%xenon%~  OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = ~grArtikel~ and t.translation like ~%xenon%~ )))','xenon',75,NULL);

UNLOCK TABLES;

/*Table structure for table `webadminmenu` */

DROP TABLE IF EXISTS `webadminmenu`;

CREATE TABLE `webadminmenu` (
  `MenuNr` int(10) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `MenuNrParent` int(10) DEFAULT NULL,
  `Desc` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MenuNr`),
  UNIQUE KEY `grArtikel-KategorienArtKatNr` (`MenuNr`),
  KEY `ArtKatNrParent` (`MenuNrParent`),
  KEY `Desc` (`Desc`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webadminmenu` */

LOCK TABLES `webadminmenu` WRITE;

insert  into `webadminmenu`(`MenuNr`,`Name`,`MenuNrParent`,`Desc`,`URL`) values (0,'IntraSell Administrator Menu',-1,NULL,NULL),(1,'offene Vorgänge',0,NULL,'lists/listOrders.asp?OrderType=AU&showClosedOrders=0'),(2,'abgeschlossene Vorgänge',0,NULL,'lists/listOrders.asp?OrderType=AU&showClosedOrders=1'),(3,'Daten Import/Export',0,NULL,'impex/importPreises.asp'),(4,'Produkte und Preise',0,NULL,'genericAsp/specialSearchl.asp?SearchFormFilename=SearchForm_grArtikel.htm'),(5,'Statistiken',0,NULL,'stats/stat_webGenericStats.asp?stat=Sessions'),(6,'Tabellen',0,NULL,'genericAsp/tableRedirector_Vars.asp'),(7,'Vorgangstabellen',0,NULL,'genericAsp/tableRedirector_Vars.asp'),(9,'Einstellungen',0,NULL,'genericAsp/tableRedirector_Vars.asp'),(10,'Hilfe',0,NULL,'help.asp'),(11,'Auftrag',1,NULL,'lists/listOrders.asp?OrderType=AU&showClosedOrders=0'),(12,'Rechnung',1,NULL,'lists/listOrders.asp?OrderType=AR&showClosedOrders=0'),(13,'Lieferschein',1,NULL,'lists/listOrders.asp?OrderType=LI&showClosedOrders=0'),(14,'Retourwaren',1,NULL,'lists/listOrders.asp?OrderType=RT&showClosedOrders=0'),(15,'Angebot',1,NULL,'lists/listOrders.asp?OrderType=AN&showClosedOrders=0'),(21,'Auftrag',2,NULL,'lists/listOrders.asp?OrderType=AU&showClosedOrders=1'),(22,'Rechnung',2,NULL,'lists/listOrders.asp?OrderType=AR&showClosedOrders=1'),(23,'Lieferschein',2,NULL,'lists/listOrders.asp?OrderType=LI&showClosedOrders=1'),(24,'Retourwaren',2,NULL,'lists/listOrders.asp?OrderType=RT&showClosedOrders=1'),(25,'Angebot',2,NULL,'lists/listOrders.asp?OrderType=AN&showClosedOrders=1'),(31,'Produkte importieren',3,NULL,'impex/importPreises.asp'),(32,'Produkte importieren CSV',3,NULL,'impex/importCSV.asp'),(33,'CSV Datei Upload',3,NULL,'impex/uploadCSV.asp'),(34,'Produkte exportieren',3,NULL,'impex/exportPreises.asp'),(35,'upload Produktbilder',3,NULL,'../admin/upload/uploadProductImages.asp'),(36,'upload Firmenlogo',3,NULL,'../admin/upload/uploadLogo.asp'),(37,'import Produkte / ITAll',3,NULL,'impex/module_itall/importPreisesITALL.asp'),(38,'Category Mapping/ ITAll',3,NULL,'impex/module_itall/tableRedirector_itallCategoryMapping.asp'),(41,'Produkte/Suche',4,NULL,'../admin/genericAsp/specialSearchl.asp?SearchFormFilename=SearchForm_grArtikel.htm'),(42,'Produkte',4,NULL,'../admin/genericAsp/tableRedirector_Products.asp'),(43,'MWST',4,NULL,'../admin/genericAsp/tableRedirector_grMWST.asp'),(44,'Staffelpreise',4,NULL,'../admin/genericAsp/tableRedirector_grArtrikel_Staffelpreise.asp'),(45,'Kategorien',4,NULL,'../admin/genericAsp/tableRedirector_Categories.asp'),(46,'Top Products',4,NULL,'../admin/genericAsp/tableRedirector_webCatTopProducts.asp'),(47,'Price Hits',4,NULL,'../admin/genericAsp/tableRedirector_webTopTen.asp'),(48,'Transportkosten',4,NULL,'../admin/genericAsp/tableRedirector_grArtikel-VertriebsKosten.asp'),(49,'Verwandte Produkte',4,NULL,'../admin/genericAsp/tableRedirector_grArtikel-VerwandteArtikel.asp'),(51,'Sessions',5,NULL,'../admin/stats/stat_webGenericStats.asp?stat=Sessions'),(52,'Rechnung',5,NULL,'../admin/stats/stat_webGenericStats.asp?stat=Order&Type=RE'),(53,'Verkauf',5,NULL,'../admin/stats/stat_webGenericStats.asp?stat=Sales'),(54,'Sessions Tag',0,NULL,'../admin/stats/stat_webGenericStats.asp?stat=Sessions_Tag'),(62,'Adressen/Suche',6,NULL,'../admin/genericAsp/specialSearchl.asp?SearchFormFilename=SearchForm_ofAdressen.htm'),(63,'Adressen',6,NULL,'../admin/genericAsp/tableRedirector_Adressen.asp'),(64,'Adressen/PLZ',6,NULL,'../admin/genericAsp/tableRedirector_AdressenPLZ.asp'),(65,'Lieferanten',6,NULL,'../admin/genericAsp/tableRedirector_Lieferanten.asp'),(66,'Newsletter',6,NULL,'../admin/genericAsp/tableRedirector_webNewsletter.asp'),(67,'Referers',6,NULL,'../admin/genericAsp/tableRedirector_webReferers.asp'),(81,'Shop',8,NULL,'../cgi/default.asp'),(90,'Einstellungen',9,NULL,'../admin/genericAsp/tableRedirector_Vars.asp'),(91,'FAQ',9,NULL,'../admin/genericAsp/tableRedirector_webFAQ.asp'),(92,'Serienemail Newsletter',9,NULL,'../intrasoft/createMailsToSend.asp?SQL_RECEIVERS=SELECT distinct EMAIL FROM webNewsletter'),(93,'Serienemail Kunden',9,NULL,'../intrasoft/createMailsToSend.asp?SQL_RECEIVERS=SELECT distinct EMAIL FROM ofAdressen'),(94,'Serienemail Absenden',9,NULL,'../intrasoft/sendMailstoSend.asp'),(101,'Shop',10,NULL,'../default.asp'),(102,'Hilfe',10,NULL,'../admin/help.asp'),(103,'Setup Wizzard',10,NULL,'../admin/setup/wizzard.asp'),(611,'Auftrag',7,NULL,'../admin/genericAsp/tableRedirector_buchAuftrag.asp'),(612,'Rechnung',7,NULL,'../admin/genericAsp/tableRedirector_buchRechnung.asp'),(614,'Lieferschein',7,NULL,'../admin/genericAsp/tableRedirector_buchLieferschein.asp'),(615,'Retourwaren',7,NULL,'../admin/genericAsp/tableRedirector_buchRetourwaren.asp'),(616,'Angebot',7,NULL,'../admin/genericAsp/tableRedirector_buchAngebot.asp'),(651,'Land',6,NULL,'../admin/genericAsp/tableRedirector_grLand.asp'),(652,'Admin Menus',6,NULL,'../admin/genericAsp/tableRedirector_webAdminMenu.asp'),(653,'Zahlungsbedingung',6,NULL,'../admin/genericAsp/tableRedirector_grZahlungsbedingung.asp'),(654,'Zahlungsmethode',6,NULL,'../admin/genericAsp/tableRedirector_grZahlungsmethode.asp'),(655,'PLZ',6,NULL,'../admin/genericAsp/tableRedirector_grPLZ.asp'),(656,'Pages',6,NULL,'../admin/genericAsp/tableRedirector_webPages.asp');

UNLOCK TABLES;

/*Table structure for table `webbanners` */

DROP TABLE IF EXISTS `webbanners`;

CREATE TABLE `webbanners` (
  `BannerId` int(10) NOT NULL,
  `CatId` int(10) DEFAULT NULL,
  `LieferantId` int(10) DEFAULT NULL,
  `BannerName` varchar(50) DEFAULT NULL,
  `BannerFile` varchar(255) DEFAULT NULL,
  `BannerLink` varchar(255) DEFAULT NULL,
  `ActiveFrom` datetime DEFAULT NULL,
  `ActiveTo` datetime DEFAULT NULL,
  `ImpresionsCount` int(10) DEFAULT NULL,
  `ClicksCount` int(10) DEFAULT NULL,
  `maxImpressionsCount` int(10) DEFAULT NULL,
  `openInNewWindow` tinyint(1) NOT NULL,
  PRIMARY KEY (`BannerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webbanners` */

LOCK TABLES `webbanners` WRITE;

insert  into `webbanners`(`BannerId`,`CatId`,`LieferantId`,`BannerName`,`BannerFile`,`BannerLink`,`ActiveFrom`,`ActiveTo`,`ImpresionsCount`,`ClicksCount`,`maxImpressionsCount`,`openInNewWindow`) values (1,0,2,'1','http://www.smartefox.com/banners/amazon-03.gif','http://www.amazon.de/exec/obidos/redirect-home?tag=shoppingnetwo-21&site=home','2002-03-07 23:00:00','2003-02-25 00:00:00',9194,71,10000,-1),(3,1,7232,'2','http://www.smartefox.com/banners/neckermann.gif','http://www.neckermann.at','2002-03-03 23:00:00','2003-02-25 00:00:00',5109,61,10000,-1),(5,119,2,'1','http://www.smartefox.com/banners/amazon-03.gif','http://www.amazon.de/exec/obidos/redirect-home?tag=shoppingnetwo-21&site=home','2002-03-07 23:00:00','2003-02-25 00:00:00',1217,9,5000,-1),(6,1,4,'4','http://www.smartefox.com/at/banners/guenter-button.gif','http://www.netzmarkt.de/guenther/fs.html?vmp=1092','2002-07-23 00:00:00','2003-07-24 00:00:00',2614,5043,100000,-1),(7,114,4,'1','http://view.autoscout24.de/view.asp?site=1679&ref=133502&b=3','http://click.autoscout24.de/click.asp?ref=133502&site=1679&type=b3&bnb=3','2002-07-25 00:00:00','2003-07-25 00:00:00',107,14,10000,-1),(8,124,4,'1','http://view.finanzscout24.de/view.asp?site=1711&ref=133502&b=1','http://click.finanzscout24.de/click.asp?ref=133502&site=1711&type=b1&bnb=1','2002-07-25 00:00:00','2003-07-25 00:00:00',70,13,10000,-1),(9,22,1,'1',NULL,NULL,'2004-01-01 00:00:00',NULL,NULL,NULL,NULL,0);

UNLOCK TABLES;

/*Table structure for table `webbannerslogs` */

DROP TABLE IF EXISTS `webbannerslogs`;

CREATE TABLE `webbannerslogs` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `bannerId` int(10) DEFAULT NULL,
  `FromIP` varchar(50) DEFAULT NULL,
  `referingURL` varchar(255) DEFAULT NULL,
  `DateTimestamp` datetime DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=latin1;

/*Data for the table `webbannerslogs` */

LOCK TABLES `webbannerslogs` WRITE;

insert  into `webbannerslogs`(`Id`,`bannerId`,`FromIP`,`referingURL`,`DateTimestamp`,`Type`) values (1,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-07 16:51:16','View'),(2,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-07 16:51:32','View'),(3,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-07 16:53:49','View'),(4,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-07 16:56:36','View'),(5,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-07 16:57:03','View'),(6,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-07 16:57:44','View'),(7,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-07 16:58:16','View'),(8,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-07 17:01:13','View'),(9,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-07 17:02:37','View'),(10,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-07 17:25:24','View'),(11,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-07 17:54:48','View'),(12,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-07 18:01:15','View'),(13,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-13 17:05:01','View'),(14,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-13 17:07:02','View'),(15,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-17 20:23:02','View'),(16,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-17 20:25:27','View'),(17,1,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-17 20:25:29','View'),(18,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-17 22:19:05','View'),(19,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-19 21:04:54','View'),(20,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-19 22:55:19','View'),(21,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-19 22:55:22','View'),(22,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-19 22:59:35','View'),(23,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-19 22:59:53','View'),(24,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-19 23:37:09','View'),(25,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-19 23:55:13','View'),(26,1,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-19 23:55:16','View'),(27,1,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:07:57','View'),(28,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:08:00','View'),(29,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:08:03','View'),(30,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:08:07','View'),(31,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:08:12','View'),(32,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:08:18','View'),(33,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:08:25','View'),(34,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:08:25','View'),(35,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:08:44','View'),(36,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:09:58','View'),(37,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:10:26','View'),(38,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:11:35','View'),(39,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:11:49','View'),(40,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:11:51','View'),(41,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:11:52','View'),(42,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:11:52','View'),(43,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:11:53','View'),(44,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:12:05','View'),(45,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:12:07','View'),(46,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:12:07','View'),(47,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:13:31','View'),(48,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:13:51','View'),(49,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-20 00:16:06','View'),(50,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-21 23:01:09','View'),(51,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-21 23:08:57','View'),(52,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2002-12-21 23:10:37','View'),(53,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-25 10:41:01','View'),(54,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-25 11:03:22','View'),(55,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-25 11:03:22','View'),(56,1,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-25 11:23:43','View'),(57,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-25 11:23:45','View'),(58,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-25 11:27:03','View'),(59,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-25 14:38:20','View'),(60,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-25 14:43:34','View'),(61,1,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-25 15:08:21','View'),(62,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-25 15:41:27','View'),(63,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-25 15:41:30','View'),(64,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-25 16:34:39','View'),(65,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-25 16:35:08','View'),(66,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-25 17:12:48','View'),(67,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-25 17:15:05','View'),(68,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 12:26:05','View'),(69,1,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 12:34:22','View'),(70,1,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:07:08','View'),(71,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:18:11','View'),(72,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:18:11','View'),(73,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:18:13','View'),(74,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:18:14','View'),(75,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:18:15','View'),(76,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:18:16','View'),(77,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:18:16','View'),(78,1,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:25:07','View'),(79,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:26:13','View'),(80,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:26:21','View'),(81,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:26:24','View'),(82,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:26:25','View'),(83,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:26:25','View'),(84,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:26:26','View'),(85,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:28:01','View'),(86,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:28:02','View'),(87,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:28:04','View'),(88,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:30:21','View'),(89,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:30:21','View'),(90,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:34:54','View'),(91,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:35:01','View'),(92,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:35:02','View'),(93,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:35:03','View'),(94,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:36:22','View'),(95,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 14:36:24','View'),(96,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 15:29:58','View'),(97,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 15:30:00','View'),(98,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 15:30:01','View'),(99,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 15:30:01','View'),(100,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 15:42:27','View'),(101,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 15:42:27','View'),(102,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 15:43:08','View'),(103,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 15:54:39','View'),(104,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:02:38','View'),(105,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:03:05','View'),(106,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:03:08','View'),(107,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:03:12','View'),(108,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:04:40','View'),(109,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:08:37','View'),(110,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:08:53','View'),(111,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:09:50','View'),(112,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:10:47','View'),(113,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:10:48','View'),(114,1,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:10:50','View'),(115,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:10:56','View'),(116,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:11:26','View'),(117,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:11:31','View'),(118,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:11:33','View'),(119,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:11:39','View'),(120,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:12:12','View'),(121,3,'127.0.0.1','http://localhost/webshop/cgi/Default.asp','2003-01-26 19:12:14','View'),(122,3,'127.0.0.1','http://localhost/webshop/cgi/Default.asp','2003-01-26 19:12:16','View'),(123,3,'127.0.0.1','http://localhost/webshop/cgi/Default.asp','2003-01-26 19:12:18','View'),(124,3,'127.0.0.1','http://localhost/webshop/cgi/Default.asp','2003-01-26 19:32:39','View'),(125,3,'127.0.0.1','http://localhost/webshop/cgi/Default.asp','2003-01-26 19:35:34','View'),(126,1,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:37:46','View'),(127,1,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:38:14','View'),(128,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:51:16','View'),(129,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:56:06','View'),(130,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 19:59:18','View'),(131,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 20:01:54','View'),(132,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 20:20:55','View'),(133,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-26 20:22:31','View'),(134,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-28 19:44:31','View'),(135,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-28 19:56:10','View'),(136,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-28 19:56:10','View'),(137,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-29 00:10:21','View'),(138,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-31 17:39:32','View'),(139,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-01-31 17:41:48','View'),(140,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 21:59:37','View'),(141,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:03:28','View'),(142,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:05:07','View'),(143,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:08:29','View'),(144,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:20:58','View'),(145,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:22:03','View'),(146,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:23:02','View'),(147,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:38:15','View'),(148,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:39:10','View'),(149,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:40:04','View'),(150,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:40:29','View'),(151,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:41:45','View'),(152,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:51:01','View'),(153,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:51:23','View'),(154,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:51:54','View'),(155,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:52:19','View'),(156,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:52:33','View'),(157,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:53:53','View'),(158,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-07 22:54:11','View'),(159,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-08 13:10:53','View'),(160,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-08 13:11:07','View'),(161,1,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-08 14:07:08','View'),(162,1,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-08 14:08:11','View'),(163,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-18 21:58:00','View'),(164,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-22 19:19:58','View'),(165,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-22 19:20:05','View'),(166,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-22 19:20:42','View'),(167,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-22 19:20:53','View'),(168,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-22 19:20:54','View'),(169,1,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-22 19:20:56','View'),(170,1,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-22 19:21:40','View'),(171,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-22 19:35:03','View'),(172,3,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-22 19:35:05','View'),(173,1,'127.0.0.1','http://localhost/webshop/cgi/default.asp','2003-02-22 19:35:06','View');

UNLOCK TABLES;

/*Table structure for table `webcards` */

DROP TABLE IF EXISTS `webcards`;

CREATE TABLE `webcards` (
  `LoveCard_ID` int(10) NOT NULL AUTO_INCREMENT,
  `FromName` varchar(20) DEFAULT NULL,
  `FromEmail` varchar(100) DEFAULT NULL,
  `ToName` varchar(20) DEFAULT NULL,
  `ToEmail` varchar(100) DEFAULT NULL,
  `LoveText` longtext,
  `CardName` varchar(20) DEFAULT NULL,
  `DateFrom` datetime DEFAULT NULL,
  PRIMARY KEY (`LoveCard_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

/*Data for the table `webcards` */

LOCK TABLES `webcards` WRITE;

insert  into `webcards`(`LoveCard_ID`,`FromName`,`FromEmail`,`ToName`,`ToEmail`,`LoveText`,`CardName`,`DateFrom`) values (36,'werfwerf','grigor@gmx.at','erfwerf','grigor@gmx.at','werfwerf','card_6.gif','2001-12-29 20:23:10'),(37,'werfwerf','grigor@gmx.at','erfwerf','grigor@gmx.at','werfwerf','card_6.gif','2001-12-29 20:23:42');

UNLOCK TABLES;

/*Table structure for table `webcatsindex` */

DROP TABLE IF EXISTS `webcatsindex`;

CREATE TABLE `webcatsindex` (
  `ArtKatNrPArent` int(10) NOT NULL,
  `ArtKAtNR` int(10) NOT NULL,
  PRIMARY KEY (`ArtKatNrPArent`,`ArtKAtNR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webcatsindex` */

LOCK TABLES `webcatsindex` WRITE;

insert  into `webcatsindex`(`ArtKatNrPArent`,`ArtKAtNR`) values (0,1),(0,2),(0,3),(0,11),(0,12),(0,13),(0,21),(0,22),(0,23),(0,31),(0,32),(0,33),(1,11),(1,12),(1,13),(2,21),(2,22),(2,23),(3,31),(3,32),(3,33),(11,11),(12,12),(13,13),(21,21),(22,22),(23,23),(31,31),(32,32),(33,33),(9999,9999);

UNLOCK TABLES;

/*Table structure for table `webcattopproducts` */

DROP TABLE IF EXISTS `webcattopproducts`;

CREATE TABLE `webcattopproducts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `CatID` int(10) DEFAULT NULL,
  `ProductID` int(10) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CatID` (`CatID`),
  KEY `id` (`id`),
  KEY `ProductID` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `webcattopproducts` */

LOCK TABLES `webcattopproducts` WRITE;

insert  into `webcattopproducts`(`id`,`CatID`,`ProductID`,`Type`) values (1,0,1017,'TopProduct'),(2,2,1001,'TopProduct'),(3,2,1001,'TopProduct'),(4,2,1001,'TopProduct'),(5,3,7,'TopProduct'),(6,3,5,'TopProduct'),(7,72,525,'TopProduct');

UNLOCK TABLES;

/*Table structure for table `webfaq` */

DROP TABLE IF EXISTS `webfaq`;

CREATE TABLE `webfaq` (
  `FAQID` int(10) NOT NULL AUTO_INCREMENT,
  `Page` varchar(50) DEFAULT NULL,
  `Frage` longtext,
  `Antwort` longtext,
  `Status` varchar(50) DEFAULT NULL,
  `Kein_Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FAQID`),
  KEY `FAQ_Id` (`FAQID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webfaq` */

LOCK TABLES `webfaq` WRITE;

UNLOCK TABLES;

/*Table structure for table `webnewsletter` */

DROP TABLE IF EXISTS `webnewsletter`;

CREATE TABLE `webnewsletter` (
  `NLId` double(15,5) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `NewsletterName` varchar(255) DEFAULT NULL,
  `FromIP` varchar(50) DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `Aktiv` tinyint(1) NOT NULL,
  UNIQUE KEY `Index_95FA54E7_D581_477D` (`NLId`),
  KEY `Index_2` (`Email`),
  KEY `Index_3` (`NewsletterName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webnewsletter` */

LOCK TABLES `webnewsletter` WRITE;

insert  into `webnewsletter`(`NLId`,`Email`,`NewsletterName`,`FromIP`,`Timestamp`,`Aktiv`) values (2.00000,'test@gmx.at','alle neue Produkte in Home','::1',NULL,1),(3.00000,'grigor.tonkov@gmx.at','alle neue Produkte in Home','::1',NULL,1),(4.00000,'buba@gmx.at','Standart','::1',NULL,1),(5.00000,'grigor.tonkov@gmail.com','Standart','127.0.0.1','2009-02-16 23:13:17',1),(6.00000,'kris@gmx.at','Standart','127.0.0.1','2009-04-17 22:38:48',1),(7.00000,'test@test.at','Produkt Challenger in Hauptkategorie','::1','2009-07-17 22:59:34',1);

UNLOCK TABLES;

/*Table structure for table `weborderreferenz` */

DROP TABLE IF EXISTS `weborderreferenz`;

CREATE TABLE `weborderreferenz` (
  `RefID` int(10) NOT NULL AUTO_INCREMENT,
  `RefererId` int(10) DEFAULT NULL,
  `OrderNummer` int(10) DEFAULT NULL,
  `OrderType` varchar(2) DEFAULT NULL,
  `Bezahlt` tinyint(1) NOT NULL,
  PRIMARY KEY (`RefID`),
  KEY `ofAdressenwebOrderReferenz` (`RefererId`),
  KEY `OrderId` (`OrderNummer`),
  KEY `RefererId` (`RefererId`),
  KEY `RefID` (`RefID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `weborderreferenz` */

LOCK TABLES `weborderreferenz` WRITE;

insert  into `weborderreferenz`(`RefID`,`RefererId`,`OrderNummer`,`OrderType`,`Bezahlt`) values (1,1,10,'AU',0);

UNLOCK TABLES;

/*Table structure for table `webpages` */

DROP TABLE IF EXISTS `webpages`;

CREATE TABLE `webpages` (
  `PageID` int(10) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `HTML` longtext,
  `ErstelltAm` datetime DEFAULT NULL,
  PRIMARY KEY (`PageID`),
  KEY `pageID` (`PageID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `webpages` */

LOCK TABLES `webpages` WRITE;

insert  into `webpages`(`PageID`,`Title`,`HTML`,`ErstelltAm`) values (1,'AGB','<h1>AGB</h1> Unsere AGB lauten ....',NULL),(2,'FirstPage','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse; border-width: 0\" bordercolor=\"#111111\" width=\"100%\" id=\"AutoNumber2\" height=\"253\">\r\n  <tr>\r\n    <td width=\"100%\" style=\"border-style: none; border-width: medium\" height=\"162\" valign=\"top\" colspan=\"2\">\r\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse; border-width: 0\" bordercolor=\"#111111\" width=\"100%\" id=\"AutoNumber6\">\r\n        <tr>\r\n          <td width=\"46%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-style: none; border-width: medium\">\r\n                        <center>\r\n                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#111111\" width=\"98%\" id=\"AutoNumber8\" bordercolorlight=\"#FFFFFF\" bordercolordark=\"#FFFFFF\">\r\n              <tr>\r\n                <td width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\r\n                <h1 align=\"left\"><br>\r\n                Willkommen!</h1>\r\n                <p align=\"left\">\r\n          Wir freuen uns Sie in unserem e-store begrüßen zu dürfen. Da wir unser Produktsortiment aktualisieren, bitten wir Sie um \r\n          Verständnis, dass dieses noch nicht vollständig ist bzw. noch einige Fehler auftreten können.&nbsp; jedoch täglich \r\n          erweitert wird. Insgesamt werden Sie die Möglichkeit haben unter den erstklassigen Produkten zu stöbern und auszuwählen. Wir \r\n          wünschen Ihnen dabei Viel Spass!</td>\r\n              </tr>\r\n            </table>\r\n            \r\n                        </center>\r\n            \r\n          </td>\r\n          <td width=\"54%\" border=\"0\" style=\"border-style: none; border-width: medium\">\r\n      <p align=\"center\">\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width=\"46%\" style=\"border-style: none; border-width: none\" height=\"50\" rowspan=\"3\" valign=\"top\">\r\n    </td>\r\n    <td width=\"54%\" border=\"0\" style=\"border-style: none; border-width: none\" height=\"16\">\r\n    <table border=\"0\" cellspacing=\"1\" width=\"98%\" id=\"AutoNumber5\" bordercolorlight=\"#FFFFFF\" bordercolordark=\"#FFFFFF\" bgcolor=\"#FFFFFF\">\r\n      <tr>\r\n        <td width=\"41%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-style: none; border-width: none\">\r\n        <p align=\"center\">\r\n          &nbsp;</td>\r\n        <td width=\"59%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-style: none; border-width: none\">\r\n          <img border=\"0\" src=\"../productimages/1000.gif\" align=\"center\"><br>\r\n          Das ist ein innovatives Produktbeispiel <a href=\"default.asp?ArtNr=1000\">Detail</a></td>\r\n      </tr>\r\n    </table>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width=\"54%\" border=\"0\" style=\"border-style: none; border-width: medium\" height=\"17\">\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width=\"54%\" border=\"0\" style=\"border-style: none; border-width: medium\" height=\"17\">\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width=\"46%\" style=\"border-style: none; border-width: medium\" height=\"16\">\r\n    </td>\r\n    <td width=\"54%\" style=\"border-style: none; border-width: medium\" height=\"16\">\r\n    </td>\r\n  </tr>\r\n</table>',NULL),(3,'Lieferung','<h1>Lieferung</h1> Unsere Lieferung werden so und so gemacht ....',NULL),(4,'Kontakt','<h1>Kontakt</h1> Unsere Adresse lautet:',NULL),(5,'Retournierungen','<h1>Retournierungen</h1>  Retournierungen können Sie so und so machen ...',NULL),(6,'Datenschutz','\r\n <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse; border-width: 0\" bordercolor=\"#111111\" width=\"100%\" id=\"AutoNumber1\">\r\n   <tr>\r\n     <td width=\"33%\" style=\"border-style: none; border-width: medium\">\r\n     &nbsp;</td>\r\n     <td width=\"33%\" style=\"border-style: none; border-width: medium\">&nbsp;</td>\r\n     <td width=\"34%\" style=\"border-style: none; border-width: medium\">&nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n     <td width=\"33%\" style=\"border-style: none; border-width: medium\">&nbsp;</td>\r\n     <td width=\"33%\" style=\"border-style: none; border-width: medium\">&nbsp;</td>\r\n     <td width=\"34%\" style=\"border-style: none; border-width: medium\">&nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n     <td width=\"100%\" style=\"border-style: none; border-width: medium\" colspan=\"3\">\r\n       <center>\r\n       <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse; border-width: 0\" bordercolor=\"#111111\" width=\"80%\" id=\"AutoNumber2\" height=\"292\">\r\n         <tr>\r\n           <td width=\"66%\" style=\"border-style: none; border-width: medium\" height=\"17\">\r\n           <h1>Datenschutz\r\n           <br>\r\n&nbsp;</h1>\r\n           </td>\r\n           <td width=\"34%\" style=\"border-style: none; border-width: medium\" height=\"17\">\r\n           </td>\r\n         </tr>\r\n         <tr>\r\n           <td width=\"100%\" style=\"border-style: none; border-width: medium\" valign=\"top\" height=\"158\" colspan=\"2\">\r\n           <p class=\"MsoNormal\" style=\"text-autospace: none\">\r\n           Ihre \r\n           personenbezogenen Daten werden nach der strengen Vorschrift des \r\n           geltenden österreichischen Datenschutzrechts erhoben, verarbeitet und \r\n           genutzt.</p>\r\n           <p class=\"MsoNormal\" style=\"text-autospace: none\">\r\n           Zur \r\n           Nutzung dieses Services erklären Sie sich im Zuge der Anmeldung oder \r\n           Bestellung damit einverstanden, dass Ihre Stammdaten \r\n           (Name, Adresse, Geburtsdatum, E-mail Adresse, Telefonnummer), \r\n           Bestelldaten und Daten über die Nutzung&nbsp; für \r\n           Zwecke der Beratung, Werbung, Marktforschung sowie bedarfsgerechten \r\n           Gestaltung der Angebote erhebt, verarbeitet und nutzt. Eine \r\n           Weitergabe Ihrer Daten an Dritte darf nur erfolgen, wenn die Daten \r\n           ausschließlich zu diesem Zweck verwendet werden. Die \r\n           Einwilligungserklärung ist völlig freiwillig und kann jederzeit \r\n           widerrufen werden. Liegt uns keine Einwilligung vor, werden Ihre \r\n           Daten ausschließlich für die Auftragsabwicklung verwendet. Damit wir \r\n           unseren Rechten und Pflichten aus dem Kaufvertrag nachkommen können, \r\n           sind wir berechtigt, soweit es notwendig ist, an von uns mit der \r\n           Durchführung des Kaufvertrages beauftragte Partner Ihre Daten zu \r\n           übermitteln.</td>\r\n         </tr>\r\n         </table>\r\n       </center>\r\n     </td>\r\n   </tr>\r\n </table>',NULL),(7,'Service','<h1>Services</h1> Unsere Services lauten ....',NULL),(8,'Werbung','Hier könnte Ihr Banner stehen!',NULL);

UNLOCK TABLES;

/*Table structure for table `webproductclicks` */

DROP TABLE IF EXISTS `webproductclicks`;

CREATE TABLE `webproductclicks` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `ArtNr` int(10) DEFAULT NULL,
  `CountClicks` int(10) DEFAULT NULL,
  `FirstClick` datetime DEFAULT NULL,
  `LastClick` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ArtNr` (`ArtNr`),
  KEY `Id` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;

/*Data for the table `webproductclicks` */

LOCK TABLES `webproductclicks` WRITE;

insert  into `webproductclicks`(`Id`,`ArtNr`,`CountClicks`,`FirstClick`,`LastClick`) values (1,1001,56,'2003-08-27 22:15:50','2003-08-27 22:15:50'),(2,1000,13,'2003-09-14 21:15:46','2003-09-14 21:15:46'),(3,1029,25,'2003-09-14 21:32:18','2003-09-14 21:32:18'),(4,1029,20,'2004-01-26 20:54:42','2004-01-26 20:54:42'),(5,1001,39,'2004-01-26 21:36:44','2004-01-26 21:36:44'),(6,1017,50,'2004-02-01 22:23:02','2004-02-01 22:23:02'),(7,1001,31,'2004-02-01 23:49:40','2004-02-01 23:49:40'),(8,1002,14,'2004-02-06 20:33:26','2004-02-06 20:33:26'),(9,1001,30,'2004-02-06 20:33:49','2004-02-06 20:33:49'),(10,1017,6,'2004-02-06 21:11:04','2004-02-06 21:11:04'),(11,1017,6,'2004-02-11 14:27:54','2004-02-11 14:27:54'),(12,1001,2,'2004-02-12 13:09:00','2004-02-12 13:09:00'),(13,1008,2,'2004-02-12 13:09:32','2004-02-12 13:09:32'),(14,1002,1,'2004-02-12 13:39:07','2004-02-12 13:39:07'),(15,1029,4,'2004-02-12 14:00:24','2004-02-12 14:00:24'),(16,1017,8,'2004-02-19 14:38:48','2004-02-19 14:38:48'),(17,1001,2,'2004-04-22 17:02:31','2004-04-22 17:02:31'),(18,1017,1,'2004-04-28 12:16:54','2004-04-28 12:16:54'),(19,1008,1,'2004-05-19 16:05:22','2004-05-19 16:05:22'),(20,1001,1,'2004-12-29 23:03:19','2004-12-29 23:03:19'),(21,1017,1,'2005-04-03 11:03:34','2005-04-03 11:03:34'),(22,1001,1,'2009-01-29 18:15:08',NULL),(23,2602,1,'2009-01-30 17:50:50',NULL),(24,1102,1,'2009-01-30 17:51:09',NULL),(25,1175,1,'2009-01-30 17:51:14',NULL),(26,2714,3,'2009-02-01 10:19:54',NULL),(27,1117,1,'2009-02-01 10:30:55',NULL),(28,1096,1,'2009-02-01 10:32:01',NULL),(29,2309,1,'2009-02-01 10:32:24',NULL),(30,2632,2,'2009-02-01 10:40:48',NULL),(31,2489,1,'2009-02-01 10:51:04',NULL),(32,2638,1,'2009-02-01 10:52:38',NULL),(33,4020,2,'2009-02-01 10:54:58',NULL),(34,1034,1,'2009-02-01 11:32:37',NULL),(35,192032,2,'2009-02-01 11:32:56',NULL),(36,1371,1,'2009-02-01 11:39:51',NULL),(37,1035,1,'2009-02-01 11:45:11',NULL),(38,2843,7,'2009-02-01 11:45:17',NULL),(39,2476,4,'2009-02-01 22:11:21',NULL),(40,2477,1,'2009-02-01 22:11:21',NULL),(41,4040,2,'2009-02-01 22:13:14',NULL),(42,4009,1,'2009-02-01 22:13:21',NULL),(43,1077,1,'2009-02-01 22:49:40',NULL),(44,1080,1,'2009-02-01 22:49:44',NULL),(45,2249,1,'2009-02-01 22:53:18',NULL),(46,90100,1,'2009-02-01 22:54:10',NULL),(47,1123,1,'2009-02-01 22:54:38',NULL),(48,1109,1,'2009-02-01 22:56:14',NULL),(49,2730,6,'2009-02-01 22:57:57',NULL),(50,2642,9,'2009-02-02 21:38:28',NULL),(51,2744,1,'2009-02-02 21:53:23',NULL),(52,0,1,'2009-02-02 22:15:32',NULL),(53,2732,2,'2009-02-02 23:30:48',NULL),(54,2843,9,'2009-02-05 21:32:06',NULL),(55,5105,46,'2009-02-05 21:36:26',NULL),(56,2099,2,'2009-02-05 22:24:19',NULL),(57,1081,6,'2009-02-05 22:33:07',NULL),(58,2476,2,'2009-02-05 22:42:14',NULL),(59,5,2,'2009-02-05 23:07:58',NULL),(60,1096,1,'2009-02-05 23:51:00',NULL),(61,2338,2,'2009-02-06 16:24:49',NULL),(62,2340,1,'2009-02-06 16:25:03',NULL),(63,2731,2,'2009-02-06 16:25:14',NULL),(64,196020,3,'2009-02-06 17:33:29',NULL),(65,4040,3,'2009-02-06 17:34:28',NULL),(66,2730,4,'2009-02-07 18:58:21',NULL),(67,1911102,1,'2009-02-07 23:21:10',NULL),(68,2224,2,'2009-02-08 02:24:47',NULL),(69,1146,2,'2009-02-08 02:25:58',NULL),(70,1420,2,'2009-02-08 02:26:34',NULL),(71,15017,2,'2009-02-08 12:04:29',NULL),(72,1108,1,'2009-02-08 12:04:40',NULL),(73,1110,1,'2009-02-08 12:04:44',NULL),(74,1144,1,'2009-02-08 12:05:02',NULL),(75,90100,1,'2009-02-08 12:39:50',NULL),(76,200107,1,'2009-02-08 12:41:32',NULL),(77,2642,1,'2009-02-08 13:07:12',NULL),(78,5105,7,'2009-02-08 22:05:40',NULL),(79,2843,4,'2009-02-14 11:40:15',NULL),(80,5105,4,'2009-02-14 11:40:22',NULL),(81,1081,3,'2009-02-14 11:40:24',NULL),(82,1911102,1,'2009-02-14 11:40:29',NULL),(83,1023,26,'2009-02-14 11:46:06',NULL),(84,2499,1,'2009-02-15 11:37:12',NULL),(85,2731,3,'2009-02-15 11:37:41',NULL),(86,2730,3,'2009-02-15 12:19:58',NULL),(87,2476,3,'2009-02-16 23:22:32',NULL),(88,1144,4,'2009-02-17 00:45:42',NULL),(89,2642,1,'2009-02-17 00:47:50',NULL),(90,1071,1,'2009-02-17 00:48:58',NULL),(91,2843,22,'2009-02-17 20:11:43',NULL),(92,5105,6,'2009-02-17 20:11:55',NULL),(93,1437,4,'2009-02-17 20:23:48',NULL),(94,1258,1,'2009-02-17 20:39:56',NULL),(95,12204,3,'2009-02-17 20:40:48',NULL),(96,1004,3,'2009-02-17 20:56:00',NULL),(97,191025,3,'2009-02-17 22:55:34',NULL),(98,1081,1,'2009-02-17 23:20:31',NULL),(99,2714,1,'2009-02-17 23:36:04',NULL),(100,2099,1,'2009-02-17 23:36:15',NULL),(101,1161,1,'2009-02-17 23:37:29',NULL),(102,1077,2,'2009-02-18 17:12:17',NULL),(109,2843,8,'2009-04-05 23:46:13',NULL),(110,2714,1,'2009-04-05 23:46:23',NULL),(111,1077,1,'2009-04-07 20:09:39',NULL),(112,1096,2,'2009-04-17 22:44:07',NULL),(113,5,16,'2009-05-31 19:41:10',NULL),(114,6,1,'2009-05-31 19:53:31',NULL),(115,5,69,'2009-07-15 17:35:14',NULL),(116,7,58,'2009-07-15 17:41:25',NULL),(117,10,1,'2009-07-15 19:00:14',NULL),(118,1004,1,'2009-07-16 00:31:40',NULL),(119,8,2,'2009-07-16 00:36:29',NULL),(120,6,18,'2009-07-17 21:32:33',NULL),(121,5,12,'2009-07-20 16:00:54',NULL),(122,6,1,'2009-07-22 22:13:15',NULL),(123,8,1,'2009-07-22 22:13:27',NULL);

UNLOCK TABLES;

/*Table structure for table `webproductlists` */

DROP TABLE IF EXISTS `webproductlists`;

CREATE TABLE `webproductlists` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `ArtNr` int(10) DEFAULT NULL,
  `CountClicks` int(10) DEFAULT NULL,
  `FirstClick` datetime DEFAULT NULL,
  `LastClick` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ArtNr` (`ArtNr`),
  KEY `Id` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=763 DEFAULT CHARSET=latin1;

/*Data for the table `webproductlists` */

LOCK TABLES `webproductlists` WRITE;

insert  into `webproductlists`(`Id`,`ArtNr`,`CountClicks`,`FirstClick`,`LastClick`) values (1,1001,56,'2003-08-27 22:15:50','2003-08-27 22:15:50'),(2,1000,13,'2003-09-14 21:15:46','2003-09-14 21:15:46'),(3,1029,25,'2003-09-14 21:32:18','2003-09-14 21:32:18'),(4,1029,20,'2004-01-26 20:54:42','2004-01-26 20:54:42'),(5,1001,39,'2004-01-26 21:36:44','2004-01-26 21:36:44'),(6,1017,50,'2004-02-01 22:23:02','2004-02-01 22:23:02'),(7,1001,31,'2004-02-01 23:49:40','2004-02-01 23:49:40'),(8,1002,14,'2004-02-06 20:33:26','2004-02-06 20:33:26'),(9,1001,30,'2004-02-06 20:33:49','2004-02-06 20:33:49'),(10,1017,6,'2004-02-06 21:11:04','2004-02-06 21:11:04'),(11,1017,6,'2004-02-11 14:27:54','2004-02-11 14:27:54'),(12,1001,2,'2004-02-12 13:09:00','2004-02-12 13:09:00'),(13,1008,2,'2004-02-12 13:09:32','2004-02-12 13:09:32'),(14,1002,1,'2004-02-12 13:39:07','2004-02-12 13:39:07'),(15,1029,4,'2004-02-12 14:00:24','2004-02-12 14:00:24'),(16,1017,8,'2004-02-19 14:38:48','2004-02-19 14:38:48'),(17,1001,2,'2004-04-22 17:02:31','2004-04-22 17:02:31'),(18,1017,1,'2004-04-28 12:16:54','2004-04-28 12:16:54'),(19,1008,1,'2004-05-19 16:05:22','2004-05-19 16:05:22'),(20,1001,1,'2004-12-29 23:03:19','2004-12-29 23:03:19'),(21,1001,2,'2005-04-03 10:11:49','2005-04-03 10:11:49'),(22,1008,2,'2005-04-03 10:11:49','2005-04-03 10:11:49'),(23,1017,2,'2005-04-03 10:11:49','2005-04-03 10:11:49'),(24,1001,83,'2009-01-28 23:46:45',NULL),(25,1096,7,'2009-01-30 17:50:54',NULL),(26,1108,5,'2009-01-30 17:50:54',NULL),(27,1109,5,'2009-01-30 17:50:54',NULL),(28,1110,5,'2009-01-30 17:50:55',NULL),(29,1541,5,'2009-01-30 17:50:55',NULL),(30,1542,5,'2009-01-30 17:50:55',NULL),(31,1543,5,'2009-01-30 17:50:56',NULL),(32,1544,5,'2009-01-30 17:50:56',NULL),(33,1323,1,'2009-01-30 17:50:56',NULL),(34,1380,1,'2009-01-30 17:50:57',NULL),(35,1381,1,'2009-01-30 17:50:57',NULL),(36,1476,1,'2009-01-30 17:50:57',NULL),(37,1477,1,'2009-01-30 17:50:58',NULL),(38,1478,1,'2009-01-30 17:50:58',NULL),(39,1479,1,'2009-01-30 17:50:58',NULL),(40,1485,1,'2009-01-30 17:50:59',NULL),(41,1640,1,'2009-01-30 17:50:59',NULL),(42,1641,1,'2009-01-30 17:50:59',NULL),(43,1642,1,'2009-01-30 17:50:59',NULL),(44,1643,1,'2009-01-30 17:51:00',NULL),(45,1101,2,'2009-01-30 17:51:00',NULL),(46,1102,2,'2009-01-30 17:51:00',NULL),(47,1103,2,'2009-01-30 17:51:01',NULL),(48,1141,2,'2009-01-30 17:51:01',NULL),(49,1143,2,'2009-01-30 17:51:01',NULL),(50,1168,2,'2009-01-30 17:51:02',NULL),(51,1170,2,'2009-01-30 17:51:02',NULL),(52,1171,2,'2009-01-30 17:51:02',NULL),(53,1172,2,'2009-01-30 17:51:03',NULL),(54,1173,2,'2009-01-30 17:51:03',NULL),(55,1174,2,'2009-01-30 17:51:03',NULL),(56,1175,2,'2009-01-30 17:51:04',NULL),(57,1211,2,'2009-01-30 17:51:04',NULL),(58,1282,2,'2009-01-30 17:51:04',NULL),(59,1283,2,'2009-01-30 17:51:04',NULL),(60,1284,2,'2009-01-30 17:51:05',NULL),(61,1353,2,'2009-01-30 17:51:05',NULL),(62,1354,2,'2009-01-30 17:51:05',NULL),(63,1355,2,'2009-01-30 17:51:06',NULL),(64,1356,2,'2009-01-30 17:51:06',NULL),(65,2476,9,'2009-02-01 10:50:46',NULL),(66,2477,6,'2009-02-01 10:50:47',NULL),(67,2482,5,'2009-02-01 10:50:47',NULL),(68,2484,5,'2009-02-01 10:50:47',NULL),(69,2485,5,'2009-02-01 10:50:48',NULL),(70,2486,5,'2009-02-01 10:50:48',NULL),(71,2487,5,'2009-02-01 10:50:48',NULL),(72,2488,5,'2009-02-01 10:50:48',NULL),(73,2489,5,'2009-02-01 10:50:49',NULL),(74,192068,2,'2009-02-01 10:52:26',NULL),(75,192069,2,'2009-02-01 10:52:26',NULL),(76,192070,2,'2009-02-01 10:52:26',NULL),(77,1140,2,'2009-02-01 10:52:26',NULL),(78,2638,1,'2009-02-01 10:52:27',NULL),(79,1032,2,'2009-02-01 11:32:33',NULL),(80,1033,2,'2009-02-01 11:32:33',NULL),(81,1034,2,'2009-02-01 11:32:33',NULL),(82,1035,2,'2009-02-01 11:32:33',NULL),(83,1036,2,'2009-02-01 11:32:34',NULL),(84,2610,2,'2009-02-01 11:32:43',NULL),(85,2758,2,'2009-02-01 11:32:43',NULL),(86,6100,2,'2009-02-01 11:32:44',NULL),(87,1104,1,'2009-02-01 11:39:41',NULL),(88,1105,1,'2009-02-01 11:39:41',NULL),(89,1106,1,'2009-02-01 11:39:41',NULL),(90,1142,1,'2009-02-01 11:39:41',NULL),(91,1212,1,'2009-02-01 11:39:42',NULL),(92,1357,1,'2009-02-01 11:39:42',NULL),(93,1359,1,'2009-02-01 11:39:42',NULL),(94,1364,1,'2009-02-01 11:39:43',NULL),(95,1365,1,'2009-02-01 11:39:43',NULL),(96,1366,1,'2009-02-01 11:39:43',NULL),(97,1367,1,'2009-02-01 11:39:43',NULL),(98,1368,1,'2009-02-01 11:39:44',NULL),(99,1369,1,'2009-02-01 11:39:44',NULL),(100,1370,1,'2009-02-01 11:39:44',NULL),(101,1371,1,'2009-02-01 11:39:44',NULL),(102,1395,1,'2009-02-01 11:39:45',NULL),(103,1504,1,'2009-02-01 11:39:45',NULL),(104,1505,1,'2009-02-01 11:39:45',NULL),(105,2730,36,'2009-02-01 11:44:55',NULL),(106,2731,31,'2009-02-01 11:44:55',NULL),(107,2732,31,'2009-02-01 11:44:56',NULL),(108,2740,31,'2009-02-01 11:44:56',NULL),(109,2741,31,'2009-02-01 11:44:56',NULL),(110,2742,31,'2009-02-01 11:44:57',NULL),(111,2743,31,'2009-02-01 11:44:57',NULL),(112,2744,31,'2009-02-01 11:44:57',NULL),(113,2338,1,'2009-02-01 22:07:42',NULL),(114,2340,1,'2009-02-01 22:07:43',NULL),(115,2382,1,'2009-02-01 22:07:43',NULL),(116,2386,1,'2009-02-01 22:07:43',NULL),(117,2397,1,'2009-02-01 22:07:44',NULL),(118,2449,1,'2009-02-01 22:07:44',NULL),(119,2478,1,'2009-02-01 22:07:44',NULL),(120,2479,1,'2009-02-01 22:07:44',NULL),(121,2480,1,'2009-02-01 22:07:45',NULL),(122,2811,1,'2009-02-01 22:07:45',NULL),(123,2812,1,'2009-02-01 22:07:45',NULL),(124,2813,1,'2009-02-01 22:07:45',NULL),(125,2814,1,'2009-02-01 22:07:46',NULL),(126,2815,1,'2009-02-01 22:07:46',NULL),(127,2816,1,'2009-02-01 22:07:46',NULL),(128,2817,1,'2009-02-01 22:07:46',NULL),(129,2818,1,'2009-02-01 22:07:47',NULL),(130,2828,1,'2009-02-01 22:07:47',NULL),(131,2829,1,'2009-02-01 22:07:47',NULL),(132,2830,1,'2009-02-01 22:07:47',NULL),(133,192040,1,'2009-02-01 22:13:47',NULL),(134,199011,1,'2009-02-01 22:13:48',NULL),(135,199012,1,'2009-02-01 22:13:49',NULL),(136,199013,1,'2009-02-01 22:13:49',NULL),(137,199014,1,'2009-02-01 22:13:49',NULL),(138,198010,1,'2009-02-01 22:13:49',NULL),(139,198015,1,'2009-02-01 22:13:50',NULL),(140,198030,1,'2009-02-01 22:13:50',NULL),(141,197014,1,'2009-02-01 22:13:50',NULL),(142,197015,1,'2009-02-01 22:13:50',NULL),(143,197016,1,'2009-02-01 22:13:51',NULL),(144,197025,1,'2009-02-01 22:13:51',NULL),(145,193010,1,'2009-02-01 22:13:51',NULL),(146,193020,1,'2009-02-01 22:13:51',NULL),(147,193021,1,'2009-02-01 22:13:52',NULL),(148,193022,1,'2009-02-01 22:13:52',NULL),(149,2490,1,'2009-02-01 22:13:52',NULL),(150,1077,4,'2009-02-01 22:48:46',NULL),(151,1078,2,'2009-02-01 22:49:36',NULL),(152,1079,2,'2009-02-01 22:49:36',NULL),(153,1080,2,'2009-02-01 22:49:36',NULL),(154,1081,2,'2009-02-01 22:49:36',NULL),(155,1082,2,'2009-02-01 22:49:36',NULL),(156,1083,2,'2009-02-01 22:49:36',NULL),(157,1084,2,'2009-02-01 22:49:36',NULL),(158,1085,2,'2009-02-01 22:49:36',NULL),(159,1086,2,'2009-02-01 22:49:37',NULL),(160,1087,2,'2009-02-01 22:49:37',NULL),(161,1088,2,'2009-02-01 22:49:37',NULL),(162,1089,2,'2009-02-01 22:49:37',NULL),(163,1090,2,'2009-02-01 22:49:37',NULL),(164,1091,2,'2009-02-01 22:49:37',NULL),(165,1285,2,'2009-02-01 22:49:37',NULL),(166,1286,2,'2009-02-01 22:49:37',NULL),(167,1287,2,'2009-02-01 22:49:37',NULL),(168,1288,2,'2009-02-01 22:49:37',NULL),(169,1289,2,'2009-02-01 22:49:37',NULL),(170,90100,1,'2009-02-01 22:54:05',NULL),(171,90101,1,'2009-02-01 22:54:05',NULL),(172,90102,1,'2009-02-01 22:54:05',NULL),(173,90103,1,'2009-02-01 22:54:05',NULL),(174,1122,1,'2009-02-01 22:54:35',NULL),(175,1123,1,'2009-02-01 22:54:35',NULL),(176,1124,1,'2009-02-01 22:54:35',NULL),(177,1125,1,'2009-02-01 22:54:35',NULL),(178,1126,1,'2009-02-01 22:54:35',NULL),(179,1127,1,'2009-02-01 22:54:35',NULL),(180,1128,1,'2009-02-01 22:54:35',NULL),(181,1129,1,'2009-02-01 22:54:36',NULL),(182,1131,1,'2009-02-01 22:54:36',NULL),(183,1132,1,'2009-02-01 22:54:36',NULL),(184,1133,1,'2009-02-01 22:54:36',NULL),(185,1134,1,'2009-02-01 22:54:36',NULL),(186,1135,1,'2009-02-01 22:54:36',NULL),(187,1136,1,'2009-02-01 22:54:36',NULL),(188,1137,1,'2009-02-01 22:54:36',NULL),(189,1138,1,'2009-02-01 22:54:36',NULL),(190,1139,1,'2009-02-01 22:54:36',NULL),(191,2642,9,'2009-02-02 21:46:01',NULL),(192,1148,5,'2009-02-02 21:54:40',NULL),(193,1149,5,'2009-02-02 21:54:40',NULL),(194,1430,5,'2009-02-02 21:54:40',NULL),(195,2616,5,'2009-02-02 21:54:40',NULL),(196,2619,5,'2009-02-02 21:54:40',NULL),(197,2631,5,'2009-02-02 21:54:41',NULL),(198,2136,5,'2009-02-02 21:54:41',NULL),(199,2427,5,'2009-02-02 21:54:41',NULL),(200,2224,5,'2009-02-02 21:54:41',NULL),(201,2018,5,'2009-02-02 21:54:41',NULL),(202,2873,5,'2009-02-02 21:54:41',NULL),(203,2874,5,'2009-02-02 21:54:41',NULL),(204,2370,5,'2009-02-02 21:54:41',NULL),(205,1360,5,'2009-02-02 21:54:41',NULL),(206,1374,5,'2009-02-02 21:54:41',NULL),(207,1375,5,'2009-02-02 21:54:41',NULL),(208,1376,5,'2009-02-02 21:54:41',NULL),(209,1377,5,'2009-02-02 21:54:42',NULL),(210,1396,5,'2009-02-02 21:54:42',NULL),(211,191025,2,'2009-02-03 00:08:23',NULL),(212,2111,2,'2009-02-03 00:08:23',NULL),(213,2763,2,'2009-02-03 00:08:23',NULL),(214,2381,4,'2009-02-03 00:08:23',NULL),(215,15013,2,'2009-02-03 00:08:23',NULL),(216,1096,10,'2009-02-03 23:58:06',NULL),(217,2099,2,'2009-02-05 22:24:07',NULL),(218,2169,2,'2009-02-05 22:24:07',NULL),(219,2271,2,'2009-02-05 22:24:08',NULL),(220,2290,2,'2009-02-05 22:24:08',NULL),(221,2326,2,'2009-02-05 22:24:08',NULL),(222,2432,2,'2009-02-05 22:24:08',NULL),(223,2452,2,'2009-02-05 22:24:08',NULL),(224,2453,2,'2009-02-05 22:24:08',NULL),(225,2454,2,'2009-02-05 22:24:08',NULL),(226,2455,2,'2009-02-05 22:24:08',NULL),(227,2606,2,'2009-02-05 22:24:08',NULL),(228,2607,2,'2009-02-05 22:24:08',NULL),(229,2613,2,'2009-02-05 22:24:08',NULL),(230,2614,2,'2009-02-05 22:24:08',NULL),(231,2632,2,'2009-02-05 22:24:09',NULL),(232,2777,2,'2009-02-05 22:24:09',NULL),(233,2844,2,'2009-02-05 22:24:09',NULL),(234,2901,2,'2009-02-05 22:24:09',NULL),(235,5105,2,'2009-02-05 22:24:09',NULL),(236,2730,32,'2009-02-05 22:33:03',NULL),(237,2731,32,'2009-02-05 22:33:03',NULL),(238,2732,32,'2009-02-05 22:33:03',NULL),(239,2740,32,'2009-02-05 22:33:03',NULL),(240,2741,32,'2009-02-05 22:33:03',NULL),(241,2742,32,'2009-02-05 22:33:03',NULL),(242,2743,32,'2009-02-05 22:33:04',NULL),(243,2744,32,'2009-02-05 22:33:04',NULL),(244,2476,9,'2009-02-05 22:42:12',NULL),(245,2477,9,'2009-02-05 22:42:12',NULL),(246,2482,9,'2009-02-05 22:42:12',NULL),(247,2484,9,'2009-02-05 22:42:12',NULL),(248,2485,9,'2009-02-05 22:42:12',NULL),(249,2486,9,'2009-02-05 22:42:12',NULL),(250,2487,9,'2009-02-05 22:42:12',NULL),(251,2488,9,'2009-02-05 22:42:12',NULL),(252,2489,9,'2009-02-05 22:42:13',NULL),(253,1077,4,'2009-02-05 23:47:41',NULL),(254,1108,7,'2009-02-05 23:50:48',NULL),(255,1109,7,'2009-02-05 23:50:48',NULL),(256,1110,7,'2009-02-05 23:50:48',NULL),(257,1541,7,'2009-02-05 23:50:48',NULL),(258,1542,7,'2009-02-05 23:50:48',NULL),(259,1543,7,'2009-02-05 23:50:49',NULL),(260,1544,7,'2009-02-05 23:50:49',NULL),(261,2338,4,'2009-02-06 16:19:28',NULL),(262,2340,4,'2009-02-06 16:19:28',NULL),(263,2382,4,'2009-02-06 16:19:29',NULL),(264,2386,4,'2009-02-06 16:19:29',NULL),(265,2397,4,'2009-02-06 16:19:29',NULL),(266,2449,4,'2009-02-06 16:19:29',NULL),(267,2478,4,'2009-02-06 16:19:29',NULL),(268,2479,4,'2009-02-06 16:19:29',NULL),(269,2480,4,'2009-02-06 16:19:29',NULL),(270,2811,4,'2009-02-06 16:19:29',NULL),(271,2812,4,'2009-02-06 16:19:29',NULL),(272,2813,4,'2009-02-06 16:19:29',NULL),(273,2814,4,'2009-02-06 16:19:29',NULL),(274,2815,4,'2009-02-06 16:19:29',NULL),(275,2816,4,'2009-02-06 16:19:29',NULL),(276,2817,4,'2009-02-06 16:19:30',NULL),(277,2818,4,'2009-02-06 16:19:30',NULL),(278,2828,4,'2009-02-06 16:19:30',NULL),(279,2829,4,'2009-02-06 16:19:30',NULL),(280,2830,4,'2009-02-06 16:19:30',NULL),(281,1096,5,'2009-02-08 02:19:52',NULL),(282,2882,2,'2009-02-08 02:25:29',NULL),(283,5106,2,'2009-02-08 02:25:29',NULL),(284,14026,2,'2009-02-08 02:25:30',NULL),(285,2839,1,'2009-02-08 02:26:08',NULL),(286,2840,1,'2009-02-08 02:26:08',NULL),(287,2841,1,'2009-02-08 02:26:08',NULL),(288,2842,1,'2009-02-08 02:26:08',NULL),(289,2891,1,'2009-02-08 02:26:09',NULL),(290,6150,1,'2009-02-08 02:26:09',NULL),(291,6151,1,'2009-02-08 02:26:09',NULL),(292,6160,1,'2009-02-08 02:26:09',NULL),(293,6161,1,'2009-02-08 02:26:09',NULL),(294,6162,1,'2009-02-08 02:26:09',NULL),(295,6170,1,'2009-02-08 02:26:09',NULL),(296,6180,1,'2009-02-08 02:26:09',NULL),(297,6181,1,'2009-02-08 02:26:09',NULL),(298,6182,1,'2009-02-08 02:26:09',NULL),(299,6183,1,'2009-02-08 02:26:09',NULL),(300,6190,1,'2009-02-08 02:26:09',NULL),(301,6200,1,'2009-02-08 02:26:09',NULL),(302,6201,1,'2009-02-08 02:26:10',NULL),(303,6202,1,'2009-02-08 02:26:10',NULL),(304,6203,1,'2009-02-08 02:26:10',NULL),(305,2273,1,'2009-02-08 02:26:12',NULL),(306,2274,1,'2009-02-08 02:26:12',NULL),(307,2837,1,'2009-02-08 02:26:12',NULL),(308,2845,1,'2009-02-08 02:26:12',NULL),(309,2846,1,'2009-02-08 02:26:12',NULL),(310,2893,1,'2009-02-08 02:26:12',NULL),(311,1144,3,'2009-02-08 02:26:14',NULL),(312,1145,3,'2009-02-08 02:26:14',NULL),(313,1146,3,'2009-02-08 02:26:14',NULL),(314,1417,3,'2009-02-08 02:26:14',NULL),(315,2780,1,'2009-02-08 02:26:24',NULL),(316,2787,1,'2009-02-08 02:26:24',NULL),(317,2789,1,'2009-02-08 02:26:24',NULL),(318,2799,1,'2009-02-08 02:26:24',NULL),(319,2804,1,'2009-02-08 02:26:24',NULL),(320,2809,1,'2009-02-08 02:26:24',NULL),(321,2810,1,'2009-02-08 02:26:24',NULL),(322,2831,1,'2009-02-08 02:26:24',NULL),(323,2832,1,'2009-02-08 02:26:25',NULL),(324,2833,1,'2009-02-08 02:26:25',NULL),(325,2834,1,'2009-02-08 02:26:25',NULL),(326,2835,1,'2009-02-08 02:26:25',NULL),(327,2836,1,'2009-02-08 02:26:25',NULL),(328,13000,1,'2009-02-08 02:26:25',NULL),(329,1161,2,'2009-02-08 02:26:26',NULL),(330,1220,2,'2009-02-08 02:26:26',NULL),(331,1222,2,'2009-02-08 02:26:26',NULL),(332,1264,2,'2009-02-08 02:26:26',NULL),(333,1277,2,'2009-02-08 02:26:26',NULL),(334,1280,2,'2009-02-08 02:26:26',NULL),(335,1281,2,'2009-02-08 02:26:26',NULL),(336,1420,2,'2009-02-08 02:26:26',NULL),(337,90100,1,'2009-02-08 12:39:44',NULL),(338,90101,1,'2009-02-08 12:39:44',NULL),(339,90102,1,'2009-02-08 12:39:44',NULL),(340,90103,1,'2009-02-08 12:39:44',NULL),(341,1078,3,'2009-02-08 13:07:31',NULL),(342,1079,3,'2009-02-08 13:07:31',NULL),(343,1080,3,'2009-02-08 13:07:31',NULL),(344,1081,3,'2009-02-08 13:07:31',NULL),(345,1082,3,'2009-02-08 13:07:31',NULL),(346,1083,3,'2009-02-08 13:07:31',NULL),(347,1084,3,'2009-02-08 13:07:31',NULL),(348,1085,3,'2009-02-08 13:07:31',NULL),(349,1086,3,'2009-02-08 13:07:31',NULL),(350,1087,3,'2009-02-08 13:07:31',NULL),(351,1088,3,'2009-02-08 13:07:32',NULL),(352,1089,3,'2009-02-08 13:07:32',NULL),(353,1090,3,'2009-02-08 13:07:32',NULL),(354,1091,3,'2009-02-08 13:07:32',NULL),(355,1285,3,'2009-02-08 13:07:32',NULL),(356,1286,3,'2009-02-08 13:07:32',NULL),(357,1287,3,'2009-02-08 13:07:32',NULL),(358,1288,3,'2009-02-08 13:07:32',NULL),(359,1289,3,'2009-02-08 13:07:32',NULL),(360,1160,1,'2009-02-08 13:36:31',NULL),(361,1101,1,'2009-02-08 22:23:36',NULL),(362,1102,1,'2009-02-08 22:23:36',NULL),(363,1103,1,'2009-02-08 22:23:36',NULL),(364,1141,1,'2009-02-08 22:23:36',NULL),(365,1143,1,'2009-02-08 22:23:36',NULL),(366,1168,1,'2009-02-08 22:23:36',NULL),(367,1170,1,'2009-02-08 22:23:36',NULL),(368,1171,1,'2009-02-08 22:23:36',NULL),(369,1172,1,'2009-02-08 22:23:36',NULL),(370,1173,1,'2009-02-08 22:23:37',NULL),(371,1174,1,'2009-02-08 22:23:37',NULL),(372,1175,1,'2009-02-08 22:23:37',NULL),(373,1211,1,'2009-02-08 22:23:37',NULL),(374,1282,1,'2009-02-08 22:23:37',NULL),(375,1283,1,'2009-02-08 22:23:37',NULL),(376,1284,1,'2009-02-08 22:23:37',NULL),(377,1353,1,'2009-02-08 22:23:37',NULL),(378,1354,1,'2009-02-08 22:23:37',NULL),(379,1355,1,'2009-02-08 22:23:37',NULL),(380,1356,1,'2009-02-08 22:23:37',NULL),(381,2099,1,'2009-02-08 22:42:49',NULL),(382,2169,1,'2009-02-08 22:42:49',NULL),(383,2271,1,'2009-02-08 22:42:49',NULL),(384,2290,1,'2009-02-08 22:42:49',NULL),(385,2326,1,'2009-02-08 22:42:49',NULL),(386,2381,1,'2009-02-08 22:42:49',NULL),(387,2432,1,'2009-02-08 22:42:49',NULL),(388,2452,1,'2009-02-08 22:42:49',NULL),(389,2453,1,'2009-02-08 22:42:49',NULL),(390,2454,1,'2009-02-08 22:42:49',NULL),(391,2455,1,'2009-02-08 22:42:50',NULL),(392,2606,1,'2009-02-08 22:42:50',NULL),(393,2607,1,'2009-02-08 22:42:50',NULL),(394,2613,1,'2009-02-08 22:42:50',NULL),(395,2614,1,'2009-02-08 22:42:50',NULL),(396,2632,1,'2009-02-08 22:42:50',NULL),(397,2777,1,'2009-02-08 22:42:50',NULL),(398,2844,1,'2009-02-08 22:42:50',NULL),(399,2901,1,'2009-02-08 22:42:50',NULL),(400,5105,1,'2009-02-08 22:42:50',NULL),(401,2730,1,'2009-02-08 22:57:35',NULL),(402,2731,1,'2009-02-08 22:57:35',NULL),(403,2732,1,'2009-02-08 22:57:35',NULL),(404,2740,1,'2009-02-08 22:57:35',NULL),(405,2741,1,'2009-02-08 22:57:35',NULL),(406,2742,1,'2009-02-08 22:57:35',NULL),(407,2743,1,'2009-02-08 22:57:36',NULL),(408,2744,1,'2009-02-08 22:57:36',NULL),(409,1023,6,'2009-02-14 11:51:44',NULL),(410,2730,27,'2009-02-15 11:36:02',NULL),(411,2731,22,'2009-02-15 11:36:02',NULL),(412,2732,22,'2009-02-15 11:36:02',NULL),(413,2740,22,'2009-02-15 11:36:02',NULL),(414,2741,22,'2009-02-15 11:36:02',NULL),(415,2742,22,'2009-02-15 11:36:02',NULL),(416,2743,22,'2009-02-15 11:36:02',NULL),(417,2744,22,'2009-02-15 11:36:02',NULL),(418,2476,15,'2009-02-15 11:36:53',NULL),(419,2477,8,'2009-02-15 11:36:53',NULL),(420,2482,7,'2009-02-15 11:36:53',NULL),(421,2484,7,'2009-02-15 11:36:53',NULL),(422,2485,8,'2009-02-15 11:36:53',NULL),(423,2486,8,'2009-02-15 11:36:53',NULL),(424,2487,8,'2009-02-15 11:36:53',NULL),(425,2488,8,'2009-02-15 11:36:53',NULL),(426,2489,7,'2009-02-15 11:36:54',NULL),(427,1096,3,'2009-02-15 11:36:55',NULL),(428,1108,3,'2009-02-15 11:36:55',NULL),(429,1109,3,'2009-02-15 11:36:55',NULL),(430,1110,3,'2009-02-15 11:36:55',NULL),(431,1541,3,'2009-02-15 11:36:55',NULL),(432,1542,3,'2009-02-15 11:36:55',NULL),(433,1543,3,'2009-02-15 11:36:55',NULL),(434,1544,3,'2009-02-15 11:36:55',NULL),(435,1077,5,'2009-02-15 11:36:57',NULL),(436,1078,4,'2009-02-15 11:36:57',NULL),(437,1079,4,'2009-02-15 11:36:57',NULL),(438,1080,4,'2009-02-15 11:36:58',NULL),(439,1081,4,'2009-02-15 11:36:58',NULL),(440,1082,4,'2009-02-15 11:36:58',NULL),(441,1083,4,'2009-02-15 11:36:58',NULL),(442,1084,4,'2009-02-15 11:36:58',NULL),(443,1085,4,'2009-02-15 11:36:58',NULL),(444,1086,4,'2009-02-15 11:36:58',NULL),(445,1087,4,'2009-02-15 11:36:58',NULL),(446,1088,4,'2009-02-15 11:36:58',NULL),(447,1089,4,'2009-02-15 11:36:58',NULL),(448,1090,4,'2009-02-15 11:36:58',NULL),(449,1091,4,'2009-02-15 11:36:58',NULL),(450,1285,4,'2009-02-15 11:36:58',NULL),(451,1286,4,'2009-02-15 11:36:59',NULL),(452,1287,4,'2009-02-15 11:36:59',NULL),(453,1288,4,'2009-02-15 11:36:59',NULL),(454,1289,4,'2009-02-15 11:36:59',NULL),(455,1113,1,'2009-02-15 11:37:02',NULL),(456,1114,1,'2009-02-15 11:37:02',NULL),(457,1115,1,'2009-02-15 11:37:02',NULL),(458,1116,1,'2009-02-15 11:37:02',NULL),(459,1117,1,'2009-02-15 11:37:02',NULL),(460,1119,1,'2009-02-15 11:37:02',NULL),(461,1120,1,'2009-02-15 11:37:02',NULL),(462,1121,1,'2009-02-15 11:37:02',NULL),(463,1190,1,'2009-02-15 11:37:03',NULL),(464,1191,1,'2009-02-15 11:37:03',NULL),(465,1192,1,'2009-02-15 11:37:03',NULL),(466,1193,1,'2009-02-15 11:37:03',NULL),(467,1194,1,'2009-02-15 11:37:03',NULL),(468,1195,1,'2009-02-15 11:37:03',NULL),(469,1248,1,'2009-02-15 11:37:03',NULL),(470,1249,1,'2009-02-15 11:37:03',NULL),(471,1251,1,'2009-02-15 11:37:03',NULL),(472,1507,1,'2009-02-15 11:37:03',NULL),(473,1509,1,'2009-02-15 11:37:03',NULL),(474,1628,1,'2009-02-15 11:37:03',NULL),(475,2439,1,'2009-02-15 11:37:05',NULL),(476,2760,1,'2009-02-15 11:37:05',NULL),(477,2761,1,'2009-02-15 11:37:05',NULL),(478,2762,1,'2009-02-15 11:37:06',NULL),(479,2766,1,'2009-02-15 11:37:06',NULL),(480,2767,1,'2009-02-15 11:37:06',NULL),(481,2768,1,'2009-02-15 11:37:06',NULL),(482,2769,1,'2009-02-15 11:37:06',NULL),(483,2770,1,'2009-02-15 11:37:06',NULL),(484,2499,1,'2009-02-15 11:37:08',NULL),(485,2501,1,'2009-02-15 11:37:08',NULL),(486,2503,1,'2009-02-15 11:37:08',NULL),(487,2717,1,'2009-02-15 11:37:08',NULL),(488,2718,1,'2009-02-15 11:37:08',NULL),(489,2719,1,'2009-02-15 11:37:08',NULL),(490,2720,1,'2009-02-15 11:37:08',NULL),(491,2721,1,'2009-02-15 11:37:08',NULL),(492,2722,1,'2009-02-15 11:37:09',NULL),(493,2771,1,'2009-02-15 11:37:09',NULL),(494,2772,1,'2009-02-15 11:37:09',NULL),(495,2773,1,'2009-02-15 11:37:09',NULL),(496,2774,1,'2009-02-15 11:37:09',NULL),(497,2775,1,'2009-02-15 11:37:09',NULL),(498,2776,1,'2009-02-15 11:37:09',NULL),(499,2260,1,'2009-02-15 12:19:31',NULL),(500,191025,15,'2009-02-15 12:19:31',NULL),(501,4020,1,'2009-02-15 12:19:31',NULL),(502,4030,1,'2009-02-15 12:19:31',NULL),(503,2273,1,'2009-02-15 12:19:32',NULL),(504,2778,1,'2009-02-15 12:19:32',NULL),(505,2777,1,'2009-02-15 12:19:32',NULL),(506,2461,1,'2009-02-15 12:19:32',NULL),(507,2462,1,'2009-02-15 12:19:32',NULL),(508,2463,1,'2009-02-15 12:19:32',NULL),(509,2610,2,'2009-02-15 12:19:33',NULL),(510,15000,1,'2009-02-15 12:19:33',NULL),(511,1144,4,'2009-02-16 23:22:23',NULL),(512,1290,2,'2009-02-17 00:44:52',NULL),(513,1291,2,'2009-02-17 00:44:52',NULL),(514,1292,2,'2009-02-17 00:44:52',NULL),(515,1293,2,'2009-02-17 00:44:52',NULL),(516,1294,2,'2009-02-17 00:44:52',NULL),(517,1295,2,'2009-02-17 00:44:52',NULL),(518,1316,2,'2009-02-17 00:44:52',NULL),(519,1317,2,'2009-02-17 00:44:52',NULL),(520,1318,2,'2009-02-17 00:44:52',NULL),(521,1319,2,'2009-02-17 00:44:53',NULL),(522,1320,2,'2009-02-17 00:44:53',NULL),(523,1321,2,'2009-02-17 00:44:53',NULL),(524,1322,2,'2009-02-17 00:44:53',NULL),(525,1324,2,'2009-02-17 00:44:53',NULL),(526,1325,2,'2009-02-17 00:44:53',NULL),(527,1326,2,'2009-02-17 00:44:53',NULL),(528,1327,2,'2009-02-17 00:44:53',NULL),(529,1349,2,'2009-02-17 00:44:53',NULL),(530,1416,2,'2009-02-17 00:44:53',NULL),(531,1421,2,'2009-02-17 00:44:53',NULL),(532,1145,3,'2009-02-17 00:45:26',NULL),(533,1146,3,'2009-02-17 00:45:27',NULL),(534,1417,3,'2009-02-17 00:45:27',NULL),(535,1101,1,'2009-02-17 00:48:52',NULL),(536,1102,1,'2009-02-17 00:48:53',NULL),(537,1103,1,'2009-02-17 00:48:53',NULL),(538,1141,1,'2009-02-17 00:48:53',NULL),(539,1143,1,'2009-02-17 00:48:53',NULL),(540,1168,1,'2009-02-17 00:48:53',NULL),(541,1170,1,'2009-02-17 00:48:53',NULL),(542,1171,1,'2009-02-17 00:48:53',NULL),(543,1172,1,'2009-02-17 00:48:53',NULL),(544,1173,1,'2009-02-17 00:48:53',NULL),(545,1174,1,'2009-02-17 00:48:53',NULL),(546,1175,1,'2009-02-17 00:48:53',NULL),(547,1211,1,'2009-02-17 00:48:53',NULL),(548,1282,1,'2009-02-17 00:48:53',NULL),(549,1283,1,'2009-02-17 00:48:54',NULL),(550,1284,1,'2009-02-17 00:48:54',NULL),(551,1353,1,'2009-02-17 00:48:54',NULL),(552,1354,1,'2009-02-17 00:48:54',NULL),(553,1355,1,'2009-02-17 00:48:54',NULL),(554,1356,1,'2009-02-17 00:48:54',NULL),(555,2758,1,'2009-02-17 00:48:54',NULL),(556,6100,1,'2009-02-17 00:48:54',NULL),(557,1069,1,'2009-02-17 00:48:55',NULL),(558,1070,1,'2009-02-17 00:48:55',NULL),(559,1071,1,'2009-02-17 00:48:55',NULL),(560,1072,1,'2009-02-17 00:48:55',NULL),(561,1073,1,'2009-02-17 00:48:55',NULL),(562,1074,1,'2009-02-17 00:48:55',NULL),(563,1075,1,'2009-02-17 00:48:55',NULL),(564,1099,1,'2009-02-17 00:48:55',NULL),(565,1100,1,'2009-02-17 00:48:55',NULL),(566,1644,1,'2009-02-17 00:48:55',NULL),(567,2497,1,'2009-02-17 00:48:56',NULL),(568,2498,1,'2009-02-17 00:48:56',NULL),(569,2723,1,'2009-02-17 00:48:56',NULL),(570,1437,1,'2009-02-17 20:23:45',NULL),(571,1258,1,'2009-02-17 20:39:49',NULL),(572,1259,1,'2009-02-17 20:39:50',NULL),(573,1260,1,'2009-02-17 20:39:50',NULL),(574,1261,1,'2009-02-17 20:39:50',NULL),(575,1262,1,'2009-02-17 20:39:50',NULL),(576,1263,1,'2009-02-17 20:39:50',NULL),(577,1265,1,'2009-02-17 20:39:50',NULL),(578,1266,1,'2009-02-17 20:39:50',NULL),(579,1267,1,'2009-02-17 20:39:50',NULL),(580,1268,1,'2009-02-17 20:39:50',NULL),(581,1269,1,'2009-02-17 20:39:50',NULL),(582,1280,2,'2009-02-17 20:39:50',NULL),(583,1281,2,'2009-02-17 20:39:50',NULL),(584,1264,2,'2009-02-17 20:39:51',NULL),(585,1277,2,'2009-02-17 20:39:51',NULL),(586,1633,1,'2009-02-17 20:39:51',NULL),(587,1214,1,'2009-02-17 20:39:51',NULL),(588,1215,1,'2009-02-17 20:39:51',NULL),(589,1216,1,'2009-02-17 20:39:51',NULL),(590,1217,1,'2009-02-17 20:39:51',NULL),(591,90103,1,'2009-02-17 20:40:09',NULL),(592,12204,6,'2009-02-17 20:40:46',NULL),(593,2111,15,'2009-02-17 22:50:12',NULL),(594,2763,15,'2009-02-17 22:50:12',NULL),(595,2381,15,'2009-02-17 22:50:13',NULL),(596,15013,15,'2009-02-17 22:50:13',NULL),(597,1161,1,'2009-02-17 23:37:26',NULL),(598,1220,1,'2009-02-17 23:37:26',NULL),(599,1222,1,'2009-02-17 23:37:26',NULL),(600,1420,1,'2009-02-17 23:37:27',NULL),(601,191025,1,'2009-02-18 17:11:58',NULL),(602,1077,1,'2009-02-18 17:12:13',NULL),(603,1078,1,'2009-02-18 17:12:13',NULL),(604,1079,1,'2009-02-18 17:12:14',NULL),(605,1080,1,'2009-02-18 17:12:14',NULL),(606,1081,1,'2009-02-18 17:12:14',NULL),(607,1082,1,'2009-02-18 17:12:14',NULL),(608,1083,1,'2009-02-18 17:12:14',NULL),(609,1084,1,'2009-02-18 17:12:14',NULL),(610,1085,1,'2009-02-18 17:12:14',NULL),(611,1086,1,'2009-02-18 17:12:14',NULL),(612,1087,1,'2009-02-18 17:12:14',NULL),(613,1088,1,'2009-02-18 17:12:14',NULL),(614,1089,1,'2009-02-18 17:12:14',NULL),(615,1090,1,'2009-02-18 17:12:15',NULL),(616,1091,1,'2009-02-18 17:12:15',NULL),(617,1285,1,'2009-02-18 17:12:15',NULL),(618,1286,1,'2009-02-18 17:12:15',NULL),(619,1287,1,'2009-02-18 17:12:15',NULL),(620,1288,1,'2009-02-18 17:12:15',NULL),(621,1289,1,'2009-02-18 17:12:15',NULL),(622,2476,11,'2009-02-19 18:17:28',NULL),(623,2477,11,'2009-02-19 18:17:30',NULL),(624,2482,11,'2009-02-19 18:17:30',NULL),(625,2484,11,'2009-02-19 18:17:30',NULL),(626,2485,11,'2009-02-19 18:17:30',NULL),(627,2486,11,'2009-02-19 18:17:30',NULL),(628,2487,11,'2009-02-19 18:17:30',NULL),(629,2488,11,'2009-02-19 18:17:30',NULL),(630,2489,11,'2009-02-19 18:17:31',NULL),(631,2730,4,'2009-02-19 18:35:04',NULL),(632,2731,4,'2009-02-19 18:35:04',NULL),(633,2732,4,'2009-02-19 18:35:04',NULL),(634,2740,4,'2009-02-19 18:35:04',NULL),(635,2741,4,'2009-02-19 18:35:04',NULL),(636,2742,4,'2009-02-19 18:35:05',NULL),(637,2743,4,'2009-02-19 18:35:05',NULL),(638,2744,4,'2009-02-19 18:35:05',NULL),(639,1096,7,'2009-02-19 18:40:23',NULL),(640,1108,7,'2009-02-19 18:40:23',NULL),(641,1109,7,'2009-02-19 18:40:24',NULL),(642,1110,7,'2009-02-19 18:40:24',NULL),(643,1541,7,'2009-02-19 18:40:24',NULL),(644,1542,7,'2009-02-19 18:40:24',NULL),(645,1543,7,'2009-02-19 18:40:24',NULL),(646,1544,7,'2009-02-19 18:40:25',NULL),(647,1077,2,'2009-04-07 20:09:25',NULL),(648,1078,2,'2009-04-07 20:09:26',NULL),(649,1079,2,'2009-04-07 20:09:27',NULL),(650,1080,2,'2009-04-07 20:09:27',NULL),(651,1081,2,'2009-04-07 20:09:27',NULL),(652,1082,2,'2009-04-07 20:09:28',NULL),(653,1083,2,'2009-04-07 20:09:28',NULL),(654,1084,2,'2009-04-07 20:09:29',NULL),(655,1085,2,'2009-04-07 20:09:29',NULL),(656,1086,2,'2009-04-07 20:09:30',NULL),(657,1087,2,'2009-04-07 20:09:30',NULL),(658,1088,2,'2009-04-07 20:09:31',NULL),(659,1089,2,'2009-04-07 20:09:31',NULL),(660,1090,2,'2009-04-07 20:09:31',NULL),(661,1091,2,'2009-04-07 20:09:32',NULL),(662,1285,2,'2009-04-07 20:09:32',NULL),(663,1286,2,'2009-04-07 20:09:32',NULL),(664,1287,2,'2009-04-07 20:09:33',NULL),(665,1288,2,'2009-04-07 20:09:33',NULL),(666,1289,2,'2009-04-07 20:09:34',NULL),(667,2730,4,'2009-04-07 20:10:45',NULL),(668,2731,4,'2009-04-07 20:10:46',NULL),(669,2732,4,'2009-04-07 20:10:46',NULL),(670,2740,4,'2009-04-07 20:10:47',NULL),(671,2741,4,'2009-04-07 20:10:47',NULL),(672,2742,4,'2009-04-07 20:10:47',NULL),(673,2743,4,'2009-04-07 20:10:48',NULL),(674,2744,4,'2009-04-07 20:10:48',NULL),(675,2610,3,'2009-04-07 20:17:13',NULL),(676,2758,3,'2009-04-07 20:17:13',NULL),(677,6100,3,'2009-04-07 20:17:14',NULL),(678,1038,2,'2009-04-07 21:29:17',NULL),(679,1107,2,'2009-04-07 21:29:17',NULL),(680,1206,2,'2009-04-07 21:29:18',NULL),(681,1627,2,'2009-04-07 21:29:18',NULL),(682,1636,2,'2009-04-07 21:29:19',NULL),(683,1161,3,'2009-04-07 22:02:36',NULL),(684,1220,3,'2009-04-07 22:02:37',NULL),(685,1222,3,'2009-04-07 22:02:37',NULL),(686,1264,3,'2009-04-07 22:02:38',NULL),(687,1277,3,'2009-04-07 22:02:38',NULL),(688,1280,3,'2009-04-07 22:02:38',NULL),(689,1281,3,'2009-04-07 22:02:39',NULL),(690,1420,3,'2009-04-07 22:02:39',NULL),(691,2882,1,'2009-04-07 22:05:12',NULL),(692,5106,1,'2009-04-07 22:05:12',NULL),(693,14026,1,'2009-04-07 22:05:13',NULL),(694,2476,2,'2009-04-07 22:05:38',NULL),(695,2477,2,'2009-04-07 22:05:39',NULL),(696,2482,2,'2009-04-07 22:05:39',NULL),(697,2484,2,'2009-04-07 22:05:40',NULL),(698,2485,2,'2009-04-07 22:05:40',NULL),(699,2486,2,'2009-04-07 22:05:41',NULL),(700,2487,2,'2009-04-07 22:05:41',NULL),(701,2488,2,'2009-04-07 22:05:42',NULL),(702,2489,2,'2009-04-07 22:05:42',NULL),(703,1144,5,'2009-04-07 22:05:49',NULL),(704,1145,5,'2009-04-07 22:05:50',NULL),(705,1146,5,'2009-04-07 22:05:50',NULL),(706,1417,5,'2009-04-07 22:05:50',NULL),(707,1096,2,'2009-04-07 22:07:40',NULL),(708,1108,2,'2009-04-07 22:07:41',NULL),(709,1109,2,'2009-04-07 22:07:41',NULL),(710,1110,2,'2009-04-07 22:07:41',NULL),(711,1541,2,'2009-04-07 22:07:42',NULL),(712,1542,2,'2009-04-07 22:07:42',NULL),(713,1543,2,'2009-04-07 22:07:43',NULL),(714,1544,2,'2009-04-07 22:07:43',NULL),(715,1101,1,'2009-04-07 22:14:47',NULL),(716,1069,1,'2009-04-08 22:12:46',NULL),(717,1070,1,'2009-04-08 22:12:47',NULL),(718,1071,1,'2009-04-08 22:12:48',NULL),(719,1072,1,'2009-04-08 22:12:48',NULL),(720,1073,1,'2009-04-08 22:12:49',NULL),(721,1074,1,'2009-04-08 22:12:49',NULL),(722,1075,1,'2009-04-08 22:12:50',NULL),(723,1099,1,'2009-04-08 22:12:50',NULL),(724,1100,1,'2009-04-08 22:12:51',NULL),(725,1644,1,'2009-04-08 22:12:51',NULL),(726,2497,1,'2009-04-08 22:12:51',NULL),(727,2498,1,'2009-04-08 22:12:52',NULL),(728,2723,1,'2009-04-08 22:12:52',NULL),(729,2730,7,'2009-04-17 22:02:00',NULL),(730,2731,3,'2009-04-17 22:21:37',NULL),(731,2732,3,'2009-04-17 22:21:38',NULL),(732,2740,3,'2009-04-17 22:21:39',NULL),(733,2741,3,'2009-04-17 22:21:41',NULL),(734,2742,3,'2009-04-17 22:21:42',NULL),(735,2743,3,'2009-04-17 22:21:44',NULL),(736,2744,3,'2009-04-17 22:21:46',NULL),(737,1096,1,'2009-04-17 22:43:57',NULL),(738,1108,1,'2009-04-17 22:43:58',NULL),(739,1109,1,'2009-04-17 22:43:58',NULL),(740,1110,1,'2009-04-17 22:43:58',NULL),(741,1541,1,'2009-04-17 22:43:59',NULL),(742,1542,1,'2009-04-17 22:43:59',NULL),(743,1543,1,'2009-04-17 22:44:00',NULL),(744,1544,1,'2009-04-17 22:44:00',NULL),(745,0,8,'2009-05-31 19:41:05',NULL),(746,5,14,'2009-05-31 19:41:06',NULL),(747,6,9,'2009-05-31 19:41:06',NULL),(748,5,265,'2009-07-15 17:34:07',NULL),(749,7,259,'2009-07-15 17:35:10',NULL),(750,8,259,'2009-07-15 17:35:11',NULL),(751,9,259,'2009-07-15 17:35:11',NULL),(752,10,259,'2009-07-15 17:35:11',NULL),(753,6,29,'2009-07-17 21:31:36',NULL),(754,5,11,'2009-07-20 14:54:48',NULL),(755,7,10,'2009-07-20 14:54:48',NULL),(756,8,10,'2009-07-20 14:54:48',NULL),(757,9,10,'2009-07-20 14:54:48',NULL),(758,10,10,'2009-07-20 14:54:48',NULL),(759,6,3,'2009-07-22 22:13:12',NULL),(760,1004,3,'2009-07-22 22:13:12',NULL),(761,20000,3,'2009-07-22 22:13:12',NULL),(762,20001,3,'2009-07-22 22:13:12',NULL);

UNLOCK TABLES;

/*Table structure for table `webreferers` */

DROP TABLE IF EXISTS `webreferers`;

CREATE TABLE `webreferers` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `IDNR` int(10) DEFAULT NULL,
  `RefererId` int(10) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ClientId` (`IDNR`),
  KEY `Id` (`Id`),
  KEY `RefererId` (`RefererId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `webreferers` */

LOCK TABLES `webreferers` WRITE;

insert  into `webreferers`(`Id`,`IDNR`,`RefererId`) values (1,0,100000);

UNLOCK TABLES;

/*Table structure for table `webreferersproducts` */

DROP TABLE IF EXISTS `webreferersproducts`;

CREATE TABLE `webreferersproducts` (
  `ID` int(10) NOT NULL,
  `ArtNr` int(10) NOT NULL,
  `IDNR` int(10) NOT NULL,
  `DatumSeit` datetime DEFAULT NULL,
  PRIMARY KEY (`ArtNr`,`IDNR`),
  KEY `ID` (`ID`),
  KEY `IDNR` (`IDNR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webreferersproducts` */

LOCK TABLES `webreferersproducts` WRITE;

insert  into `webreferersproducts`(`ID`,`ArtNr`,`IDNR`,`DatumSeit`) values (9,1000,1,'2002-04-16 00:00:00'),(2,1001,1,'2002-04-16 00:00:00'),(8,1005,1,'2002-04-16 00:00:00'),(4,1006,1,'2002-04-16 00:00:00');

UNLOCK TABLES;

/*Table structure for table `websessions` */

DROP TABLE IF EXISTS `websessions`;

CREATE TABLE `websessions` (
  `SID` int(10) NOT NULL,
  `IP` varchar(50) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `KundenIDNR` int(10) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `creationTime` datetime DEFAULT NULL,
  `lastRegisteredTime` datetime DEFAULT NULL,
  `loggedOut` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`SID`),
  KEY `KundenId` (`KundenIDNR`),
  KEY `SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `websessions` */

LOCK TABLES `websessions` WRITE;

insert  into `websessions`(`SID`,`IP`,`UserName`,`KundenIDNR`,`creationDate`,`creationTime`,`lastRegisteredTime`,`loggedOut`) values (1,'127.0.0.1',NULL,NULL,'2009-05-24 22:07:55','2009-05-24 22:07:55',NULL,0),(2,'127.0.0.1',NULL,NULL,'2009-05-31 17:15:19','2009-05-31 17:15:19','2009-05-31 17:34:45',0),(3,'127.0.0.1',NULL,NULL,'2009-05-31 17:46:40','2009-05-31 17:46:40',NULL,0),(4,'127.0.0.1',NULL,NULL,'2009-05-31 18:11:10','2009-05-31 18:11:10',NULL,0),(5,'127.0.0.1',NULL,NULL,'2009-05-31 19:30:42','2009-05-31 19:30:42',NULL,0),(6,'127.0.0.1',NULL,1,'2009-05-31 19:40:06','2009-05-31 19:40:06','2009-05-31 19:43:05',0),(7,'127.0.0.1',NULL,1,'2009-05-31 19:52:58','2009-05-31 19:52:58','2009-05-31 19:54:25',0),(8,'127.0.0.1',NULL,1,'2009-06-01 14:18:11','2009-06-01 14:18:11','2009-06-01 14:52:54',0),(9,'127.0.0.1',NULL,NULL,'2009-06-01 15:23:43','2009-06-01 15:23:43','2009-06-01 15:59:13',0),(10,'127.0.0.1',NULL,NULL,'2009-06-01 15:59:32','2009-06-01 15:59:32',NULL,0),(11,'127.0.0.1',NULL,NULL,'2009-06-01 16:00:37','2009-06-01 16:00:37',NULL,0),(12,'127.0.0.1',NULL,NULL,'2009-06-01 16:01:01','2009-06-01 16:01:01','2009-06-01 16:01:34',0),(13,'127.0.0.1',NULL,NULL,'2009-06-01 20:23:34','2009-06-01 20:23:34','2009-06-01 20:24:32',0),(14,'::1',NULL,NULL,'2009-06-04 18:26:22','2009-06-04 18:26:22','2009-06-04 18:27:49',0),(15,'::1',NULL,NULL,'2009-06-04 22:05:51','2009-06-04 22:05:51','2009-06-04 22:06:44',0),(16,'::1',NULL,NULL,'2009-06-04 23:57:13','2009-06-04 23:57:13','2009-06-04 23:57:16',0),(17,'::1',NULL,NULL,'2009-06-06 21:53:58','2009-06-06 21:53:58','2009-06-06 21:53:58',0),(18,'::1',NULL,NULL,'2009-06-06 22:18:44','2009-06-06 22:18:44','2009-06-06 22:18:44',0),(19,'::1',NULL,NULL,'2009-06-06 22:20:32','2009-06-06 22:20:32','2009-06-06 22:38:34',0),(20,'::1',NULL,NULL,'2009-06-06 22:53:31','2009-06-06 22:53:31','2009-06-06 22:53:31',0),(21,'::1',NULL,NULL,'2009-06-27 23:10:34','2009-06-27 23:10:34','2009-06-27 23:16:25',0),(22,'::1',NULL,NULL,'2009-07-07 01:12:05','2009-07-07 01:12:05','2009-07-07 01:16:30',0),(23,'::1',NULL,NULL,'2009-07-09 20:11:40','2009-07-09 20:11:40','2009-07-09 20:14:10',0),(24,'::1',NULL,NULL,'2009-07-13 00:01:11','2009-07-13 00:01:11','2009-07-13 00:47:33',0),(25,'::1',NULL,NULL,'2009-07-13 00:13:05','2009-07-13 00:13:05','2009-07-13 00:14:31',0),(26,'::1',NULL,NULL,'2009-07-13 00:30:04','2009-07-13 00:30:04',NULL,0),(27,'::1',NULL,NULL,'2009-07-13 10:19:27','2009-07-13 10:19:27','2009-07-13 10:20:34',0),(28,'::1',NULL,NULL,'2009-07-13 10:20:43','2009-07-13 10:20:43','2009-07-13 13:24:31',0),(29,'::1',NULL,NULL,'2009-07-13 12:14:47','2009-07-13 12:14:47','2009-07-13 12:22:05',0),(30,'::1',NULL,NULL,'2009-07-15 14:25:45','2009-07-15 14:25:45','2009-07-15 14:26:03',0),(31,'::1',NULL,NULL,'2009-07-15 14:51:50','2009-07-15 14:51:50','2009-07-15 14:53:22',0),(32,'::1',NULL,1,'2009-07-15 17:30:37','2009-07-15 17:30:37','2009-07-15 19:00:21',0),(33,'::1',NULL,NULL,'2009-07-15 18:47:59','2009-07-15 18:47:59','2009-07-15 18:48:08',0),(34,'::1',NULL,NULL,'2009-07-15 23:39:48','2009-07-15 23:39:48','2009-07-16 01:03:48',0),(35,'::1',NULL,NULL,'2009-07-15 23:46:01','2009-07-15 23:46:01','2009-07-16 00:15:13',0),(36,'::1',NULL,NULL,'2009-07-16 00:16:56','2009-07-16 00:16:56','2009-07-16 00:18:34',0),(37,'::1',NULL,NULL,'2009-07-16 01:13:25','2009-07-16 01:13:25','2009-07-16 01:13:26',0),(38,'::1',NULL,NULL,'2009-07-16 01:13:54','2009-07-16 01:13:54','2009-07-16 01:14:48',0),(39,'127.0.0.1',NULL,NULL,'2009-07-16 13:52:02','2009-07-16 13:52:02','2009-07-16 14:58:09',0),(40,'::1',NULL,NULL,'2009-07-16 14:29:14','2009-07-16 14:29:14','2009-07-16 14:29:52',0),(41,'::1',NULL,NULL,'2009-07-16 14:31:45','2009-07-16 14:31:45','2009-07-16 15:51:56',0),(42,'127.0.0.1',NULL,NULL,'2009-07-16 14:58:59','2009-07-16 14:58:59','2009-07-16 14:59:08',0),(43,'127.0.0.1',NULL,NULL,'2009-07-16 15:11:36','2009-07-16 15:11:36','2009-07-16 15:11:36',0),(44,'127.0.0.1',NULL,NULL,'2009-07-16 15:11:38','2009-07-16 15:11:38','2009-07-16 15:33:12',0),(45,'127.0.0.1',NULL,NULL,'2009-07-16 15:15:44','2009-07-16 15:15:44','2009-07-16 15:20:49',0),(46,'127.0.0.1',NULL,NULL,'2009-07-16 15:21:44','2009-07-16 15:21:44','2009-07-16 16:06:49',0),(47,'::1',NULL,1,'2009-07-16 16:16:49','2009-07-16 16:16:49','2009-07-16 18:30:44',0),(48,'127.0.0.1',NULL,NULL,'2009-07-16 17:47:15','2009-07-16 17:47:15','2009-07-16 18:05:32',0),(49,'127.0.0.1',NULL,NULL,'2009-07-16 18:06:17','2009-07-16 18:06:17','2009-07-16 18:46:38',0),(50,'::1',NULL,1,'2009-07-16 18:31:10','2009-07-16 18:31:10','2009-07-16 18:37:58',-1),(51,'::1',NULL,NULL,'2009-07-16 18:37:58','2009-07-16 18:37:58','2009-07-16 18:47:22',0),(52,'::1',NULL,NULL,'2009-07-16 19:03:40','2009-07-16 19:03:40','2009-07-16 19:08:53',0),(53,'::1',NULL,1,'2009-07-16 19:12:35','2009-07-16 19:12:35','2009-07-16 19:40:47',0),(54,'::1',NULL,NULL,'2009-07-16 23:15:20','2009-07-16 23:15:20','2009-07-17 00:13:40',0),(55,'::1',NULL,NULL,'2009-07-16 23:34:53','2009-07-16 23:34:53','2009-07-16 23:35:12',0),(56,'::1',NULL,NULL,'2009-07-17 13:40:39','2009-07-17 13:40:39','2009-07-17 13:51:19',0),(57,'::1',NULL,NULL,'2009-07-17 21:31:08','2009-07-17 21:31:08','2009-07-17 21:48:38',0),(58,'::1',NULL,NULL,'2009-07-17 21:51:56','2009-07-17 21:51:56','2009-07-17 21:59:11',0),(59,'::1',NULL,NULL,'2009-07-17 22:20:57','2009-07-17 22:20:57','2009-07-17 22:22:06',0),(60,'::1',NULL,NULL,'2009-07-17 22:49:55','2009-07-17 22:49:55','2009-07-17 22:59:34',0),(61,'127.0.0.1',NULL,NULL,'2009-07-20 13:04:40','2009-07-20 13:04:40','2009-07-20 13:13:14',0),(62,'127.0.0.1',NULL,NULL,'2009-07-20 14:39:38','2009-07-20 14:39:38','2009-07-20 14:39:46',0),(63,'127.0.0.1',NULL,NULL,'2009-07-20 14:40:49','2009-07-20 14:40:49','2009-07-20 14:41:02',0),(64,'127.0.0.1',NULL,NULL,'2009-07-20 14:41:41','2009-07-20 14:41:41','2009-07-20 14:42:16',0),(65,'::1',NULL,NULL,'2009-07-20 14:42:38','2009-07-20 14:42:38','2009-07-20 14:59:16',0),(66,'127.0.0.1',NULL,NULL,'2009-07-20 15:24:41','2009-07-20 15:24:41','2009-07-20 15:24:42',0),(67,'127.0.0.1',NULL,NULL,'2009-07-20 15:26:28','2009-07-20 15:26:28',NULL,0),(68,'127.0.0.1',NULL,NULL,'2009-07-20 15:27:40','2009-07-20 15:27:40',NULL,0),(69,'127.0.0.1',NULL,NULL,'2009-07-20 15:32:03','2009-07-20 15:32:03','2009-07-20 16:42:15',0),(70,'127.0.0.1',NULL,NULL,'2009-07-20 15:45:58','2009-07-20 15:45:58','2009-07-20 15:50:01',0),(71,'::1',NULL,NULL,'2009-07-20 16:00:47','2009-07-20 16:00:47','2009-07-20 16:25:05',0),(72,'127.0.0.1',NULL,NULL,'2009-07-20 16:11:46','2009-07-20 16:11:46','2009-07-20 16:12:33',0),(73,'127.0.0.1',NULL,NULL,'2009-07-22 13:15:28','2009-07-22 13:15:28','2009-07-22 13:15:33',0),(74,'127.0.0.1',NULL,NULL,'2009-07-22 18:32:29','2009-07-22 18:32:29','2009-07-22 18:32:29',0),(75,'::1',NULL,1,'2009-07-22 21:48:43','2009-07-22 21:48:43','2009-07-22 22:15:08',-1),(76,'::1',NULL,NULL,'2009-07-22 22:15:08','2009-07-22 22:15:08','2009-07-22 22:15:14',0);

UNLOCK TABLES;

/*Table structure for table `webtopten` */

DROP TABLE IF EXISTS `webtopten`;

CREATE TABLE `webtopten` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ProductID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `id` (`ID`),
  KEY `productID` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `webtopten` */

LOCK TABLES `webtopten` WRITE;

insert  into `webtopten`(`ID`,`ProductID`) values (1,102),(2,1049),(5,1050),(10,3236),(8,5793),(9,6767),(7,14952),(6,28876),(4,521229),(3,521231);

UNLOCK TABLES;

/*Table structure for table `webwarenkorb` */

DROP TABLE IF EXISTS `webwarenkorb`;

CREATE TABLE `webwarenkorb` (
  `WebWarenkorbId` int(10) NOT NULL AUTO_INCREMENT,
  `SID` int(10) DEFAULT NULL,
  `ArtNr` int(10) DEFAULT NULL,
  `Quantity` int(10) DEFAULT NULL,
  `Datum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AuftragNr` int(10) unsigned DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `Notiz` varchar(255) NOT NULL,
  PRIMARY KEY (`WebWarenkorbId`),
  KEY `ArtNr` (`ArtNr`),
  KEY `SID` (`SID`),
  KEY `WebWarekkorbId` (`WebWarenkorbId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `webwarenkorb` */

LOCK TABLES `webwarenkorb` WRITE;

insert  into `webwarenkorb`(`WebWarenkorbId`,`SID`,`ArtNr`,`Quantity`,`Datum`,`AuftragNr`,`Timestamp`,`Notiz`) values (1,6,5,5,'2009-05-31 19:41:15',NULL,NULL,''),(2,7,6,5,'2009-05-31 19:53:35',NULL,NULL,''),(3,8,5,6,'2009-06-01 14:46:50',20099004,NULL,''),(4,8,5,6,'2009-06-01 14:46:50',20099004,NULL,''),(5,8,5,6,'2009-06-01 14:46:50',20099004,NULL,''),(6,8,5,7,'2009-06-01 14:50:23',NULL,NULL,''),(7,9,5,9,'2009-06-01 15:33:48',NULL,NULL,''),(8,9,5,9,'2009-06-13 18:14:20',2,NULL,'6'),(9,32,7,5,'2009-07-15 18:59:14',2009090006,NULL,''),(10,32,5,4,'2009-07-15 18:59:14',2009090006,NULL,''),(11,33,5,1,'2009-07-15 18:48:07',NULL,NULL,''),(12,32,10,5,'2009-07-15 19:00:20',NULL,NULL,''),(13,34,5,15,'2009-07-16 00:58:55',NULL,NULL,''),(14,36,5,5,'2009-07-16 00:17:17',NULL,NULL,''),(15,34,8,5,'2009-07-16 00:36:36',NULL,NULL,''),(16,41,7,5,'2009-07-16 15:27:18',NULL,NULL,''),(17,41,5,1,'2009-07-16 15:46:33',NULL,NULL,''),(18,47,7,1,'2009-07-16 17:31:47',2009090007,NULL,''),(19,47,8,1,'2009-07-16 17:31:47',2009090007,NULL,''),(20,47,5,15,'2009-07-16 18:13:44',NULL,NULL,''),(21,51,5,6,'2009-07-16 18:43:54',NULL,NULL,''),(22,53,5,1,'2009-07-16 19:38:39',NULL,NULL,''),(23,54,5,5,'2009-07-17 00:05:06',NULL,NULL,''),(24,58,6,5,'2009-07-17 21:58:58',NULL,NULL,''),(25,60,5,4,'2009-07-17 22:50:11',NULL,NULL,''),(26,75,5,0,'2009-07-22 22:14:54',2009090008,NULL,''),(27,75,5,0,'2009-07-22 22:14:54',2009090008,NULL,'Artikel #5: , '),(28,75,5,0,'2009-07-22 22:14:54',2009090008,NULL,'Artikel #5: , '),(29,75,5,0,'2009-07-22 22:14:54',2009090008,NULL,'Artikel #5: 100, Grün'),(30,75,6,0,'2009-07-22 22:14:54',2009090008,NULL,''),(31,75,8,0,'2009-07-22 22:14:54',2009090008,NULL,''),(32,75,5,4,'2009-07-22 22:14:54',2009090008,NULL,'Artikel #5: 100, Rot');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
