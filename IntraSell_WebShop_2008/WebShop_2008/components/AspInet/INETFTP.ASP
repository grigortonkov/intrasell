<html>
<head><title>InetASP Test</title><head>
<body bgcolor=white text=black>
<H2>InetASP Test</H2>
<pre>
<font color=red size=+2>
</pre>
</font>
<%

  rem *************************************************************************
  rem *
  rem * This is certainly not the way I would implement an "industrial strength"
  rem *    FTP system. I would probably create a job queue that offloads the
  rem *    processing onto another system besides IIS with IIS simply serving as
  rem *    the gateway to the interface but that is "for another day".
  rem *
  rem * Session timeout's become an issue for files that take longer to transfer than
  rem *   the session timeout will allow. I suspect that the file transfer will continue
  rem *   even after the session times out but I have not tested this.
  rem *
  rem * ASPInet.FTP has two methods:
  rem *   FTPGetFile(strHostName, strUserName, strPassword,
  rem *              strRemoteFileName, strLocalFileName, bolOverwrite)
  rem *   FTPPutFile(strHostName, strUserName, strPassword,
  rem *              strRemoteFileName, strLocalFileName)
  rem *
  rem * The return value is a boolean indicating success or failure.
  rem *
  rem *************************************************************************

  FTP_TRANSFER_TYPE_ASCII = 1
  FTP_TRANSFER_TYPE_BINARY = 2


  Set FtpConn = Server.CreateObject("AspInet.FTP")


  rem *************************************************************************
  rem *
  rem *  GET File Test
  rem *
  rem *************************************************************************
  if FtpConn.FTPGetFile("ftp.microsoft.com", "anonymous", "user@hostname.net", _
      "/disclaimer.txt", "d:\inetpub\wwwroot\disclaim.new", true, FTP_TRANSFER_TYPE_BINARY) then
     Response.Write "<p>FTP download Success...<br>"
  else
    Response.Write "<p>FTP download Failed...<br>"
    Response.Write "Last Error was: " & FtpConn.LastError
  end if


  rem *************************************************************************
  rem *
  rem *  PUT File Test
  rem *
  rem *************************************************************************
  rem if FtpConn.FTPPutFile("localhost", "anonymous", "user@hostname.net", "command.com", "c:\command.com", FTP_TRANSFER_TYPE_BINARY) then
  rem   Response.Write "<p>FTP upload Success...<br>"
  rem else
  rem   Response.Write "<p>FTP upload Failed...<br>"
  rem end if
%>

</body>
</html>
