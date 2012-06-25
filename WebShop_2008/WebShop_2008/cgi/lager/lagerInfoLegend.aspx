<!--#include file="../defaultHead.inc.aspx"-->
<h1>Lagerstatus Legende</h1>
<a href="../../default.aspx?ArtNr=<%=request("ArtNr")%>">Back to Product Page</a>
<hr />
<%
    'Description:  
    Dim ArtNr : ArtNr = Request("ArtNr")
    Dim sql as String = "select bezeichnung1 as Info from grArtikel where bezeichnung1 is not null group by bezeichnung1 having count(*) > 3"
    Dim rs = ObjConnectionExecute(sql) 
    Dim html as String 

    html = "<Table>"  
    html += "<tr><td>Icon</td><td>Status</td></tr>"
    
    while not rs.EOF 
      html +=  "<tr> <td><img src='../../../images/icons/" & rs("Info").Value & ".gif' /></td> <td>" & getTranslation(rs("Info").Value) & "</td> </tr>" 
      rs.MoveNext 
    end while
    html += "</Table>" 

    rs.close 

    Response.write ( parseTemplate(html, Session("CURRENT_PRODUCT_CATEGORY")) )
%>
