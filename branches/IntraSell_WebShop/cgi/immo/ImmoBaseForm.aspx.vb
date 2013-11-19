Public Class ImmoBaseForm
    Inherits System.Web.UI.Page

#Region " Vom Web Form Designer generierter Code "

    'Dieser Aufruf ist für den Web Form-Designer erforderlich.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'HINWEIS: Die folgende Platzhalterdeklaration ist für den Web Form-Designer erforderlich.
    'Nicht löschen oder verschieben.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: Dieser Methodenaufruf ist für den Web Form-Designer erforderlich
        'Verwenden Sie nicht den Code-Editor zur Bearbeitung.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        ' Hier Benutzercode zur Seiteninitialisierung einfügen
    End Sub
    Public Function prepareSQL(ByVal rawSQL As String) As String
        prepareSQL = Replace(Replace(rawSQL, "[", "`"), "]", "`")
    End Function


    Public Function getGruppeName(ByVal artNr As String, ByVal gruppe As String, ByVal connString As String)
        Dim sql As String = prepareSQL("Select GruppeName from [grArtikel-KeyWords] WHERE " & _
                " ArtKatNr = (select artKatNr from grArtikel where ArtNr=" & artNr & ") " & _
                " and [Gruppe] Like '" & gruppe & "' Group by GruppeName;")
        Dim isDb As IntraSellDB = New IntraSellDB
        isDb.objConnection.ConnectionString = connString
        isDb.objConnection.Open()
        getGruppeName = isDb.firstValue(sql)
        isDb.objConnection.Close()
    End Function

End Class
