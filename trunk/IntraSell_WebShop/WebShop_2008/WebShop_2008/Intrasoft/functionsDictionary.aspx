<script language="VB" runat="server">  
'===========================================================================
' General ASP Functions
' This is collection of usefull ASP functions and procedures.
' Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 
'
'
'============================================================================
' History
'____________________________________________________________________________
' DATE         WHAT
'____________________________________________________________________________
'
' Dictionary functionality 
'**Start Encode**
    Function translate(ByVal technicalTermToSearch) As String
        Dim terms(200)
        Dim Lastterm : Lastterm = 80
    
    
        terms(0) = "active|aktiv"
        terms(1) = "not active|nicht aktiv"
        terms(2) = "news|Neuigkeiten"
        terms(3) = "Comment|Kommentar"
        terms(4) = "Abstract|Abstrakt"
        terms(5) = "Title|Titel"
        terms(6) = "documentId|DokumentId"
        terms(7) = "document|Dokument"
        terms(8) = "ownerUserId|Verantwortlicher"
        terms(9) = "insertingUserId|Einbringer"
        terms(10) = "project|Projekt"
        terms(11) = "Keyword|Schlüsselwort"
        terms(12) = "Keywords|Schlüsselwörter"
        terms(13) = "countAccess|Anzahl Zugriffe"
        terms(14) = "lastaccess|letzter Zugriff"
        terms(15) = "Inbox|Inbox"
        terms(16) = "Neuigkeiten|What's new?"
        terms(17) = "TopDoku|WMS Hitlist"
        terms(18) = "Suchen|Previous Searches"
        terms(19) = "CheckedOut|Checked out Documents"
        terms(20) = "Order|Bestellung"
        terms(21) = "Orders|Bestellungen"
        terms(22) = "Invoice|Rechnung"
        terms(23) = "Offer|Angebot"
        terms(24) = "Invoices|Rechnungen"
        terms(25) = "Sending|Lieferschein"
        terms(26) = "Reclamation|Retourwaren"
        terms(27) = "See|Ansehen"
        terms(28) = "convert|konvertieren"
        terms(29) = "client|Kunde"
        terms(30) = "address|adresse"
        terms(31) = "addresses|Adressen"
        terms(32) = "addresses/zip|Adressen/PLZ"
        terms(33) = "merchants|Lieferanten"
        terms(34) = "Product/price|Produkt/Preis"
        terms(35) = "product|Produkt"
        terms(36) = "products|Produkte"
        terms(37) = "Statistics|Statistik"
        terms(38) = "Tables|Tebellen"
        terms(39) = "products/search|Produkte/Suche"
        terms(40) = "settings|Optionen"
        terms(41) = "help|Hilfe"
        terms(42) = "categories|Kategorien"
        terms(43) = "Type|Typ"
        terms(44) = "New|Neu"
        terms(45) = "See|ansehen"
        terms(46) = "Date|Datum"
        terms(47) = "Printed|Ausgedruckt"
        terms(48) = "Paid|Bezahlt"
        terms(49) = "Closed|Geschlossen"
        terms(50) = "Sum|Summe"
        terms(51) = "delete|löschen"
        terms(52) = "change|ändern"
        terms(53) = "print|ausdrucken"
        terms(54) = "activity|Vorgang"
        terms(55) = "Yes|Ja"
        terms(56) = "No|Nein"
        terms(57) = "Adresses/search|Adressen/Suche"
        terms(58) = "ZIP|PLZ"
        terms(59) = "VAT|MWST"
        terms(60) = "Import/Export|Importieren/Exportieren"
        terms(61) = "Import|Importierung"
        terms(62) = "Export|Exportierung"
        terms(63) = "import Products|Produkte importieren"
        terms(64) = "import Addresses|Adressen importieren"
        terms(65) = "export Products|Produkte exportieren"
        terms(66) = "price|Preis"
        terms(67) = "sales|Verkäufe"
        terms(68) = "post expenses|Postgebühren"
        terms(69) = "Settings|Einstellungen"
        terms(70) = "options|Optionen"
        terms(71) = "insert|einfügen"
        terms(72) = "from|von"
        terms(73) = "to|nach"
        terms(74) = "converted from|konvertiert von"
        terms(75) = "converted to|konvertiert nach"
        terms(76) = "|"
        terms(77) = "|"
        terms(78) = "|"
        terms(79) = "|"
        terms(80) = "|"
    


        Dim techTerm, foreignTerm
        Dim i : i = 0
        For i = 0 To Lastterm
            'Response.Write "found " & split(terms(i),"|")(0)
            techTerm = Split(terms(i), "|")(0)
            If UCase(technicalTermToSearch) = UCase(techTerm) Then 'Found
                translate = Split(terms(i), "|")(1)
                Exit Function
            End If
        Next
  
        'if nothing found   
        translate = technicalTermToSearch
  
    End Function


'With Caching functionality 
    Public Function getTranslation(ByVal german As String) As String
        Dim temp As String
        Dim CACHE_NAME As String : CACHE_NAME = "TRANSLATION_" & german
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, getTranslation_NoCache(german))
        End If
        getTranslation = temp
    End Function

    Public Function getTranslation_NoCache(ByVal german As String) As String
        Dim token As String = Left(german, 255).Replace("'", "")
        'On Error Resume Next
        Dim rs
        Dim currentLanguage As String = VARVALUE_DEFAULT("LANGUAGE", "DEU")
        getTranslation_NoCache = german
        
        
        Dim sql As String = "select * from ofDictionary where DEU Like '" & token & "'"
        rs = ObjConnectionExecute(sql)
   
        If Not rs.EOF Then
            Dim tmpCurLang : tmpCurLang = rs(currentLanguage).Value
            If Len(tmpCurLang) > 0 Then getTranslation_NoCache = tmpCurLang
            'decoding for bulgarian
            If currentLanguage = "BUL" Then
                If Len(tmpCurLang) > 0 Then
                    getTranslation_NoCache = tmpCurLang 'TODO Funktion NOT FOUND  stringToCyr(tmpCurLang)
                End If
            End If
        Else
            'If currentLanguage = "DEU" Then
            'DoCmd.SetWarnings False
            sql = "Insert into ofDictionary (DEU) values('" & token & "')"
            ObjConnectionExecute(sql)
            'DoCmd.SetWarnings True
        End If
        'End If
        rs.Close()
    End Function
</script>