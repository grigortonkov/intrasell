Attribute VB_Name = "modulePOSPrinter"
Option Compare Database
Option Explicit
Const LF = "x" '  Chr(13)

  
  Sub printFile(ByVal filename As String)
        'If HW_CONFIG = HW_CONFIG_3 Or HW_CONFIG = HW_CONFIG_4 Then 'usb must have printer map on com9 port
           ' Call Shell("print /d:com9 " & filename, AppWinStyle.Hide, False)
      'print to lpt1 port
            Call Shell("print " & filename, vbNormalFocus) 'time out of 5 seconds to print the file
       ' End If
    End Sub

 

 


    Function center(ByVal s As String) As String
  
            Dim countSpaces As Integer
            countSpaces = CInt((44 - Len(s)) / 2)
            Dim i As Integer
            For i = 0 To countSpaces
                s = " " & s
            Next
            center = s
 
    End Function

    Function sqlToText(ByVal sql As String, Optional ByVal maxPrintRows As Integer = 50) As String
     
            Dim result As String
            Dim dr: dr = (sql)
            Dim curRow As Integer: curRow = 0
            While dr.Read And curRow < maxPrintRows
                   curRow = curRow + 1
                   result = result + CStr(dr(0)) & LF
            Wend
            sqlToText = result
 
    End Function
 



