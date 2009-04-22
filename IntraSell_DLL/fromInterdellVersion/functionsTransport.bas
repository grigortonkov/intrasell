Attribute VB_Name = "functionsTransport"
Option Compare Database

'txtMODE = "TRANSPORT_LI" or "TRANSPORT"
Public Sub printTransportAuftrag(ByVal AuftragNr As String, ByVal txtMODE As String)

    Dim filename: filename = mergeTransportAuftrag(AuftragNr, txtMODE, AuftragNr)
    
    Dim Email As String
    Dim IDNR As String
    
    If txtMODE = "TRANSPORT_LI" Then
        Email = "" & firstRow("select adr.Email from buchAuftrag anf, qry_AdressfelderLieferant adr " & _
                    " where anf.lieferantNr = adr.IDNR and Nummer=" & AuftragNr)
        IDNR = "" & firstRow("sele ct adr.lieferantNr from buchAuftrag anf, qry_AdressfelderLieferant adr " & _
                    " where anf.lieferantNr = adr.IDNR and Nummer=" & AuftragNr)
    Else
        Email = "" & firstRow("select adr.Email from transportAuftrag anf, qry_AdressfelderLieferant adr " & _
                    " where anf.lieferantNr = adr.IDNR and AuftragNr=" & AuftragNr)
        IDNR = "" & firstRow("select  adr.IDNR  from transportAuftrag anf, qry_AdressfelderLieferant adr " & _
                    " where anf.lieferantNr = adr.IDNR and AuftragNr=" & AuftragNr)
    End If

    openForMerge filename, txtMODE, Email, IDNR
 
End Sub



'returns the filename of the created XML
Public Function mergeTransportAuftrag(ByVal AuftragNr As String, ByVal txtMODE As String, ByVal NummerFuerFilename As String) As String
'anfrage ist datentechnisch erstellt
'jetzt XML erstellen

Dim xml
    xml = "<DOCUMENT>"
    xml = xml & "<TransportAuftrag>"
    
    xml = xml + QueryToXML("select * from transportAuftrag anf where anf.AuftragNr=" & AuftragNr, "")
    
    'LIEFERANT
    xml = xml + QueryToXML("select adr.* from transportAuftrag anf, qry_AdressfelderLieferant adr " & _
                " where anf.lieferantNr = adr.IDNR and AuftragNr=" & AuftragNr, "Lieferant")
                
 
    'CONSIGNEE
    xml = xml + QueryToXML("select adr.* from transportAuftrag anf, qry_Adressfelder_und_Weitere adr " & _
                " where anf.ConsigneeNr & """" = adr.ID  & """" and AuftragNr=" & AuftragNr, "Consignee")
                
    'LADEPLATZ
     xml = xml + QueryToXML("select adr.* from transportAuftrag anf, qry_Adressfelder adr " & _
                " where anf.LadeplatzNr = adr.IDNR and AuftragNr=" & AuftragNr, "Ladeplatz")
    'WEITERE BELADEPLAETZE
     xml = xml + "<WeitereBeladeplaetze>"
     xml = xml + QueryToXML("select anf.BeladeTag, adr.* from transportauftrag_beladung anf, qry_Adressfelder adr " & _
                " where anf.BeladeplatzNr = adr.IDNR and anf.AuftragNr=" & AuftragNr, "Beladeplatz")
     xml = xml + "</WeitereBeladeplaetze>"
     
    'LADEZEITEN
     xml = xml + "<Ladezeiten>"
     xml = xml + QueryToXML("select adr.Von, adr.Bis, adr.Notiz from transportAuftrag anf, transportladezeiten adr " & _
                " where anf.LadeplatzNr = adr.IDNR and AuftragNr=" & AuftragNr, "Zeit")
     xml = xml + "</Ladezeiten>"
     
    'ENTLADEPLATZ
     xml = xml + QueryToXML("select adr.* from transportAuftrag anf, qry_Adressfelder adr " & _
                " where anf.EntladeplatzNr = adr.IDNR and AuftragNr=" & AuftragNr, "Entladeplatz")
                
    'WEITERE ENTLADEPLAETZE
     xml = xml + "<WeitereEntladeplaetze>"
     xml = xml + QueryToXML("select anf.EntladeTag, adr.* from transportauftrag_entladung anf, qry_Adressfelder adr " & _
                " where anf.EntladeplatzNr = adr.IDNR and anf.AuftragNr=" & AuftragNr, "Entladeplatz")
     xml = xml + "</WeitereEntladeplaetze>"
                
    'ENTLADEZEITEN
     xml = xml + "<Entladezeiten>"
     xml = xml + QueryToXML("select adr.Von, adr.Bis, adr.Notiz from transportAuftrag anf, transportladezeiten adr " & _
                " where anf.EntLadeplatzNr = adr.IDNR and AuftragNr=" & AuftragNr, "Zeit")
     xml = xml + "</Entladezeiten>"
    
    'EXPORT ZOLL
     xml = xml + QueryToXML("select adr.* from transportAuftrag anf, qry_Adressfelder adr " & _
                " where anf.Export_ZollAmtNr = adr.IDNR and AuftragNr=" & AuftragNr, "ExportZollAmt")
                              
                                                
    'IMPORT ZOLL
     xml = xml + QueryToXML("select adr.* from transportAuftrag anf, qry_Adressfelder adr " & _
                " where anf.Import_ZollAmtNr = adr.IDNR and AuftragNr=" & AuftragNr, "ImportZollAmt")
                                            
                                                                               
    'DOKUMENTE
    xml = xml & "<Dokumente>"
     xml = xml + QueryToXML("select Dokument, IIf([Notwendig],'X','') as NotwendigJA, IIf([Notwendig],'','X') as NotwendigNEIN  from transportAuftragDokumente where AuftragNr=" & AuftragNr, "Dokument")
    xml = xml & "</Dokumente>"
     
    'MITARBEITER
    xml = xml + QueryToXML("select adr.* from transportAuftrag anf, qry_AdressfelderMitarbeiter adr " & _
                " where anf.MitarbeiterNr = adr.IDNR and AuftragNr=" & AuftragNr, "Mitarbeiter")
                 
    'AUFTRAG DATEN EINFÜGEN
    'xml = xml & "<Auftrag>"
    xml = xml & VorgangXML(AuftragNr, "AU")
    'xml = xml & "</Auftrag>"
    
    xml = xml & "</TransportAuftrag>"
    
    xml = xml & "</DOCUMENT>"

    Dim filename As String
    
       'show form for merge and print
    If txtMODE = "TRANSPORT_LI" Then
        filename = dbFolder & "tmp\LieferantenInstruktion_" & NummerFuerFilename & ".xml"
    Else
        filename = dbFolder & "tmp\TransportAuftrag_" & NummerFuerFilename & ".xml"
    End If
    
    Call saveXML(xml, filename)
    mergeTransportAuftrag = filename
End Function



 'legt einen datensatz an!
 Public Function makeLeereAdresse() As Long
       Dim IDNR As Long: IDNR = nextId("ofAdressen", "IDNR")
       RunSQL ("insert into ofAdressen(IDNR) values (" & IDNR & ")")
       makeLeereAdresse = IDNR
 End Function
