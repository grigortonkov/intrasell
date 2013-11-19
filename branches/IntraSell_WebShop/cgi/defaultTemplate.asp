<!--#include file="defaulthead.inc"-->
<!--#include file="defaultMenu.inc"-->
<%call DisplayManu ("default.asp")%>
<%call showBasket()%>
<%call interactionCategoriesPath("default.asp", pageToShow)%>
<%call showCurrentUser()%>
<%call interactionCategories("default.asp")%>
<%call showWebPageLinks()                  %>
<!--BODY-->
<!--#include file="defaultbody.inc"-->
<!--BODY-->
<!--START BANNER SECTION-->      
<%=TABLEVALUE("webPages","Title","'Werbung'","HTML")%>  
<!--END BANNER SECTION-->
<!-- BANNER INTRASELL-->  
<p>This e-shop is powered by <a href="http://www.griton.eu"> 
<img src="<%=imageFullName("isell_verysmall.gif")%>"  width="100" height="40" border="0"></a>&nbsp;
[<a href="http://www.griton.eu">Download</a>]</p>
<img src="http://www4.brinkster.com/intrasoft/Downloads/download.asp?DownloadSoftware=IntraSell&Email=bannerviewer@noxel.com" width="1" height="1">
<!-- BANNER INTRASELL-->    
         
    


























