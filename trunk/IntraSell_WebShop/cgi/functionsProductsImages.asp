<%
Const THUMBNAIL_SIZE = 200

'****************************************************************************
'CHECKS IF AN IMAGE IS OKAY.. it is needed because somethimes problems on downloading happen
'local full filename 
'****************************************************************************

function isImageOK(imageFileName)
 Dim CImage
	Set CImage = Server.CreateObject("CImageInfo.GetInfo")
	Dim FilePath
	FilePath = imageFileName 'Type the path of your image file.
	CImage.SetPath (FilePath)
	'Response.Write "Image Type : " & CImage.TypeOfImage & "<BR>"
	'Response.Write "Image Height : " & CImage.GetHeight & "<BR>"
	'Response.Write "Image Width : " & CImage.GetWidth & "<BR>"
	if Cimage.GetWidth > 10 and CImage.GetHeight>0 then 
			isImageOK = true 
	else
			isImageOK = false 
	end if 
	set cimage = nothing 
end function 



'returns html string with image proportional width and height
function makeImageSizeAttributes(byVal imageFileName, byVal maxWidth, byVal maxHeight)
    'Response.Write "makeImageSizeAttributes start "
    'Response.Write "maxWidth = " & maxWidth
    'Response.Write "maxHeight = " & maxHeight
    
    Dim CImage
	Set CImage = Server.CreateObject("CImageInfo.GetInfo")
	Dim FilePath
	FilePath = Server.MapPath(imageFileName) 'Type the path of your image file.
	CImage.SetPath (FilePath)
	if false then 
	   Response.Write "Image Type : " & CImage.TypeOfImage & "<BR>"
	   Response.Write "Image Height : " & CImage.GetHeight & "<BR>"
	   Response.Write "Image Width : " & CImage.GetWidth & "<BR>"
	   Response.Write "Image Depth : " & CImage.GetDepth & "<BR>"
	   Response.Write "Image Path : " & CImage.GetPath & "<BR><BR>"
	   Response.Write "<b>About : -</b> " & CImage.About
	end if 
	
	if cint(maxWidth) <= cint(CImage.GetWidth) and cint(maxHeight )>= cint(CImage.GetHeight)  then 'reduce by Widht
	    makeImageSizeAttributes = "width=""" & maxWidth & """ height=""" &  CImage.GetHeight*maxWidth/CImage.GetWidth  & """"
	end if 

	if cint(maxWidth) >= cint(CImage.GetWidth) and cint(maxHeight) <= cint(CImage.GetHeight)  then 'reduce by Height
	    makeImageSizeAttributes = "width=""" & CImage.GetWidth*maxHeight/CImage.GetHeight & """ height=""" &  maxHeight  & """"
	end if 
	
	
		
    if cint(maxWidth) <= cint(CImage.GetWidth) and cint(maxHeight) <= int(CImage.GetHeight)  then 'reduce by Width and Height
    'Response.Write "here"
      if CImage.GetWidth/maxWidth > CImage.GetHeight/maxHeight then 'brighter than higher case 
	    makeImageSizeAttributes = "width=""" & maxWidth & """ height=""" &  CImage.GetHeight*maxWidth/CImage.GetWidth  & """"
	   else
	    makeImageSizeAttributes = "width=""" & CImage.GetWidth*maxHeight/CImage.GetHeight & """ height=""" &  maxHeight  & """"
	   end if  
	end if 
	
	'else do nothing ' do not increase 
	'Response.End 
Set CImage = nothing 
end function 

 
'makes img html tag and checks if the file exists on the server
function makeImgTag(byVal imageRelativeURL, byVal bezeichnung, byVal maxSize)
  
  'will use any thumbnail generator like thumbnail.aspx
  Dim SHOP_USE_LOCAL_THUMBS : SHOP_USE_LOCAL_THUMBS = VARVALUE("SHOP_USE_LOCAL_THUMBS")
   
  if SHOP_USE_LOCAL_THUMBS <> "true" and SHOP_USE_LOCAL_THUMBS <> "false" then 
		SHOP_USE_LOCAL_THUMBS = SETVARVALUE("SHOP_USE_LOCAL_THUMBS","false")
  end if 
	
  Dim image : Image =  imageRelativeURL   
  bezeichnung = Server.HTMLEncode(bezeichnung&"")

  
  'if on other seerver 
  if lcase(left(image,4)) = "http" then 'absolute path on other server
   dim html : html = "" 
   Randomize
   dim randomName: randomName = "Img_" &  Int((500000 * Rnd) + 1)
    html =  "<img  name=""ProductImage"" class=""ProductImage"" align=""center"" name=""" & randomName & """ border=""0"" src=""" & imageRelativeURL & """ alt=""" & bezeichnung & """>" 
   'resize Java script handling     
    html = html & chr(13)
	html = html & "<script language=""JavaScript"" type=""text/javascript"">" & chr(13)
	html = html & "<!--" & chr(13)
	html = html & "function func_" & randomName & "() {" & chr(13)
	html = html & "    if (document." & randomName & ".complete && document." & randomName & ".width>0) {" & chr(13)
	html = html & "			document." & randomName & ".width=" & maxSize & ";" 'document." & randomName & ".width;" & chr(13)
	html = html & "			document." & randomName & ".height=document." & randomName & ".width/" & maxSize & "*document." & randomName & ".height;" & chr(13)
	html = html & "    }" 
	html = html & "		else window.setTimeout('func_" &  randomName & "();',100);" & chr(13)
	html = html & "}//function" & chr(13)
	html = html & "func_" &  randomName & "();" & chr(13)  
	
	html = html & "//-->" & chr(13)
	html = html & "</script>" & chr(13)
    makeImgTag = html
   
   exit function 
  end if
  
  'on error resume next 
  if image & "" <> "" AND image <> "no-image" then 
    if fileExists(Server.MapPath("" & image)) then 
       
		makeImgTag = "<img align=""center"" border=""0"" src=""" & image & """ alt=""" & bezeichnung & """>"
		
	    if maxSize <=THUMBNAIL_SIZE then 
	        makeImgTag = "<img name=""ProductImage"" class=""ProductImage"" align=""center"" border=""0"" src=""thumbs/" & image & """ alt=""" & bezeichnung & """>"
	    end if 
	    
	    if VARVALUE_DEFAULT("BenutzeImageResize", "TRUE") = "TRUE" then
	        'Response.Write "Image Resize!" & VARVALUE("BenutzeImageResize"): Response.End 
			'using the component if registered 
			 makeImgTag = "<img name=""ProductImage"" class=""ProductImage"" align=""center"" border=""0"" src=""" & image & """ alt=""" & bezeichnung & " on " & imageRelativeURL & """ " &  makeImageSizeAttributes( imageRelativeURL, maxSize, maxSize) & ">"
	    end if 
	    
	     if VARVALUE_DEFAULT("SHOP_GENERATE_THUMBNAILS", "TRUE") = "TRUE" then
	        'Response.Write "Image Resize!" & VARVALUE("BenutzeImageResize"): Response.End 
			'using the .NET Function productImages/thumbnail.aspx
			 makeImgTag = "<img name=""ProductImage"" class=""ProductImage"" align=""center"" border=""0"" src=""productImages/thumbnail.aspx?width=" & maxSize & "&maxWidth=" & maxSize & "&filename=" & image & """ alt=""" & bezeichnung & " on " & imageRelativeURL & """ " &  makeImageSizeAttributes( imageRelativeURL, maxSize, maxSize) & ">"
	    end if 
	    
	    
	else ' no image on server
	 'not in use 
	 'makeImgTag = "<p class=""error"">" & Image & " fehlt!</p>" ' Abbildung wurde am Server nicht gefunden</b>"
	
	 dim fakeImage: fakeImage = "productImages/SymbolPicture.jpg"
	 if fileExists(Server.MapPath(fakeImage)) then 
		makeImgTag = makeImgTag(fakeImage,bezeichnung,maxsize)
	 else 
		makeImgTag = "<p class=""error"">" & Image & " and " & fakeImage &" fehlen!</p>" ' Abbildung wurde am Server nicht gefunden</b>"
	 end if 
	 
	end if  
  else
    makeImgTag = "<b>" & Image & "</b>"
  end if 
  'on error goto 0
end function 
 
 

%>