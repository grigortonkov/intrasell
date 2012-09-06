Imports System

Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net.dsVorgaengeTableAdapters

Imports IntraSell_Net
Imports IntraSell_DLL


'''<summary>
'''This is a test class for buchvorgangTableAdapterTest and is intended
'''to contain all buchvorgangTableAdapterTest Unit Tests
'''</summary>
<TestClass()> _
Public Class buchvorgangTableAdapterTest


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

    <TestMethod()> _
    Sub buchVorgang_Create()
        Dim tam As IntraSell_Net.dsVorgaengeTableAdapters.TableAdapterManager = New IntraSell_Net.dsVorgaengeTableAdapters.TableAdapterManager()
        tam.Connection = IntraSell_DLL.FunctionsDB.CurrentDB
        'tam.Connection.Open()

        'Dim tr As MySql.Data.MySqlClient.MySqlTransaction = CurrentDB.BeginTransaction


        Dim t As buchvorgangTableAdapter = New buchvorgangTableAdapter() ' TODO: Initialize to an appropriate value
        Dim ta As buchvorgang_artikelTableAdapter = New buchvorgang_artikelTableAdapter() ' TODO: Initialize to an appropriate value

        Dim DsVorgaenge As IntraSell_Net.dsVorgaenge = New IntraSell_Net.dsVorgaenge()


        t.Fill(DsVorgaenge.buchvorgang)
        ta.Fill(DsVorgaenge._buchvorgang_artikel)

        Dim r As IntraSell_Net.dsVorgaenge.buchvorgangRow = DsVorgaenge.buchvorgang.NewRow()

        r.Nummer = "1000000"
        r.Typ = "AR"
        r.Datum = Date.Today
        r.Bezahlt = 0
        r.Ausgedruckt = 0
        r.Abgeschlossen = 0

        r.KundNr = 100
        r.Summe = 1000
        r.SummeMWST = 200
        r.SummeBrutto = 1200



        Dim rp As IntraSell_Net.dsVorgaenge._buchvorgang_artikelRow = DsVorgaenge._buchvorgang_artikel.NewRow()
        rp.ID = 1
        rp.Typ = r.Typ
        rp.Stk = 1
        rp.Nummer = r.Nummer
        rp.ArtNr = 100
        rp.Bezeichnung = "Erste Position"
        rp.Preis_Netto = 1000
        rp.MWST = 200
        rp.Preis_Brutto = 1200

        Dim rp1 As IntraSell_Net.dsVorgaenge._buchvorgang_artikelRow = DsVorgaenge._buchvorgang_artikel.NewRow()
        rp1.ID = 2
        rp1.Typ = r.Typ
        rp1.Stk = 2
        rp1.Nummer = r.Nummer
        rp1.ArtNr = 101
        rp1.Bezeichnung = "Zweite Position"
        rp1.Preis_Netto = 2000
        rp1.MWST = 400
        rp1.Preis_Brutto = 2400


        DsVorgaenge.buchvorgang.AddbuchvorgangRow(r)
        DsVorgaenge._buchvorgang_artikel.Rows.Add(rp)
        DsVorgaenge._buchvorgang_artikel.Rows.Add(rp1)
        DsVorgaenge.WriteXml("c:\test.xml")


        'BuchvorgangBindingSource.EndEdit()
        'Buchvorgang_artikelBindingSource.EndEdit()

        tam.UpdateAll(DsVorgaenge)

        t.Update(DsVorgaenge)
        ta.Update(DsVorgaenge)

        'tr.Commit()

    End Sub

    '''<summary>
    '''A test for Insert
    '''</summary>
    <TestMethod()> _
    Public Sub buchvorgang_InsertTest()
        Dim target As buchvorgangTableAdapter = New buchvorgangTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Nummer As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Typ As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim KundNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Datum As DateTime = New DateTime() ' TODO: Initialize to an appropriate value
        Dim Notiz As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim NotizIntern As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim NotizExtern As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Summe As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim Bezahlt As Byte = 0 ' TODO: Initialize to an appropriate value
        Dim Ausgedruckt As Byte = 0 ' TODO: Initialize to an appropriate value
        Dim Abgeschlossen As Byte = 0 ' TODO: Initialize to an appropriate value
        Dim Zahlungsbedingung As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim TransportMethode As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim ZahlungsMethode As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Woher As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Wohin As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Status As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim SummeMWST As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim SummeBrutto As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim LieferantNr As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim MitarbeiterNr As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim KundNr2 As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Waehrung As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim ErstelltAm As Nullable(Of DateTime) = New Nullable(Of DateTime)() ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Insert(Nummer, Typ, KundNr, Datum, Notiz, NotizIntern, NotizExtern, Summe, Bezahlt, Ausgedruckt, Abgeschlossen, Zahlungsbedingung, TransportMethode, ZahlungsMethode, Woher, Wohin, Status, SummeMWST, SummeBrutto, LieferantNr, MitarbeiterNr, KundNr2, Waehrung, ErstelltAm)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for Update
    '''</summary>
    <TestMethod()> _
    Public Sub buchvorgang_UpdateTest()
        Dim target As buchvorgangTableAdapter = New buchvorgangTableAdapter() ' TODO: Initialize to an appropriate value
        Dim KundNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Datum As DateTime = New DateTime() ' TODO: Initialize to an appropriate value
        Dim Notiz As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim NotizIntern As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim NotizExtern As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Summe As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim Bezahlt As Object = Nothing ' TODO: Initialize to an appropriate value
        Dim Ausgedruckt As Object = Nothing ' TODO: Initialize to an appropriate value
        Dim Abgeschlossen As Object = Nothing ' TODO: Initialize to an appropriate value
        Dim Zahlungsbedingung As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim TransportMethode As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim ZahlungsMethode As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Woher As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Wohin As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Status As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim SummeMWST As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim SummeBrutto As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim LieferantNr As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim MitarbeiterNr As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim KundNr2 As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Waehrung As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim ErstelltAm As DateTime = New DateTime() ' TODO: Initialize to an appropriate value
        Dim Original_Nummer As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Typ As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Update(KundNr, Datum, Notiz, NotizIntern, NotizExtern, Summe, Bezahlt, Ausgedruckt, Abgeschlossen, Zahlungsbedingung, TransportMethode, ZahlungsMethode, Woher, Wohin, Status, SummeMWST, SummeBrutto, LieferantNr, MitarbeiterNr, KundNr2, Waehrung, ErstelltAm, Original_Nummer, Original_Typ)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for Delete
    '''</summary>
    <TestMethod()> _
    Public Sub buchvorgang_DeleteTest()
        Dim target As buchvorgangTableAdapter = New buchvorgangTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Original_Nummer As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Typ As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_KundNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Datum As DateTime = New DateTime() ' TODO: Initialize to an appropriate value
        Dim Original_Notiz As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_NotizIntern As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_NotizExtern As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Summe As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim Original_Bezahlt As Byte = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Ausgedruckt As Byte = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Abgeschlossen As Byte = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Zahlungsbedingung As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_TransportMethode As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_ZahlungsMethode As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Woher As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Wohin As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Status As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_SummeMWST As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim Original_SummeBrutto As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim Original_LieferantNr As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_MitarbeiterNr As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_KundNr2 As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_Waehrung As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_ErstelltAm As Nullable(Of DateTime) = New Nullable(Of DateTime)() ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Delete(Original_Nummer, Original_Typ, Original_KundNr, Original_Datum, Original_Notiz, Original_NotizIntern, Original_NotizExtern, Original_Summe, Original_Bezahlt, Original_Ausgedruckt, Original_Abgeschlossen, Original_Zahlungsbedingung, Original_TransportMethode, Original_ZahlungsMethode, Original_Woher, Original_Wohin, Original_Status, Original_SummeMWST, Original_SummeBrutto, Original_LieferantNr, Original_MitarbeiterNr, Original_KundNr2, Original_Waehrung, Original_ErstelltAm)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub
End Class
