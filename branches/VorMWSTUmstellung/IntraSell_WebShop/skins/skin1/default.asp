<!--#include file="defaulthead.inc"-->
<html>
<HEAD>
<meta name="Keywords" content="InraSell, Tonkov, Vegsys, Noxel">
<meta http-equiv="Content-Language" content="de">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title><%=VARVALUE("DOMAIN")%> (WebShop) in <%=Session("LAND")%> - <%=pageToShow%></title>
<link REL="stylesheet" HREF="../style.css" TYPE="text/css">
</HEAD>
<BODY BGCOLOR="#FFFFFF" LEFTMARGIN=0 TOPMARGIN=0 MARGINHEIGHT=0 MARGINWIDTH=0>
 <table border="0" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#CECFCE" width="100%" id="AutoNumber9" height="1">
   <tr>
     <td width="18%" border="0" style="border-style: none; border-width: medium" height="66">
     <p align="center">
    <IMG id=IMG1 hspace=0 src="<%=imageFullName("company.gif")%>" width="141" height="56"></td>
     <td width="64%" style="border-style: none; border-width: medium" bgcolor="#42598C" height="66">
     <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#111111" width="100%" id="AutoNumber10">
       <tr>
         <td width="100%" border="0" style="border-style: none; border-width: medium">&nbsp;</td>
       </tr>
       <tr>
         <td width="100%" cellspacing="0" cellpadding="0" style="border-style: none; border-width: medium">
         <div align="center">
           <center>
           <table border="0" cellpadding="0" cellspacing="0" style="border-width:0; border-collapse: collapse" bordercolor="#111111" width="45%" id="AutoNumber11" height="16">
             <tr>
               <td width="33%" border="0" cellspacing="0" cellpadding="0" style="border-style: none; border-width: medium" align="center" height="14">
				<IMG src="<%=imageFullName("search.gif")%>" border=0></td>
               <td width="33%" border="0" cellspacing="0" cellpadding="0" style="border-style: none; border-width: medium" align="center" height="14">
               <form method="post" action="default.asp" id=form2 name=form2>
               <input type="text" size="30" name="qu">
			  </td>
               <td width="34%" cellspacing="0" cellpadding="0" style="border-style: none; border-width: medium" align="center" height="14">
		&nbsp;<input type="image" src="<%=imageFullName("go.gif")%>" valign="bottom" value="Search" name="Query" align="top" border="0"></td>
             </tr>
           </form>
           </table>
           </center>
         </div>
         </td>
       </tr>
       <tr>
         <td border="0" width="100%" cellspacing="0" cellpadding="0"></td>
       </tr>
     </table>
     </td>
     <td width="18%" border="0" cellspacing="0" cellpadding="0" style="border-style: none; border-width: medium" bgcolor="#C6CFDE" height="66">
     <div align="center">
       <center>
       <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#111111" width="80%" id="AutoNumber12">
       <tr>
      <td border="0" width="100%" style="border-style: none; border-width: medium" valign="top">&nbsp;<!--#include file="defaultMenu.inc"--></td>
         </tr>
       </table>
       </center>
     </div>
     </td>
   </tr>
   <tr>
     <td width="82%" colspan="2" valign="top" height="1" bgcolor="#10205A">     
     <%call DisplayManu ("default.asp")%>
     </td>
     <td width="18%" style="border-style: none; border-width: medium" height="1" bgcolor="#10205A">
     <font size="1">d</font></td>
   </tr>
   <tr>
     <td width="100%" style="border-style: none; border-width: medium" height="1" bgcolor="#C6CFDE" colspan="3">
     <img border="0" src="<%=imageFullName("default.gif")%>"></td>
   </tr>
   <tr> 
    <td width="18%" height="17" bgcolor="#42598C" align="left" style="border-style: none; border-width: medium">&nbsp;</td>
   <td border="0" width="63%" height="17" bgcolor="#42598C" align="left" style="border-style: none; border-width: medium">
    &nbsp;</td>
   <td width="18%" style="border-style: none; border-width: medium" height="17" bgcolor="#FF6900" align="center">
   <font size="1" face="Verdana" color="#10205A"><%call showBasket()%></font></td>
   </tr>
   <tr> 
    <td width="99%" height="1" bgcolor="#C6CFDE" align="left" style="border-style: none; border-width: medium" colspan="3">
     <img border="0" src="<%=imageFullName("default.gif")%>"></td>
   </tr>
   <tr> 
    <td width="99%" height="17" align="left" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium; border-bottom-style:solid; border-bottom-width:1" valign="top" bordercolor="#CECFCE" colspan="3">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#111111" width="100%" id="AutoNumber19">
          <tr>
            <td width="74%" style="border-style: none; border-width: medium">&nbsp;&nbsp; <font color="#42598C" size="1" face="Verdana"><%call interactionCategoriesPath("default.asp", pageToShow)%></font></td>
            <td width="29%" style="border-style: none; border-width: medium" align="right"><%call showCurrentUser()%>&nbsp;</td>
          </tr>
        </table>
        </td>
   </tr>

    <td width="18%" height="17" align="left" style="border=0" valign="top">
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#111111" width="100%" id="AutoNumber13">
      <tr>
        <td width="100%" style="border-style: none; border-width: medium" valign="top">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#111111" width="100%" id="AutoNumber14">
          <tr>
            <table border="0" width="100%" style="border-width: 0">
            <p align="center">
     <br>
     <IMG src="<%=imageFullName("produkte.gif")%>" border=0 align="center"><br>
&nbsp;</td>
          </tr>
          <tr>
            <td width="100%" style="border=medium none; " valign="top">
            <div align="right">
              <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#111111" width="80%" id="AutoNumber15" height="16">
                <tr>
                  <td border="0" width="100%"><font size="1" face="Verdana" color="#10205A"><%call interactionCategories("default.asp")%></font>&nbsp;</td>
                </tr>
              </table>
            </div>
            </td>
          </tr>
          <tr>
            <td width="100%" style="border-style: none; border-width: medium" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td width="100%" style="border-style: none; border-width: medium" valign="top">
            <p align="center">
     <IMG src="<%=imageFullName("toplinks.gif")%>" border=0><br>
&nbsp;</td>
          </tr>
          <tr>
            <td width="100%" style="border-style: none; border-width: medium" valign="top">
            <div align="center">
              <center>
              <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="60%" id="AutoNumber16">
                <tr>
                  <td width="100%">
           <font color="#42598c" size="1" face="Verdana"><u><A href="default.asp?pageToShow=TopClicks">
                  <font color="#42598C">Top 25 der Woche</font></A><br>
           <A href="default.asp?pageToShow=TopTen"><font color="#42598C">Preis-Hits</font></A></u></font></td>
                </tr>
              </table>
              </center>
            </div>
            </td>
          </tr>
          <tr>
            <td width="100%" style="border-style: none; border-width: medium" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td width="100%" style="border-style: none; border-width: medium" valign="top">
            <p align="center">
     <IMG  src="<%=imageFullName("resources.gif")%>" border=0><br>
&nbsp;</td>
          </tr>
          <tr>
            <td width="100%" style="border-style: none; border-width: medium" valign="top">
            <div align="center">
              <center>
              <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#111111" width="60%" id="AutoNumber17">
                <tr>
                  <td border="0" width="100%">
    <font color="#42598C" size="1" face="Verdana"><u><A href="default.asp?pageToShow=Lieferung">
    <font color="#42598C">Lieferung</font></A><br>
           <A href="default.asp?pageToShow=AGB"><font color="#42598C">Unsere AGBs</font></A><br>
           <A href="default.asp?pageToShow=Contact"><font color="#42598C">Kontakt</font></A><br>
           <A href="default.asp?pageToShow=Retournierungen">
    <font color="#42598C">Retournierungen</font></A><br>
           <A href="default.asp?pageToShow=Datenschutz"><font color="#42598C">Datenschutz</font></A></font><br>
                  <A href="default.asp?pageToShow=NewAccount">
    <font color="#42598C">Neukunde</font></A></u></font></td>
                </tr>
              </table>
              </center>
            </div>
            </td>
          </tr>
          <tr>
            <td border="0" width="100%" style="border-style: none; border-width: medium" valign="top">
            &nbsp;</td>
          </tr>
          <tr>
            <td border="0" width="100%" style="border-style: none; border-width: medium" valign="top">
            &nbsp;</td>
          </tr>
          <tr>
            <td border="0" width="100%" style="border-style: none; border-width: medium" valign="top">
            <p align="center"><!--#include file="calls/registerNewsletter.asp"--><br>
</td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    </td>
   <td width="63%" height="17" style="border-left-style:solid; border-left-width:1; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium; border-top-style:none; border-top-width:medium" valign="top" bordercolor="#CECFCE">
<table width="100%" height="100%"><tr><td valign="top">
<P>
	<!--BODY-->
	<!--#include file="defaultbody.inc"-->
	<!--BODY-->
	
	</td>
      </tr></table>
  </td>
   <td border="0" width="18%" ccellpadding="0" cellspacing="0" height="17" align="left" valign="top">
   <table width="100%" height="100%"><tr><td>
   
     <table border="0" cellspacing="0" style="border-width: 0; border-collapse:collapse" width="100%" id="AutoNumber18" bordercolor="#111111" cellpadding="0">
       <tr>
         <td border="0" width="100%">
         <p align="center">
         <br>
         <a href="default.asp?PreKatNr=2">
        <IMG src="<%=imageFullName("banner-100-01.gif")%>" border=0 hspace="0"></a></td>
       </tr>
       <tr>
         <td width="100%" border="0" style="border:0">&nbsp;</td>
       </tr>
       <tr>
         <td width="100%" border="0" cellpadding="0" cellspacing="0" style="border-style: none; border-width: medium" align="center" bordercolor="#FFFFFF" height="0">
         <a href="default.asp?PreKatNr=61"><IMG src="<%=imageFullName("banner-100-02.gif")%>" border=0></a></td>
       </tr>
       <tr>
         <td width="100%" border="0" cellpadding="0" cellspacing="0" style="border-style: none; border-width: medium" align="center" bordercolor="#FFFFFF" height="0">&nbsp;</td>
       </tr>
       <tr>
         <td width="100%" border="0" cellpadding="0" cellspacing="0" style="border-style: none; border-width: medium" align="center" bordercolor="#FFFFFF" height="0">
         <a href="default.asp?PreKatNr=146"><IMG src="<%=imageFullName("banner-100-03.gif")%>" border=0></a></td>
       </tr>
       <tr>
         <td width="100%" border="0" cellpadding="0" cellspacing="0" style="border-style: none; border-width: medium" align="center" bordercolor="#FFFFFF" height="0"></td>
       </tr>
       <tr>
         <td width="100%" border="0" cellpadding="0" cellspacing="0" style="border-style: none; border-width: medium" align="center" bordercolor="#FFFFFF" height="0">
         &nbsp;</td>
       </tr>
       <tr>
         <td width="100%" border="0" cellpadding="0" cellspacing="0" style="border-style: none; border-width: medium" align="center" bordercolor="#FFFFFF" height="0">
         <a href="default.asp?PreKatNr=18">
         <img border="0" src="<%=imageFullName("banner-100-04.gif")%>"></a></td>
       </tr>
       <tr>
         <td width="100%" border="0" cellpadding="0" cellspacing="0" style="border-style: none; border-width: medium" align="center" bordercolor="#FFFFFF" height="0">
         
<!-- BANNER INTRASELL-->  
<p>This e-shop is powered by <a href="http://www.vegsys.com"> <img src="<%=imageFullName("isell_verysmall.gif")%>" _src="../../isell_verysmall.gif" width="100" height="40" border="0"></a>&nbsp;
[<a href="http://www.vegsys.com">Download</a>]</p>
<img src="http://www.vegsys.com/Downloads/download.asp?DownloadSoftware=IntraSell&Email=bannerviewer@<%=VARVALUE("DOMAIN")%>" width="1" height="1">
<!-- BANNER INTRASELL-->    
         
         </td>
       </tr>
       <tr>
         <td width="100%" border="0" cellpadding="0" cellspacing="0" style="border-style: none; border-width: medium" align="center" bordercolor="#FFFFFF" height="0">
         &nbsp;</td>
       </tr>
       <tr>
         <td width="100%"  border="0" style="border-style: none; border-width: medium" align="center" bordercolor="#FFFFFF" height="0">
         &nbsp;</td>
       </tr>
       <tr>
         <td width="100%"  border="0" style="border-style: none; border-width: medium" align="center" bordercolor="#FFFFFF" height="0">
         &nbsp;</td>
       </tr>
       <tr>
         <td width="100%"  border="0" style="border-style: none; border-width: medium" align="center" bordercolor="#FFFFFF" height="0">
         &nbsp;</td>
       </tr>
       <tr>
         <td width="100%"  border="0" style="border-style: none; border-width: medium" align="center" bordercolor="#FFFFFF" height="0">
         &nbsp;</td>
       </tr>
       <tr>
         <td width="100%"  border="0" style="border-style: none; border-width: medium" align="center" bordercolor="#FFFFFF" height="0">&nbsp;</td>
       </tr>
       <tr>
         <td width="100%"  border="0" style="border-style: none; border-width: medium" align="center" bordercolor="#FFFFFF" height="0">&nbsp;</td>
       </tr>
       <tr>
         <td width="100%"  border="0" style="border-style: none; border-width: medium" align="center" bordercolor="#FFFFFF" height="0">&nbsp;</td>
       </tr>
       <tr>
         <td width="100%"  border="0" style="border-style: none; border-width: medium" align="center" bordercolor="#FFFFFF" height="0">&nbsp;</td>
       </tr>
       <tr>
         <td width="100%"  border="0" style="border-style: none; border-width: medium" bordercolor="#FFFFFF" height="0">
         &nbsp;</td>
       </tr>
     </table>
     </td>
      </tr></table>
     </td>
   <tr> 
    <td width="18%" border="0" height="17" align="left" style="border-left-style:none; border-left-width:medium; border-top-style:none; border-top-width:medium; border-bottom-style:none; border-bottom-width:medium"></td>
   <td border="0" width="63%" height="17" align="left" style="border-left-style:solid; border-left-width:1; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium; border-bottom-style:none; border-bottom-width:medium">
  </td>
   <td width="18%" border="0" style="border-style: none; border-width: medium" height="17" align="left">
     </td>
   </tr>
   <tr> 
    <td width="18%" border="0" height="17" align="left" style="border-left-style:none; border-left-width:medium; border-top-style:none; border-top-width:medium; border-bottom-style:solid; border-bottom-width:1"></td>
   <td border="0" width="63%" height="17" align="left" style="border-left-style:solid; border-left-width:1; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium; border-bottom-style:solid; border-bottom-width:1">
  <br>
  <br>
  <br>
&nbsp;</td>
   <td width="18" border="0" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium; border-bottom-style:solid; border-bottom-width:1" height="17" align="left">
     </td>
   </tr>
   <tr> 
    <td width="18%" border="0" height="17" align="left" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium"></td>
   <td border="0" width="63%" height="17" align="left" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium">
  </td>
   <td width="18%" border="0" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium" height="17" align="left">
     </td>
   </tr>
   <tr> 
    <td width="18%" border="0" height="17" align="left" style="border-style: none; border-width: medium"></td>
   <td border="0" width="81%" height="17" align="left" style="border-style: none; border-width: medium" colspan="2">
  <p align="right"><span class="smBlkText">
  <font face="Verdana" size="1" color="#CECFCE">Copyright 2000-2001 NOXEL.COM , 
  All rights reserved</font></span></td>
   </tr>
   </table>  
</body>





























