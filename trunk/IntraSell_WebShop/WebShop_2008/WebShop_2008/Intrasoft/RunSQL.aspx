<!--#include file="menu.aspx"-->
<%
    Dim SQLString as String = Request.QueryString("SQLString")
    If Len(SQLString) < 1 Then
        SQLString = Request.Form("SQLString")
    End If

    zurueckSeite = Request.QueryString("zurueckSeite")
    Response.Write("sqlstring = " + SQLString)


    rs = objConnection.Execute(SQLString)
%>
<p align="center">
    <font face="Arial"><a href="<%=zurueckSeite%>">zurück</a> </TBODY>
        <tfoot>
        </tfoot>
    </font>
</p>
</body> </html> 