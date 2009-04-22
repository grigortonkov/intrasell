Attribute VB_Name = "modulePDFConvert"
Option Compare Database

' Converts Word to PDF File
' Warning: Uses the PDFCreator utility, please install first
' and make the settings for auto save with same filename as the doc file
Sub saveWordAsPDF(ByVal filenameWordDoc As String)
   Dim App 'As Application
   Set App = CreateObject("Word.Application")
    App.Documents.Open filename:=filenameWordDoc, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False, Format:=0
 
    App.ActivePrinter = "PDFCreator"
    App.Application.PrintOut filename:="", Range:=0, Item:=0, Copies:=1, Pages:="", PageType:=0, _
        ManualDuplexPrint:=False, Collate:=True, Background:=True, PrintToFile:= _
        False, PrintZoomColumn:=0, PrintZoomRow:=0, PrintZoomPaperWidth:=0, _
        PrintZoomPaperHeight:=0
        
    App.Quit
      
End Sub


 
 



