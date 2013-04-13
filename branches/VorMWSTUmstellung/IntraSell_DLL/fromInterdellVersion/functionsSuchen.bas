Attribute VB_Name = "functionsSuchen"
Option Compare Database
Option Explicit

Sub FilterSelection(ByVal baseTable As String, ByVal formName As String)

 Dim selKriterium As String
 selKriterium = InputBox("Geben Sie ein Selektionskriterium ein:", "Filtrieren nach Selektion1 od. Selektion2", _
                          "Maske: " & formName, 200, 200)
                          
 

  If selKriterium <> "" Then
 
     Forms(formName).Filter = baseTable & ".IDNR IN (SELECT DISTINCT IDNR " & _
                        " FROM [ofAdressen-Selection1] " & _
                        " WHERE Selection Like '*" & selKriterium & "*' )" & _
                        "OR " & baseTable & ".IDNR IN (SELECT DISTINCT IDNR " & _
                        " FROM [ofAdressen-Selection2] " & _
                        " WHERE Selection Like '*" & selKriterium & "*' )"
    Forms(formName).FilterOn = True
    'Me.Caption = Me.Filter
    
    Forms(formName).lstSearch.RowSource = "SELECT " & baseTable & ".IDNR, " & baseTable & ".Status, " & baseTable & ".Firma, " & baseTable & ".Name, " & baseTable & ".Adresse, grPLZ.PLZ, grPLZ.Ort FROM grPLZ " & _
         " INNER JOIN " & baseTable & " ON grPLZ.IdNr = " & baseTable & ".PLZ " & _
         " WHERE " & Forms(formName).Filter & _
         " ORDER BY " & baseTable & ".Name"
    Forms(formName).lstSearch.Requery
 End If
End Sub

'inTable = ofAdressen or lieferantenAdressen
Function Suchen(ByVal inTable As String) As String

Dim ctlCurrentControl As Control
Dim findWhat, listSQL, cName



Set ctlCurrentControl = Screen.PreviousControl

 cName = ctlCurrentControl.Name
 Dim erlaubteFelder: erlaubteFelder = "IdNR;Firma;Name;Vorname;Name1;Email;Branche;Rolle;Status;Land;Adresse;PLZ;Ort;UID;SkypeAdresse;MessengerAdresse;Web;MAInnen;MAAusen"

 If InStr(erlaubteFelder, cName) > 0 Then
    Else
      MsgBox "Gehen Sie vorher in Feld " & erlaubteFelder & "!"
      DoCmd.GoToControl "Firma"
      cName = "Firma"
    End If
    
                        
 findWhat = InputBox("Bestimmen Sie <<" & cName & ">> Feld: ", "Suche nach " & cName)
 
 If findWhat = "" Then
   Exit Function
  End If

 'Forms![ofKunden].Caption = ctlCurrentControl.Name
 
 If cName = "Land" Then cName = "grLand.Name"
 If cName = "Name" Then cName = inTable & ".Name"
 Dim wherePart
 
 wherePart = "([" & cName & "] LIKE '*" & findWhat & "*')"

 If cName = "MAInnen" Or cName = "MAAusen" Then
     wherePart = "([" & cName & "] in (select idnr from ofmitarbeiter where Name like ('*" & findWhat & "*') or Username like ('*" & findWhat & "*')))"
 End If
 
 
 listSQL = "SELECT DISTINCTROW " & inTable & ".IDNR, Firma, " & inTable & ".Name as Name, Vorname, Adresse, grPLZ.PLZ, grPLZ.Ort, grLand.Name as Land " & _
            " FROM (grPLZ RIGHT JOIN " & inTable & _
            " ON grPLZ.IdNr = " & inTable & ".PLZ ) LEFT JOIN grland ON " & inTable & ".Land = grland.IdNr" & _
            " WHERE " & inTable & ".Status is not null and " & _
            wherePart & _
            " ORDER BY Firma;"
            
   If cName = "IDNR" Then
    If Not IsNumeric(findWhat) Then
        MsgBox "Das ist keine Nummer!", vbCritical
        Exit Function
    End If
    
      listSQL = "SELECT DISTINCTROW " & inTable & ".IDNR, Firma, " & inTable & ".Name as Name, Vorname, Adresse, grPLZ.PLZ, grPLZ.Ort, grLand.Name as Land " & _
            " FROM (grPLZ RIGHT JOIN " & inTable & _
            " ON grPLZ.IdNr = " & inTable & ".PLZ ) LEFT JOIN grland ON " & inTable & ".Land = grland.IdNr" & _
            " WHERE (" & inTable & ".Status is not null or """ & inTable & """=""lieferantenAdressen"") and  " & inTable & ".IdNr = " & findWhat & _
            " ORDER BY Firma;"
   End If
  
' MsgBox listSQL
 DoCmd.OpenForm "ofAdressenSuchen", acNormal
 
 If inTable = "ofAdressen" Then
    Forms![ofAdressenSuchen]![txtSearchFormName] = "ofKunden"
 Else
    Forms![ofAdressenSuchen]![txtSearchFormName] = "lieferantenAdressen"
 End If
 'Dim checkIfSQLOK: checkIfSQLOK = firstRow(listSQL)
 
 Forms![ofAdressenSuchen]![listAdressen].RowSource = listSQL
 Forms![ofAdressenSuchen]![listAdressen].Requery
 
End Function



Function SuchenProdukte() As String

Dim ctlCurrentControl As Control
Dim findWhat, listSQL, cName

Set ctlCurrentControl = Screen.PreviousControl

 cName = ctlCurrentControl.Name

 If InStr("ArtNr;Bezeichnung;Beschreibung;Bezeichnung1;", cName) > 0 Then
    Else
     MsgBox " Klicken Sie vorher ins Feld ArtNr, Bezeichnung, Beschreibung oder Bezeichnung1!"
     DoCmd.GoToControl "Bezeichnung"
     cName = "Bezeichnung"
    End If

 findWhat = InputBox("Bestimmen Sie das <<" & cName & ">> Feld: ", "Suche nach " & cName)
 
 If findWhat = "" Then
   Exit Function
  End If

 
  listSQL = "SELECT DISTINCTROW ArtNr, EAN, Bezeichnung, Bezeichnung1, PreisATS as Preis " & _
            " FROM grArtikel " & _
            " WHERE " & cName & " LIKE '*" & findWhat & "*' " & _
            " or artnr in (select artnr from [grArtikel-KeyWordsToProducts] where [value] like '*" & findWhat & "*') " & _
            " ORDER BY ArtNr;"
            
   If cName = "ArtNr" Then 'number search
      listSQL = "SELECT DISTINCTROW ArtNr, EAN, Bezeichnung, Bezeichnung1, PreisATS as Preis " & _
            " FROM grArtikel " & _
            " WHERE " & cName & "=" & findWhat & _
            " ORDER BY ArtNr;"
   End If
  
' MsgBox listSQL
 DoCmd.OpenForm "ofAdressenSuchen", acNormal
 
 Forms![ofAdressenSuchen]![listAdressen].RowSource = listSQL
 Forms![ofAdressenSuchen]![listAdressen].Requery
 Forms![ofAdressenSuchen]![txtSearchFormName] = "artikelArtikel"
 Forms![ofAdressenSuchen]![txtSearchField] = "ArtNr"
 
End Function

'Suche nach Rechnung oder Auftrag
Sub SuchenVorgang(ByVal Vorgangtyp As String)
        
        Dim ctlCurrentControl As Control
        Dim findWhat, listSQL, cName
        
         findWhat = InputBox("Geben Sie für " & getDruckForType(Vorgangtyp) & " die Nummer  ein: ", "Suche nach " & getDruckForType(Vorgangtyp))
         
          If findWhat = "" Then
                    Exit Sub
          End If
          
          'check if data exists
          listSQL = "select * from " & getVorgangTableForType(Vorgangtyp) & " where nummer  = " & findWhat
          Dim rs
          Set rs = CurrentDb.openRecordset(listSQL)
          If rs.EOF Then
                MsgBox "Keine Datan vorhanden!", vbCritical
          Else
         Call openVorgangFunctionByNummer(Vorgangtyp, findWhat)
 End If
End Sub
