<html>
<head><title>ASPExec Dir Test (ping)</title>
</head>

<body>
<blockquote>
<H1>XCopy</H1>
Backup von date-for-you.com
<%
  Set Executor = Server.CreateObject("ASPExec.Execute")
  Executor.Application = "e:\inetpub\date-for-you.com\xcopy_ed.bat"
  Executor.Parameters = ""
  Executor.ShowWindow = True
  Response.Write "Attempting to execute " & Executor.Application & "<br />"
  strResult = Executor.ExecuteWinApp
  Response.Write "The result of this call was: " & strResult

%>
</blockquote>
</body>
</html>
