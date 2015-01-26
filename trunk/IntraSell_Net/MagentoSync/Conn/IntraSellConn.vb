Imports IntraSell_Net
Imports IntraSell_DLL

Public Class IntraSellConn
    Public client

    Public vars As IntraSell_DLL.IntraSellVars = New IntraSellVars
    Public kunden As IntraSell_DLL.IntraSellKunden = New IntraSellKunden
    Public dictionary As IntraSell_DLL.IntraSellDictionary = New IntraSellDictionary

    Public Sub init()
        ModuleLog.Log("Init IntraSell")
        vars.init(MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString)
        kunden.init(MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString)
        dictionary.init(MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString)

        InitConnection()
    End Sub


    Sub OpenConn()
        ModuleLog.Log("Open IntraSell")
        Dim ta As dsAdressenTableAdapters.ofadressenTableAdapter = New dsAdressenTableAdapters.ofadressenTableAdapter
        Dim data As dsAdressen.ofadressenDataTable = New dsAdressen.ofadressenDataTable
        ta.Connection.ConnectionString = MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString
        ta.FillByIDNR(data, 0)

    End Sub

    Sub CloseConn()
        ModuleLog.Log("Close IntraSell")
    End Sub

    ''' <summary>
    ''' My SQL Connection
    ''' </summary>
    ''' <remarks></remarks>
    Private _connection As Global.MySql.Data.MySqlClient.MySqlConnection

    ''' <summary>
    ''' Init new Connection 
    ''' </summary>
    ''' <remarks></remarks>
    Private Sub InitConnection()
        If _connection Is Nothing Then
            Me._connection = New Global.MySql.Data.MySqlClient.MySqlConnection()
            Me._connection.ConnectionString = MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString
        End If
    End Sub


    Public Function MySQLConn() As Global.MySql.Data.MySqlClient.MySqlConnection
        Return _connection
    End Function

End Class
