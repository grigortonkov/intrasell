ALTER TABLE `intrasell_daten_2`.`buchrech-artikel` DROP PRIMARY KEY,
 ADD PRIMARY KEY  USING BTREE(`ID`, `RechNr`);

ALTER TABLE `intrasell_daten_2`.`buchangebot-artikel` MODIFY COLUMN `RechNr` INT(10) NOT NULL,
 DROP PRIMARY KEY,
 ADD PRIMARY KEY  USING BTREE(`ID`, `RechNr`);

ALTER TABLE `intrasell_daten_2`.`buchauftrag-artikel` DROP PRIMARY KEY,
 ADD PRIMARY KEY  USING BTREE(`ID`, `RechNr`);


ALTER TABLE `intrasell_daten_2`.`buchgutschrift-artikel` MODIFY COLUMN `RechNr` INT(10) NOT NULL,
 DROP PRIMARY KEY,
 ADD PRIMARY KEY  USING BTREE(`ID`, `RechNr`);


ALTER TABLE `intrasell_daten_2`.`buchlieferantauftrag-artikel` MODIFY COLUMN `RechNr` INT(10) NOT NULL,
 DROP PRIMARY KEY,
 ADD PRIMARY KEY  USING BTREE(`ID`, `RechNr`);

ALTER TABLE `intrasell_daten_2`.`buchlieferschein-artikel` MODIFY COLUMN `RechNr` INT(10) NOT NULL,
 DROP PRIMARY KEY,
 ADD PRIMARY KEY  USING BTREE(`ID`, `RechNr`);

ALTER TABLE `intrasell_daten_2`.`buchretourwaren-artikel` MODIFY COLUMN `RechNr` INT(10) NOT NULL,
 DROP PRIMARY KEY,
 ADD PRIMARY KEY  USING BTREE(`ID`, `RechNr`);

ALTER TABLE `intrasell_daten_2`.`buchruestschein-artikel` MODIFY COLUMN `RechNr` INT(10) NOT NULL,
 DROP PRIMARY KEY,
 ADD PRIMARY KEY  USING BTREE(`ID`, `RechNr`);

