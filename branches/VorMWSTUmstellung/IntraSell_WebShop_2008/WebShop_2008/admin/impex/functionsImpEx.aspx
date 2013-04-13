<script language="VB" runat="server">
    'on error resume next
    '**********************************************************************
    ' UpdatePreises
    ' updates the selling prices with the Aufschlag from the article category
    '**********************************************************************
function UpdatePreises(artNR as string) 
    Dim sql As String
    Dim catNr As String = TABLEVALUE("grArtikel", "ArtNR", artNR, "ArtKatNR")
    Dim aufschlag as Decimal = TABLEVALUE("[grArtikel-Kategorien]", "ArtKatNr", catNR, "Aufschlag")
    sql = " UPDATE [grArtikel] SET " & _
        " grArtikel.PreisATS = [EKPreis]*" & replace(Aufschlag, ",", ".") & _
       ", grArtikel.PreisEuro = [EKPreis]*" & replace(Aufschlag, ",", ".") & _
          " WHERE ArtNR = " & artNR
  	
    'Response.Write "<br />sql=" & sql
    ObjConnectionExecute(sql)
End Function


'**********************************************************************
' imports data ot the grArtikel table
' uses for format the CSV file from Farbod 
'**********************************************************************
Function importPreiseLine(ByVal preisLine As String)
    'On Error Resume Next 
    importPreiseLine = "ERROR"
    preisLine = Replace(preisLine, """", "")
    'response.write "<br />PreisLine:" & PreisLine
    'Response.Flush
    'exit function 
    Dim fields, nr, name, description, manufacturer, taxclass, price, weight, minorder
    Dim manufacturernr, variation, mult, avail, units, difftxt, picture, category, ProduktAktiv
    fields = Split(preisLine, ";")
    nr = fields(0)
    category = fields(1)
    name = Left(fields(2), 100)
    description = Replace(fields(3), """", "")  'remove "
    description = Replace(description, "|", ";")   'replace | with ;
    manufacturer = fields(4) : If manufacturer = "" Then manufacturer = "n/a"
    taxclass = fields(5) : taxclass = Replace(taxclass, ",", ".")
    price = Replace(fields(6), ",", ".")
    weight = Replace(fields(7), ",", ".") : If weight = "" Then weight = "0"
    minorder = fields(8)
    manufacturernr = fields(9) : If manufacturernr = "" Then manufacturernr = 0
    variation = fields(10)
    mult = fields(11)
    avail = fields(12)
    units = fields(13)
    difftxt = fields(14)
    picture = fields(15) : If picture = "" Then picture = "no-image"
    ProduktAktiv = fields(16)  '0 or 1 

    If Not IsNumeric(manufacturer) Then manufacturer = getIntraSellManufacturerNr(manufacturer) ' get by name 

    Dim sql  As String = "select * from grArtikel where artNr=" & nr
    Dim rs : rs = ObjConnectionExecute(sql)
    Dim IsNEW : IsNEW = rs.EOF
    rs.close()
 
    If IsNEW Then  ' NEW Article
        sql = "INSERT INTO grArtikel (ArtNr, Bezeichnung, Bezeichnung1, Beschreibung, Gewicht, Einheit,  " & _
             " ArtKatNr, LieferantNr, EAN,  PreisATS, PreisEuro, EKPreis, MWST, Picture,ProduktAktiv) " & _
          " Values (" & nr & ",'" & name & "','" & avail & "','" & description & "'," & weight & ", '" & units & "'," & _
            category & ", " & manufacturer & ",'" & manufacturernr & "'," & price & "," & price & "," & price & "," & _
            taxclass & ", '" & picture & "'," & ProduktAktiv & ")"
        importPreiseLine = "INSERT"
         
    Else 'UPDATE
        sql = "UPDATE grArtikel Set " & _
            " Bezeichnung ='" & name & "'" & _
            ", Bezeichnung1 ='" & avail & "'" & _
            ", Beschreibung ='" & description & "'" & _
            ", Gewicht =" & weight & _
            ", Einheit ='" & units & "'" & _
            ", ArtKatNr =" & category & _
            ", LieferantNr =" & manufacturer & _
       ", EAN ='" & manufacturernr & _
          "', preisATS =" & price & _
            ", preisEuro =" & price & _
            ", ekPreis =" & price & _
            ", MWST=" & taxclass & _
            ", Picture ='" & picture & "'" & _
            ",ProduktAktiv=" & ProduktAktiv & " " & _
            " WHERE ArtNR = " & nr
        importPreiseLine = "UPDATE"
      		  
    End If

    On Error Resume Next
    'response.write "<br /><font color=red>Error occured</font> on sql=" & sql:Response.Flush
    'Response.end
    ObjConnectionExecute(sql)
    If Err.Number > 0 Then
        Response.Write("<br /><font color=red>Error occured</font> on sql=" & sql) : Response.Flush()
        Err.Clear()
    End If
    ' on error goto 0 
    Call UpdatePreises(nr)
 
    Response.Flush()
    If Err.Number > 0 Then
        importPreiseLine = "ERROR"
        Response.Write("<br />Error: " & Err.Description)
    End If
 
End Function


'**************************************************************************
'returns the manufacturer from IntraSell and creates new if not existing 
'**************************************************************************
Function getIntraSellManufacturerNr(ByVal foreignManufacturerName As String) As String
    If foreignManufacturerName = "" Then
        Response.Write("To select or create new company we need at least the name!")
        Exit Function
    End If
 
    Dim sql, rs
    sql = "SELECT IdNR from [lieferantenAdressen] WHERE [Firma] like '" & foreignManufacturerName & "'"
    rs = ObjConnectionExecute(sql)
    If rs.eof Then
        'getIntraSellArtKAtNRForItallCategory = -1
        sql = "INSERT INTO LieferantenAdressen (IDNR,[Name],Firma, PLZ) Values (" & _
               NextId("lieferantenAdressen", "IdNR") & ",'" & foreignManufacturerName & "','" & foreignManufacturerName & "',1)"
        'Response.Write sql
        ObjConnectionExecute(sql)
        getIntraSellManufacturerNr = getIntraSellManufacturerNr(foreignManufacturerName) 'try again 
    Else
        getIntraSellManufacturerNr = rs("IdNr")
    End If
End Function

</script>