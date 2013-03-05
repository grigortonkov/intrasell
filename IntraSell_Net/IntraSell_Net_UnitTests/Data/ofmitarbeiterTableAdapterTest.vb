Imports System

Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net.dsMitarbeiterTableAdapters



'''<summary>
'''This is a test class for ofmitarbeiterTableAdapterTest and is intended
'''to contain all ofmitarbeiterTableAdapterTest Unit Tests
'''</summary>
<TestClass()> _
Public Class ofmitarbeiterTableAdapterTest


    Private testContextInstance As TestContext

    '''<summary>
    '''Gets or sets the test context which provides
    '''information about and functionality for the current test run.
    '''</summary>
    Public Property TestContext() As TestContext
        Get
            Return testContextInstance
        End Get
        Set(ByVal value As TestContext)
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
    Public Sub ofMitarbeiter_InsertTest()
        Dim target As ofmitarbeiterTableAdapter = New ofmitarbeiterTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Position As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Anrede As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Name As String = "Mustermann"
        Dim Vorname As String = "Manfred"
        Dim Geschlecht As String = "m"
        Dim Adresse As String = "Einestrasse 14"
        Dim Land As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim PLZ As String = "4040"
        Dim Ort As String = "Linz"
        Dim TelPrivat As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim TelFirma As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim FaxFirma As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Mobil As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Email As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim SVN As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim BankNr As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim KontoNr As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Username As String = "MM"
        Dim Passwort As String = "MM"
        Dim expected As Integer = 1
        Dim actual As Integer
        actual = target.Insert(Position, Anrede, Name, Vorname, Geschlecht, Adresse, Land, PLZ, Ort, TelPrivat, TelFirma, FaxFirma, Mobil, Email, SVN, BankNr, KontoNr, Username, Passwort)
        Assert.AreEqual(expected, actual)

    End Sub

    '''<summary>
    '''A test for Update
    '''</summary>
    <TestMethod()> _
    Public Sub ofMitarbeiter_UpdateTest()
        Dim target As ofmitarbeiterTableAdapter = New ofmitarbeiterTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Position As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Anrede As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Name As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Vorname As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Geschlecht As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Adresse As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Land As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim PLZ As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Ort As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim TelPrivat As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim TelFirma As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim FaxFirma As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Mobil As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Email As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim SVN As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim BankNr As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim KontoNr As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Username As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Passwort As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_IDNR As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Update(Position, Anrede, Name, Vorname, Geschlecht, Adresse, Land, PLZ, Ort, TelPrivat, TelFirma, FaxFirma, Mobil, Email, SVN, BankNr, KontoNr, Username, Passwort, Original_IDNR)
        Assert.AreEqual(expected, actual)

    End Sub

    '''<summary>
    '''A test for Delete
    '''</summary>
    <TestMethod()> _
    Public Sub ofMitarbeiter_DeleteTest()
        Dim target As ofmitarbeiterTableAdapter = New ofmitarbeiterTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Original_IDNR As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Delete(Original_IDNR)
        Assert.AreEqual(expected, actual)
    End Sub
End Class
