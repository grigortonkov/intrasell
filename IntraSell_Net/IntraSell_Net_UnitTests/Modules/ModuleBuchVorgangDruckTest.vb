﻿Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net
Imports IntraSell_DLL


'''<summary>
'''This is a test class for ModuleBuchVorgangDruckTest and is intended
'''to contain all ModuleBuchVorgangDruckTest Unit Tests
'''</summary>
<TestClass()> _
Public Class ModuleBuchVorgangDruckTest


    Private testContextInstance As TestContext

    '''<summary>
    '''Gets or sets the test context which provides
    '''information about and functionality for the current test run.
    '''</summary>
    Public Property TestContext() As TestContext
        Get
            Return testContextInstance
        End Get
        Set(value As TestContext)
            testContextInstance = Value
        End Set
    End Property

#Region "Additional test attributes"
    '
    'You can use the following additional attributes as you write your tests:
    '
    'Use ClassInitialize to run code before running the first test in the class
    <ClassInitialize()> _
    Public Shared Sub MyClassInitialize(ByVal testContext As TestContext)
        DBTest.MyClassInitialize(testContext)
    End Sub
    '
    'Use ClassCleanup to run code after all tests in a class have run
    '<ClassCleanup()>  _
    'Public Shared Sub MyClassCleanup()
    'End Sub
    '
    'Use TestInitialize to run code before running each test
    '<TestInitialize()>  _
    'Public Sub MyTestInitialize()
    'End Sub
    '
    'Use TestCleanup to run code after each test has run
    '<TestCleanup()>  _
    'Public Sub MyTestCleanup()
    'End Sub
    '
#End Region


    '''<summary>
    '''A test for OpenAusdruck_inWord_Filename
    '''</summary>
    <TestMethod()> _
    Public Sub OpenAusdruck_inWord_FilenameTest()
        Dim VorgangNummer As Long = buchvorgangTableAdapterTest.VORGANG_NUMMER_AR_1
        Dim VorgangTyp As String = buchvorgangTableAdapterTest.VORGANG_TYP_AR_1
        Dim Dateiname As String = "Vorlagen\Vorlage_Rechnung.rtf"
        ModuleBuchVorgangDruck.OpenAusdruck_inWord_Filename(VorgangTyp, VorgangNummer, Dateiname, True)
        'Assert.Inconclusive("A method that does not return a value cannot be verified.")
    End Sub
End Class
