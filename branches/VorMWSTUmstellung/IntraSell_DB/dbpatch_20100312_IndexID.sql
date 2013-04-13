ALTER TABLE  `buchrech-artikel` DROP INDEX `ID`,
 ADD INDEX `ID` USING BTREE(`ID`);

ALTER TABLE  `buchAuftrag-artikel` DROP INDEX `ID`,
 ADD INDEX `ID` USING BTREE(`ID`);

ALTER TABLE  `buchAngebot-artikel` DROP INDEX `ID`,
 ADD INDEX `ID` USING BTREE(`ID`);

ALTER TABLE  `buchLieferschein-artikel` DROP INDEX `ID`,
 ADD INDEX `ID` USING BTREE(`ID`);

ALTER TABLE  `buchGutschrift-artikel` DROP INDEX `ID`,
 ADD INDEX `ID` USING BTREE(`ID`);