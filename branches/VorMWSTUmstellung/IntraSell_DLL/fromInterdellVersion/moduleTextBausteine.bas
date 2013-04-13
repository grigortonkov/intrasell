Attribute VB_Name = "moduleTextBausteine"
Option Compare Database

Public Sub TextBausteinDefinieren(ByRef callingForm As Form, ByVal Vorlage As String)
    
     DoCmd.OpenForm "ofTextBausteine", , , "Vorlage='" & Vorlage & "'"
      Set Forms("ofTextBausteine").callingForm = callingForm
     'fill with default TAGS
     If Forms("ofTextBausteine").TextBaustein & "" = "" Then
     
            Forms("ofTextBausteine").Vorlage = Vorlage
            Forms("ofTextBausteine").IDNR = 0
            Forms("ofTextBausteine").TextBaustein = "Die folgende Tags stehen zur Verfügung: " & _
            QueryToText("qry_Adressfelder", True, "")
     End If
     
End Sub






'Reads To Available Fields from a query
Public Function QueryToText(ByVal sql As String, ByVal getOnlyFieldNames As Boolean, ByVal replaceInText As String) As String
  Dim rs
  Dim line As String
  Dim FeldName As String
  Dim FeldWert As String
  
  Dim i As Integer
  Set rs = CurrentDb.openRecordset(sql)
         
    line = replaceInText
    
    While Not rs.EOF
        For i = 1 To rs.Fields.Count
            FeldName = Replace(rs.Fields(i - 1).Name, " ", "")
            FeldName = Replace(FeldName, "_", "")
            
    
                FeldWert = rs.Fields(i - 1).Value & ""
                
                If FeldWert = "" Then
                    FeldWert = "_"
                End If
                
               If getOnlyFieldNames Then
                   line = line + " [" & FeldName & "]" 'this are the avaialble fields in this query
               Else 'replace mode
                   line = Replace(line, "[" & FeldName & "]", FeldWert)
               End If
               
        Next
        
         If getOnlyFieldNames Then 'we need this function only for one row
            QueryToText = line
            Exit Function
         End If
                
        rs.MoveNext
    Wend
        rs.Close
        
    
    QueryToText = line
End Function


 

