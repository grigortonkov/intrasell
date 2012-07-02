ALTER TABLE `intrasell_daten_2`.`buchseriennummer`
 ADD COLUMN `AngebotsNr` INT(10),
 ADD COLUMN `AuftragsNr` INT(10),
 ADD COLUMN `Notiz` VARCHAR(255),
 ADD COLUMN `Lagerort` INT(10);