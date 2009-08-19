update grARtikel set herstellernr = 0 where herstellernr is null;
ALTER TABLE `intrasell_daten_2`.`grartikel` MODIFY COLUMN `HerstellerNr` INT(10) DEFAULT 0 NOT NULL;
