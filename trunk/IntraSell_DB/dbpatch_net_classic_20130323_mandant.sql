﻿CREATE TABLE `mandant` (
  `IDNR` SMALLINT(6) UNSIGNED NOT NULL,
  `Firma` VARCHAR(255) NOT NULL,
  `LagerNr` INTEGER(10) UNSIGNED,
  `AngelegtAm` TIMESTAMP NOT NULL,
  PRIMARY KEY (`IDNR`)
)
ENGINE = InnoDB;


ALTER TABLE buchVorgang ADD COLUMN `MandantNr` TINYINT(6) UNSIGNED;
ALTER TABLE buchangebot ADD COLUMN `MandantNr` TINYINT(6) UNSIGNED;
ALTER TABLE buchAuftrag ADD COLUMN `MandantNr` TINYINT(6) UNSIGNED;
ALTER TABLE buchrechnung ADD COLUMN `MandantNr` TINYINT(6) UNSIGNED;
ALTER TABLE buchLieferschein ADD COLUMN `MandantNr` TINYINT(6) UNSIGNED;
ALTER TABLE buchRetourwaren ADD COLUMN `MandantNr` TINYINT(6) UNSIGNED;
ALTER TABLE buchRuestschein ADD COLUMN `MandantNr` TINYINT(6) UNSIGNED;
ALTER TABLE buchGutschrift ADD COLUMN `MandantNr` TINYINT(6) UNSIGNED;
ALTER TABLE buchLieferantauftrag ADD COLUMN `MandantNr` TINYINT(6) UNSIGNED;


ALTER TABLE buchkassabuch ADD COLUMN `MandantNr` TINYINT(6) UNSIGNED;

ALTER TABLE `grartikel-lagerort` ADD COLUMN `MandantNr` TINYINT(6) UNSIGNED;

ALTER TABLE `ofadressen-kundengruppen` ADD COLUMN `MandantNr` TINYINT(6) UNSIGNED ,
 ADD COLUMN `VorlageName` VARCHAR(255) ,
 ADD COLUMN `MwSt` INTEGER UNSIGNED ;
ALTER TABLE  `impexbmd_vars` ADD COLUMN `Mandant` INTEGER(10);
