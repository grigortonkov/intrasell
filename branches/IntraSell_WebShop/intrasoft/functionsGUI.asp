<%
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

function drawWindowPart1(byVal Title, byVal Body, byVal State, byVal ActionButtons)
%>
<table border="1" width="750" cellspacing="0" cellpadding="3">
  <tr>
    <td width="172" bordercolor="#000080" bgcolor="#6699FF">Title:<%=Title%></td>
    <td width="497" bordercolor="#000080" bgcolor="#99CCFF">
     <%=drawButtonLine(ActionButtons)%>
    </td>
    <td width="24" bordercolor="#000080">
      <p align="center">?</p>
    </td>
    <td width="23" bordercolor="#000080">
      <p align="center">X</p>
    </td>
  </tr>
  <%if Body <> "" or true then %>
  <tr>
    <td width="740" bordercolor="#000080" colspan="4"><%=Body%>
    <% end if 
end function 

function drawWindowPart2(byVal Title, byVal Body, byVal State, byVal ActionButtons)
    if Body <> "" then %>
    </td>
  </tr>
  <% end if %>
  <%if State <> "" or true then %>
  <tr>
    <td width="740" bordercolor="#99CCFF" colspan="4" bgcolor="#99CCFF">Status:<%=State%></td>
  </tr>
  <%end if%>
</table>
<%
end function 
%>

<%
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
function drawButtonLine(byVal ActionButtons)%>
    <table border="0" cellspacing="1" cellpadding="0">
    <tr>
    
    <%
    Dim i
    for i= 1 to UBound(ActionButtons)
    %>    
    <td>
    <%
     'respone.write button
      call drawButton("button_"&i, ActionButtons(i,1), ActionButtons(i,2), "white")
	%>
</td>
<%    
 next
    %>
    <td></td>
    </tr>
    </table>
<%
end function
%>

<%
'********************************************************************************
'Name:
'Description:
'Important:
'Autor:
'Changes:
'Usage:
'********************************************************************************
sub drawArea(Title,Body,State, width)
Response.Write drawAreaHTML(Title, Body, State, Width)
end sub%>

<%
'********************************************************************************
'Name:
'Description: Draws sime window that represens user area. returns "" if nothing to show!
'Important:
'Autor:
'Changes:
'Usage:
'********************************************************************************
function drawAreaHTML(Title,Body,State,Width)
'Response.Write "Body=[" & Body & "]"
if trim(Body) = "" then 
	drawAreaHTML = ""'Title & " is empty."
	exit function 
end if 
 drawAreaHTML  = drawAreaHTMLOval(Title,Body,State,Width)
end function 

function drawAreaHTMLStandard(Title,Body,State,Width)
Const QuestionMarkWidth = 20
dim titlewidth: titlewidth = Width - QuestionMarkWidth
dim html
	html = " <table border=""1"" width=""" & Width & """ cellspacing=""0"">"
	html = html & "<tr>"
	html = html & "<td bgcolor=""#6699FF"" bordercolor=""#99CCFF"" width=""" & titlewidth & """>" & Title  & "</td>"
	html = html & "<td bgcolor=""yellow"" bordercolor=""red"" width=""" & QuestionMarkWidth & """><center><a href=""faq.asp?faq=" & Title & """>?</a></center></td>"
	html = html & "</tr>"
	html = html & "<tr>"
	html = html & "<td colspan=""2"">" & Body & "</td>"
	html = html & "</tr>"
	html = html & "</table>"
drawAreaHTMLStandard = html
end function 


' draws window with oval corners
function drawAreaHTMLOval(Title, Body, State, Width)
Dim imagesBase : imagesBase = Session("BASENAME") & "/intrasoft/windows/"
dim html 
html = html & "<table border=0 width=" & Width & " cellspacing=0 cellpadding=0>"
html = html & "  <tr>"
html = html & "    <td width=16 height=16><img border=0 src=""" & imagesBase & "upleft.gif"" width=16 height=16></td>"
html = html & "    <td width=" & Width & " height=16 background=""" & imagesBase & "Up_Title_Backgrund.gif"">"
html = html & "         <font color=#FFFF00 size=1><b>" & TITLE & "</b></font><img border=0 src=dot.gif width=2 height=2></td>"
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
end function 

%>

<%
'********************************************************************************
'Name:
'Description:
'Important:
'Autor:
'Changes:
'Usage:
'********************************************************************************
function drawMsgBox(Title, Body, UrlYes, UrlNo)%>
<table border="1" width="200" cellspacing="0">
  <tr>
    <td width="167" bgcolor="#6699FF" bordercolor="#99CCFF">Title: <%=Title%></td>
    <td width="23" bgcolor="#FFFFFF" bordercolor="#99CCFF">
      <p align="center">?</td>
  </tr>
  <tr>
    <td width="194" colspan="2"><p align="center"><%=Body%></p>
    </td>
  </tr>
  <tr>
    <td width="194" colspan="2">
      <p align="center"><b>
      <%if UrlYes<> "" then %>
      <a href="<%=UrlYes%>"><%=getTranslation("YES")%></a></b>
      <%end if%>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <%if UrlNo<> "" then %>
      <a href="<%=UrlNo%>"><b><%=getTranslation("NO")%></b></a>
      <%end if%>
      </td>
  </tr>
</table>
<%end function%>

<%
'********************************************************************************
'Name:
'Description:
'Important:
'Autor:
'Changes:
'Usage:
'********************************************************************************
function drawErrorBox(Title, Body, UrlYes, UrlNo)%>
<table border="1" width="200" cellspacing="0">
  <tr>
    <td width="167" bgcolor="#C0C0C0" bordercolor="#FF0000"><%=Title%></td>
    <td width="23" bgcolor="#FFFFFF" bordercolor="#FF0000">
      <p align="center"><b><font color="#FF0000">!</font></b></td>
  </tr>
  <tr>
    <td width="194" colspan="2" bordercolor="#FF0000"><%=Body%>
      <p align="center">&nbsp;</p>
    </td>
  </tr>
  <tr>
    <td width="194" colspan="2">
      <p align="center"><b>
      <%if UrlYes<> "" then %>
      <a href="<%=UrlYes%>"><%=getTranslation("YES")%></a></b>
      <%end if%>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <%if UrlNo<> "" then %>
      <a href="<%=UrlNo%>"><b><%=getTranslation("NO")%></b></a>
      <%end if%>
      </td>
  </tr>
</table>
<%end function%>

<%
'********************************************************************************
'Name:
'Description:
'Important: this functions need included button.js and buttonStyleshet.css 
'Autor:
'Changes:
'Usage:
'********************************************************************************
function DrawButton(ButtonId, Value, Link, Color)%>
							<TABLE cellSpacing=0 cellPadding=0 border=1 width="99">
                          <TBODY>
                          <TR>
                            <A href="<%=Link%>">
                            <TD id=<%=ButtonId%> 
                            style="cursor: hand; color: #6386de; border: 1px solid #bdc7de" 
                            onmouseover="this.style.backgroundColor='#E7E7E7';"                             
                            onmouseout="this.style.backgroundColor='#BDC7DE';" 
                            align=middle width=99 bgcolor="#BDC7DE"></a>
                            <A class=MenuStyle  href="<%=Link%>"><%=Value%></A>
                            </TD>
                            </TR>
                            </TBODY>
                            </TABLE>
<%end function%>
<%
'********************************************************************************
'Name:
'Description:
'Important: 
'Autor:
'Changes:
'Usage:
'********************************************************************************
function readTextFile(filename)
	'Response.Write "Filename:" & filename: Response.Flush
	Dim content, fs, file
	Set fs = CreateObject("Scripting.FileSystemObject")   
	on error resume next 
	Set file = fs.OpenTextFile (filename, 1 , FALSE, FALSE)
	content = file.readAll
	file.Close
	if err.number > 0 then
           if lcase(request("debug"))="true" then 
	   	Response.Write "File is missing:[" &  filename& "]<br>"
	   	Response.Write  err.Description 
           end if
	end if
	on error goto 0
	readTextFile = content  
end function 


function convertToHTML(genericDBHTML)
    Dim curVal 
			curVal = replace(genericDBHTML,"&lt;","<")
					curVal = replace(curVal,"&gt;" ,">")
					curVal = replace(curVal,"&nbsp;<br>", chr(10))
    convertToHTML =  curVal 
end function 



function drawWindowForum(von,datum,review,buttons)
	dim html
	html ="<table width=""100%"">"
	html = html & "<tr><td width=""50%"" bgColor=""#f7f7f7"">"
	html = html & "<p align=""left""><font size=""1"">" & von & "</font></p></td>"
	html = html & "<td width=""50%"" bgColor=""#f7f7f7""><font size=""1"">" & datum & "</font></td></tr><tr>"
	html = html & "<td width=""100%"" bgColor=""#f7f7f7"" colSpan=""2""><font size=""1"">" & review & "</font><hr width=""100%"" color=""#980000"" size=""1""></td></tr>"
	html = html & "</table>"
	 drawWindowForum = html
end function 

%>



