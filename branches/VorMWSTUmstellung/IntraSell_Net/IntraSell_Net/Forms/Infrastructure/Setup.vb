Imports System.Configuration
Imports System.Xml
Public Class Setup

    Dim CONN_STRING_TEMPLATE = "Server=#SERVER#;Port=#PORT#;User Id=#USERNAME#;password=#PASSWORD#;Persist Security Info=True;Database=#DATABASE#;"

    Private Sub ButtonSetUpMySQL_Click(sender As System.Object, e As System.EventArgs) Handles ButtonSetUpMySQL.Click
        SetUpMySqlServer()
    End Sub


    Private Sub Setup_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'Load from app.config 
        'conn string = server=localhost;User Id=root;password=a1060;Persist Security Info=True;database=intrasell_daten_2
        Dim connStr = Global.IntraSell_Net.My.MySettings.Default.intrasell_daten_2_ConnectionString

        Me.TextBox1.Text = extract(connStr, "server")
        Me.TextBox2.Text = extract(connStr, "User Id")
        Me.TextBox3.Text = extract(connStr, "password")
        Me.TextBox4.Text = extract(connStr, "Port")
        Me.TextBox5.Text = extract(connStr, "database")
    End Sub


    Private Sub ButtonConnect_Click(sender As System.Object, e As System.EventArgs) Handles ButtonConnect.Click
        'Build CString
        Dim cTest As String = CONN_STRING_TEMPLATE
        cTest = Replace(cTest, "#SERVER#", Me.TextBox1.Text)
        cTest = Replace(cTest, "#USERNAME#", Me.TextBox2.Text)
        cTest = Replace(cTest, "#PASSWORD#", Me.TextBox3.Text)
        cTest = Replace(cTest, "#PORT#", Me.TextBox4.Text)
        cTest = Replace(cTest, "#DATABASE#", Me.TextBox5.Text)
        'CHECK CONN 
        Dim c As MySql.Data.MySqlClient.MySqlConnection = New MySql.Data.MySqlClient.MySqlConnection(cTest)
        Try

            c.Open()
            setConnState(True)
        Catch ex As Exception
            setConnState(False)
            MsgBox(ex.Message, vbCritical)
            Exit Sub
        End Try

        'SAVE
        AppConfigFileSettings.UpdateAppSettings("IntraSell_Net.My.MySettings.intrasell_daten_2_ConnectionString", cTest)
        IntraSell_Net.My.Settings.Reload()

    End Sub

#Region "Update App.config"


    '// Class Name: AppConfigFileSettings
    '// Purpose: To Change appSettings Values


    ''' <summary>
    ''' AppConfigFileSettings: This class is used to Change the 
    ''' AppConfigs Parameters at runtime through User Interface
    ''' </summary>
    ''' <remarks></remarks>
    Public Class AppConfigFileSettings
        ''' <summary>
        ''' UpdateAppSettings: It will update the app.Config file AppConfig key values
        ''' </summary>
        ''' <param name="KeyName">AppConfigs KeyName</param>
        ''' <param name="KeyValue">AppConfigs KeyValue</param>
        ''' <remarks></remarks>
        Public Shared Sub UpdateAppSettings(ByVal KeyName As String, ByVal KeyValue As String)
            '  AppDomain.CurrentDomain.SetupInformation.ConfigurationFile 
            ' This will get the app.config file path from Current application Domain
            Dim XmlDoc As New XmlDocument()
            ' Load XML Document
            XmlDoc.Load(AppDomain.CurrentDomain.SetupInformation.ConfigurationFile)
            ' Navigate Each XML Element of app.Config file
            For Each xElement As XmlElement In XmlDoc.DocumentElement
                If xElement.Name = "connectionStrings" Then
                    ' Loop each node of appSettings Element 
                    ' xNode.Attributes(0).Value , Mean First Attributes of Node , 
                    ' KeyName Portion
                    ' xNode.Attributes(1).Value , Mean Second Attributes of Node,
                    ' KeyValue Portion
                    For Each xNode As XmlNode In xElement.ChildNodes
                        If xNode.Attributes(0).Value = KeyName Then
                            xNode.Attributes(1).Value = KeyValue
                        End If
                    Next
                End If
            Next
            ' Save app.config file
            XmlDoc.Save(AppDomain.CurrentDomain.SetupInformation.ConfigurationFile)
        End Sub
    End Class

#End Region

    'REturn the value for the argument 
    Private Function extract(connStr As String, paramName As String) As String
        For Each s In Split(connStr, ";")
            If s.Contains(paramName) Then
                Return s.Split("=")(1)
            End If
        Next
        Return Nothing
    End Function

    Private Sub setConnState(p1 As Boolean)
        Me.TextBox1.ForeColor = IIf(p1, Color.Green, Color.Red)
        Me.TextBox2.ForeColor = Me.TextBox1.ForeColor
        Me.TextBox3.ForeColor = Me.TextBox1.ForeColor
        Me.TextBox4.ForeColor = Me.TextBox1.ForeColor
        Me.TextBox5.ForeColor = Me.TextBox1.ForeColor
    End Sub

End Class