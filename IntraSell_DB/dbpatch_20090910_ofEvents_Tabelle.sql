﻿CREATE TABLE `intrasell_daten_2`.`ofEvents` (
  `ID` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nachricht` VARCHAR(255) NOT NULL,
  `Datum` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
)
ENGINE = InnoDB;
