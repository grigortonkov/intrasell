 
 <script language="VB" runat="server">  
    'Specify the index file location where the indexes are to be stored
    Dim IndexFileLocation As String = "C:\Temp\Lucene.Net\Data\Products"
    
    'Creates the lucene.net index with person details
    Sub CreateIndex()
        
         Dim INDEX_CREATED_ON = varvalue_default("INDEX_CREATED_ON", DateTime.Today.AddDays(-2))
         If INDEX_CREATED_ON > DateTime.Today.AddDays(-1) Then
             Return 'else create index 
         End If
         SETVARVALUE("INDEX_CREATED_ON", DateTime.Today)
         
         Dim dir As Lucene.Net.Store.Directory = Lucene.Net.Store.FSDirectory.GetDirectory(IndexFileLocation, True)
        
         Dim indexWriter As Lucene.Net.Index.IndexWriter = New Lucene.Net.Index.IndexWriter(dir, New Lucene.Net.Analysis.Standard.StandardAnalyzer(), True)
         indexWriter.SetRAMBufferSizeMB(10.0)
         indexWriter.SetUseCompoundFile(False)
         indexWriter.SetMaxMergeDocs(10000)
         indexWriter.SetMergeFactor(100)

         Dim sql As String = "select * from grArtikel where Bezeichnung is not null and bezeichnung not like '***%' and ProduktAktiv<> 0 and ProduktAktivOnline <>0 order by Bezeichnung"
         Dim rs = objConnectionExecute(sql)
         While Not rs.EOF
       
        
             'Create the Document object
             Dim doc As Lucene.Net.Documents.Document = New Lucene.Net.Documents.Document()
             
             'Populate the document with the column name and value from our query
             
             doc.Add(New Lucene.Net.Documents.Field("ArtNr", "" & rs("ArtNr").Value, _
                                                   Lucene.Net.Documents.Field.Store.YES, _
                                                   Lucene.Net.Documents.Field.Index.TOKENIZED))
             
             doc.Add(New Lucene.Net.Documents.Field("Bezeichnung", "" & rs("Bezeichnung").Value, _
                                                    Lucene.Net.Documents.Field.Store.YES, _
                                                    Lucene.Net.Documents.Field.Index.TOKENIZED))
            
             doc.Add(New Lucene.Net.Documents.Field("Beschreibung", "" & rs("Beschreibung").Value, _
                                                    Lucene.Net.Documents.Field.Store.YES, _
                                                    Lucene.Net.Documents.Field.Index.TOKENIZED))
            
             ' Write the Document to the catalog
             indexWriter.AddDocument(doc)
             rs.MoveNext()
         End While
 
         ' Close the writer
         indexWriter.Close()
     End Sub
    
    
    'Search in the index
    Public Function SearchProduct(ByVal searchString As String) As ArrayList
        'Results are collected as a List
        Dim SearchResults As ArrayList = New ArrayList
        '(SearchResult) = new List(SearchResults)()

        ' Specify the location where the index files are stored
         
        Dim dir As Lucene.Net.Store.Directory = Lucene.Net.Store.FSDirectory.GetDirectory(IndexFileLocation)
        
        'specify the search fields, lucene search in multiple fields
        Dim searchfields As String() = Split("ArtNr,Bezeichnung,Beschreibung", ",")
        
        Dim indexSearcher As Lucene.Net.Search.IndexSearcher = New Lucene.Net.Search.IndexSearcher(dir)
        'Making a boolean query for searching and get the searched hits
        Dim hits = indexSearcher.Search(QueryMaker(searchString, searchfields))
        Dim i As Integer = 0
         If hits.Length() > 25 Then
              Response.Write("<br/>More than 25 results found.")
         End If
         While i < hits.Length() And i < 25
           
             Dim result As SearchResult = New SearchResult()
             result.Artnr = hits.Doc(i).GetField("ArtNr").StringValue()
             result.Bezeichnung = hits.Doc(i).GetField("Bezeichnung").StringValue()
             result.Beschreibung = hits.Doc(i).GetField("Beschreibung").StringValue()
            
             SearchResults.Add(result)
            
             Response.Write("<br/>" & result.ToUrl)
             i = i + 1
         End While

        indexSearcher.Close()
        Return SearchResults
    End Function

    'Making the query
    Public Function QueryMaker(ByVal searchString As String, ByVal searchfields As String()) As Lucene.Net.Search.BooleanQuery
        
        Dim parser = New Lucene.Net.QueryParsers.MultiFieldQueryParser(Lucene.Net.Util.Version.LUCENE_29, _
                                               searchfields, _
                                               New Lucene.Net.Analysis.Standard.StandardAnalyzer(Lucene.Net.Util.Version.LUCENE_29))
        
        Dim finalQuery = New Lucene.Net.Search.BooleanQuery()
        
        Dim searchText As String
        searchText = searchString.Replace("+", "")
        searchText = searchText.Replace("""", "")
        searchText = searchText.Replace("\'", "")
        'Split the search string into separate search terms by word
        Dim terms As String() = Split(searchText, " ") '//, StringSplitOptions.RemoveEmptyEntries);
        For i As Integer = 1 To terms.Length
            If (searchString.Contains("+")) Then
                finalQuery.Add(parser.Parse(Replace(terms(i - 1), "*", "") + "*"), Lucene.Net.Search.BooleanClause.Occur.MUST)
            Else
                finalQuery.Add(parser.Parse(Replace(terms(i - 1), "*", "") + "*"), Lucene.Net.Search.BooleanClause.Occur.SHOULD)
            End If
        Next
        Return finalQuery
    End Function
    
     Class SearchResult
         Friend Artnr As String
         Friend Bezeichnung As String
         Friend Beschreibung As String
        
         Function ToString() As String
             Return Artnr & ", " & Bezeichnung
         End Function
         
         Function ToUrl() As String
             '<img src='http://localhost:88/productImages/SymbolPicture.jpg' width=64 height=64 />
             Return "<a href='/?ArtNr=" & Artnr & "'>" & Bezeichnung & "</a>"
         End Function
         
         
     End Class

</script>
