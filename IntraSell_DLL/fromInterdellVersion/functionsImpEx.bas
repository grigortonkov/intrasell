Attribute VB_Name = "functionsIMPEX"

Option Compare Database
Option Explicit

'makes CSV file from query or table
Function transferQuery(ByVal TableName As String, ByVal filename As String)
transferQuery = False
      'If Creation of export filename wished
    Dim fs, exportFile
    Dim fileLine
    Dim rs
    Dim i As Integer
    
    Set rs = CurrentDb.openRecordset(TableName)
    
    If rs.EOF Then Exit Function
    
            Set fs = CreateObject("Scripting.FileSystemObject")
        Set exportFile = fs.CreateTextFile(filename, True)
                    For i = 1 To rs.Fields.Count
                     fileLine = fileLine & rs.Fields(i - 1).Name & ";"
                Next
                exportFile.WriteLine fileLine
                fileLine = ""
    While Not rs.EOF
               
                For i = 1 To rs.Fields.Count
                     fileLine = fileLine & rs.Fields(i - 1).Value & ";"
                Next
                        
                exportFile.WriteLine fileLine
                fileLine = ""
        rs.MoveNext
    Wend
        rs.Close
        exportFile.Close
transferQuery = True
End Function





   '  Parameter Value
   '------------------------------------------------------------------------
   'bIncFldNames     True/False, stating if the first row of the text file
   '                 has column names
   'sPath            Full path to the folder where Schema.ini will reside
   'sSectionName     Schema.ini section name; must be the same as the name
   '                 of the text file it describes
   'sTblQryName      Name of the table or query for which you want to
   '                 create a Schema.ini file
                
Public Function CreateSchemaFile(ByVal bIncFldNames As Boolean, _
                                       ByVal sPath As String, _
                                       ByVal sSectionName As String, _
                                       ByVal sTblQryName As String) As Boolean
         Dim Msg As String ' For error handling.
         On Local Error GoTo CreateSchemaFile_Err
         Dim ws As Workspace, db As database
         Dim tblDef As TableDef, fldDef As Field
         Dim i As Integer, Handle As Integer
         Dim fldName As String, fldDataInfo As String
         ' -----------------------------------------------
         ' Set DAO objects.
         ' -----------------------------------------------
         Set db = CurrentDb()
         ' -----------------------------------------------
         ' Open schema file for append.
         ' -----------------------------------------------
         Handle = FreeFile
         Open sPath & "schema.ini" For Output Access Write As #Handle
         ' -----------------------------------------------
         ' Write schema header.
         ' -----------------------------------------------
         Print #Handle, "[" & sSectionName & "]"
         Print #Handle, "ColNameHeader = " & _
                         IIf(bIncFldNames, "True", "False")
         Print #Handle, "CharacterSet = ANSI"
         Print #Handle, "Format = TabDelimited"
         ' -----------------------------------------------
         ' Get data concerning schema file.
         ' -----------------------------------------------
         Set tblDef = db.TableDefs(sTblQryName)
         With tblDef
            For i = 0 To .Fields.Count - 1
               Set fldDef = .Fields(i)
               With fldDef
                  fldName = .Name
                  Select Case .Type
                     Case dbBoolean
                        fldDataInfo = "Bit"
                     Case dbByte
                        fldDataInfo = "Byte"
                     Case dbInteger
                        fldDataInfo = "Short"
                     Case dbLong
                        fldDataInfo = "Integer"
                     Case dbCurrency
                        fldDataInfo = "Currency"
                     Case dbSingle
                        fldDataInfo = "Single"
                     Case dbDouble
                        fldDataInfo = "Double"
                     Case dbDate
                        fldDataInfo = "Date"
                     Case dbText
                        fldDataInfo = "Char Width " & Format$(.Size)
                     Case dbLongBinary
                        fldDataInfo = "OLE"
                     Case dbMemo
                        fldDataInfo = "LongChar"
                     Case dbGUID
                        fldDataInfo = "Char Width 16"
                  End Select
                  Print #Handle, "Col" & Format$(i + 1) _
                                  & "=" & fldName & Space$(1) _
                                  & fldDataInfo
               End With
            Next i
         End With
         'MsgBox sPath & "SCHEMA.INI has been created."
         CreateSchemaFile = True
CreateSchemaFile_End:
         Close Handle
         Exit Function
CreateSchemaFile_Err:
         Msg = "Error #: " & Format$(err.Number) & vbCrLf
         Msg = Msg & err.Description
         MsgBox Msg
         Resume CreateSchemaFile_End
      End Function
                        

'Print CreateSchemaFile(True, "c:\MSOffice\Access\", "EMP.TXT", "Employees")



