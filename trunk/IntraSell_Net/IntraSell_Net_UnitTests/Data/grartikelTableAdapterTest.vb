Imports System

Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net.dsArtikelTableAdapters



'''<summary>
'''This is a test class for grartikelTableAdapterTest and is intended
'''to contain all grartikelTableAdapterTest Unit Tests
'''</summary>
<TestClass()> _
Public Class grartikelTableAdapterTest


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
    Public Sub GrArtikelInsertUpdateTest()
        Dim target As grartikelTableAdapter = New grartikelTableAdapter() ' TODO: Initialize to an appropriate value
        Dim ArtNr As Integer = 100
        Dim EAN As String = "EAN100"
        Dim Barcode As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Bezeichnung As String = "Artikel 100"
        Dim Bezeichnung1 As String = "Artikel 100"
        Dim Beschreibung As String = "Artikel 100 Beschreibung"
        Dim Einheit As String = "KG"

        Dim PreisATS As Nullable(Of [Decimal]) = 100
        Dim PreisEuro As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim PreisATS_Brutto As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value

        Dim EKPreis As Nullable(Of [Decimal]) = 50
        Dim LEKPreis As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value

        Dim LieferantNR As Nullable(Of Integer) = 1

        Dim ArtKatNr As Nullable(Of Integer) = 1
        Dim MWST As Nullable(Of Integer) = 20
        Dim Gewicht As String = 20
        Dim Picture As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim HerstellerNr As Nullable(Of Integer) = 100100

        Dim ShopURL As String = "http://www.arfaian.com"
        Dim HerstellerURL As String = "http://www.arfaian.com"
        Dim Modifikationen As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim HerstellerRabatt As Nullable(Of Double) = 5
        Dim HerstellerRabattText As String = "5% Rabatt des Herstellers"

        Dim AngelegtAn As Nullable(Of DateTime) = New Nullable(Of DateTime)() ' TODO: Initialize to an appropriate value
        Dim AngelegtAm As Nullable(Of DateTime) = New Nullable(Of DateTime)() ' TODO: Initialize to an appropriate value

        Dim BruttoGewicht As Nullable(Of Double) = 10
        Dim NettoGewicht As Nullable(Of Double) = 8
        Dim TaraGewicht As Nullable(Of Double) = 2


        Dim NichtBestellbar As Byte = 0 ' TODO: Initialize to an appropriate value
        Dim ProduktAktivOnline As Nullable(Of Byte) = 1
        Dim ProduktAktiv As Byte = 1
        Dim SetArtikel As Byte = 1
        Dim LagerArtikel As Byte = 1
        Dim Seriennummer As Byte = 1

        Dim expected As Integer = 1 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Insert(ArtNr, EAN, Barcode, Bezeichnung, Bezeichnung1, Beschreibung, Einheit, PreisATS, PreisEuro, PreisATS_Brutto, LagerArtikel, EKPreis, LEKPreis, Seriennummer, LieferantNR, SetArtikel, ArtKatNr, MWST, Gewicht, Picture, HerstellerNr, ProduktAktiv, ShopURL, HerstellerURL, Modifikationen, HerstellerRabatt, HerstellerRabattText, AngelegtAn, BruttoGewicht, NettoGewicht, TaraGewicht, AngelegtAm, NichtBestellbar, ProduktAktivOnline)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")

        'Test Update 

        'Change Preise 
        Bezeichnung = Bezeichnung + " Updated"
        PreisATS = PreisATS + 1
        PreisATS_Brutto = PreisATS * 1.2

        expected = 1
        Dim actualUpdate As Integer
        actualUpdate = target.Update(EAN, Barcode, Bezeichnung, Bezeichnung1, Beschreibung, Einheit, PreisATS, PreisEuro, PreisATS_Brutto, LagerArtikel, EKPreis, LEKPreis, Seriennummer, LieferantNR, SetArtikel, ArtKatNr, MWST, Gewicht, Picture, HerstellerNr, ProduktAktiv, ShopURL, HerstellerURL, Modifikationen, HerstellerRabatt, HerstellerRabattText, AngelegtAn, BruttoGewicht, NettoGewicht, TaraGewicht, AngelegtAm, NichtBestellbar, ProduktAktivOnline, ArtNr)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")


    End Sub
 
    '''<summary>
    '''A test for Delete
    '''</summary>
    <TestMethod()> _
    Public Sub GrArtikelDeleteTest()
        Dim target As grartikelTableAdapter = New grartikelTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Original_ArtNr As Integer = 100

        Dim expected As Integer = 1 'deleted
        Dim actual As Integer
        actual = target.Delete(Original_ArtNr)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub
End Class
