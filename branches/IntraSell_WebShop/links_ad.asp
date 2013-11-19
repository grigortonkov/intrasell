<%
' ********************************************************************
' Paste this block of code on your web page where you would like text 
' links to be displayed. This code will dynamically add and remove text 
' links on your web page according to your BackLinks.com settings.
' ********************************************************************

Dim BLKey
Dim OpenInNewWindow
Dim PostingString
Dim ErrorString
Dim ResultString
Dim LinkUrl

' The following variable defines whether links are opened in a new window
' (1 = Yes, 0 = No)
OpenInNewWindow = 1

' *******************************************************************
' please do not modify any of the code below
' *******************************************************************

BLKey = "5QYO-A296-JO4X"

' # The following variable is sent to the BackLinks server in order to
' # generate working links on your page:
If Request.ServerVariables("HTTPS") = "on" Then LinkUrl="https://" Else LinkUrl="http://" End If

If Request.ServerVariables("REQUEST_URI") Then
   LinkUrl = LinkUrl & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("REQUEST_URI")
Else
   LinkUrl = LinkUrl & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("PATH_INFO")
   If Request.ServerVariables("QUERY_STRING") <> "" Then LinkUrl = LinkUrl & "?" & Request.ServerVariables("QUERY_STRING") End If
End If

LinkUrl = server.URLencode(LinkUrl)

' # Generate the data to post to the BackLinks.com server
PostingString = "&Key=" & BLKey
PostingString = PostingString & "&OpenInNewWindow=" & OpenInNewWindow & "&LinkUrl=" & LinkUrl



Function GetBackLinksData(HTTPQuery, ByRef Resp, ByRef Er)
    Dim HttpReqObj
    
    Set HttpReqObj = Nothing
        On Error Resume Next 
        Set HttpReqObj = CreateObject("WinHttp.WinHttpRequest.5.1")
        On Error Resume Next
        If HttpReqObj Is Nothing Then Set HttpReqObj = CreateObject("WinHttp.WinHttpRequest.5") End If

        On Error Resume Next
        If HttpReqObj Is Nothing Then
            On Error Resume Next
            Set HttpReqObj = CreateObject("Msxml2.ServerXMLHTTP")
            On Error Resume Next
            If HttpReqObj Is Nothing Then
                Set HttpReqObj = CreateObject("Msxml2.ServerXMLHTTP.4.0")
            End If
            On Error Resume Next
            If HttpReqObj Is Nothing Then
                Set HttpReqObj = CreateObject("Microsoft.XMLHTTP")
            End If

            On Error Resume Next
            If HttpReqObj Is Nothing Then
                Er = "HTTP requests not supported."
                GetBackLinksData = False
            Else
                HttpReqObj.open "GET", "http://www.backlinks.com/engine.php?" & HTTPQuery, false
                HttpReqObj.Send 
            
                If HttpReqObj.status <> 200 Then
                    Er = "Error: Status=" & HttpReqObj.status & " Text='" & HttpReqObj.responseText & "'"
                    GetBackLinksData = False
                Else
                    Resp =  HttpReqObj.responseText
                    GetBackLinksData = True
                End If
                Set HttpReqObj = Nothing        
            End If
        Else
            HttpReqObj.Open "GET", "http://www.backlinks.com/engine.php?" & HTTPQuery, False
            HttpReqObj.Send
            
            If HttpReqObj.Status <> 200 Then
                Er = "Error: Status=" & HttpReqObj.Status & " Text=" & HttpReqObj.ResponseText
                GetBackLinksData = False
            Else
            Resp =  HttpReqObj.responseText
            GetBackLinksData = True
        End If
    End If
End Function



If GetBackLinksData(PostingString, ResultString, ErrorString) Then
    Response.Write ResultString
Else    
    Response.Write ErrorString
End If

' FINSIHED BackLinks.COM SCRIPT BLOCK
%>