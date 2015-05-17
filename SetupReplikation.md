# Replikation #

## Einrichtung Replikation ##

1. Edit the my.cnf file on the slave and on the master server:

Hint: These are additional settings to a clean MySQL installation (Version 5.1).

master my.cnf:
```
[mysqld]
server-id = 1
log-bin
log-slave-updates 
replicate-do-db = intrasell_daten_2
log-warnings
slave-skip-errors=all
master-connect-retry=600
master-retry-count=1000
```

slave my.cnf:
```
[mysqld]
server-id = 2
log-bin
log-slave-updates
#master-host = master-host.net
#master-user = repl
#master-password = repl_pass
replicate-do-db = intrasell_daten_2
log-warnings
slave-skip-errors=all
master-connect-retry=600
master-retry-count=1000
```

2. Restart both the slave and the master.

3. On the master do:

```
GRANT SUPER,REPLICATION CLIENT,REPLICATION SLAVE,RELOAD ON *.* TO replication@"%" IDENTIFIED BY 'pwd';
```
4. On the slave do:
```
LOAD DATA FROM MASTER;
GRANT SUPER,REPLICATION CLIENT,REPLICATION SLAVE,RELOAD ON *.* TO replication@"%" IDENTIFIED BY 'pwd';
```

The slave should now download the databases specified with replicate-do-db in the slaves my.cnf,
and be replicating new data.


Befehle:
Rechte Vergeben (Am Master):
```
GRANT SUPER, REPLICATION SLAVE, REPLICATION CLIENT,RELOAD
    ON *.*
    TO 'replication'@'*'
    IDENTIFIED BY 'pwd';
```

Master setzen (am Slave):
```
CHANGE MASTER TO
  MASTER_HOST='80.120.22.111',
  MASTER_USER='replication',
  MASTER_PASSWORD='pwd',
  -- MASTER_PORT=3306,
  MASTER_LOG_FILE='master2-bin.00016',
  MASTER_LOG_POS=7968,
  MASTER_CONNECT_RETRY=10;
```





## Set up VPN Verbindung ##
### Server ###
1. Am Server  - Allow VPN - Netzwerkverbindungen - TCP IP
> Start Adresse am Client 10.0.0.2
### Client ###
1. Install UltraVNC am Client:
> http://www.uvnc.com/
2.  Eine VPN Verbindung zum Server Einrichten: Windows/Netzwerke/neue Verbindung
> IP: Deine Server IP
> User: Administrator
> Passwort: xxxxxxx




## Weitere Einrichtung Start Replikation wenn der Client VPN (Einwählen) benutzt ##

Datei: startrepl.cmd
```
rem Windows Batch File für automatisches Starten der Replikation (VPN) 
rem Runs SQL Commands from File at certain time! Every 10 minutes;
c:\mysql\bin\mysql intrasell_daten_2 -uroot < commands.sql
pause
```

Datei: commands.sql
```
stop slave;

start slave;
```
---

## Problembehebung ##
### SKIP LOGS ###
Es kann passieren dass die Replikation nicht mehr funktioniert.
Die Gründe können mit dem Befehl: SHOW SLAVE STATUS; erruiert werden.

Folgende Befehle führen die Replikation ohne Fehlerbehebung weiter. So oft ausführen bis die Replikation wieder läuft.
```
START SLAVE;
SET GLOBAL SQL_SLAVE_SKIP_COUNTER = 1;
START SLAVE;
```
### Aktuelle Position auslesen, Binary Log lesbar ansehen ###
Die aktuelle Position in einem Log File ansehen.
Bsp:
mysqlbinlog.exe mysql-bin.000086 >> 86.txt