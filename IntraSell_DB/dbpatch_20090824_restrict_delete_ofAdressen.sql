ALTER TABLE `intrasell_daten_2`.`buchrechnung`
 DROP FOREIGN KEY `buchrechnung_ibfk_1`;

ALTER TABLE `intrasell_daten_2`.`buchrechnung`
 DROP FOREIGN KEY `buchrechnung_ibfk_2`;

ALTER TABLE `intrasell_daten_2`.`buchrechnung` ADD CONSTRAINT `buchrechnung_ibfk_1` FOREIGN KEY `buchrechnung_ibfk_1` (`KundNr`)
    REFERENCES `ofadressen` (`IDNR`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
 ADD CONSTRAINT `buchrechnung_ibfk_2` FOREIGN KEY `buchrechnung_ibfk_2` (`KundNr`)
    REFERENCES `ofadressen` (`IDNR`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;
