 <script language="VB" runat="server">
     ' Needs PDF Creator to be installed with autosave option set to ON 
     ' The Files is printed using the standart windows file program (register with open by) 
     ' Prints RTF with Wordpad
     ' Prints HTML with FireFox
     ' returns the Filename of the the PDF Document 
    
     Function printPDF(ByVal filename As String) As String
        
         
         Dim PDFCreator As Object = Server.CreateObject("PDFCreator.clsPDFCreator")
     
         PDFCreator.cStart("/NoProcessingAtStartup")
         PDFCreator.cOption("UseAutosave") = 1
         PDFCreator.cOption("UseAutosave") = 1
         PDFCreator.cOption("UseAutosaveDirectory") = 1
         PDFCreator.cOption("AutosaveFormat") = 0
         PDFCreator.cVisible = False 'True
         PDFCreator.cDefaultPrinter = "PDFCreator"
         PDFCreator.cClearCache()
         PDFCreator.cPrintFile(filename)
         PDFCreator.cVisible = True
         PDFCreator.cPrinterStop = False
         printPDF = filename.Replace(".rtf", ".pdf")
         
     End Function
     
</script>
 