SELECT * FROM z2014_ofadressen z where angelegtan > '2012-01-01' and Status ='Kunde' order by angelegtan desc ;


SELECT * FROM ofadressen z order by angelegtan desc where idnr=284643;


SELECT * FROM intrasell_daten_rollback.ofadressen z where idnr=284631;



select * from buchRechnung where KundNr  not in (select idnr from ofAdressen);

select * from buchRechnung  where nummer = 1408004243;
select * from buchAuftrag  where nummer = 2014096890;


select * from z2014_buchAuftrag where KundNr=284645;



select * from buchAuftrag  where nummer = 2014096923;

SELECT * FROM z2014_ofadressen z  where idnr in (284643, 284644, 284645);


284643 Alexander Mainusch
21:20 Uhr            284644 Mandera Bodo
21:48 Uhr            284645 Thorsten Tiedemann-Koch;




select * from buchAuftrag where nummer = 2014096916;


SELECT * FROM `z2014_buchauftrag-artikel` where rechnr = 2014096916;
;
select * from ofAdressen where  idnr in (select idnr from tmp_z2014_ofadressen_Rollback);




-- Kunden wiederherstellen
delete from tmp_z2014_ofadressen_Rollback;

insert into tmp_z2014_ofadressen_Rollback
SELECT * FROM z2014_ofadressen z where angelegtan > '2010-01-01' and Status ='Kunde'
order by angelegtan desc;



Create Table tmp_z2014_buchauftrag_Rollback as
SELECT * FROM intrasell_daten_rollback.buchauftrag b
where Datum  > '2010-01-01' and not exists (select 1 from intrasell_daten_2.buchauftrag ba2 where ba2.nummer = b.nummer);


select min(Datum) from buchAuftrag;

SELECT * FROM intrasell_daten_rollback.buchrechnung b
where Datum  > '2014-08-07' and not exists (select 1 from intrasell_daten_2.buchrechnung ba2 where ba2.nummer = b.nummer);


select * from z2014_ofadressen z where idnr in (select idnr from tmp_z2014_ofadressen_Rollback) and idnr in (select idnr from ofAdressen);

select * from ofAdressen where IDNR >= 284636 and angelegtan > '2014-08-08';


select * from z2014_ofadressen where   angelegtan > '2014-08-07' order by idnr desc;



select * from buchAuftrag where kundnr in (select idnr from ofAdressen where  idnr in (select idnr from tmp_z2014_ofadressen_Rollback));


-- Kundennummer erhöhen
284636 -> 284656
284637 -> 284657
284638 -> 284658
284639 -> 284659
284640 -> 284660
select * from buchAuftrag where kundnr = 284640;
select * from ofAdressen where idnr = 284640;
SELECT * FROM `ofadressen-profil`where idnr = 284640;
SELECT * FROM `ofadressen-settings` where idnr = 284640;
SELECT * FROM `ofadressen-transportmethoden` where idnr = 284640;
SELECT * FROM `ofadressen-weitere` where idnr = 284640;
SELECT * FROM `ofadressen-zahlungsbedingungen` where idnr = 284640;
SELECT * FROM `ofadressen-zahlungsmethoden` where idnr = 284640;


update ofAdressen set idnr = 284659 where idnr = 284639;
update  buchAuftrag set kundnr=284659 where kundnr = 284639;
update `ofadressen-profil`set idnr = 284659  where idnr = 284639;
update `ofadressen-settings` v set idnr = 284659 where idnr = 284639;
update `ofadressen-transportmethoden` set idnr = 284659  where idnr = 284639;
update `ofadressen-weitere` set idnr = 284659  where idnr = 284639;
update `ofadressen-zahlungsbedingungen` set idnr = 284659  where idnr = 284639;
update `ofadressen-zahlungsmethoden` set idnr = 284659  where idnr = 284639;


-- rollback adressen
select a.* from tmp_z2014_ofadressen_Rollback a;

select a.* from tmp_z2014_ofadressen_Rollback a, grplz where grPLZ.idnr= a.plz;

create table tmp as
select *   from tmp_z2014_ofadressen_Rollback a  where not exists (select 1 from grPLZ p where  a.plz = p.idnr);

delete from tmp_z2014_ofadressen_Rollback where idnr in (select idnr from tmp);

insert into ofAdressen
select * from z2014_ofadressen where idnr in (select idnr from tmp_z2014_ofadressen_Rollback where PLZ is not null);

insert into `ofadressen-settings`
select * from `z2014_ofadressen-settings` where idnr in (select idnr from tmp_z2014_ofadressen_Rollback);

insert into `ofadressen-transportmethoden`
select * from `z2014_ofadressen-transportmethoden` where idnr in (select idnr from tmp_z2014_ofadressen_Rollback);

insert into `ofadressen-weitere`
select * from `z2014_ofadressen-weitere` where idnr in (select idnr from tmp_z2014_ofadressen_Rollback);

insert into  `ofadressen-zahlungsbedingungen`
select * from `z2014_ofadressen-zahlungsbedingungen` where idnr in (select idnr from tmp_z2014_ofadressen_Rollback);

insert into `ofadressen-zahlungsmethoden`
select * from `z2014_ofadressen-zahlungsmethoden` where idnr in (select idnr from tmp_z2014_ofadressen_Rollback);




-- ältere kunden wiederherstellen

create table  tmp_z2014_ofadressen_Rollback_vor2010 as
SELECT * FROM z2014_ofadressen z where angelegtan <= '2010-01-01' and Status ='Kunde'
order by angelegtan desc;


create table tmp2 as
select *   from tmp_z2014_ofadressen_Rollback_vor2010 a  where not exists (select 1 from grPLZ p where  a.plz = p.idnr);

delete from tmp_z2014_ofadressen_Rollback_vor2010 where idnr in (select idnr from tmp2);


insert into ofAdressen
select * from z2014_ofadressen where idnr in (select idnr from tmp_z2014_ofadressen_Rollback_vor2010 );

insert into `ofadressen-settings`
select * from `z2014_ofadressen-settings` where idnr in (select idnr from tmp_z2014_ofadressen_Rollback_vor2010);

insert into `ofadressen-transportmethoden`
select * from `z2014_ofadressen-transportmethoden` where idnr in (select idnr from tmp_z2014_ofadressen_Rollback_vor2010);

insert into `ofadressen-weitere`
select * from `z2014_ofadressen-weitere` where idnr in (select idnr from tmp_z2014_ofadressen_Rollback_vor2010);

insert into  `ofadressen-zahlungsbedingungen`
select * from `z2014_ofadressen-zahlungsbedingungen` where idnr in (select idnr from tmp_z2014_ofadressen_Rollback_vor2010);

insert into `ofadressen-zahlungsmethoden`
select * from `z2014_ofadressen-zahlungsmethoden` where idnr in (select idnr from tmp_z2014_ofadressen_Rollback_vor2010);



-- Aufträge




-- insert into buchAuftrag
select * from intrasell_daten_rollback.buchAuftrag b where Datum > '2010-01-01'
and b.kundnr in (select idnr from ofAdressen)
and b.nummer not in  (select Nummer from buchAuftrag a) order by datum desc;

create table tmp_auftrag_gesperrt as
select * from tmp_z2014_buchauftrag_rollback r  where not kundnr in (select idnr from ofAdressen) order by nummer desc;

select status  from intrasell_daten_rollback.ofAdressen where idnr in (
select kundnr from tmp_z2014_buchauftrag_rollback r  where not kundnr in (select idnr from ofAdressen) order by nummer desc);


delete from tmp_z2014_buchauftrag_rollback where nummer in  (select nummer from tmp_auftrag_gesperrt);

insert into buchAuftrag
select * from intrasell_daten_rollback.`buchAuftrag` where Nummer in (select nummer from tmp_z2014_buchauftrag_rollback);
-- select * from intrasell_daten_rollback.`buchAuftrag` where Nummer in (select nummer from tmp_z2014_buchauftrag_rollback)    and kundnr in (select idnr from ofAdressen) order by datum desc;


insert into `buchAuftrag-Artikel`
select * from intrasell_daten_rollback.`buchAuftrag-Artikel` where RechNr in (select nummer from tmp_z2014_buchauftrag_rollback);



select 'all' , count(*) from intrasell_daten_rollback.buchAuftrag b
union
select 'prod', count(*) from intrasell_daten_2.buchAuftrag b
union
select 'archive', count(*) from intrasell_daten_2.z2014_buchAuftrag b;

SELECT * FROM tmp_z2014_buchauftrag_rollback t;
