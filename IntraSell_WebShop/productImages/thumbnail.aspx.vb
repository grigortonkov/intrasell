Public Class thumbnail
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region


    'Request("filename")
    'Request("width")
    'Request("maxwidth") ' TODO 'defaulted by 500 

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
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
        objThumbnail.Save(Response.OutputStream, Imaging.ImageFormat.Jpeg)
        ' Tidy up
        objImage.Dispose()
        objThumbnail.Dispose()

    End Sub
    'downloads on server the file and retusn the physical filename 
    Function downloadURLFile(ByVal fullImageURL As String) As String 'returns loca filename 

        Try

            Dim cl As System.Net.WebClient = New System.Net.WebClient
            cl.BaseAddress = "http://" & Request.ServerVariables("SERVER_NAME") & ":" & Request.ServerVariables("SERVER_PORT")

            Dim myDatabuffer As Byte() = cl.DownloadData(fullImageURL)
            ' Display the downloaded data.
            Dim zufall As System.Random = New System.Random
            Dim randomFilename As String = "random" & zufall.Next
            Dim absoluteFileName As String = Server.MapPath("\productImages\" & randomFilename & ".jpg")
            Dim newFile As System.IO.FileStream = New System.IO.FileStream(absoluteFileName, IO.FileMode.Create)

            Dim b As Byte
            For Each b In myDatabuffer
                newFile.WriteByte(b)
            Next

            newFile.Close()
            downloadURLFile = absoluteFileName
        Catch ex As Exception
            Response.Write("Error when processing URL:" & fullImageURL)
            Response.Write(Err.Description)
        End Try
    End Function

End Class
