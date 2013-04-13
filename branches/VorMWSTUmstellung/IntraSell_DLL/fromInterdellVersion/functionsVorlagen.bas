Attribute VB_Name = "functionsVorlagen"
Option Compare Database

Public Sub openVorlageKunde(ByVal IDNR As String)
    openVorlageKundeLieferant IDNR, False
End Sub



Sub openVorlageLieferant(ByVal IDNR As String)
   openVorlageKundeLieferant IDNR, True
End Sub



Private Sub openVorlageKundeLieferant(ByVal IDNR As String, istLieferant As Boolean)

    Dim Email As String
    'anfrage ist datentechnisch erstellt
    'jetzt XML erstellen
    Dim xml
        xml = "<DOCUMENT>"
        If istLieferant Then
            xml = xml + QueryToXML("select * from qry_AdressfelderLieferant where IDNR=" & IDNR, "Adresse")
            xml = xml + QueryToXML("select * from qry_AdressfelderLieferant_und_Weitere where IDNR=" & IDNR, "WeitereAdressen")
            Email = firstRow("select Email from qry_AdressfelderLieferant where IDNR=" & IDNR) & ""
            
        Else
            xml = xml + QueryToXML("select * from qry_Adressfelder where IDNR=" & IDNR, "Adresse")
            xml = xml + QueryToXML("select * from qry_Adressfelder_und_Weitere where IDNR=" & IDNR, "WeitereAdressen")
            Email = "" & firstRow("select Email from qry_Adressfelder where IDNR=" & IDNR)
        End If
        
        xml = xml & "</DOCUMENT>"
    
    Dim filename As String
    filename = dbFolder & "tmp\Adresse_" & IDNR & ".xml"
    
    Call saveXML(xml, filename)
    'show form for merge and print
    
    
    openForMerge filename, "ADRESSE", Email, IDNR

End Sub


