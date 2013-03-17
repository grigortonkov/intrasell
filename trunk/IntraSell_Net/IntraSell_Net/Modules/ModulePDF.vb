Option Strict Off
Option Explicit On

Module ModulePDF
 
    ''' <summary>
    ''' Converts Word to PDF File
    ''' Warning: Uses the PDFCreator utility, please install first and make the settings for auto save with same filename as the doc file
    ''' </summary>
    ''' <param name="filenameWordDoc"></param>
    ''' <remarks></remarks>
    Sub SaveWordAsPDF(ByVal filenameWordDoc As String)
        Try
            Dim App 'As Application
            App = CreateObject("Word.Application")
            App.Documents.Open(fileName:=filenameWordDoc, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False, Format:=0)

            App.ActivePrinter = "PDFCreator"
            App.Application.PrintOut(fileName:="", Range:=0, Item:=0, Copies:=1, Pages:="", PageType:=0, _
                ManualDuplexPrint:=False, Collate:=True, Background:=True, PrintToFile:= _
                False, PrintZoomColumn:=0, PrintZoomRow:=0, PrintZoomPaperWidth:=0, _
                PrintZoomPaperHeight:=0)

            App.Quit()
        Catch e As Exception
            Dim text As String = "Ein Fehler ist aufgetretten! Diese Funktion benötigt PDFCreator und MS Word. Details: " + e.Message
            HandleAppError(e, text)
        End Try
    End Sub


    Public Sub EditInWord(ByVal filenameWordDoc As String)
        Dim App 'As Application
        App = CreateObject("Word.Application")
        App.Visible = True
        App.Documents.Open(fileName:=filenameWordDoc, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False, Format:=0)

    End Sub


End Module
