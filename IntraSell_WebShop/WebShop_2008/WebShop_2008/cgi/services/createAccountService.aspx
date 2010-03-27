<!--#include file="../defaulthead.inc"-->
<%
    'Example: 
    'http://test.vegsys.com/cgi/services/createAccountService.aspx?Email1=grigor1@vegsys.com&Emailwiederholung1=grigor1@vegsys.com&Passwort1=123123&PasswortII1=123123&Titel1=Mag&Anrede1=Mr.&Name1=Tonkov&Vorname1=grigor&Strasse1=test&PLZ1=123123&Ort1=LA&Tel1=0123123123&Mobil1=01234123123&Fax1=0123123123&Land1=1&debug=true

    Dim sql
    Session("SID") = "" 'to generate new session on request 
    Session("LOG_IN") = ""
    'generate new SID 
    Call createNewSession()
    Call getSID() : Response.Write("SID=" & getSID())

    Dim showForm : showForm = Request("showForm") 'Show Form for Save Again 
    If LCase(Request("action")) = "update" Then
        'login first 
        If authenticate(Request("Email1"), Request("Passwort1")) = "" Then 'cannot authentificate
            Response.Write("Please provide valid creditentials!")
        Else
            'the user will be logged in and an update will happen !     
        End If
    End If


    Dim new_kdnr : new_kdnr = saveBothAddresses()
    'response.Write "new_kdnr=" & new_kdnr
    'response.Write "LOG_IN=" & session("LOG_IN")
    If new_kdnr = "" Or new_kdnr = "0" Then ' address saving failed /missing data 
        If showForm & "" <> "false" Then
            Response.Write("Account konnte nicht erstellt werden!")
        End If
    End If
%>
<!--#include file="../../intrasoft/connclose.aspx"-->
