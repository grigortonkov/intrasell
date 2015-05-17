# SQL Scripts #

1. Kundennummer ändern
```
start transaction;
SET FOREIGN_KEY_CHECKS=0;
update ofAdressen            set idnr = 295489   where idnr = 499017;
update `ofadressen-settings` set idnr = 295489   where idnr = 499017;
update  `ofadressen-weitere` set idnr = 295489   where idnr =  499017;
update buchAuftrag           set kundnr= 295489  where kundnr = 499017;
update buchRechnung          set kundnr= 295489  where kundnr = 499017;
SET FOREIGN_KEY_CHECKS=1;
commit;
```