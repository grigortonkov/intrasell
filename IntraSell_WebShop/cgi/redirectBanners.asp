<!--#include file="defaultHead.inc"-->
<%
Dim sql
Dim rsBan
Dim banId : banId = Request.QueryString("ID")
Dim bannerLink

if  banID = "" then 
	Response.Redirect ("default.asp")
end if

sql = "SELECT * FROM webBanners WHERE bannerId = " & banId 
set rsBan = objConnectionExecute( sql )
if  rsBan.EOF and rsBan.BOF then 
	rsBan.close
	set rsBan = nothing
	Response.Redirect ("default.asp")
else
'increment clicks
	sql = "UPDATE webBanners set ClicksCount = " & rsBan("ClicksCount") + 1 & " WHERE bannerId = " & banId
	objConnectionExecute( sql )
	
		Dim remoteAddress: remoteAddress = Request.ServerVariables("REMOTE_ADDR") 
	    Dim localURL: localURL = "'http://" & Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL")
		sql = "INSERT INTO webBannersLogs (BannerId, FromIP , ReferingURL, [Type]) " & _
			  " Values( " & banId & ",'" & remoteAddress & "'," & localURL & "'," & "'Click')"
       'response.write sql1
		objConnectionExecute( sql)
	
	
	bannerLink = rsBan("BannerLink")
	rsBan.close
	set rsBan = nothing
	Response.Redirect ( bannerLink )
end if	
%>
<!--#include file="../intrasoft/connClose.asp"-->