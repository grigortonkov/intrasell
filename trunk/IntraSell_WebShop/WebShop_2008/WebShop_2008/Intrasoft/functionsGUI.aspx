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
'**Start Encode**
'********************************************************************************
'Name:
'Description:1
'Important:
'Autor:
'Changes:
'Usage:
' Parameters: 
' State: free string representing state of window
'********************************************************************************
' 
function drawWindow(byVal Title, byVal Body, byVal State, byVal ActionButtons)
   call drawWindowPart1(Title, Body, State, ActionButtons)
   call drawWindowPart2(Title, Body, State, ActionButtons)
end function

    Function drawWindowPart1(ByVal Title, ByVal Body, ByVal State, ByVal ActionButtons) As String
        Dim html As String : html = ""
        html = html & "<table border=""1"" width=""750"" cellspacing=""0"" cellpadding=""3"">"""
        html = html & " <tr>"
        html = html & "  <td width=""172"" bordercolor=""#000080"" bgcolor=""#6699FF"">Title:" & Title & "</td>"
        html = html & "  <td width=""497"" bordercolor=""#000080"" bgcolor=""#99CCFF"">"
        html = html & drawButtonLine(ActionButtons)
        html = html & "  </td>"
        html = html & "  <td width=""24"" bordercolor=""#000080"">"
        html = html & "    <p align=""center"">?</p>"
        html = html & "  </td>"
        html = html & "  <td width=""23"" bordercolor=""#000080"">"
        html = html & "    <p align=""center"">X</p>"
        html = html & "  </td>"
        html = html & " </tr>"
        If Body <> "" Or True Then
            html = html & "<tr>"
            html = html & "<td width=""740"" bordercolor=""#000080"" colspan=""4"">" & Body
        End If
        drawWindowPart1 = html
    End Function

    Function drawWindowPart2(ByVal Title, ByVal Body, ByVal State, ByVal ActionButtons) As String
        Dim html As String : html = ""
        
        If Body <> "" Then
            html = html & "</td>"
            html = html & "</tr>"
        End If
        If State <> "" Or True Then
            html = html & "<tr>"
            html = html & "<td width=""740"" bordercolor=""#99CCFF"" colspan=""4"" bgcolor=""#99CCFF"">Status:" & State & "</td>"
            html = html & "</tr>"
        End If
        html = html & "</table>"
        drawWindowPart2 = html
        
    End Function
 
    '********************************************************************************
    'Name:
    'Description:
    'Important:
    'Autor:
    'Changes:
    'Usage:
    ' Parameters: 
    ' State: free string representing state of window
    '********************************************************************************
    Function drawButtonLine(ByVal ActionButtons) As String
        Dim html As String : html = ""
        
        html = html & "<table border=""0"" cellspacing=""1"" cellpadding=""0"">"
        html = html & "<tr>"
    
    
        Dim i
        For i = 1 To UBound(ActionButtons)
      
            html = html & "<td>"
     
            'respone.write button
            Call DrawButton("button_" & i, ActionButtons(i, 1), ActionButtons(i, 2), "white")
	 
            html = html & "</td>"
    
        Next
    
        html = html & "<td></td>"
        html = html & "</tr>"
        html = html & "</table>"
        drawButtonLine = html
    End Function
 
 
    '********************************************************************************
    'Name:
    'Description:
    'Important:
    'Autor:
    'Changes:
    'Usage:
    '********************************************************************************
    Sub drawArea(ByVal Title, ByVal Body, ByVal State, ByVal width)
        Response.Write(drawAreaHTML(Title, Body, State, width))
    End Sub

 
    '********************************************************************************
    'Name:
    'Description: Draws sime window that represens user area. returns "" if nothing to show!
    'Important:
    'Autor:
    'Changes:
    'Usage:
    '********************************************************************************
    Function drawAreaHTML(ByVal Title, ByVal Body, ByVal State, ByVal Width)
        'Response.Write "Body=[" & Body & "]"
        If Trim(Body) = "" Then
            drawAreaHTML = "" 'Title & " is empty."
            Exit Function
        End If
        drawAreaHTML = drawAreaHTMLOval(Title, Body, State, Width)
    End Function

    Function drawAreaHTMLStandard(ByVal Title, ByVal Body, ByVal State, ByVal Width)
        Const QuestionMarkWidth = 20
        Dim titlewidth : titlewidth = Width - QuestionMarkWidth
        Dim html
        html = " <table border=""1"" width=""" & Width & """ cellspacing=""0"">"
        html = html & "<tr>"
        html = html & "<td bgcolor=""#6699FF"" bordercolor=""#99CCFF"" width=""" & titlewidth & """>" & Title & "</td>"
        html = html & "<td bgcolor=""yellow"" bordercolor=""red"" width=""" & QuestionMarkWidth & """><center><a href=""faq.asp?faq=" & Title & """>?</a></center></td>"
        html = html & "</tr>"
        html = html & "<tr>"
        html = html & "<td colspan=""2"">" & Body & "</td>"
        html = html & "</tr>"
        html = html & "</table>"
        drawAreaHTMLStandard = html
    End Function


    ' draws window with oval corners
    Function drawAreaHTMLOval(ByVal Title, ByVal Body, ByVal State, ByVal Width)
        Dim imagesBase : imagesBase = Session("BASENAME") & "/intrasoft/windows/"
        Dim html
        html = html & "<table border=0 width=" & Width & " cellspacing=0 cellpadding=0>"
        html = html & "  <tr>"
        html = html & "    <td width=16 height=16><img border=0 src=""" & imagesBase & "upleft.gif"" width=16 height=16></td>"
        html = html & "    <td width=" & Width & " height=16 background=""" & imagesBase & "Up_Title_Backgrund.gif"">"
        html = html & "         <font color=#FFFF00 size=1><b>" & Title & "</b></font><img border=0 src=dot.gif width=2 height=2></td>"
        html = html & "    <td width=16 height=16 align=right><img border=0 src=""" & imagesBase & "upright.gif"" width=16 height=16></td>"
        html = html & "  </tr>"
        html = html & "  <tr>"
        html = html & "    <td width=16 background=""" & imagesBase & "leftborder.gif""><img border=0 src=""" & imagesBase & "dot.gif"" width=1 height=100></td>"
        html = html & "    <td width=" & Width & ">" & Body & "</td>"
        html = html & "    <td width=16 align=right background=""" & imagesBase & "rightborder.gif""><img border=0 src=""" & imagesBase & "dot.gif"" width=1 height=100></td>"
        html = html & "  </tr>"
        html = html & "  <tr>"
        html = html & "    <td width=16 valign=bottom><img border=0 src=""" & imagesBase & "downleft.gif"" width=16 height=16></td>"
        html = html & "    <td width=" & Width & " valign=bottom background=""" & imagesBase & "downborder.gif""><img border=0 src=""" & imagesBase & "dot.gif"" width=1 height=1></td>"
        html = html & "    <td width=16 valign=bottom align=right><img border=0 src=""" & imagesBase & "downright.gif"" width=16 height=16></td>"
        html = html & "  </tr>"
        html = html & "</table>"
        drawAreaHTMLOval = html
    End Function

 
    '********************************************************************************
    'Name:
    'Description:
    'Important:
    'Autor:
    'Changes:
    'Usage:
    '********************************************************************************
    Function drawMsgBox(ByVal Title, ByVal Body, ByVal UrlYes, ByVal UrlNo) As String
        
        Dim html As String : html = ""
        html = html & "<table border=""1"" width=""200"" cellspacing=""0"">"
        html = html & "<tr>"
        html = html & "<td width=""167"" bgcolor=""#6699FF"" bordercolor=""#99CCFF"">Title: " & Title & "</td>"
        html = html & "<td width=""23"" bgcolor=""#FFFFFF"" bordercolor=""#99CCFF"">"
        html = html & "<p align=""center"">?</td>"
        html = html & "</tr>"
        html = html & "<tr>"
        html = html & "<td width=""194"" colspan=""2""><p align=""center"">" & Body & "</p>"
        html = html & "</td>"
        html = html & "</tr>"
        html = html & "<tr>"
        html = html & "<td width=""194"" colspan=""2"">"
        html = html & "<p align=""center""><b>"
        If UrlYes <> """" Then
            html = html & "<a href=""" & UrlYes & """>" & getTranslation("YES") & "</a></b>"
        End If
        html = html & "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
        If UrlNo <> """" Then
            html = html & "<a href=""" & UrlNo & """><b>" & getTranslation("NO") & "</b></a>"
        End If
        html = html & "</td>"
        html = html & "</tr>"
        html = html & "</table>"
        drawMsgBox = html
        
    End Function

 
    '********************************************************************************
    'Name:
    'Description:
    'Important:
    'Autor:
    'Changes:
    'Usage:
    '********************************************************************************
    Function drawErrorBox(ByVal Title, ByVal Body, ByVal UrlYes, ByVal UrlNo) As String
        Dim html As String : html = ""

        html = html & "<table border=""1"" width=""200"" cellspacing=""0"">"
        html = html & "<tr>"
        html = html & "<td width=""167"" bgcolor=""#C0C0C0"" bordercolor=""#FF0000"">" & Title & "</td>"
    
        html = html & "<td width=""23"" bgcolor=""#FFFFFF"" bordercolor=""#FF0000"">"
        html = html & "<p align=""center""><b><font color=""#FF0000"">!</font></b></td>"
        html = html & "</tr>"
        html = html & "<tr>"
        html = html & "<td width=""194"" colspan=""2"" bordercolor=""#FF0000""><%=Body%>"
        html = html & "<p align=""center"">&nbsp;</p>"
        html = html & "</td>"
        html = html & "</tr>"
        html = html & "<tr>"
        html = html & "<td width=""194"" colspan=""2"">"
        html = html & "<p align=""center""><b>"
        If UrlYes <> """" Then
            html = html & "<a href=""" & UrlYes & """>" & getTranslation("YES") & "</a></b>"
       end if 
        html = html & "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
        If UrlNo <> """" Then
            html = html & "<a href=""" & UrlNo & """><b>" & getTranslation("NO") & "</b></a>"
        End If
        html = html & "</td>"
        html = html & "</tr>"
        html = html & "</table>"
        drawErrorBox = html
 end function 

 
    '********************************************************************************
    'Name:
    'Description:
    'Important: this functions need included button.js and buttonStyleshet.css 
    'Autor:
    'Changes:
    'Usage:
    '********************************************************************************
    Function DrawButton(ByVal ButtonId, ByVal Value, ByVal Link, ByVal Color) As String
        Dim html As String : html = ""

        html = html & "<TABLE cellSpacing=0 cellPadding=0 border=1 width=""99"">"
        html = html & "    <TBODY>"
        html = html & "     <TR>"
        html = html & "      <A href=""" & Link & """>"
        html = html & "       <TD id=""" & ButtonId & " "
        html = html & " Style = ""cursor: hand; color: #6386de; border: 1px solid #bdc7de"""
        html = html & " onmouseover = ""this.style.backgroundColor='#E7E7E7';"""
        html = html & " onmouseout = ""this.style.backgroundColor='#BDC7DE';"""
        html = html & "      align=middle width=99 bgcolor=""#BDC7DE""></a>"
        html = html & "       <A class='MenuStyle'  href=""" & Link & """>" & Value & "</A>"
        html = html & "     </TD>"
        html = html & "     </TR>"
        html = html & "     </TBODY>"
        html = html & "</TABLE>"
        DrawButton = html
 end function 
 
    '********************************************************************************
    'Name:
    'Description:
    'Important: 
    'Autor:
    'Changes:
    'Usage:
    '********************************************************************************
    Function readTextFile(ByVal filename)
        'Response.Write "Filename:" & filename: Response.Flush
        Dim content, fs, file
        fs = CreateObject("Scripting.FileSystemObject")
        On Error Resume Next
        file = fs.OpenTextFile(filename, 1, False, False)
        content = file.readAll
        file.Close()
        If Err.Number > 0 Then
            If LCase(Request("debug")) = "true" Then
                Response.Write("File is missing:[" & filename & "]<br>")
                Response.Write(Err.Description)
            End If
        End If
        On Error GoTo 0
        readTextFile = content
    End Function


    Function convertToHTML(ByVal genericDBHTML)
        Dim curVal
        curVal = Replace(genericDBHTML, "&lt;", "<")
        curVal = Replace(curVal, "&gt;", ">")
        curVal = Replace(curVal, "&nbsp;<br>", Chr(10))
        convertToHTML = curVal
    End Function



    Function drawWindowForum(ByVal von, ByVal datum, ByVal review, ByVal buttons)
        Dim html
        html = "<table width=""100%"">"
        html = html & "<tr><td width=""50%"" bgColor=""#f7f7f7"">"
        html = html & "<p align=""left""><font size=""1"">" & von & "</font></p></td>"
        html = html & "<td width=""50%"" bgColor=""#f7f7f7""><font size=""1"">" & datum & "</font></td></tr><tr>"
        html = html & "<td width=""100%"" bgColor=""#f7f7f7"" colSpan=""2""><font size=""1"">" & review & "</font><hr width=""100%"" color=""#980000"" size=""1""></td></tr>"
        html = html & "</table>"
        drawWindowForum = html
    End Function

    
    

    ''' <summary>
    ''' the image is shown as head for the table 
    ''' </summary>
    ''' <param name="Title"></param>
    ''' <param name="Body"></param>
    ''' <param name="State"></param>
    ''' <param name="Width"></param>
    ''' <param name="ImageUrl"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function drawAreaHTML_WithImage(ByVal Title, ByVal Body, ByVal State, ByVal Width, ByVal ImageUrl)
        Dim html
        html = html & "<table align=""center"" border=""0"" width=""190"" cellspacing=""0"" cellpadding=""0"">"
        html = html & "  <tr>"
        html = html & "    <td colspan=""3"" align=""center""><img border=""0"" src=""" & ImageUrl & """></td>"
        html = html & "  </tr>"
        html = html & "  <tr>"
        html = html & "    <td width=""5"">&nbsp;</td>"
        html = html & "    <td width=""190"">"
        html = html & "      <table border=""0"" width=""100%"" cellspacing=""0"" cellpadding=""0"">"
        html = html & "        <tr>"
        html = html & "          <td bgcolor=""#FFFFFF"" width=""100%"" style=""border-top: 0 solid #808080; border-left: 0 solid #808080; border-right: 1 solid #808080; border-bottom: 1 solid #808080"">&nbsp;"
        html = html & Body
        html = html & "          </td>"
        html = html & "        </tr>"
        html = html & "      </table>"
        html = html & "    </td>"
        html = html & "    <td width=""8"">&nbsp;</td>"
        html = html & "  </tr>"
        html = html & "</table>"
        drawAreaHTML_WithImage = html
    End Function
    

</script>



