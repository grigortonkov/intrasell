--Adressen 

create table t as
 select min(id)
from `ofadressen-settings`
group by idnr having count(*)>1 ;

delete FROM `ofadressen-settings`
where id in (select id from t);

drop table t;



--Artikel
update grArtikel
set artkatNr = (select min(artKatNr) from `grArtikel-Kategorien`)
where  artkatnr not in (select artkatnr from `grArtikel-Kategorien`);