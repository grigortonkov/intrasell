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
    
  
    
    ''' <summary>
    ''' ' State: free string representing state of window
    ''' </summary>
    ''' <param name="Title"></param>
    ''' <param name="Body"></param>
    ''' <param name="State"></param>
    ''' <param name="ActionButtons"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function drawWindow(ByVal Title As String, ByVal Body As String, ByVal State As String, ByVal ActionButtons As String(,)) As String 
        Dim html As String
        html =  drawWindowPart1(Title, Body, State, ActionButtons)
        html = html + drawWindowPart2(Title, Body, State, ActionButtons)
        drawWindow = html 
    End Function

    ''' <summary>
    ''' drawWindowPart1
    ''' </summary>
    ''' <param name="Title"></param>
    ''' <param name="Body"></param>
    ''' <param name="State"></param>
    ''' <param name="ActionButtons"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function drawWindowPart1(ByVal Title As String, ByVal Body As String, ByVal State As String, ByVal ActionButtons As String(,)) As String
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

    ''' <summary>
    ''' drawWindowPart2
    ''' </summary>
    ''' <param name="Title"></param>
    ''' <param name="Body"></param>
    ''' <param name="State"></param>
    ''' <param name="ActionButtons"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function drawWindowPart2(ByVal Title As String, ByVal Body As String, ByVal State As String, ByVal ActionButtons As String(,)) As String
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
    Function drawButtonLine(ByVal ActionButtons As String(,)) As String
        Dim html As String = ""
        
        html = html & "<table border=""0"" cellspacing=""1"" cellpadding=""0"">"
        html = html & "<tr>"
   
        Dim i
        For i = 1 To UBound(ActionButtons)
      
            html = html & "<td>"
            'respone.write button
            html = html & DrawButton("button_" & i, ActionButtons(i, 1), ActionButtons(i, 2), "white")
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
    Sub drawArea(ByVal Title As String, ByVal Body As String, ByVal State As String, ByVal width As String) 
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
    Function drawAreaHTML(ByVal Title As String, ByVal Body As String, ByVal State As String, ByVal Width As String) As String
        'Response.Write "Body=[" & Body & "]"
        If Trim(Body) = "" Then
            drawAreaHTML = "" 'Title & " is empty."
            Exit Function
        End If
        drawAreaHTML = drawAreaHTMLOval(Title, Body, State, Width)
    End Function

    Function drawAreaHTMLStandard(ByVal Title As String, ByVal Body As String, ByVal State As String, ByVal Width As String) As String
        Const QuestionMarkWidth As Integer = 20
        Dim titlewidth : titlewidth = Width - QuestionMarkWidth
        Dim html
        html = " <table border=""1"" width=""" & Width & """ cellspacing=""0"">"
        html = html & "<tr>"
        html = html & "<td bgcolor=""#6699FF"" bordercolor=""#99CCFF"" width=""" & titlewidth & """>" & Title & "</td>"
        html = html & "<td bgcolor=""yellow"" bordercolor=""red"" width=""" & QuestionMarkWidth & """><center><a href=""faq.aspx?faq=" & Title & """>?</a></center></td>"
        html = html & "</tr>"
        html = html & "<tr>"
        html = html & "<td colspan=""2"">" & Body & "</td>"
        html = html & "</tr>"
        html = html & "</table>"
        drawAreaHTMLStandard = html
    End Function


    ' draws window with oval corners
    Function drawAreaHTMLOval(ByVal Title As String, ByVal Body As String, ByVal State As String, ByVal Width As String) As String
        Dim imagesBase As String = Session("BASENAME") & "/intrasoft/windows/"
        Dim html As String
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

    ''' <summary>
    ''' drawMsgBox
    ''' </summary>
    ''' <param name="Title"></param>
    ''' <param name="Body"></param>
    ''' <param name="UrlYes"></param>
    ''' <param name="UrlNo"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function drawMsgBox(ByVal Title As String, ByVal Body As String, ByVal UrlYes As String, ByVal UrlNo As String, _
                        Optional ByVal yes As String = "JA", Optional ByVal no As String = "NEIN") As String
        
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
        If UrlYes <> "" Then
            html = html & "<a href=""" & UrlYes & """>" & getTranslation(yes) & "</a></b>"
        End If
        html = html & "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
        If UrlNo <> "" Then
            html = html & "<a href=""" & UrlNo & """><b>" & getTranslation(no) & "</b></a>"
        End If
        html = html & "</td>"
        html = html & "</tr>"
        html = html & "</table>"
        drawMsgBox = html
        
    End Function

 
    ''' <summary>
    ''' drawErrorBox
    ''' </summary>
    ''' <param name="Title"></param>
    ''' <param name="Body"></param>
    ''' <param name="UrlYes"></param>
    ''' <param name="UrlNo"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function drawErrorBox(ByVal Title As String, ByVal Body As String, ByVal UrlYes As String, ByVal UrlNo As String) As String
        Dim html As String : html = ""

        html = html & "<table border=""1"" width=""200"" cellspacing=""0"">"
        html = html & "<tr>"
        html = html & "<td width=""167"" bgcolor=""#C0C0C0"" bordercolor=""#FF0000"">" & Title & "</td>"
    
        html = html & "<td width=""23"" bgcolor=""#FFFFFF"" bordercolor=""#FF0000"">"
        html = html & "<p align=""center""><b><font color=""#FF0000"">!</font></b></td>"
        html = html & "</tr>"
        html = html & "<tr>"
        html = html & "<td width=""194"" colspan=""2"" bordercolor=""#FF0000"">"
        html = html & "<p align=""center"">" & Body & "</p>"
        html = html & "</td>"
        html = html & "</tr>"
        html = html & "<tr>"
        html = html & "<td width=""194"" colspan=""2"">"
        html = html & "<p align=""center""><b>"
        If UrlYes <> "" Then
            html = html & "<a href=""" & UrlYes & """>" & getTranslation("JA") & "</a></b>"
        End If
        html = html & "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
        If UrlNo <> "" Then
            html = html & "<a href=""" & UrlNo & """><b>" & getTranslation("NEIN") & "</b></a>"
        End If
        html = html & "</td>"
        html = html & "</tr>"
        html = html & "</table>"
        drawErrorBox = html
    End Function

 
    ''' <summary>
    ''' Important: this functions need included button.js and buttonStyleshet.css 
    ''' </summary>
    ''' <param name="ButtonId"></param>
    ''' <param name="Value"></param>
    ''' <param name="Link"></param>
    ''' <param name="Color"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function DrawButton(ByVal ButtonId As String, ByVal Value As String, ByVal Link As String, ByVal Color As String) As String
        Dim html As String  = ""

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
    End Function
 
 


    ''' <summary>
    ''' convertToHTML
    ''' </summary>
    ''' <param name="genericDBHTML"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function convertToHTML(ByVal genericDBHTML As String) As String
        Dim curVal As String
        curVal = Replace(genericDBHTML, "&lt;", "<")
        curVal = Replace(curVal, "&gt;", ">")
        curVal = Replace(curVal, "&nbsp;<br />", Chr(10))
        convertToHTML = curVal
    End Function


    ''' <summary>
    ''' drawWindowForum
    ''' </summary>
    ''' <param name="von"></param>
    ''' <param name="datum"></param>
    ''' <param name="review"></param>
    ''' <param name="buttons"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function drawWindowForum(ByVal von As String, ByVal datum As String, ByVal review As String, ByVal buttons As String) As String
        Dim html  As String = "" 
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
    Function drawAreaHTML_WithImage(ByVal Title As String, ByVal Body As String, ByVal State As String, ByVal Width As String, ByVal ImageUrl As String) As String
        Dim html As String = ""
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
    

    '******************************************************************************
    ' DisplayManu 
    '******************************************************************************

    Sub DisplayMainMenu(ByVal inPageToShow As String)
        
        Response.Write("<script language=""JavaScript"" src=""" & BASENAME & "/intrasoft/menu.js""></" & "script>" & Chr(10) & Chr(13))
        Response.Write("<script language=""JavaScript"">" & Chr(10) & Chr(13))
        Response.Write("function showToolbar () { " & Chr(10) & Chr(13))
        Response.Write("menu = new Menu ();" & Chr(10) & Chr(13))
        Dim sql As String, rs, rsSu
        ' Loop for initialize menu items
        Dim PreKatNr : PreKatNr = 0
        sql = "SELECT * FROM webAdminMenu WHERE MenuNrParent=" & PreKatNr & " ORDER BY MenuNr"
        rs = ObjConnectionexecute(sql)
        While Not rs.EOF
            If rs("MenuNrParent").Value = 0 Then
                Dim url As String = rs("URL").Value
                url = url.Replace(".asp", ".aspx")
                Response.Write("menu.addItem (""menu" & rs("MenuNr").Value & """, """ & getTranslation(Server.HtmlEncode(rs("Name").Value)) & _
                 """, """ & getTranslation(rs("Name").Value) & """, """ & BASENAME & "/admin/" & Server.HtmlEncode(url) & """ , null );")
                Response.Write(Chr(10) & Chr(13))
                sql = "SELECT * FROM webAdminMenu WHERE MenuNrParent=" & rs("MenuNr").Value & " ORDER BY MenuNr"
                Dim rsSub As Object : rsSub = ObjConnectionexecute(sql)
                While Not rsSub.EOF
                    Dim urlSub As String = rsSub("URL").Value
                    urlSub = urlSub.Replace(".asp", ".aspx")
                    
                    Response.Write("menu.addSubItem (""menu" & rs("MenuNr").Value & """, """ & getTranslation(rsSub("Name").Value) & """, """ & _
                     getTranslation(rsSub("Name").Value) & """, """ & BASENAME & "/admin/" & Server.HtmlEncode(urlSub) & """);")
                    rsSub.MoveNext()
                    Response.Write(Chr(10) & Chr(13))
                End While
                rsSub.Close()
                rsSub = Nothing
            End If
            rs.MoveNext()
	  
        End While
        rs.Close()
        rs = Nothing
        'end loop of initialization
        
        Response.Write("menu.showMenu ();}" & Chr(10) & Chr(13))
        Response.Write("showToolbar();")
        Response.Write("</" & "script>" & Chr(10) & Chr(13))
	
    End Sub
    
    
    Function drawCheckBoxForBoolean(ByVal bool As Boolean) As String
        If bool Then
            drawCheckBoxForBoolean = "<input type=""checkbox"" name=""C1"" value=""ON"" checked>"
        Else
            drawCheckBoxForBoolean = "<input type=""checkbox"" name=""C2"" value=""ON"">"
        End If
    End Function


</script>

