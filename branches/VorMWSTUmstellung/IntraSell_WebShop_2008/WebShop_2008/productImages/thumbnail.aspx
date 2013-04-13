<!--#include file="../cgi/defaulthead.inc.aspx"-->
<%

    'Put user code to initialize the page here
        ' Initialize objects 
        Dim objImage, objThumbnail As System.Drawing.Image
        Dim strServerPath, strFilename As String
        Dim shtWidth, shtHeight As Short
        ' Get image folder path on server - use "\" string if root
        strServerPath = Server.MapPath("\")
        ' Retrieve name of file to resize from query string
        strFilename = strServerPath & Request("filename")
        ' Retrieve file, or error.gif if not available

        'Start handly for URL FILES 
        If LCase(Left(Request("filename"), 4)) = "http" Then ' it is URL 
            strFilename = downloadURLFile(Request("filename"))
        End If
        'end handling for URL Files 


        Try
            objImage = objImage.FromFile(strFilename)
        Catch
            objImage = objImage.FromFile(strServerPath & "productImages/error.gif")
        End Try
        ' Retrieve width from query string
        If Request("width") = Nothing Then
            shtWidth = objImage.Width
        ElseIf Request("width") < 1 Then
            shtWidth = 100
        Else
            shtWidth = Request("width")
        End If

        'check if MaxWidth defined 
        If IsNumeric(Request("maxwidth")) Then
            Dim MaxWidth As Integer = Request("maxwidth")
            If MaxWidth < shtWidth Then
                shtWidth = MaxWidth
            End If
        End If

        ' Work out a proportionate height from width
        shtHeight = objImage.Height / (objImage.Width / shtWidth)
        ' Create thumbnail
        objThumbnail = objImage.GetThumbnailImage(shtWidth, _
          shtHeight, Nothing, System.IntPtr.Zero)
        ' Send down to client
        Response.ContentType = "image/jpeg"
    objThumbnail.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg)
        ' Tidy up
        objImage.Dispose()
        objThumbnail.Dispose()

 %>