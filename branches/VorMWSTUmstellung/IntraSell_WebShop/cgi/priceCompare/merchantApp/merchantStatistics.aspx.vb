Public Class merchantStatistics
    Inherits System.Web.UI.Page
    Protected WithEvents SqlSelectCommand1 As System.Data.SqlClient.SqlCommand
    Protected WithEvents SqlInsertCommand1 As System.Data.SqlClient.SqlCommand
    Protected WithEvents SqlUpdateCommand1 As System.Data.SqlClient.SqlCommand
    Protected WithEvents SqlDeleteCommand1 As System.Data.SqlClient.SqlCommand
    Protected WithEvents Datagrid_Clicks As System.Web.UI.WebControls.DataGrid
    Protected WithEvents SqlCommand1 As System.Data.SqlClient.SqlCommand
    Protected WithEvents SqlCommand2 As System.Data.SqlClient.SqlCommand
    Protected WithEvents SqlCommand4 As System.Data.SqlClient.SqlCommand
    Protected WithEvents SqlDataAdapter_Uebersicht As System.Data.SqlClient.SqlDataAdapter
    Protected WithEvents SqlDataAdapter_ProduktClicks As System.Data.SqlClient.SqlDataAdapter
    Protected WithEvents txtLieferantNr As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnLoad As System.Web.UI.WebControls.Button
    Protected WithEvents Datagrid_Angebote As System.Web.UI.WebControls.DataGrid
    Protected WithEvents OdbcDataAdapter_ProduktClicks As Microsoft.Data.Odbc.OdbcDataAdapter
    Protected WithEvents OdbcDataAdapter_Uebersicht As Microsoft.Data.Odbc.OdbcDataAdapter
    Protected WithEvents OdbcConn As Microsoft.Data.Odbc.OdbcConnection
    Protected WithEvents OdbcCommand_Select_Uebersicht As Microsoft.Data.Odbc.OdbcCommand
    Protected WithEvents OdbcCommand_Select_ProduktClicks As Microsoft.Data.Odbc.OdbcCommand
    Protected WithEvents SqlCommandProduktClicks As System.Data.SqlClient.SqlCommand

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader()
        Me.SqlSelectCommand1 = New System.Data.SqlClient.SqlCommand()
        Me.SqlInsertCommand1 = New System.Data.SqlClient.SqlCommand()
        Me.SqlUpdateCommand1 = New System.Data.SqlClient.SqlCommand()
        Me.SqlDeleteCommand1 = New System.Data.SqlClient.SqlCommand()
        Me.SqlDataAdapter_Uebersicht = New System.Data.SqlClient.SqlDataAdapter()
        Me.SqlDataAdapter_ProduktClicks = New System.Data.SqlClient.SqlDataAdapter()
        Me.SqlCommand1 = New System.Data.SqlClient.SqlCommand()
        Me.SqlCommand2 = New System.Data.SqlClient.SqlCommand()
        Me.SqlCommandProduktClicks = New System.Data.SqlClient.SqlCommand()
        Me.SqlCommand4 = New System.Data.SqlClient.SqlCommand()
        Me.OdbcDataAdapter_ProduktClicks = New Microsoft.Data.Odbc.OdbcDataAdapter()
        Me.OdbcCommand_Select_ProduktClicks = New Microsoft.Data.Odbc.OdbcCommand()
        Me.OdbcConn = New Microsoft.Data.Odbc.OdbcConnection()
        Me.OdbcCommand_Select_Uebersicht = New Microsoft.Data.Odbc.OdbcCommand()
        Me.OdbcDataAdapter_Uebersicht = New Microsoft.Data.Odbc.OdbcDataAdapter()
        '
        'SqlSelectCommand1
        '
        Me.SqlSelectCommand1.CommandText = "SELECT TOP 100 dbo.priceComparePriceClicks.LieferantNr AS [Ihre Nummer], dbo.lief" & _
        "erantenAdressen.Firma, SUBSTRING(CONVERT(varchar, dbo.priceComparePriceClicks.Ti" & _
        "mestamp, 104), 4, 7) AS Monat, COUNT(dbo.priceComparePriceClicks.ArtNr) AS Anzah" & _
        "lClicks FROM dbo.priceComparePriceClicks INNER JOIN dbo.lieferantenAdressen ON d" & _
        "bo.priceComparePriceClicks.LieferantNr = dbo.lieferantenAdressen.IDNR WHERE (dbo" & _
        ".priceComparePriceClicks.LieferantNr = @param1) AND (dbo.priceComparePriceClicks" & _
        ".Timestamp IS NOT NULL) GROUP BY SUBSTRING(CONVERT(varchar, dbo.priceComparePric" & _
        "eClicks.Timestamp, 104), 4, 7), dbo.priceComparePriceClicks.LieferantNr, dbo.lie" & _
        "ferantenAdressen.Firma"
        Me.SqlSelectCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@param1", System.Data.SqlDbType.Int, 4, "Ihre Nummer"))
        '
        'SqlInsertCommand1
        '
        Me.SqlInsertCommand1.CommandText = "INSERT INTO webProductClicks(Id, ArtNr, CountClicks, FirstClick, LastClick, rowgu" & _
        "id) VALUES (@Id, @ArtNr, @CountClicks, @FirstClick, @LastClick, @rowguid); SELEC" & _
        "T Id, ArtNr, CountClicks, FirstClick, LastClick, rowguid FROM webProductClicks W" & _
        "HERE (Id = @Id)"
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Id", System.Data.SqlDbType.Int, 4, "Id"))
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ArtNr", System.Data.SqlDbType.Int, 4, "ArtNr"))
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@CountClicks", System.Data.SqlDbType.Int, 4, "CountClicks"))
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@FirstClick", System.Data.SqlDbType.DateTime, 8, "FirstClick"))
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@LastClick", System.Data.SqlDbType.DateTime, 8, "LastClick"))
        Me.SqlInsertCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@rowguid", System.Data.SqlDbType.UniqueIdentifier, 16, "rowguid"))
        '
        'SqlUpdateCommand1
        '
        Me.SqlUpdateCommand1.CommandText = "UPDATE webProductClicks SET Id = @Id, ArtNr = @ArtNr, CountClicks = @CountClicks," & _
        " FirstClick = @FirstClick, LastClick = @LastClick, rowguid = @rowguid WHERE (Id " & _
        "= @Original_Id) AND (ArtNr = @Original_ArtNr OR @Original_ArtNr IS NULL AND ArtN" & _
        "r IS NULL) AND (CountClicks = @Original_CountClicks OR @Original_CountClicks IS " & _
        "NULL AND CountClicks IS NULL) AND (FirstClick = @Original_FirstClick OR @Origina" & _
        "l_FirstClick IS NULL AND FirstClick IS NULL) AND (LastClick = @Original_LastClic" & _
        "k OR @Original_LastClick IS NULL AND LastClick IS NULL) AND (rowguid = @Original" & _
        "_rowguid); SELECT Id, ArtNr, CountClicks, FirstClick, LastClick, rowguid FROM we" & _
        "bProductClicks WHERE (Id = @Id)"
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Id", System.Data.SqlDbType.Int, 4, "Id"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ArtNr", System.Data.SqlDbType.Int, 4, "ArtNr"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@CountClicks", System.Data.SqlDbType.Int, 4, "CountClicks"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@FirstClick", System.Data.SqlDbType.DateTime, 8, "FirstClick"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@LastClick", System.Data.SqlDbType.DateTime, 8, "LastClick"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@rowguid", System.Data.SqlDbType.UniqueIdentifier, 16, "rowguid"))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Id", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Id", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ArtNr", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ArtNr", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_CountClicks", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CountClicks", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_FirstClick", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "FirstClick", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_LastClick", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "LastClick", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlUpdateCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_rowguid", System.Data.SqlDbType.UniqueIdentifier, 16, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "rowguid", System.Data.DataRowVersion.Original, Nothing))
        '
        'SqlDeleteCommand1
        '
        Me.SqlDeleteCommand1.CommandText = "DELETE FROM webProductClicks WHERE (Id = @Original_Id) AND (ArtNr = @Original_Art" & _
        "Nr OR @Original_ArtNr IS NULL AND ArtNr IS NULL) AND (CountClicks = @Original_Co" & _
        "untClicks OR @Original_CountClicks IS NULL AND CountClicks IS NULL) AND (FirstCl" & _
        "ick = @Original_FirstClick OR @Original_FirstClick IS NULL AND FirstClick IS NUL" & _
        "L) AND (LastClick = @Original_LastClick OR @Original_LastClick IS NULL AND LastC" & _
        "lick IS NULL) AND (rowguid = @Original_rowguid)"
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Id", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Id", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ArtNr", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ArtNr", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_CountClicks", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CountClicks", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_FirstClick", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "FirstClick", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_LastClick", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "LastClick", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlDeleteCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_rowguid", System.Data.SqlDbType.UniqueIdentifier, 16, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "rowguid", System.Data.DataRowVersion.Original, Nothing))
        '
        'SqlDataAdapter_Uebersicht
        '
        Me.SqlDataAdapter_Uebersicht.DeleteCommand = Me.SqlDeleteCommand1
        Me.SqlDataAdapter_Uebersicht.InsertCommand = Me.SqlInsertCommand1
        Me.SqlDataAdapter_Uebersicht.SelectCommand = Me.SqlSelectCommand1
        Me.SqlDataAdapter_Uebersicht.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "webProductClicks", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Id", "Id"), New System.Data.Common.DataColumnMapping("ArtNr", "ArtNr"), New System.Data.Common.DataColumnMapping("CountClicks", "CountClicks"), New System.Data.Common.DataColumnMapping("FirstClick", "FirstClick"), New System.Data.Common.DataColumnMapping("LastClick", "LastClick"), New System.Data.Common.DataColumnMapping("rowguid", "rowguid")})})
        Me.SqlDataAdapter_Uebersicht.UpdateCommand = Me.SqlUpdateCommand1
        '
        'SqlDataAdapter_ProduktClicks
        '
        Me.SqlDataAdapter_ProduktClicks.DeleteCommand = Me.SqlCommand1
        Me.SqlDataAdapter_ProduktClicks.InsertCommand = Me.SqlCommand2
        Me.SqlDataAdapter_ProduktClicks.SelectCommand = Me.SqlCommandProduktClicks
        Me.SqlDataAdapter_ProduktClicks.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "webProductClicks", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Id", "Id"), New System.Data.Common.DataColumnMapping("ArtNr", "ArtNr"), New System.Data.Common.DataColumnMapping("CountClicks", "CountClicks"), New System.Data.Common.DataColumnMapping("FirstClick", "FirstClick"), New System.Data.Common.DataColumnMapping("LastClick", "LastClick"), New System.Data.Common.DataColumnMapping("rowguid", "rowguid")})})
        Me.SqlDataAdapter_ProduktClicks.UpdateCommand = Me.SqlCommand4
        '
        'SqlCommand1
        '
        Me.SqlCommand1.CommandText = "DELETE FROM webProductClicks WHERE (Id = @Original_Id) AND (ArtNr = @Original_Art" & _
        "Nr OR @Original_ArtNr IS NULL AND ArtNr IS NULL) AND (CountClicks = @Original_Co" & _
        "untClicks OR @Original_CountClicks IS NULL AND CountClicks IS NULL) AND (FirstCl" & _
        "ick = @Original_FirstClick OR @Original_FirstClick IS NULL AND FirstClick IS NUL" & _
        "L) AND (LastClick = @Original_LastClick OR @Original_LastClick IS NULL AND LastC" & _
        "lick IS NULL) AND (rowguid = @Original_rowguid)"
        Me.SqlCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Id", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Id", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ArtNr", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ArtNr", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_CountClicks", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CountClicks", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_FirstClick", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "FirstClick", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_LastClick", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "LastClick", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlCommand1.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_rowguid", System.Data.SqlDbType.UniqueIdentifier, 16, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "rowguid", System.Data.DataRowVersion.Original, Nothing))
        '
        'SqlCommand2
        '
        Me.SqlCommand2.CommandText = "INSERT INTO webProductClicks(Id, ArtNr, CountClicks, FirstClick, LastClick, rowgu" & _
        "id) VALUES (@Id, @ArtNr, @CountClicks, @FirstClick, @LastClick, @rowguid); SELEC" & _
        "T Id, ArtNr, CountClicks, FirstClick, LastClick, rowguid FROM webProductClicks W" & _
        "HERE (Id = @Id)"
        Me.SqlCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Id", System.Data.SqlDbType.Int, 4, "Id"))
        Me.SqlCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ArtNr", System.Data.SqlDbType.Int, 4, "ArtNr"))
        Me.SqlCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@CountClicks", System.Data.SqlDbType.Int, 4, "CountClicks"))
        Me.SqlCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@FirstClick", System.Data.SqlDbType.DateTime, 8, "FirstClick"))
        Me.SqlCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@LastClick", System.Data.SqlDbType.DateTime, 8, "LastClick"))
        Me.SqlCommand2.Parameters.Add(New System.Data.SqlClient.SqlParameter("@rowguid", System.Data.SqlDbType.UniqueIdentifier, 16, "rowguid"))
        '
        'SqlCommandProduktClicks
        '
        Me.SqlCommandProduktClicks.CommandText = "SELECT TOP 100 dbo.priceComparePriceClicks.LieferantNr AS [Ihre Nummer], dbo.lief" & _
        "erantenAdressen.Firma, SUBSTRING(CONVERT(varchar, dbo.priceComparePriceClicks.Ti" & _
        "mestamp, 104), 4, 7) AS Monat, dbo.priceComparePriceClicks.ArtNr AS Artikel#, db" & _
        "o.grArtikel.Bezeichnung AS Produktbezeichnung, COUNT(dbo.priceComparePriceClicks" & _
        ".ArtNr) AS AnzahlClicks, ROUND(1 * AVG(1 * dbo.priceComparePriceClicks.ArtikelPr" & _
        "eis), 2) AS Durchschnittspreis FROM dbo.priceComparePriceClicks INNER JOIN dbo.g" & _
        "rArtikel ON dbo.priceComparePriceClicks.ArtNr = dbo.grArtikel.ArtNr INNER JOIN d" & _
        "bo.lieferantenAdressen ON dbo.priceComparePriceClicks.LieferantNr = dbo.lieferan" & _
        "tenAdressen.IDNR WHERE (dbo.priceComparePriceClicks.LieferantNr = @param1) AND (" & _
        "dbo.priceComparePriceClicks.Timestamp IS NOT NULL) GROUP BY SUBSTRING(CONVERT(va" & _
        "rchar, dbo.priceComparePriceClicks.Timestamp, 104), 4, 7), dbo.priceComparePrice" & _
        "Clicks.ArtNr, dbo.priceComparePriceClicks.LieferantNr, dbo.grArtikel.Bezeichnung" & _
        ", dbo.lieferantenAdressen.Firma ORDER BY SUBSTRING(CONVERT(varchar, dbo.priceCom" & _
        "parePriceClicks.Timestamp, 104), 4, 7), COUNT(dbo.priceComparePriceClicks.ArtNr)" & _
        " DESC"
        Me.SqlCommandProduktClicks.Parameters.Add(New System.Data.SqlClient.SqlParameter("@param1", System.Data.SqlDbType.Int, 4, "Ihre Nummer"))
        '
        'SqlCommand4
        '
        Me.SqlCommand4.CommandText = "UPDATE webProductClicks SET Id = @Id, ArtNr = @ArtNr, CountClicks = @CountClicks," & _
        " FirstClick = @FirstClick, LastClick = @LastClick, rowguid = @rowguid WHERE (Id " & _
        "= @Original_Id) AND (ArtNr = @Original_ArtNr OR @Original_ArtNr IS NULL AND ArtN" & _
        "r IS NULL) AND (CountClicks = @Original_CountClicks OR @Original_CountClicks IS " & _
        "NULL AND CountClicks IS NULL) AND (FirstClick = @Original_FirstClick OR @Origina" & _
        "l_FirstClick IS NULL AND FirstClick IS NULL) AND (LastClick = @Original_LastClic" & _
        "k OR @Original_LastClick IS NULL AND LastClick IS NULL) AND (rowguid = @Original" & _
        "_rowguid); SELECT Id, ArtNr, CountClicks, FirstClick, LastClick, rowguid FROM we" & _
        "bProductClicks WHERE (Id = @Id)"
        Me.SqlCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Id", System.Data.SqlDbType.Int, 4, "Id"))
        Me.SqlCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ArtNr", System.Data.SqlDbType.Int, 4, "ArtNr"))
        Me.SqlCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@CountClicks", System.Data.SqlDbType.Int, 4, "CountClicks"))
        Me.SqlCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@FirstClick", System.Data.SqlDbType.DateTime, 8, "FirstClick"))
        Me.SqlCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@LastClick", System.Data.SqlDbType.DateTime, 8, "LastClick"))
        Me.SqlCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@rowguid", System.Data.SqlDbType.UniqueIdentifier, 16, "rowguid"))
        Me.SqlCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_Id", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Id", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_ArtNr", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ArtNr", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_CountClicks", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CountClicks", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_FirstClick", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "FirstClick", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_LastClick", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "LastClick", System.Data.DataRowVersion.Original, Nothing))
        Me.SqlCommand4.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_rowguid", System.Data.SqlDbType.UniqueIdentifier, 16, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "rowguid", System.Data.DataRowVersion.Original, Nothing))
        '
        'OdbcDataAdapter_ProduktClicks
        '
        Me.OdbcDataAdapter_ProduktClicks.AcceptChangesDuringFill = False
        Me.OdbcDataAdapter_ProduktClicks.ContinueUpdateOnError = True
        Me.OdbcDataAdapter_ProduktClicks.SelectCommand = Me.OdbcCommand_Select_ProduktClicks
        '
        'OdbcCommand_Select_ProduktClicks
        '
        Me.OdbcCommand_Select_ProduktClicks.CommandText = "SELECT la.idnr AS 'Ihre Nummer' , la.Firma AS 'Firma', DATE_FORMAT(pcc.TIMESTAMP," & _
        "'%m-%y') AS 'Monat', lap.ArtikelNr AS 'Artikel#', lap.Bezeichnung AS 'Produktbez" & _
        "eichnung', COUNT(pcc.TIMESTAMP) AS AnzahlClicks,AVG(lap.vkpreis) AS Durchschnitt" & _
        "spreis FROM pricecomparepriceclicks pcc, lieferantenAdressen la, `lieferantenArt" & _
        "ikel-Preise` lap WHERE pcc.lieferantnr = la.idnr  AND  pcc.ArtNr = lap.ArtikelNr" & _
        " AND  la.idnr = lap.LieferantNr and la.idnr = @idnr GROUP by   la.idnr , la.Firm" & _
        "a, MONTH(pcc.TIMESTAMP), lap.ArtikelNr , lap.Bezeichnung ORDER BY DATE_FORMAT(pc" & _
        "c.TIMESTAMP,'%m-%y') DESC , lap.Bezeichnung ASC"
        Me.OdbcCommand_Select_ProduktClicks.Connection = Me.OdbcConn
        Me.OdbcCommand_Select_ProduktClicks.Parameters.Add(New Microsoft.Data.Odbc.OdbcParameter("IDNR", Microsoft.Data.Odbc.OdbcType.NVarChar))
        '
        'OdbcConn
        '
        Me.OdbcConn.ConnectionString = CType(configurationAppSettings.GetValue("Database.MyDNS.MySQL", GetType(System.String)), String)
        '
        'OdbcCommand_Select_Uebersicht
        '
        Me.OdbcCommand_Select_Uebersicht.CommandText = "SELECT la.idnr as 'Ihre Nummer' , la.Firma as 'Firma', DATE_FORMAT(pcc.TIMESTAMP," & _
        "'%m-%y') as 'Monat', count(pcc.artnr) as AnzahlClicks FROM pricecomparepriceclic" & _
        "ks pcc, lieferantenAdressen la WHERE pcc.lieferantnr = la.idnr and la.idnr = @ID" & _
        "NR group by   la.idnr , la.Firma, DATE_FORMAT(pcc.TIMESTAMP,'%m-%y') ORDER BY DA" & _
        "TE_FORMAT(pcc.TIMESTAMP,'%m-%y') DESC"
        Me.OdbcCommand_Select_Uebersicht.Connection = Me.OdbcConn
        Me.OdbcCommand_Select_Uebersicht.Parameters.Add(New Microsoft.Data.Odbc.OdbcParameter("IDNR", Microsoft.Data.Odbc.OdbcType.NVarChar, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "", System.Data.DataRowVersion.Current, "1268"))
        '
        'OdbcDataAdapter_Uebersicht
        '
        Me.OdbcDataAdapter_Uebersicht.SelectCommand = Me.OdbcCommand_Select_Uebersicht

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        Me.txtLieferantNr.Text = "" & Session("LieferantNr").ToString() ' set in login page
        If Me.txtLieferantNr.Text = "" Then
            Response.Write("LieferantNr is not provided!")
            Response.End()
        Else
            Call loaddata()
        End If
    End Sub

 
    Sub loaddata()
        Me.OdbcConn.Open()

        Dim dt As DataTable : dt = New DataTable()
        Me.OdbcDataAdapter_Uebersicht.SelectCommand.Parameters(0).Value = CInt(Me.txtLieferantNr.Text)
        Me.OdbcDataAdapter_Uebersicht.Fill(dt)
        Me.DataGrid_Angebote.DataSource = dt
        Me.DataGrid_Angebote.DataBind()


        Dim dt1 As DataTable : dt1 = New DataTable()
        Me.OdbcCommand_Select_ProduktClicks.Parameters(0).Value = CInt(Me.txtLieferantNr.Text)
        Me.OdbcDataAdapter_ProduktClicks.Fill(dt1)
        Me.Datagrid_Clicks.DataSource = dt1
        Me.Datagrid_Clicks.DataBind()

        Me.OdbcConn.Close()
    End Sub
    Private Sub txtLieferantNr_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtLieferantNr.TextChanged

    End Sub

    Private Sub SqlDataAdapter_ProduktClicks_RowUpdated(ByVal sender As System.Object, ByVal e As System.Data.SqlClient.SqlRowUpdatedEventArgs) Handles SqlDataAdapter_ProduktClicks.RowUpdated

    End Sub

    Private Sub DataGrid_Angebote_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub Datagrid_Clicks_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Datagrid_Clicks.SelectedIndexChanged

    End Sub

    
    Private Sub btnLoad_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLoad.Click
        Call loaddata()
    End Sub
End Class
