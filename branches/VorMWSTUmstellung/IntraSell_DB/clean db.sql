-- CLEAN DB SCRIPT

USE INTRASELL_DATEN_2;



DELETE FROM   webwarenkorb;
DELETE FROM   websessions;

DELETE FROM  calcSheet;

DELETE FROM   tradeboardkundenanfrage ;
DELETE FROM   tradeboardkundenanfrage ;
DELETE FROM   tradeboardlieferantenanfrageartikel ;
DELETE FROM   tradeboardlieferantenanfrage ;
DELETE FROM   tradeboardgeschaeft ;

DELETE FROM   tradeboardlieferantenangebot ;
DELETE FROM   tradeboardlieferantenangebotfoto ;
DELETE FROM   transportanfrage ;
DELETE FROM   transportauftrag ;


DELETE FROM `buchauftrag-artikel`;
DELETE FROM buchauftrag;


DELETE FROM `buchRech-artikel`;
DELETE FROM buchRechnung;


DELETE FROM `buchlieferschein-artikel`;
DELETE FROM buchlieferschein;



DELETE FROM `buchlieferantAuftrag-artikel`;
DELETE FROM buchlieferantAuftrag;

DELETE FROM `buchVorgang-artikel`;
DELETE FROM buchVorgang;



DELETE FROM  buchvorgaengeausdruckelog;
DELETE FROM  buchvorgaengeeigenschaften;


DELETE FROM  `grartikel-htmlinfo` where ArtNr > 10;
DELETE FROM  `grartikel-lagerbewegung` where ArtNr > 10;
DELETE FROM  `grartikel-lagerbestand` where ArtNr > 10;

DELETE FROM  `grartikel-vkpreisperselection` where ArtNr > 10 and not ArtNr is null;


DELETE FROM   `lieferantenartikel-preise`;

DELETE FROM   `ofadressen-bonuspunkte` where Idnr > 1;
DELETE FROM   `ofadressen-selection1` where Idnr > 1;
DELETE FROM   `ofadressen-settings` where Idnr > 1;
DELETE FROM   `ofadressen-transportmethoden` where Idnr > 1;
DELETE FROM   `ofadressen-weitere`;
DELETE FROM   `ofadressen-zahlungsbedingungen` where Idnr > 1;
DELETE FROM   `ofadressen-zahlungsmethoden` where Idnr > 1;

DELETE FROM   ofanrufe;
DELETE FROM   ofasppartner where Idnr > 1;
DELETE FROM   ofmitarbeiter where IDNR > 2;


DELETE FROM   lieferantenadressen where IdNr > 5;
DELETE FROM   ofadressen where Idnr > 1;
DELETE FROM   grartikel where ArtNr > 10;