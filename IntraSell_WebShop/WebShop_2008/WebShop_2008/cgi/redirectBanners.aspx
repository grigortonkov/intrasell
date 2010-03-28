<!--#include file="defaultHead.inc.aspx"-->
<%
    Dim sql as string
    Dim rsBan
    Dim banId : banId = Request.QueryString("ID")
    Dim bannerLink as String

    If banId = "" Then
        Response.Redirect("default.aspx")
    End If

    sql = "SELECT * FROM webBanners WHERE bannerId = " & banId
    rsBan = objConnectionExecute(sql)
    If rsBan.EOF And rsBan.BOF Then
        rsBan.close()
        rsBan = Nothing
        Response.Redirect("default.aspx")
    Else
        'increment clicks
        sql = "UPDATE webBanners set ClicksCount = " & rsBan("ClicksCount").Value + 1 & " WHERE bannerId = " & banId
        objConnectionExecute(sql)
    
        Dim remoteAddress : remoteAddress = Request.ServerVariables("REMOTE_ADDR")
        Dim localURL : localURL = "'http://" & Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL")
        sql = "INSERT INTO webBannersLogs (BannerId, FromIP , ReferingURL, [Type]) " & _
           " Values( " & banId & ",'" & remoteAddress & "'," & localURL & "'," & "'Click')"
        'response.write sql1
        objConnectionExecute(sql)
    
    
        bannerLink = rsBan("BannerLink").Value
        rsBan.close()
        rsBan = Nothing
        Response.Redirect(bannerLink)
    End If
%>
<!--#include file="../intrasoft/connClose.aspx"-->
