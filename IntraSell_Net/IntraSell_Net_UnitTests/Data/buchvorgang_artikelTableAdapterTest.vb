Imports System

Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net.dsVorgaengeTableAdapters



'''<summary>
'''This is a test class for buchvorgang_artikelTableAdapterTest and is intended
'''to contain all buchvorgang_artikelTableAdapterTest Unit Tests
'''</summary>
<TestClass()> _
Public Class buchvorgang_artikelTableAdapterTest


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
    Public Sub buchvorgang_artikel_InsertTest()
        Dim target As buchvorgang_artikelTableAdapter = New buchvorgang_artikelTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Nummer As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Typ As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim ArtNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Stk As [Decimal] = New [Decimal]() ' TODO: Initialize to an appropriate value
        Dim EKPreis As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim Preis_Netto As [Decimal] = New [Decimal]() ' TODO: Initialize to an appropriate value
        Dim Preis_Brutto As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim MWST As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim ArtikelIdentifikation As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Bezeichnung As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim LieferantNr As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Status As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Referenz As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Packung As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Herkunft As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Incoterm As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Spezifikation As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Zeitpunkt As Nullable(Of DateTime) = New Nullable(Of DateTime)() ' TODO: Initialize to an appropriate value
        Dim ErstelltAm As Nullable(Of DateTime) = New Nullable(Of DateTime)() ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Insert(Nummer, Typ, ArtNr, Stk, EKPreis, Preis_Netto, Preis_Brutto, MWST, ArtikelIdentifikation, Bezeichnung, LieferantNr, Status, Referenz, Packung, Herkunft, Incoterm, Spezifikation, Zeitpunkt)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for Update
    '''</summary>
    <TestMethod()> _
    Public Sub buchvorgang_artikel_UpdateTest()
        Dim target As buchvorgang_artikelTableAdapter = New buchvorgang_artikelTableAdapter() ' TODO: Initialize to an appropriate value
        Dim ArtNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Stk As [Decimal] = New [Decimal]() ' TODO: Initialize to an appropriate value
        Dim EKPreis As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim Preis_Netto As [Decimal] = New [Decimal]() ' TODO: Initialize to an appropriate value
        Dim Preis_Brutto As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim MWST As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim ArtikelIdentifikation As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Bezeichnung As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim LieferantNr As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Status As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Referenz As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Packung As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Herkunft As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Incoterm As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Spezifikation As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Zeitpunkt As Nullable(Of DateTime) = New Nullable(Of DateTime)() ' TODO: Initialize to an appropriate value
        Dim ErstelltAm As DateTime = New DateTime() ' TODO: Initialize to an appropriate value
        Dim Original_ID As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Nummer As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Typ As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Update(ArtNr, Stk, EKPreis, Preis_Netto, Preis_Brutto, MWST, ArtikelIdentifikation, Bezeichnung, LieferantNr, Status, Referenz, Packung, Herkunft, Incoterm, Spezifikation, Zeitpunkt, Original_ID, Original_Nummer, Original_Typ)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for Delete
    '''</summary>
    <TestMethod()> _
    Public Sub buchvorgang_artikel_DeleteTest()
        Dim target As buchvorgang_artikelTableAdapter = New buchvorgang_artikelTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Original_ID As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Nummer As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Typ As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_ArtNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Stk As [Decimal] = New [Decimal]() ' TODO: Initialize to an appropriate value
        Dim Original_EKPreis As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim Original_Preis_Netto As [Decimal] = New [Decimal]() ' TODO: Initialize to an appropriate value
        Dim Original_Preis_Brutto As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim Original_MWST As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim Original_ArtikelIdentifikation As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Bezeichnung As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_LieferantNr As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_Status As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Referenz As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Packung As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Herkunft As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Incoterm As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Spezifikation As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Zeitpunkt As Nullable(Of DateTime) = New Nullable(Of DateTime)() ' TODO: Initialize to an appropriate value
        Dim Original_ErstelltAm As Nullable(Of DateTime) = New Nullable(Of DateTime)() ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Delete(Original_ID, Original_Nummer, Original_Typ)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub
End Class
