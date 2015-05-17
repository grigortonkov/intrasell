# Rechnungslegung #
Sie können Angebote, Aufträge, Rechnungen, Lieferscheine u.e.m. verwalten.
Die Vorgänge können konvertiert werden. D.h. Sie können ein Angebot in eine Rechnung konvertieren. hiermit werden alle Positionen übernommen.





# Rechnungen #

## Barverkauf Rechnung ##
Hauptmenü -> Barverkauf

## Rechnung mit MwSt ##
Kunden -> (Kunde Suchen) -> Vorgänge -> Rechnung

Eine Rechnung mit MwSt. kann nur für einen Kunden mit MwSt. angelegt werden.

  * Klicken Sie auf Button "Neu" um eine neue Rechnung zu beginnen.

  * Wählen Sie die Positionen. Der Preis wird automatisch je nach Kunde und Stückzahl errechnet.

  * Klicken Sie auf Button "Abschließen" damit Lagerbuchungen durchgeführt werden können.

![http://intrasell.googlecode.com/svn/trunk/Screenshots/rechnung.jpg](http://intrasell.googlecode.com/svn/trunk/Screenshots/rechnung.jpg)


## Rechnung ohne MwST ##
Kunden -> (Kunde Suchen) -> Vorgänge -> Rechnung

Eine Rechnung ohne MwSt. kann nur für einen Kunden ohne MwSt. angelegt werden.


## Rechnung mit Akonto ##
Hauptmenü -> Liste Vorgänge

Das ist eine Ablauf mit 2 Rechnungen.
Die erste Rechnung wird ganz normal erstellt. Beim Preis geben Sie den zu akontierende Preis ein. Schließen Sie die erste Rechnung nicht ab.

Die zweite Rechnung wird von der ersten Konvertiert! Das ist sehr wichtig für den Druck. Bei der zweiten Rechnung wird der Preis von der ersten Rechung gegen gerechnet. Schließen Sie diese Rechnung ab.

![http://intrasell.googlecode.com/svn/trunk/Screenshots/rechnungdruck_akonto.jpg](http://intrasell.googlecode.com/svn/trunk/Screenshots/rechnungdruck_akonto.jpg)


## Rechnungsvorlage anpassen ##

Dafür gibt es drei Möglichkeiten:
### Access Vorlage anpassen ###
Das geht einfach mit ein bisschen Access Know How.
  * Öffnen Sie den Plug In Ihrer Firma und suchen Sie nach Access Report "buchRechung\_AddOn\_FIRMA".
  * Ändern Sie die Vorlage nach Ihrem Wunsch.
  * Importieren Sie den PlugIn ins Haupt Programm.

![http://intrasell.googlecode.com/svn/trunk/Screenshots/rechnungdruck.jpg](http://intrasell.googlecode.com/svn/trunk/Screenshots/rechnungdruck.jpg)


### Fiskal Drucker Vorlage anpassen ###
### MS Word Vorlage anpassen ###