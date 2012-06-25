ALTER TABLE `intrasell_daten_2`.`buchretourwaren` ADD COLUMN `MitarbeiterNr` INT(10) 
UNSIGNED;

 ALTER TABLE `intrasell_daten_2`.`buchretourwaren` MODIFY COLUMN `Datum` DATETIME DEFAULT NOT NULL;

 
 