rem Windows Batch File für automatisches Starten der Replikation (VPN) 

rem Runs SQL Commands from File at certain time! Every 10 minutes; 

c:\mysql\bin\mysql intrasell_daten_2 -uroot -pa1060 < commands.sql 

pause 
