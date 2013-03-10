ALTER TABLE  `ofanrufe` ADD COLUMN `Angebot` BOOLEAN AFTER `Verrechnung`,
 ADD COLUMN `WeitereInformationen` BOOLEAN AFTER `Angebot`,
 ADD COLUMN `InformationPer` VARCHAR(45) COMMENT 'Email, Fax, Post' AFTER `WeitereInformationen`,
 ADD COLUMN `Wettbewerb` VARCHAR(255) AFTER `InformationPer`;