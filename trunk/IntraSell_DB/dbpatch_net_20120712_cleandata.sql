create table t as
 select min(id)
from `ofadressen-settings`
group by idnr having count(*)>1 ;

delete FROM `ofadressen-settings`
where id in (select id from t);

drop table t;