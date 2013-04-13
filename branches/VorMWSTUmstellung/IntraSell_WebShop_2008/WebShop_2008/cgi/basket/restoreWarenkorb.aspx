<%
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================
%>
<!-- RESTORE WARENKORB -->
<%

    Dim oldWarenkorbSID
    oldWarenkorbSID = Request("oldWarenkorbSID")

    'CHECK IF EXISTS 

    If oldWarenkorbSID & "" = "" Then oldWarenkorbSID = "0" 'to reduce error 

    Dim sqlRestoreWK, rsRestoreWK

    sqlRestoreWK = "select SID, ArtNr, Quantity from webWarenkorb where Sid =" & oldWarenkorbSID
    rsRestoreWK = objConnectionExecute(sqlRestoreWK)

    If rsRestoreWK.eOF Then
        Response.Write(drawErrorBox("Error restoring Basket", "This Basket [" & oldWarenkorbSID & "] is unknown!", "", ""))
    Else 'ok 
        Dim iwk : iwk = 0
        While Not rsRestoreWK.eof And iwk < 10
            iwk = iwk + 1
            sqlRestoreWK = "INSERT INTO webWarenkorb (SID, ArtNr,Quantity) Values(" & _
                            getSID() & "," & rsRestoreWK("ArtNr").Value & "," & rsRestoreWK("quantity").Value & ")"
            'Response.Write sqlRestoreWK : response.flush                         
            objConnectionExecute(sqlRestoreWK)
            rsRestoreWK.moveNExt()
        End While
        rsRestoreWK.close()
               
              
   
    
        Response.Write(drawMsgBox("Basket restored", getTranslation("Warenkorb wurde vom Speicher geholt!") & "[" & oldWarenkorbSID & "]<br />" & _
             "<a href='default.aspx?pageToShow=warenkorbStep1'>" & getTranslation("zum Warenkorb") & "</a>", _
             "", ""))
               
    End If


%>