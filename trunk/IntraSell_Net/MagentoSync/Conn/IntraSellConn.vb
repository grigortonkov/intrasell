﻿Imports IntraSell_Net
Imports IntraSell_DLL

Public Class IntraSellConn
    Public client

    Public vars As IntraSell_DLL.IntraSellVars = New IntraSellVars
    Public kunden As IntraSell_DLL.IntraSellKunden = New IntraSellKunden

    Public Sub init()
        ModuleLog.Log("Init IntraSell")
        vars.init(MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString)
        kunden.init(MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString)
    End Sub


    Sub OpenConn()
        ModuleLog.Log("Open IntraSell")
        Dim ta As dsAdressenTableAdapters.ofadressenTableAdapter = New dsAdressenTableAdapters.ofadressenTableAdapter
        Dim data As dsAdressen.ofadressenDataTable = New dsAdressen.ofadressenDataTable
        ta.Fill(data)
    End Sub

    Sub CloseConn()
        ModuleLog.Log("Close IntraSell")
    End Sub

End Class