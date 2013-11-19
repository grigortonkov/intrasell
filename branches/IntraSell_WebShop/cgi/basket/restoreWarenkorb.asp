<%
'===========================================================================
' Autor: Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 
'===========================================================================
%>
 
<!-- RESTORE WARENKORB -->
<%

Dim oldWarenkorbSID
oldWarenkorbSID = request ("oldWarenkorbSID")

'CHECK IF EXISTS 

if oldWarenkorbSID & "" ="" then oldWarenkorbSID = "0" 'to reduce error 

dim sqlRestoreWK, rsRestoreWK

sqlRestoreWK = "select SID, ArtNr, Quantity from webWarenkorb where Sid =" & oldWarenkorbSID
set rsRestoreWK = objConnectionExecute(sqlRestoreWK) 

if rsRestoreWK.eOF then 
  call drawErrorBox("Error restoring Basket","This Basket [" & oldWarenkorbSID & "] is unknown!","","")
else 'ok 
 Dim iwk: iwk = 0  
  while not rsRestoreWK.eof  and iwk < 10
    iwk = iwk + 1 
	sqlRestoreWK = "INSERT INTO webWarenkorb (SID, ArtNr,Quantity) Values(" & _ 
	                getSID() & "," & rsRestoreWK("ArtNr") & "," & rsRestoreWK("quantity") & ")"
    'Response.Write sqlRestoreWK : response.flush	 	                
     objConnectionExecute(sqlRestoreWK)   
    rsRestoreWK.moveNExt  
  wend              
    rsRestoreWK.close       
               
              
   
    
    call drawMsgBox("Basket restored", getTranslation("Warenkorb wurde vom Speicher geholt!")  & "[" & oldWarenkorbSID & "]<br>" & _ 
         "<a href='default.asp?pageToShow=warenkorbStep1'>" & getTranslation("zum Warenkorb") &  "</a>", _
         "","")
               
end if 


%>