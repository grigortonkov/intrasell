rem Example how to run automatically the import manager

SET AUTORUN=TRUE
SET LIEFERANTNR=1
SET MAKENEWPRODUCTS=TRUE
START "Import" /LOW /WAIT "IntraSell_AddIn_ImportManager.mdb"

PAUSE