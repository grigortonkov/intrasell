# INTRASELL ONLINE HILFE #


## Voraussetzungen ##
### Hardware ###
  * Server: 10 GB Festplattenspeicher; 500 Mb RAM; 1 Ghz Prozessor; 32 Bit od. 64 Bit System;
  * Client: 100 Mb Festplattenspeicher; 265 RAM; 1 Ghz Prozessor;
### Software ###

  * Client:
> > - MS Windows (XP, Vista, 2000)
> > - MS Access 2003 Runtime (kostenlos von MS)
> > - MS Word (optional falls Vorlagengenerierung benötigt wird)
  * Server:
> > - Linux bzw Windows Betriebssystem
> > - Datenbank - MySQL, MYSQL, Oracle od. Access 2003

## Installation ##
### Office Server ###
  * MySQL 5.1 von der Seite www.mysql.org herunterladen und in c:\mysql installieren;
  * DB Script herunterladen: http://code.google.com/p/intrasell/downloads/list
  * DB Script für die Intrasell\_daten\_2 Datenbank einspielen;
  * MySQL User anlegen. IntraSell verwendet einen User namens WebShop.


### Office Client ###
  * Downloaden Sie den letzten Release: http://code.google.com/p/intrasell/downloads/list
  * Entzippen Sie die ZIP Datei in einem belibiegen Ordner.
  * Starten Sie die setup.bat Datei für die automatische Einrichtung der Komponenten
  * Starten Sie IntraSell.exe Datei (Doppelklick)
  * Warnung 64Bit System: Eventuell den MySQL Odbc 5.1 Treiber mit der DLL von einem 32 Bit ODBC Treiber ersetzen.

### WebShop Server ###

  * IntraSell\_webshop in einem Folder entpacken. (wwwroot)
  * IIS Starten und eine neue Anwendung einfügen - am Besten als Root.
  * Warnung 64Bit System:
> > in IIS 7 in Applikation pool , erweiterte Einstellungen muss 32 Support aktiviert werden.
  * SVN Installieren: http://tortoisesvn.net/downloads;
  * IntraSell\_WebShop Source Code mit SVN auschecken:


> http://intrasell.googlecode.com/svn/trunk/IntraSell_WebShop
> auschecken in c:\IntraSell\IntraSell\_WebShop;
  * Datei global.asa anpassen;
  * MySQL Installieren: Siehe auch Office Server.
  * Replikation einrichten zwischen Office und WebServer: SetupReplikation

## Funkionen ##
  * [Stammdatenverwaltung](Stammdatenverwaltung.md): Kunden, Lieferanten, Adressen, Etiketten;
  * Artikel, Artikelgruppen, Preislisten;
  * Angebot, Auftrag, Rechnung, Lieferschein, Retourschein (Umwandlungsfunktion wie z.B. Rechnung aus einem Angebot zu erstellen) ;
  * Import- & Exportfunktion, ELBA Schnittstelle;
  * Etiketten, Adresskleber, Bankbelegausdruck;
  * Statistiken & Berichte;


## Sicherung ##
  * Die Sicherung inkludiert die MySQL Datenbank. Die MySQL Datenbank wird automatisch gesichert. Eine Sicherung kann mit Hilfe von MySQL Administrator eingerichtet werden.