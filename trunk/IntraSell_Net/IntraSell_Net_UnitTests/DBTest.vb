Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net
Imports IntraSell_DLL

Public Class DBTest
    'Use ClassInitialize to run code before running the first test in the class
    <ClassInitialize()> _
    Public Shared Sub MyClassInitialize(ByVal testContext As TestContext)
        FunctionsDB.CurrentDB = New MySql.Data.MySqlClient.MySqlConnection(Global.IntraSell_Net.My.MySettings.Default.intrasell_daten_2_ConnectionString)
        ModuleCommons.appPath = "z:\Business\IntraSell_System\IntraSell_Net\IntraSell_Net\bin\Debug\"
    End Sub


    <TestInitialize()> _
    Public Sub MyTestInitialize()
        FunctionsDB.CurrentDB = New MySql.Data.MySqlClient.MySqlConnection(Global.IntraSell_Net.My.MySettings.Default.intrasell_daten_2_ConnectionString)
        ModuleCommons.appPath = "z:\Business\IntraSell_System\IntraSell_Net\IntraSell_Net\bin\Debug\"
    End Sub
End Class
