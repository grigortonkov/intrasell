﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated by a tool.
'     Runtime Version:4.0.30319.34209
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On


Namespace My
    
    <Global.System.Runtime.CompilerServices.CompilerGeneratedAttribute(),  _
     Global.System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "10.0.0.0"),  _
     Global.System.ComponentModel.EditorBrowsableAttribute(Global.System.ComponentModel.EditorBrowsableState.Advanced)>  _
    Partial Friend NotInheritable Class MySettings
        Inherits Global.System.Configuration.ApplicationSettingsBase
        
        Private Shared defaultInstance As MySettings = CType(Global.System.Configuration.ApplicationSettingsBase.Synchronized(New MySettings()),MySettings)
        
#Region "My.Settings Auto-Save Functionality"
#If _MyType = "WindowsForms" Then
    Private Shared addedHandler As Boolean

    Private Shared addedHandlerLockObject As New Object

    <Global.System.Diagnostics.DebuggerNonUserCodeAttribute(), Global.System.ComponentModel.EditorBrowsableAttribute(Global.System.ComponentModel.EditorBrowsableState.Advanced)> _
    Private Shared Sub AutoSaveSettings(ByVal sender As Global.System.Object, ByVal e As Global.System.EventArgs)
        If My.Application.SaveMySettingsOnExit Then
            My.Settings.Save()
        End If
    End Sub
#End If
#End Region
        
        Public Shared ReadOnly Property [Default]() As MySettings
            Get
                
#If _MyType = "WindowsForms" Then
               If Not addedHandler Then
                    SyncLock addedHandlerLockObject
                        If Not addedHandler Then
                            AddHandler My.Application.Shutdown, AddressOf AutoSaveSettings
                            addedHandler = True
                        End If
                    End SyncLock
                End If
#End If
                Return defaultInstance
            End Get
        End Property
        
        <Global.System.Configuration.ApplicationScopedSettingAttribute(),  _
         Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
         Global.System.Configuration.SpecialSettingAttribute(Global.System.Configuration.SpecialSetting.ConnectionString),  _
         Global.System.Configuration.DefaultSettingValueAttribute("server=localhost;User Id=root;password=a1060;Persist Security Info=True;database="& _ 
            "intrasell_daten_2")>  _
        Public ReadOnly Property intrasell_daten_2ConnectionString() As String
            Get
                Return CType(Me("intrasell_daten_2ConnectionString"),String)
            End Get
        End Property
        
        <Global.System.Configuration.UserScopedSettingAttribute(),  _
         Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
         Global.System.Configuration.DefaultSettingValueAttribute("2")>  _
        Public Property MandantNr() As String
            Get
                Return CType(Me("MandantNr"),String)
            End Get
            Set
                Me("MandantNr") = value
            End Set
        End Property
        
        <Global.System.Configuration.UserScopedSettingAttribute(),  _
         Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
         Global.System.Configuration.DefaultSettingValueAttribute("z:\Business\IntraSell_System\IntraSell_WebShop_2008\WebShop_2008\productImages\")>  _
        Public Property productimages() As String
            Get
                Return CType(Me("productimages"),String)
            End Get
            Set
                Me("productimages") = value
            End Set
        End Property
        
        <Global.System.Configuration.UserScopedSettingAttribute(),  _
         Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
         Global.System.Configuration.DefaultSettingValueAttribute("z:\Business\IntraSell_System\IntraSell_WebShop_2008\WebShop_2008\productImages_La"& _ 
            "rge\")>  _
        Public Property productimagesLarge() As String
            Get
                Return CType(Me("productimagesLarge"),String)
            End Get
            Set
                Me("productimagesLarge") = value
            End Set
        End Property
        
        <Global.System.Configuration.UserScopedSettingAttribute(),  _
         Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
         Global.System.Configuration.DefaultSettingValueAttribute("Z:\Business\IntraSell_System\IntraSell_Net\MagentoSync\bin\Debug\")>  _
        Public Property SyncFolder() As String
            Get
                Return CType(Me("SyncFolder"),String)
            End Get
            Set
                Me("SyncFolder") = value
            End Set
        End Property
        
        <Global.System.Configuration.UserScopedSettingAttribute(),  _
         Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
         Global.System.Configuration.DefaultSettingValueAttribute("300")>  _
        Public Property SyncIntervalSeconds() As String
            Get
                Return CType(Me("SyncIntervalSeconds"),String)
            End Get
            Set
                Me("SyncIntervalSeconds") = value
            End Set
        End Property
        
        <Global.System.Configuration.UserScopedSettingAttribute(),  _
         Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
         Global.System.Configuration.DefaultSettingValueAttribute("1")>  _
        Public Property Magento_product_status() As String
            Get
                Return CType(Me("Magento_product_status"),String)
            End Get
            Set
                Me("Magento_product_status") = value
            End Set
        End Property
        
        <Global.System.Configuration.UserScopedSettingAttribute(),  _
         Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
         Global.System.Configuration.DefaultSettingValueAttribute("4")>  _
        Public Property Magento_product_visibility() As String
            Get
                Return CType(Me("Magento_product_visibility"),String)
            End Get
            Set
                Me("Magento_product_visibility") = value
            End Set
        End Property
        
        <Global.System.Configuration.UserScopedSettingAttribute(),  _
         Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
         Global.System.Configuration.DefaultSettingValueAttribute("gtonkov")>  _
        Public Property Magento_username() As String
            Get
                Return CType(Me("Magento_username"),String)
            End Get
            Set
                Me("Magento_username") = value
            End Set
        End Property
        
        <Global.System.Configuration.UserScopedSettingAttribute(),  _
         Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
         Global.System.Configuration.DefaultSettingValueAttribute("abc123456")>  _
        Public Property Magento_password() As String
            Get
                Return CType(Me("Magento_password"),String)
            End Get
            Set
                Me("Magento_password") = value
            End Set
        End Property
        
        <Global.System.Configuration.UserScopedSettingAttribute(),  _
         Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
         Global.System.Configuration.DefaultSettingValueAttribute("de")>  _
        Public Property Magento_product_storeview() As String
            Get
                Return CType(Me("Magento_product_storeview"),String)
            End Get
            Set
                Me("Magento_product_storeview") = value
            End Set
        End Property
        
        <Global.System.Configuration.UserScopedSettingAttribute(),  _
         Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
         Global.System.Configuration.DefaultSettingValueAttribute("1")>  _
        Public Property Magento_product_tax_class_id() As String
            Get
                Return CType(Me("Magento_product_tax_class_id"),String)
            End Get
            Set
                Me("Magento_product_tax_class_id") = value
            End Set
        End Property
        
        <Global.System.Configuration.UserScopedSettingAttribute(),  _
         Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
         Global.System.Configuration.DefaultSettingValueAttribute("1-Letztverbraucher")>  _
        Public Property PreislisteNotLoggedIn() As String
            Get
                Return CType(Me("PreislisteNotLoggedIn"),String)
            End Get
            Set
                Me("PreislisteNotLoggedIn") = value
            End Set
        End Property
        
        <Global.System.Configuration.UserScopedSettingAttribute(),  _
         Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
         Global.System.Configuration.DefaultSettingValueAttribute(""&Global.Microsoft.VisualBasic.ChrW(13)&Global.Microsoft.VisualBasic.ChrW(10)&"                  NOT LOGGED IN=NOT LOGGED IN;"&Global.Microsoft.VisualBasic.ChrW(13)&Global.Microsoft.VisualBasic.ChrW(10)&"                  1-Letztverbra"& _ 
            "ucher=1-Letztverbraucher;"&Global.Microsoft.VisualBasic.ChrW(13)&Global.Microsoft.VisualBasic.ChrW(10)&"                  2-GH-Kunden Inland=2-GH-Kunden Inla"& _ 
            "nd;"&Global.Microsoft.VisualBasic.ChrW(13)&Global.Microsoft.VisualBasic.ChrW(10)&"                  3-Exportkunden DE=3-Exportkunden DE;"&Global.Microsoft.VisualBasic.ChrW(13)&Global.Microsoft.VisualBasic.ChrW(10)&"                  4"& _ 
            "-Exportkunden EUROPA=4-Exportkunden EUROPA;"&Global.Microsoft.VisualBasic.ChrW(13)&Global.Microsoft.VisualBasic.ChrW(10)&"                  5-Pros Pro=5-Pros"& _ 
            " Pro;"&Global.Microsoft.VisualBasic.ChrW(13)&Global.Microsoft.VisualBasic.ChrW(10)&"                  checkmo=Vorkasse;"&Global.Microsoft.VisualBasic.ChrW(13)&Global.Microsoft.VisualBasic.ChrW(10)&"                  paypal_standard=Pa"& _ 
            "ypal;"&Global.Microsoft.VisualBasic.ChrW(13)&Global.Microsoft.VisualBasic.ChrW(10)&"                  wirecard_checkout_page_cc=Creditcard;"&Global.Microsoft.VisualBasic.ChrW(13)&Global.Microsoft.VisualBasic.ChrW(10)&"                "& _ 
            "  wirecard_checkout_page_sofortueberweisung=Sofortüberweisung;"&Global.Microsoft.VisualBasic.ChrW(13)&Global.Microsoft.VisualBasic.ChrW(10)&"                "& _ 
            "")>  _
        Public Property Mappings() As String
            Get
                Return CType(Me("Mappings"),String)
            End Get
            Set
                Me("Mappings") = value
            End Set
        End Property
    End Class
End Namespace

Namespace My
    
    <Global.Microsoft.VisualBasic.HideModuleNameAttribute(),  _
     Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
     Global.System.Runtime.CompilerServices.CompilerGeneratedAttribute()>  _
    Friend Module MySettingsProperty
        
        <Global.System.ComponentModel.Design.HelpKeywordAttribute("My.Settings")>  _
        Friend ReadOnly Property Settings() As Global.MagentoSync.My.MySettings
            Get
                Return Global.MagentoSync.My.MySettings.Default
            End Get
        End Property
    End Module
End Namespace
