> ## Umsatz per Land ##
create view vStatLandTurnover as
> SELECT l.Name, year(datum) as Jahr ,  sum( summe), sum(summeBrutto)
> FROM `ofadressen-settings`  s, buchRechnung r, ofAdressen a, grLand l
> where a.Land = l.idnr and  r.KundNr = s.idnr and s.idnr = a.idnr and year(datum) > 2011
> group by  a.land, year(datum);

## Umsatz per Land mit Kunden und Preisgruppen ##
create view vStatLandTurnoverWithGroups as
> SELECT l.Name, year(datum) as Jahr , Kundengruppe, Preisliste, sum( summe), sum(summeBrutto)
> FROM `ofadressen-settings`  s, buchRechnung r, ofAdressen a, grLand l
> where a.Land = l.idnr and  r.KundNr = s.idnr and s.idnr = a.idnr and year(datum) > 2011
> group by  a.land, year(datum) , Kundengruppe, Preisliste;