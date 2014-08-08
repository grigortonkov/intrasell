-- Archivierung der intrasell daten 
-- Die Daten werden nach Tabelle mit dem Präfix z2014 verschoben 

-- Kunden, mit Status „gesperrt“ und Umsatz 0

-- Kunden, die gesperrt sind, aber ab dem 1.1.2007 Umsätze hatten, würde ich nicht archivieren

-- Kunden, die nach dem 31.12.2006 keine Umsätze hatten

-- Angebote, die vor dem 1.1.2010 erstellt wurden

-- Aufträge, die vor dem 1.1.2008 erstellt wurden

-- Lieferscheine, die vor dem 1.1.2008 erstellt wurden

-- Artikel, bei denen „Aktiv“ deaktiviert ist (nicht zu verwechseln mit Aktiv Online!) und es seit 1.1.2007 keine Lagerbewegung mehr gibt
-- start transaction;

-- tmp tabelle
create table z2014_ofAdressenIdnr as
select idnr from ofAdressen where (Status = 'Gesperrt' or name like '***%')
 and not exists (select 1 from buchRechnung where kundnr = idnr and datum >'2007-01-01')
union
select idnr  from ofAdressen where
   not exists (select 1 from buchRechnung where kundnr = idnr and datum > '2007-01-01');
   
alter table z2014_ofAdressenIdnr add unique index `xxx` (`idnr`);

create table z2014_ofAdressen as
select * from ofAdressen where idnr in (select idnr from z2014_ofAdressenIdnr);

create table `z2014_ofAdressen-profil` as
select * from `ofAdressen-profil` where idnr in (select idnr from z2014_ofAdressenIdnr);

create table `z2014_ofAdressen-settings` as
select * from `ofAdressen-settings` where idnr in (select idnr from z2014_ofAdressenIdnr);

create table `z2014_ofAdressen-transportmethoden` as
select * from `ofAdressen-transportmethoden` where idnr in (select idnr from z2014_ofAdressenIdnr);

create table `z2014_ofAdressen-weitere` as
select * from `ofAdressen-weitere` where idnr in (select idnr from z2014_ofAdressenIdnr);

create table `z2014_ofAdressen-zahlungsbedingungen` as
select * from `ofAdressen-zahlungsbedingungen` where idnr in (select idnr from z2014_ofAdressenIdnr);

create table `z2014_ofAdressen-zahlungsmethoden` as
select * from `ofAdressen-zahlungsmethoden` where idnr in (select idnr from z2014_ofAdressenIdnr);

-- angebot
create table `z2014_buchAngebot-artikel` as
SELECT * FROM `buchAngebot-artikel`  where rechnr in (select nummer from buchAngebot where datum < '2010-01-01');
create table `z2014_buchAngebot` as
select * from `buchAngebot` where datum < '2010-01-01';
delete  FROM `buchAngebot-artikel`  where rechnr in (select nummer from buchAngebot where datum < '2010-01-01');
delete from `buchAngebot` where datum < '2010-01-01';

-- auftrag
create table `z2014_buchauftrag-artikel` as
SELECT * FROM `buchauftrag-artikel`  where rechnr in (select nummer from buchauftrag where datum < '2010-01-01');
create table `z2014_buchauftrag` as
select * from `buchauftrag` where datum < '2010-01-01';
delete  FROM `buchauftrag-artikel`  where rechnr in (select nummer from buchauftrag where datum < '2010-01-01');
delete from `buchauftrag` where datum < '2010-01-01';

-- lieferschein
create table `z2014_buchlieferschein-artikel` as
SELECT * FROM `buchlieferschein-artikel`  where rechnr in (select nummer from buchlieferschein where datum < '2010-01-01');
create table `z2014_buchlieferschein` as
select * from `buchlieferschein` where datum < '2010-01-01';
delete  FROM `buchlieferschein-artikel`  where rechnr in (select nummer from buchlieferschein where datum < '2010-01-01');
delete from `buchlieferschein` where datum < '2010-01-01';

-- Rechnung
create table `z2014_buchRech-artikel` as
SELECT * FROM `buchRech-artikel`  where rechnr in (select nummer from buchRechnung where datum < '2007-01-01');
create table `z2014_buchRechnung` as
select * from `buchRechnung` where datum < '2007-01-01';
delete  FROM `buchRech-artikel`  where rechnr in (select nummer from buchRechnung where datum < '2007-01-01');
delete from `buchRechnung` where datum < '2007-01-01';


-- select count(*)  from grArtikel ;

-- delete adressen 


delete from `ofAdressen-profil` where idnr in (select idnr from z2014_ofAdressenIdnr);

delete from `ofAdressen-settings` where idnr in (select idnr from z2014_ofAdressenIdnr);

delete from `ofAdressen-transportmethoden` where idnr in (select idnr from z2014_ofAdressenIdnr);

delete from `ofAdressen-weitere` where idnr in (select idnr from z2014_ofAdressenIdnr);

delete from `ofAdressen-zahlungsbedingungen` where idnr in (select idnr from z2014_ofAdressenIdnr);

delete from `ofAdressen-zahlungsmethoden` where idnr in (select idnr from z2014_ofAdressenIdnr);

delete from ofAdressen where idnr in (select idnr from z2014_ofAdressenIdnr);

drop table z2014_ofAdressenIdnr;


