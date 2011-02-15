<script language="VB" runat="server">  

    Const THUMBNAIL_SIZE = 200

    '****************************************************************************
    'CHECKS IF AN IMAGE IS OKAY.. it is needed because somethimes problems on downloading happen
    'local full filename 
    '****************************************************************************

    Function isImageOK(ByVal imageFileName) As Boolean
        Dim CImage
        CImage = Server.CreateObject("CImageInfo.GetInfo")
        Dim FilePath
        FilePath = imageFileName 'Type the path of your image file.
        CImage.SetPath(FilePath)
        'Response.Write "Image Type : " & CImage.TypeOfImage & "<br />"
        'Response.Write "Image Height : " & CImage.GetHeight & "<br />"
        'Response.Write "Image Width : " & CImage.GetWidth & "<br />"
        If CImage.GetWidth > 10 And CImage.GetHeight > 0 Then
            isImageOK = True
        Else
            isImageOK = False
        End If
        CImage = Nothing
    End Function



    'returns html string with image proportional width and height attributes
    Function makeImageSizeAttributes(ByVal imageFileName, ByVal maxWidth, ByVal maxHeight) As String
        'Response.Write "makeImageSizeAttributes start "
        'Response.Write "maxWidth = " & maxWidth
        'Response.Write "maxHeight = " & maxHeight
    
        Dim CImage
        Try
            CImage = Server.CreateObject("CImageInfo.GetInfo")
        Catch
            Return ""
        End Try
        
        Dim FilePath
        FilePath = Server.MapPath(imageFileName) 'Type the path of your image file.
        CImage.SetPath(FilePath)
        If showDebug() Then
            Response.Write("Image Type : " & CImage.TypeOfImage & "<br />")
            Response.Write("Image Height : " & CImage.GetHeight & "<br />")
            Response.Write("Image Width : " & CImage.GetWidth & "<br />")
            Response.Write("Image Depth : " & CImage.GetDepth & "<br />")
            Response.Write("Image Path : " & CImage.GetPath & "<br /><br />")
            Response.Write("<b>About : -</b> " & CImage.About)
        End If
    
        If CInt(maxWidth) <= CInt(CImage.GetWidth) And CInt(maxHeight) >= CInt(CImage.GetHeight) Then 'reduce by Widht
            makeImageSizeAttributes = "width=""" & maxWidth & """ height=""" & CImage.GetHeight * maxWidth / CImage.GetWidth & """"
        End If

        If CInt(maxWidth) >= CInt(CImage.GetWidth) And CInt(maxHeight) <= CInt(CImage.GetHeight) Then 'reduce by Height
            makeImageSizeAttributes = "width=""" & CImage.GetWidth * maxHeight / CImage.GetHeight & """ height=""" & maxHeight & """"
        End If
    
    
        
        If CInt(maxWidth) <= CInt(CImage.GetWidth) And CInt(maxHeight) <= Int(CImage.GetHeight) Then 'reduce by Width and Height
            'Response.Write "here"
            If CImage.GetWidth / maxWidth > CImage.GetHeight / maxHeight Then 'brighter than higher case 
                makeImageSizeAttributes = "width=""" & maxWidth & """ height=""" & CImage.GetHeight * maxWidth / CImage.GetWidth & """"
            Else
                makeImageSizeAttributes = "width=""" & CImage.GetWidth * maxHeight / CImage.GetHeight & """ height=""" & maxHeight & """"
            End If
        End If
    
        'else do nothing ' do not increase 
        'Response.End 
        CImage = Nothing
    End Function

 
    ''' <summary>
    ''' makes img html tag and checks if the file exists on the server
    ''' </summary>
    ''' <param name="imageRelativeURL"></param>
    ''' <param name="bezeichnung"></param>
    ''' <param name="maxSize"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function makeImgTag(ByVal imageRelativeURL As Object, ByVal bezeichnung As String, ByVal maxSize As String) As String
  
        'will use any thumbnail generator like thumbnail.aspx
        Dim SHOP_USE_LOCAL_THUMBS As Boolean : SHOP_USE_LOCAL_THUMBS = VARVALUE_DEFAULT("SHOP_USE_LOCAL_THUMBS", "false")
   
        If SHOP_USE_LOCAL_THUMBS <> "true" And SHOP_USE_LOCAL_THUMBS <> "false" Then
            SHOP_USE_LOCAL_THUMBS = SETVARVALUE("SHOP_USE_LOCAL_THUMBS", "false")
        End If
    
        Dim image As String = ""
        
        Try 
         image = imageRelativeURL
        Catch 
        End Try
        bezeichnung = Server.HtmlEncode(bezeichnung & "")

  
        'if on other seerver 
        If LCase(Left(image, 4)) = "http" Then 'absolute path on other server
            Dim html : html = ""
            Randomize()
            Dim randomName : randomName = "Img_" & Int((500000 * Rnd()) + 1)
            html = "<img  name=""ProductImage"" class=""ProductImage"" align=""center"" name=""" & randomName & """ border=""0"" src=""" & imageRelativeURL & """ alt=""" & bezeichnung & """>"
            'resize Java script handling     
            html = html & Chr(13)
            html = html & "<script language=""JavaScript"" type=""text/javascript"">" & Chr(13)
            html = html & "<!--" & Chr(13)
            html = html & "function func_" & randomName & "() {" & Chr(13)
            html = html & "    if (document." & randomName & ".complete && document." & randomName & ".width>0) {" & Chr(13)
            html = html & "            document." & randomName & ".width=" & maxSize & ";" 'document." & randomName & ".width;" & chr(13)
            html = html & "            document." & randomName & ".height=document." & randomName & ".width/" & maxSize & "*document." & randomName & ".height;" & Chr(13)
            html = html & "    }"
            html = html & "        else window.setTimeout('func_" & randomName & "();',100);" & Chr(13)
            html = html & "}//function" & Chr(13)
            html = html & "func_" & randomName & "();" & Chr(13)
    
            html = html & "//-->" & Chr(13)
            html = html & " </ script> " & Chr(13)
            makeImgTag = html
   
            Exit Function
        End If
  
        'on error resume next  
        If image & "" <> "" And image <> "no-image" Then
            If fileExists(Server.MapPath("" & image)) Then
       
                makeImgTag = "<img align=""center"" border=""0"" src=""" & image & """ alt=""" & bezeichnung & """>"
        
                If maxSize <= THUMBNAIL_SIZE Then
                    makeImgTag = "<img name=""ProductImage"" class=""ProductImage"" align=""center"" border=""0"" src=""thumbs/" & image & """ alt=""" & bezeichnung & """>"
                End If
        
                If VARVALUE_DEFAULT("BenutzeImageResize", "TRUE") = "TRUE" Then
                    'Response.Write "Image Resize!" & VARVALUE("BenutzeImageResize"): Response.End 
                    'using the component if registered 
                    makeImgTag = "<img name=""ProductImage"" class=""ProductImage"" align=""center"" border=""0"" src=""" & image & """ alt=""" & bezeichnung & " on " & imageRelativeURL & """ " & makeImageSizeAttributes(imageRelativeURL, maxSize, maxSize) & ">"
                End If
        
                If VARVALUE_DEFAULT("SHOP_GENERATE_THUMBNAILS", "TRUE") = "TRUE" Then
                    'Response.Write "Image Resize!" & VARVALUE("BenutzeImageResize"): Response.End 
                    'using the .NET Function productImages/thumbnail.aspx
                    makeImgTag = "<img name=""ProductImage"" class=""ProductImage"" align=""center"" border=""0"" src=""productImages/thumbnail.aspx?width=" & maxSize & "&maxWidth=" & maxSize & "&filename=" & image & """ alt=""" & bezeichnung & " on " & imageRelativeURL & """ " & makeImageSizeAttributes(imageRelativeURL, maxSize, maxSize) & ">"
                End If
        
        
            Else ' no image on server
                'not in use 
                'makeImgTag = "<p class=""error"">" & Image & " fehlt!</p>" ' Abbildung wurde am Server nicht gefunden</b>"
    
                Dim fakeImage As String : fakeImage = "productImages/SymbolPicture.jpg"
                If fileExists(Server.MapPath(fakeImage)) Then
                    makeImgTag = makeImgTag(fakeImage, bezeichnung, maxSize)
                Else
                    makeImgTag = "<p class=""error"">" & image & " and " & fakeImage & " fehlen!</p>" ' Abbildung wurde am Server nicht gefunden</b>"
                End If
     
            End If
        Else
            makeImgTag = "<b>" & image & "</b>"
        End If
        'on error goto 0
    End Function
 
 
</script>

