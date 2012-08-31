Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net
Imports IntraSell_DLL



'''<summary>
'''This is a test class for ModulePreiseTest and is intended
'''to contain all ModulePreiseTest Unit Tests
'''</summary>
<TestClass()> _
Public Class ModulePreiseTest


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
    Public Overloads Shared Sub MyClassInitialize(ByVal testContext As TestContext)
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

    'Manu 

    '''<summary>
    '''A test for getPreis
    '''</summary>
    <TestMethod()> _
    Public Sub calculatePreiseTest()
        Dim KundNr = 0
        Dim ArtNr = 100
        Dim Stk = 10
        Dim Preis_Netto, Preis_Brutto, EKPreis As Double

        Preis_Netto = getPreis(KundNr, ArtNr, Stk)
        Preis_Brutto = calculateBruttoPreis(Preis_Netto, ArtNr, KundNr)
        EKPreis = getEKPreis(ArtNr)

        Assert.AreEqual(CStr(101.0), CStr(Preis_Netto))
        Assert.AreEqual(CStr(121.2), CStr(Preis_Brutto))
        Assert.AreEqual(CStr(50), CStr(EKPreis))
    End Sub

    '''<summary>
    '''A test for getPreis
    '''</summary>
    <TestMethod()> _
    Public Sub getPreisTest()
        Dim IDNR As Integer = 1
        Dim ArtNr As Integer = 1
        Dim Stk As Double = 1
        Dim expected As Double = 0
        Dim actual As Double
        actual = ModulePreise.getPreis(IDNR, ArtNr, Stk)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub


    '''<summary>
    '''A test for calculateBruttoPreis
    '''</summary>
    <TestMethod()> _
    Public Sub calculateBruttoPreis0Test()
        Dim VKPreis As Double = 100
        Dim ArtNr As String = 1
        Dim IDNR As Integer = 0
        Dim expected As Double = 120
        Dim actual As Double
        actual = ModulePreise.calculateBruttoPreis(VKPreis, ArtNr, IDNR)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for calculateBruttoPreis
    '''</summary>
    <TestMethod()> _
    Public Sub calculateBruttoPreisTest()
        Dim VKPreis As Double = 100
        Dim ArtNr As String = 1
        Dim IDNR As Integer = 1
        Dim expected As Double = 120
        Dim actual As Double
        actual = ModulePreise.calculateBruttoPreis(VKPreis, ArtNr, IDNR)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for getNewVorgangNummer
    '''</summary>
    <TestMethod()> _
    Public Sub getNewVorgangNummerTest()
        Dim Typ As String = "AR"
        Dim IDNR As Integer = 1
        Dim expected As String = "2009090001"
        Dim actual As String
        actual = ModulePreise.getNewVorgangNummer(Typ, IDNR)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for getEKPreis
    '''</summary>
    <TestMethod()> _
    Public Sub getEKPreisTest()
        Dim ArtNr As Integer = 1
        Dim expected As Double = 0.0! ' TODO: Initialize to an appropriate value
        Dim actual As Double
        actual = ModulePreise.getEKPreis(ArtNr)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for getBestLieferant
    '''</summary>
    <TestMethod()> _
    Public Sub getBestLieferantTest()
        Dim ArtNr As Integer = 1
        Dim expected As String = FunctionsVars.NOT_AVAILABLE
        Dim actual As String
        actual = ModulePreise.getBestLieferant(ArtNr)
        Assert.AreEqual(expected, actual)
        ' Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for getMWSTArtikel
    '''</summary>
    <TestMethod()> _
    Public Sub getMWSTArtikelTest()
        Dim ArtNr As String = 1
        Dim expected As Double = 20
        Dim actual As Double
        actual = ModulePreise.getMWSTArtikel(ArtNr)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub


    '''<summary>
    '''A test for convertFromTo
    '''</summary>
    <TestMethod()> _
    Public Sub convertFromToTest()
        Dim FromOrder As String = "AR"
        Dim ToOrder As String = "AN"
        Dim FromNummer As Integer = 1
        Dim NewKundNr As Integer = 1
        Dim expected As String = 2
        Dim actual As String
        actual = ModulePreise.convertFromTo(FromOrder, ToOrder, FromNummer, NewKundNr)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for getVorgangTableForType
    '''</summary>
    <TestMethod()> _
    Public Sub getVorgangTableForTypeTest()
        Dim Typ As String = "AR"
        Dim expected As String = "buchVorgang"
        Dim actual As String
        actual = ModulePreise.getVorgangTableForType(Typ)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub
End Class
