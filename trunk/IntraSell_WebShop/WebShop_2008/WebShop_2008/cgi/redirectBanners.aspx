<!--#include file="defaultHead.inc.aspx"-->
<%
    Dim sql
    Dim rsBan
    Dim banId : banId = Request.QueryString("ID")
    Dim bannerLink

    If banId = "" Then
        Response.Redirect("default.asp")
    End If

    sql = "SELECT * FROM webBanners WHERE bannerId = " & banId
    rsBan = objConnectionExecute(sql)
    If rsBan.EOF And rsBan.BOF Then
        rsBan.close()
        rsBan = Nothing
        Response.Redirect("default.asp")
    Else
        'increment clicks
        sql = "UPDATE webBanners set ClicksCount = " & rsBan("ClicksCount") + 1 & " WHERE bannerId = " & banId
        objConnectionExecute(sql)
	
        Dim remoteAddress : remoteAddress = Request.ServerVariables("REMOTE_ADDR")
        Dim localURL : localURL = "'http://" & Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL")
        sql = "INSERT INTO webBannersLogs (BannerId, FromIP , ReferingURL, [Type]) " & _
           " Values( " & banId & ",'" & remoteAddress & "'," & localURL & "'," & "'Click')"
        'response.write sql1
        objConnectionExecute(sql)
	
	
        bannerLink = rsBan("BannerLink")
        rsBan.close()
        rsBan = Nothing
        Response.Redirect(bannerLink)
    End If
%>
<!--#include file="../intrasoft/connClose.aspx"-->
