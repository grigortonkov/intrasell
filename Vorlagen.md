#Vorlagen

# Einfürung #

IntraSell kann mit mehreren Vorlagentypen umgehen.
Die vorlagentypen sind DOT, DOC, RTF, HTML.



# Vorlagen erstellen #
1. Eine bestehende Vorlage kopieren und umbenennen.
2. Mit Ms Word oder HTML Editor die Vorlagen je nach Typ editieren.
> Unterstützte Tokens (Datenfelder) sind hier TODO zu finden.

# Vorlagen erstellen in Access #
1. Eine bestehender Report kann geändert werden. z.Bsp. AddOn\_Rechnung\_Firma
2. Report anschließend in Access (Rechte Maustaste) exportieren in die dazugehörige Plug In MDB Datei. Somit kann Report auch nach einem Upgrade wieder importiert werden.


# Vorlagen verwalten #
## A. Vorlagen zentral verwalten ##

1. Die Vorlagen am Fileserver abspeichern.
Z.bsp: z:\Daten\IntraSell3\IntraSell\Vorlagen

2. Die Vorlagenpfade in Tabelle buchVorlagen zu den neuen Vorlagenpfade korrigieren.

## B. Vorlagen verteilen ##
1. Die Vorlagen am Fileserver abspeichern.
Z.bsp: z:\Daten\IntraSell3\IntraSell\Vorlagen

2. Batch File: z:\Daten\IntraSell3\vorlagen\_verteilen.bat ausführen.