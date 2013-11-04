<!--#include file="../cgi/defaulthead.inc.aspx"-->
<!--#include file="Lucene.aspx"-->
<head>
    <script type="text/javascript" src="jquery-1.10.2.js"></script>
    <script language="javascript">
        function ShowResult() {
            var searchValue = document.getElementById("Search").value;
            //alert(searchValue);
            //document.getElementById('Result').innerHTML = 'url("Default.aspx?Search=" + search)';
            //$('#Result').load('Search.aspx?Search=' + searchValue);


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
    <div id="#Result">
        result
    </div>
    <%
if Request.querystring("Search") <> "" then 
    CreateIndex()
    Response.Write ("Sie suchen nach " & Request.querystring("Search") )
    SearchProduct(Request.querystring("Search"))
end if 
    %>
</body>
<!--#include file="../intrasoft/connClose.aspx"-->
