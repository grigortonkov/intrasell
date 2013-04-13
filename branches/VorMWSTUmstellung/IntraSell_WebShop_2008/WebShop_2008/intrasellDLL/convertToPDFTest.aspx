 <script language="VB" runat="server">
     ' Needs PDF Creator to be installed with autosave option set to ON 
     ' The Files is printed using the standart windows file program (register with open by) 
     ' Prints RTF with Wordpad
     ' Prints HTML with FireFox
     Function print() As String
        
         Dim pathPdf As String = "c:\"
         Dim filename As String = "History.rtf"
         Dim PDFCreator As Object
     
         PDFCreator = Server.CreateObject("PDFCreator.clsPDFCreator")
     
         PDFCreator.cStart("/NoProcessingAtStartup")
         PDFCreator.cOption("UseAutosave") = 1
         PDFCreator.cOption("UseAutosave") = 1
         PDFCreator.cOption("UseAutosaveDirectory") = 1
         PDFCreator.cOption("AutosaveFormat") = 0
         PDFCreator.cVisible = False 'True
         PDFCreator.cDefaultPrinter = "PDFCreator"
         PDFCreator.cClearCache()
         PDFCreator.cPrintFile(pathPdf & filename)
         PDFCreator.cVisible = True
         PDFCreator.cPrinterStop = False
         print = "OK"
     End Function
     
</script>
<% =print()%>
 