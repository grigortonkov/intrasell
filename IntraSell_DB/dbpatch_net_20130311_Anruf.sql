update  ofanrufe set nanruf = null;
ALTER TABLE `ofanrufe` MODIFY COLUMN `NAnruf` DATETIME DEFAULT NULL,
 ADD COLUMN `Archiviert` BOOLEAN AFTER `Wettbewerb`;
