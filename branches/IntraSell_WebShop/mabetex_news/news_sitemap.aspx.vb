Namespace mabetex_news

Partial Class news_sitemap
    Inherits System.Web.UI.Page

#Region " Vom Web Form Designer generierter Code "

    'Dieser Aufruf ist für den Web Form-Designer erforderlich.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader
        Me.DataSet_AllNews1 = New mabetex_news.DataSet_AllNews
        Me.OleDbConnection = New System.Data.OleDb.OleDbConnection
        Me.DataSet_RandomNews1 = New mabetex_news.DataSet_RandomNews
        Me.OleDbDataAdapter_RandomNews = New System.Data.OleDb.OleDbDataAdapter
        Me.OleDbDeleteCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbInsertCommand3 = New System.Data.OleDb.OleDbCommand
        Me.OleDbSelectCommand3 = New System.Data.OleDb.OleDbCommand
        Me.OleDbUpdateCommand2 = New System.Data.OleDb.OleDbCommand
        CType(Me.DataSet_AllNews1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DataSet_RandomNews1, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'DataSet_AllNews1
        '
        Me.DataSet_AllNews1.DataSetName = "DataSet_AllNews"
        Me.DataSet_AllNews1.Locale = New System.Globalization.CultureInfo("de-AT")
        '
        'OleDbConnection
        '
        Me.OleDbConnection.ConnectionString = CType(configurationAppSettings.GetValue("OleDbConnection.ConnectionString", GetType(System.String)), String)
        '
        'DataSet_RandomNews1
        '
        Me.DataSet_RandomNews1.DataSetName = "DataSet_RandomNews"
        Me.DataSet_RandomNews1.Locale = New System.Globalization.CultureInfo("de-AT")
        '
        'OleDbDataAdapter_RandomNews
        '
        Me.OleDbDataAdapter_RandomNews.DeleteCommand = Me.OleDbDeleteCommand2
        Me.OleDbDataAdapter_RandomNews.InsertCommand = Me.OleDbInsertCommand3
        Me.OleDbDataAdapter_RandomNews.SelectCommand = Me.OleDbSelectCommand3
        Me.OleDbDataAdapter_RandomNews.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "News", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Datum", "Datum"), New System.Data.Common.DataColumnMapping("ErstelltAm", "ErstelltAm"), New System.Data.Common.DataColumnMapping("ErstelltVon", "ErstelltVon"), New System.Data.Common.DataColumnMapping("KatNr", "KatNr"), New System.Data.Common.DataColumnMapping("KurzText", "KurzText"), New System.Data.Common.DataColumnMapping("NewsNr", "NewsNr"), New System.Data.Common.DataColumnMapping("Picture", "Picture"), New System.Data.Common.DataColumnMapping("PrevSeite", "PrevSeite"), New System.Data.Common.DataColumnMapping("Text", "Text"), New System.Data.Common.DataColumnMapping("Titel", "Titel")})})
        Me.OleDbDataAdapter_RandomNews.UpdateCommand = Me.OleDbUpdateCommand2
        '
        'OleDbDeleteCommand2
        '
        Me.OleDbDeleteCommand2.CommandText = "DELETE FROM News WHERE (NewsNr = ?) AND (Datum = ? OR ? IS NULL AND Datum IS NULL" & _
        ") AND (ErstelltAm = ? OR ? IS NULL AND ErstelltAm IS NULL) AND (ErstelltVon = ? " & _
        "OR ? IS NULL AND ErstelltVon IS NULL) AND (KatNr = ? OR ? IS NULL AND KatNr IS N" & _
        "ULL) AND (Picture = ? OR ? IS NULL AND Picture IS NULL) AND (PrevSeite = ? OR ? " & _
        "IS NULL AND PrevSeite IS NULL) AND (Titel = ? OR ? IS NULL AND Titel IS NULL)"
        Me.OleDbDeleteCommand2.Connection = Me.OleDbConnection
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_NewsNr", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "NewsNr", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Datum", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Datum", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Datum1", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Datum", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ErstelltAm", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ErstelltAm", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ErstelltAm1", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ErstelltAm", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ErstelltVon", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ErstelltVon", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ErstelltVon1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ErstelltVon", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_KatNr", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "KatNr", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_KatNr1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "KatNr", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Picture", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Picture", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Picture1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Picture", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PrevSeite", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PrevSeite", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PrevSeite1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PrevSeite", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Titel", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Titel", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Titel1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Titel", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbInsertCommand3
        '
        Me.OleDbInsertCommand3.CommandText = "INSERT INTO News(Datum, ErstelltAm, ErstelltVon, KatNr, KurzText, Picture, PrevSe" & _
        "ite, [Text], Titel) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
        Me.OleDbInsertCommand3.Connection = Me.OleDbConnection
        Me.OleDbInsertCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("Datum", System.Data.OleDb.OleDbType.DBDate, 0, "Datum"))
        Me.OleDbInsertCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("ErstelltAm", System.Data.OleDb.OleDbType.DBDate, 0, "ErstelltAm"))
        Me.OleDbInsertCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("ErstelltVon", System.Data.OleDb.OleDbType.VarWChar, 50, "ErstelltVon"))
        Me.OleDbInsertCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("KatNr", System.Data.OleDb.OleDbType.Integer, 0, "KatNr"))
        Me.OleDbInsertCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("KurzText", System.Data.OleDb.OleDbType.VarWChar, 0, "KurzText"))
        Me.OleDbInsertCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("Picture", System.Data.OleDb.OleDbType.VarWChar, 50, "Picture"))
        Me.OleDbInsertCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("PrevSeite", System.Data.OleDb.OleDbType.Integer, 0, "PrevSeite"))
        Me.OleDbInsertCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("Text", System.Data.OleDb.OleDbType.VarWChar, 0, "Text"))
        Me.OleDbInsertCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("Titel", System.Data.OleDb.OleDbType.VarWChar, 50, "Titel"))
        '
        'OleDbSelectCommand3
        '
        Me.OleDbSelectCommand3.CommandText = "SELECT Datum, ErstelltAm, ErstelltVon, KatNr, KurzText, NewsNr, Picture, PrevSeit" & _
        "e, [Text], Titel, 'news_detail.aspx?newsNr=' + cstr(NewsNr) AS Url FROM News WHE" & _
        "RE (PrevSeite IS NULL) ORDER BY Datum DESC"
        Me.OleDbSelectCommand3.Connection = Me.OleDbConnection
        '
        'OleDbUpdateCommand2
        '
        Me.OleDbUpdateCommand2.CommandText = "UPDATE News SET Datum = ?, ErstelltAm = ?, ErstelltVon = ?, KatNr = ?, KurzText =" & _
        " ?, Picture = ?, PrevSeite = ?, [Text] = ?, Titel = ? WHERE (NewsNr = ?) AND (Da" & _
        "tum = ? OR ? IS NULL AND Datum IS NULL) AND (ErstelltAm = ? OR ? IS NULL AND Ers" & _
        "telltAm IS NULL) AND (ErstelltVon = ? OR ? IS NULL AND ErstelltVon IS NULL) AND " & _
        "(KatNr = ? OR ? IS NULL AND KatNr IS NULL) AND (Picture = ? OR ? IS NULL AND Pic" & _
        "ture IS NULL) AND (PrevSeite = ? OR ? IS NULL AND PrevSeite IS NULL) AND (Titel " & _
        "= ? OR ? IS NULL AND Titel IS NULL)"
        Me.OleDbUpdateCommand2.Connection = Me.OleDbConnection
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Datum", System.Data.OleDb.OleDbType.DBDate, 0, "Datum"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("ErstelltAm", System.Data.OleDb.OleDbType.DBDate, 0, "ErstelltAm"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("ErstelltVon", System.Data.OleDb.OleDbType.VarWChar, 50, "ErstelltVon"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("KatNr", System.Data.OleDb.OleDbType.Integer, 0, "KatNr"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("KurzText", System.Data.OleDb.OleDbType.VarWChar, 0, "KurzText"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Picture", System.Data.OleDb.OleDbType.VarWChar, 50, "Picture"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("PrevSeite", System.Data.OleDb.OleDbType.Integer, 0, "PrevSeite"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Text", System.Data.OleDb.OleDbType.VarWChar, 0, "Text"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Titel", System.Data.OleDb.OleDbType.VarWChar, 50, "Titel"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_NewsNr", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "NewsNr", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Datum", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Datum", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Datum1", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Datum", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ErstelltAm", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ErstelltAm", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ErstelltAm1", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ErstelltAm", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ErstelltVon", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ErstelltVon", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ErstelltVon1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ErstelltVon", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_KatNr", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "KatNr", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_KatNr1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "KatNr", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Picture", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Picture", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Picture1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Picture", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PrevSeite", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PrevSeite", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PrevSeite1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PrevSeite", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Titel", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Titel", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Titel1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Titel", System.Data.DataRowVersion.Original, Nothing))
        CType(Me.DataSet_AllNews1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DataSet_RandomNews1, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Protected WithEvents DataSet_AllNews1 As mabetex_news.DataSet_AllNews
    Protected WithEvents OleDbConnection As System.Data.OleDb.OleDbConnection
    Protected WithEvents DataSet_RandomNews1 As mabetex_news.DataSet_RandomNews
    Protected WithEvents OleDbDataAdapter_RandomNews As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents OleDbDeleteCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbInsertCommand3 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbSelectCommand3 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbUpdateCommand2 As System.Data.OleDb.OleDbCommand

    'HINWEIS: Die folgende Platzhalterdeklaration ist für den Web Form-Designer erforderlich.
    'Nicht löschen oder verschieben.

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: Dieser Methodenaufruf ist für den Web Form-Designer erforderlich
        'Verwenden Sie nicht den Code-Editor zur Bearbeitung.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        ' Hier Benutzercode zur Seiteninitialisierung einfügen
        Me.OleDbConnection.Open()

        Me.OleDbDataAdapter_RandomNews.Fill(Me.DataSet_RandomNews1)

        Me.OleDbConnection.Close()
        Me.DataBind()

    End Sub

End Class

End Namespace
