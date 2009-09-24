-- TABELLE F�R EUROFIB

DROP TABLE IF EXISTS `intrasell_daten_2`.`addin_eurofibu_export_kundengruppenkonten`;
CREATE TABLE  `intrasell_daten_2`.`addin_eurofibu_export_kundengruppenkonten` 
(
  `ID` int(11) NOT NULL,
  `Kundengruppe` varchar(50) default NULL,
  `Konto` varchar(10) default NULL,
  `Stco` varchar(50) default NULL,
  
PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `intrasell_daten_2`.`addin_eurofibu_export_values`;
CREATE TABLE  `intrasell_daten_2`.`addin_eurofibu_export_values`
 (
  `Dateiname` varchar(250) default NULL,
  `Von` datetime default NULL,
  `Bis` datetime default NULL,
  `Klient` varchar(4) NOT NULL,
  
PRIMARY KEY  (`Klient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;