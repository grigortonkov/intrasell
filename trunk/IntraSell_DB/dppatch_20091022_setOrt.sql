update ofadressen a, grplz p
set a.ort = p.Ort
where a.plz = p.idnr and a.ort is null;