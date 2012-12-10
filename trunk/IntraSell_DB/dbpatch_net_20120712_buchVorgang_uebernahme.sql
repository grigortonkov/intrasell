/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

Insert into buchVorgang (  Typ,  Nummer ,  KundNr ,  Datum ,  Notiz ,  Summe ,  Bezahlt , Ausgedruckt, abgeschlossen ,  ZahlungsBedingung,
  Woher,  Wohin,  TransportMethode,  ZahlungsMethode, Status,
  NotizIntern, NotizExtern, SummeMWST, SummeBrutto, LieferantNr, MitarbeiterNr, KundNr2,  Waehrung)
SELECT 'AN', b.`Nummer`, b.`KundNr`, b.`Datum`, b.`Notiz`, b.`Summe`, b.`Bezahlt`, b.`Ausgedrukt`, b.`anElba`, b.`ZahlungsBedungung`,
  b.`Woher`, b.`Wohin`, b.`TransportMethode`, b.`ZahlungsMethode`, b.`Status`,
  b.`NotizIntern`, b.`NotizExtern`, b.`SummeMWST`, b.`SummeBrutto`, b.`LieferantNr`, b.`MitarbeiterNr`,b.`KundNr2`, b.`Waehrung`
FROM buchangebot b;


Insert into `buchVorgang-artikel`
( Typ, ID, Nummer, ArtNr, Preis_Netto, Stk, Preis_Brutto,
ArtikelIdentifikation, EKPreis, Bezeichnung, LieferantNR, Status,
Referenz, Packung, Herkunft, Incoterm, Spezifikation, Zeitpunkt )
SELECT 'AN',  b.`ID`, b.`RechNr`, b.`ArtNr`, PreisATS, b.`Stk`, b.`PreisATS_Brutto`,
 b.`ArtikelIdentifikation`, b.`EKPreis`, IfNull(b.`Bezeichnung`,'-'), b.`LieferantNR`, b.`PositionStatus`,
 b.`Referenz`, b.`Packung`, b.`Herkunft`, b.`Incoterm`, b.`Spezifikation`, b.`Zeitpunkt`
FROM `buchangebot-artikel` b
where RechNr is not null;


Insert into buchVorgang (  Typ,  Nummer ,  KundNr ,  Datum ,  Notiz ,  Summe ,  Bezahlt , Ausgedruckt, abgeschlossen ,  ZahlungsBedingung,
  Woher,  Wohin,  TransportMethode,  ZahlungsMethode, Status,
  NotizIntern, NotizExtern, SummeMWST, SummeBrutto, LieferantNr, MitarbeiterNr, KundNr2,  Waehrung)
SELECT 'AU', b.`Nummer`, b.`KundNr`, b.`Datum`, b.`Notiz`, b.`Summe`, b.`Bezahlt`, b.`Ausgedrukt`, b.`anElba`, b.`ZahlungsBedungung`,
  b.`Woher`, b.`Wohin`, b.`TransportMethode`, b.`ZahlungsMethode`, b.`Status`,
  b.`NotizIntern`, b.`NotizExtern`, b.`SummeMWST`, b.`SummeBrutto`, b.`LieferantNr`, b.`MitarbeiterNr`,b.`KundNr2`, b.`Waehrung`
FROM buchAuftrag b;


Insert into `buchVorgang-artikel`
( Typ, ID, Nummer, ArtNr, Preis_Netto, Stk, Preis_Brutto,
ArtikelIdentifikation, EKPreis, Bezeichnung, LieferantNR, Status,
Referenz, Packung, Herkunft, Incoterm, Spezifikation, Zeitpunkt )
SELECT 'AU',  b.`ID`, b.`RechNr`, b.`ArtNr`, PreisATS, b.`Stk`, b.`PreisATS_Brutto`,
 b.`ArtikelIdentifikation`, b.`EKPreis`, IfNull(b.`Bezeichnung`,'-'), b.`LieferantNR`, b.`PositionStatus`,
 b.`Referenz`, b.`Packung`, b.`Herkunft`, b.`Incoterm`, b.`Spezifikation`, b.`Zeitpunkt`
FROM `buchAuftrag-artikel` b
where RechNr is not null;


Insert into buchVorgang (  Typ,  Nummer ,  KundNr ,  Datum ,  Notiz ,  Summe ,  Bezahlt , Ausgedruckt, abgeschlossen ,  ZahlungsBedingung,
  Woher,  Wohin,  TransportMethode,  ZahlungsMethode, Status,
  NotizIntern, NotizExtern, SummeMWST, SummeBrutto, LieferantNr, MitarbeiterNr, KundNr2,  Waehrung)
SELECT 'AR', b.`Nummer`, b.`KundNr`, b.`Datum`, b.`Notiz`, b.`Summe`, b.`Bezahlt`, b.`Ausgedrukt`, b.`anElba`, b.`ZahlungsBedungung`,
  b.`Woher`, b.`Wohin`, b.`TransportMethode`, b.`ZahlungsMethode`, b.`Status`,
  b.`NotizIntern`, b.`NotizExtern`, b.`SummeMWST`, b.`SummeBrutto`, b.`LieferantNr`, b.`MitarbeiterNr`,b.`KundNr2`, b.`Waehrung`
FROM buchRechnung b;


Insert into `buchVorgang-artikel`
( Typ, ID, Nummer, ArtNr, Preis_Netto, Stk, Preis_Brutto,
ArtikelIdentifikation, EKPreis, Bezeichnung, LieferantNR, Status,
Referenz, Packung, Herkunft, Incoterm, Spezifikation, Zeitpunkt )
SELECT 'AR',  b.`ID`, b.`RechNr`, b.`ArtNr`, PreisATS, b.`Stk`, b.`PreisATS_Brutto`,
 b.`ArtikelIdentifikation`, b.`EKPreis`, IfNull(b.`Bezeichnung`,'-'), b.`LieferantNR`, b.`PositionStatus`,
 b.`Referenz`, b.`Packung`, b.`Herkunft`, b.`Incoterm`, b.`Spezifikation`, b.`Zeitpunkt`
FROM `buchRech-artikel` b
where RechNr is not null;


Insert into buchVorgang (  Typ,  Nummer ,  KundNr ,  Datum ,  Notiz ,  Summe ,  Bezahlt , Ausgedruckt, abgeschlossen ,  ZahlungsBedingung,
  Woher,  Wohin,  TransportMethode,  ZahlungsMethode, Status,
  NotizIntern, NotizExtern, SummeMWST, SummeBrutto, LieferantNr, MitarbeiterNr, KundNr2,  Waehrung)
SELECT 'LI', b.`Nummer`, b.`KundNr`, b.`Datum`, b.`Notiz`, b.`Summe`, b.`Bezahlt`, b.`Ausgedrukt`, b.`anElba`, b.`ZahlungsBedungung`,
  b.`Woher`, b.`Wohin`, b.`TransportMethode`, b.`ZahlungsMethode`, b.`Status`,
  b.`NotizIntern`, b.`NotizExtern`, b.`SummeMWST`, b.`SummeBrutto`, b.`LieferantNr`, b.`MitarbeiterNr`,b.`KundNr2`, b.`Waehrung`
FROM buchLieferschein b;


Insert into `buchVorgang-artikel`
( Typ, ID, Nummer, ArtNr, Preis_Netto, Stk, Preis_Brutto,
ArtikelIdentifikation, EKPreis, Bezeichnung, LieferantNR, Status,
Referenz, Packung, Herkunft, Incoterm, Spezifikation, Zeitpunkt )
SELECT 'LI',  b.`ID`, b.`RechNr`, b.`ArtNr`, PreisATS, b.`Stk`, b.`PreisATS_Brutto`,
 b.`ArtikelIdentifikation`, b.`EKPreis`, IfNull(b.`Bezeichnung`,'-'), b.`LieferantNR`, b.`PositionStatus`,
 b.`Referenz`, b.`Packung`, b.`Herkunft`, b.`Incoterm`, b.`Spezifikation`, b.`Zeitpunkt`
FROM `buchLieferschein-artikel` b
where RechNr is not null and ArtNr is not null;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=1 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=1 */;