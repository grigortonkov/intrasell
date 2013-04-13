update   buchRechnung
set datum = date(datum)
where datum <> date(datum);