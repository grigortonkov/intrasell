<!--#include file="defaulthead.inc.aspx"-->
<!--#include file="defaultMenu.inc.aspx"-->
<%  Call DisplayManu("default.aspx")%>
<%  Call showBasket()%>
<%  Call interactionCategoriesPath("default.aspx", pageToShow)%>
<%  Call showCurrentUser()%>
<%  Call interactionCategories("default.aspx")%>
<%  Call showWebPageLinks()%>
<!--BODY-->
<!--#include file="defaultbody.inc"-->
<!--BODY-->
<!--START BANNER SECTION-->
<%=TABLEVALUE("webPages","Title","'Werbung'","HTML")%>
<!--END BANNER SECTION-->
<!-- BANNER INTRASELL-->
    <p style="text-align: center">
    This e-shop is powered by <a href="http://www.griton.eu">
        <img src="<%=imageFullName("isell_verysmall.gif")%>" width="100" height="40" border="0"></a>&nbsp;
    [<a href="http://www.griton.eu">Download</a>]</p>
    <img src="http://www.griton.eu/intrasoft/Downloads/download.aspx?DownloadSoftware=IntraSell&Email=bannerviewer@noxel.com" width="1" height="1">
<!-- BANNER INTRASELL-->
