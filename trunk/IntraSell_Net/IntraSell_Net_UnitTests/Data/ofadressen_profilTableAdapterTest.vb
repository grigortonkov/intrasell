Imports System

Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net.dsAdressenProfilTableAdapters



'''<summary>
'''This is a test class for ofadressen_profilTableAdapterTest and is intended
'''to contain all ofadressen_profilTableAdapterTest Unit Tests
'''</summary>
<TestClass()> _
Public Class ofadressen_profilTableAdapterTest


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
    '''A test for Insert
    '''</summary>
    <TestMethod()> _
    Public Sub ofAdressenProfil_InsertTest()
        Dim target As ofadressen_profilTableAdapter = New ofadressen_profilTableAdapter()
        Dim IDNR As Integer = 100
        Dim Name As String = "Anzahl Mitarbeiter"
        Dim Wert As String = "150"
        Dim AngelegtAm As DateTime = DateTime.Today
        Dim expected As Integer = 1
        Dim actual As Integer
        actual = target.Insert(IDNR, Name, Wert, AngelegtAm)
        Assert.AreEqual(expected, actual)

    End Sub

    '''<summary>
    '''A test for Update
    '''</summary>
    <TestMethod()> _
    Public Sub ofAdressenProfil_UpdateTest()
        Dim target As ofadressen_profilTableAdapter = New ofadressen_profilTableAdapter()
        Dim IDNR As Integer = 100
        Dim Name As String = "Anzahl Mitarbeiter"
        Dim Wert As String = "160"
        Dim AngelegtAm As DateTime = DateTime.Today
        Dim Original_ID As UInteger = 1
        
        Dim expected As Integer = 1
        Dim actual As Integer
        actual = target.Update(IDNR, Name, Wert, AngelegtAm, Original_ID)
        Assert.AreEqual(expected, actual)

    End Sub

    '''<summary>
    '''A test for Delete
    '''</summary>
    <TestMethod()> _
    Public Sub ofAdressenProfil_DeleteTest()
        Dim target As ofadressen_profilTableAdapter = New ofadressen_profilTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Original_ID As UInteger = 1
        
        Dim expected As Integer = 1
        Dim actual As Integer
        actual = target.Delete(Original_ID)
        Assert.AreEqual(expected, actual)

    End Sub


End Class
