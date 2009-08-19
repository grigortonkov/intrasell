ALTER TABLE `intrasell_daten_2`.`ofadressen-zahlungsbedingungen` MODIFY COLUMN `IdNr` INT(10) NOT NULL DEFAULT 0,
 MODIFY COLUMN `Standart` TINYINT(1) NOT NULL DEFAULT 0;

 ALTER TABLE `intrasell_daten_2`.`ofadressen-zahlungsmethoden` MODIFY COLUMN `IdNr` INT(10) NOT NULL DEFAULT 0,
 MODIFY COLUMN `Standart` TINYINT(1) NOT NULL DEFAULT 0;


 ALTER TABLE `intrasell_daten_2`.`ofadressen-transportmethoden` MODIFY COLUMN `IdNr` INT(10) NOT NULL DEFAULT 0,
 ADD COLUMN `Standart` TINYINT(1) NOT NULL DEFAULT 0 AFTER `Methode`;


