Option Explicit On

Imports IntraSell_DLL


Module ModulePOSPrinter

    Const LF = "x" '  Chr(13)


    Sub printFile(ByVal filename As String)
        'If HW_CONFIG = HW_CONFIG_3 Or HW_CONFIG = HW_CONFIG_4 Then 'usb must have printer map on com9 port
        ' Call Shell("print /d:com9 " & filename, AppWinStyle.Hide, False)
        'print to lpt1 port
        Call Shell("print " & VARVALUE_DEFAULT("PRINT_PORT", "/d:lpt3") & " " & filename, vbNormalFocus)  'time out of 5 seconds to print the file
        'End If
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

        Dim result As String = ""
        Dim dr : dr = (sql)
        Dim curRow As Integer : curRow = 0
        While dr.read And curRow < maxPrintRows
            curRow = curRow + 1
            result = result + CStr(dr(0)) & LF
        End While
        sqlToText = result

    End Function





End Module
