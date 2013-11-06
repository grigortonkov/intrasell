<!--#include file="../cgi/defaulthead.inc.aspx"-->
<!--#include file="Lucene.aspx"-->
<html>
<head>
    <script type="text/javascript" src="jquery-1.10.2.js"></script>
    <script language="javascript">
        function ShowResult() {
            var searchValue = document.getElementById("Search").value;
            $.get('Search.aspx?Search=' + searchValue)
             .success(function (data) {
                 document.getElementById('#Result').innerHTML = data;
             });

        }
    </script>
</head>
<body>
    <form action="Default.aspx">
    <input id="Search" name="Search" onkeyup="javascript:ShowResult();" />
    <input type="submit" />
    </form>
    <div id="#FloatingResult" 
        style="border-width: 1px; border-color: #00FF00; position: relative; overflow: auto; top: auto; left: auto; height: auto; width: auto;">
    xxx
    <div id="#Result">
        <!--result-->
    </div>
    </div>
    <%
if Request.querystring("Search") <> "" then 
    CreateIndex()
    Response.Write ("Sie suchen nach " & Request.querystring("Search") )
    SearchProduct(Request.querystring("Search"))
end if 
    %>
</body>
</html>
<!--#include file="../intrasoft/connClose.aspx"-->
