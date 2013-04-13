REM 

REM DLL REGISTRIERUNG 
regsvr32 IntraSell.dll

REM ODBC INSTALLATION 
"..\components\mysql-connector-odbc-5.1.5-win32.msi"

REM ODBC EINTRAG 
regedit IntraSell_ODBCRegister.reg

