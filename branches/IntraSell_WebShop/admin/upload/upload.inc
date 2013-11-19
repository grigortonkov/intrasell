<%

'********************************************************************************
'Property Variables
'********************************************************************************
const ForReading   = 1
const ForWriting   = 2
const ForAppending = 3

dim FileCount  'Number of files uploaded
dim FieldCount 'Number of fields uploaded
'dim Path       'Path to store files in
dim Dict       'pointer to a Scripting.Dictionary object with form data

'Path = "../../productImages"
FileCount   = 0
FieldCount  = 0
Dict        = Null


'**********************************************************************************************
'Methods
'**********************************************************************************************
'----------------------------------------------------------------------------------------------
'Init - Builds a Scripting.Dictionary from uploaded binary data
'        Parameters
'                pServer  [in] - pointer to ASP's Server Object
'               pRequest [in] - pointer to ASP's Request Object
'
'        Returns a Scripting.Dictionary object which contains all the form data
'----------------------------------------------------------------------------------------------
Function Init()

    Dim tBytes
    Dim binData
    Dim scrDict

    tBytes      = Request.TotalBytes
    RequestBin  = Request.BinaryRead(tBytes)

    Set scrDict = Server.CreateObject("Scripting.Dictionary")

    PosBeg      = 1
    PosEnd      = InStrB(PosBeg, RequestBin, getByteString(Chr(13)))

    If PosEnd < 2 Then
        Set Dict = Server.CreateObject("Scripting.Dictionary")
        Exit Function
    End If

    boundary    = MidB(RequestBin, PosBeg, PosEnd - PosBeg)
    BoundaryPos = InStrB(1, RequestBin, boundary)

    Do Until (BoundaryPos = InStrB(RequestBin, boundary & getByteString("--")))
        Dim UploadControl
        Set UploadControl = Server.CreateObject("Scripting.Dictionary")
        Pos               = InStrB(BoundaryPos, RequestBin, getByteString("Content-Disposition"))
        Pos               = InStrB(Pos, RequestBin, getByteString("name="))
        PosBeg            = Pos + 6
        PosEnd            = InStrB(PosBeg, RequestBin, getByteString(Chr(34)))
        Name              = getString(MidB(RequestBin, PosBeg, PosEnd - PosBeg))
        PosFile           = InStrB(BoundaryPos, RequestBin, getByteString("filename="))
        PosBound          = InStrB(PosEnd, RequestBin, boundary)

        If PosFile <> 0 And (PosFile < PosBound) Then
            FileCount = FileCount + 1
            PosBeg    = PosFile + 10
            PosEnd    = InStrB(PosBeg, RequestBin, getByteString(Chr(34)))
            FileName  = getString(MidB(RequestBin, PosBeg, PosEnd - PosBeg))
            UploadControl.Add "FileName", FileName
            Pos       = InStrB(PosEnd, RequestBin, getByteString("Content-Type:"))
            PosBeg    = Pos + 14
            PosEnd    = InStrB(PosBeg, RequestBin, getByteString(Chr(13)))
            ContentType = getString(MidB(RequestBin, PosBeg, PosEnd - PosBeg))
            UploadControl.Add "ContentType", ContentType
            PosBeg    = PosEnd + 4
            PosEnd    = InStrB(PosBeg, RequestBin, boundary) - 2
            Value     = MidB(RequestBin, PosBeg, PosEnd - PosBeg)
        Else
            FieldCount = FieldCount + 1
            Pos        = InStrB(Pos, RequestBin, getByteString(Chr(13)))
            PosBeg     = Pos + 4
            PosEnd     = InStrB(PosBeg, RequestBin, boundary) - 2
            Value      = getString(MidB(RequestBin, PosBeg, PosEnd - PosBeg))
        End If

        UploadControl.Add "Value", Value
        scrDict.Add Name, UploadControl
        BoundaryPos = InStrB(BoundaryPos + LenB(boundary), RequestBin, boundary)
    Loop

    Set Dict = scrDict
    Set scrDict = Nothing

End Function


'----------------------------------------------------------------------------------------------
'saveAs - takes the uploaded file and saves it with your selected file name and path
'        Parameters
'                sHTMLFormField    [in] - name of the item to retreive data for
'               sNewFile [in] - new file name and path to save the file under
'                               if sNewFile is empty store it to the current web path
'        Returns True if file was saved correctly
'----------------------------------------------------------------------------------------------
Function saveAs( sHTMLFormField, sNewFile)

    If Dict.Exists(sHTMLFormField) And Len(getFileName(sHTMLFormField)) > 0 Then

        binData = Dict.Item( sHTMLFormField).Item("Value")
        binData = getString( binData)

        Dim sFilePath
        sFilePath = Path & "/" & getFileName(sHTMLFormField)
        If Len( sNewFile) <> 0 Then        sFilePath = sNewFile
        'response.write  "sFilePath-" & sFilePath
        Set oFSO = Server.CreateObject( "Scripting.FileSystemObject")  '- create the transfer file using Scripting.FileSystemObject  ...

        Set oTextStream = oFSO.CreateTextFile(Server.MapPath(sFilePath), True)        '- create a file binary write
        oTextStream.Write( binData)                                    '- write binData to the file
        oTextStream.Close                                              '- close the file

        saveAs = True

     Else

        Response.Write( "File associated with HTML &lt;FORM&gt; field name &lt;INPUT NAME=" & sHTMLFormField & "&gt; not found!")
        saveAs = False

     End If

End Function


'----------------------------------------------------------------------------------------------
'getData - Retrieves data from the Scripting.Dictionary object
'        Parameters
'                sHTMLFormField [in] - name of the item to retreive data for
'
'        Returns data/value of a HTML Form Field from the Scripting.Dictionary object
'----------------------------------------------------------------------------------------------
Function getData(sHTMLFormField)

    If Dict.Exists(sHTMLFormField) Then
        getData = Dict.Item( sHTMLFormField).Item("Value")
    Else
        getData = ""
    End If
End Function


'----------------------------------------------------------------------------------------------
'getFileName - Retrieves data from the Scripting.Dictionary object
'        Parameters
'                sHTMLFormField [in] - name of the item to retreive data for
'
'        Returns data/value of a HTML Form Field from the Scripting.Dictionary object
'----------------------------------------------------------------------------------------------
Function getFileName(sHTMLFormField)

    Dim strHTMLFormField
    If Dict.Exists(sHTMLFormField) Then
        strHTMLFormField = Dict.Item( sHTMLFormField).Item("FileName")
    Else
        strHTMLFormField = ""
    End If

    Dim tPos
    Dim strRtn
    strRtn = ""
    tPos = InStrRev(strHTMLFormField, "\")
    If tPos = 0 Or IsNull(tPos) Then
        strRtn = strHTMLFormField
    Else
        strRtn = Right(strHTMLFormField, Len(strHTMLFormField) - tPos)
    End If

    getFileName = strRtn

End Function


'----------------------------------------------------------------------------------------------
'getContentType - Retrieves ContentType data from the uploaded file in the Scripting.Dictionary object
'        Parameters
'                sHTMLFormField [in] - name of the item to retreive data for
'
'        Returns data/value of a HTML Form Field from the Scripting.Dictionary object
'----------------------------------------------------------------------------------------------
Function getContentType(sHTMLFormField)
    If Dict.Exists(sHTMLFormField) Then
        getContentType = Dict.Item( sHTMLFormField).Item("ContentType")
    Else
        getContentType = ""
    End If
End Function



'**********************************************************************************************
'Private Functions
'**********************************************************************************************
'----------------------------------------------------------------------------------------------
'getString - Parse out string from byte data
'        Parameters
'                StringBin [in] -        Pull string out of byte data.
'        Returns string from byte data.
'----------------------------------------------------------------------------------------------
Function getString(StringBin)
    Dim strRtn
    strRtn = ""
    For intCount = 1 To LenB(StringBin)
        strRtn = strRtn & Chr(AscB(MidB(StringBin, intCount, 1)))
    Next
    getString = strRtn
End Function


'----------------------------------------------------------------------------------------------
'getByteString - turn a string into byte data
'        Parameters
'                StringStr [in] -        string to make into byte data.
'        Returns byte data from a string.
'----------------------------------------------------------------------------------------------
Function getByteString(StringStr)
    Dim strRtn
    strRtn = ""
    For i = 1 To Len(StringStr)
        Char   = Mid(StringStr, i, 1)
        strRtn = strRtn & ChrB(AscB(Char))
    Next
    getByteString = strRtn
End Function

%>
