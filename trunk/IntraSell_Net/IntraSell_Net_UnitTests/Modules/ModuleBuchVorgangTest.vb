Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net
Imports IntraSell_DLL



'''<summary>
'''This is a test class for ModuleBuchVorgangTest and is intended
'''to contain all ModuleBuchVorgangTest Unit Tests
'''</summary>
<TestClass()> _
Public Class ModuleBuchVorgangTest



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

    '
    <TestMethod()> _
    Public Sub VorgangVarsSetzen()
        FunctionsVars.SetVarValue("letzteAngebotNummer", "2012000")
        FunctionsVars.SetVarValue("letzteAuftragNummer", "2012000")
        FunctionsVars.SetVarValue("letzteRechnungsNummer", "2012000")
        FunctionsVars.SetVarValue("letzteLieferscheinNummer", "2012000")
        FunctionsVars.SetVarValue("letzteRetourwarenNummer", "2012000")
        FunctionsVars.SetVarValue("letzteGutschriftNummer", "2012000")
        FunctionsVars.SetVarValue("letzteLieferantAuftragNummer", "2012000")

        FunctionsVars.SetVarValue("SPEICHERPLATZ_VORGANG_AN", "c:\temp\Angebote\")
        FunctionsVars.SetVarValue("SPEICHERPLATZ_VORGANG_AU", "c:\temp\Auftraege\")
        FunctionsVars.SetVarValue("SPEICHERPLATZ_VORGANG_AR", "c:\temp\Rechnungen\")
        FunctionsVars.SetVarValue("SPEICHERPLATZ_VORGANG_LI", "c:\temp\Lieferschein\")
    End Sub



    '''<summary>
    '''A test for VorgangAbschliessen
    '''</summary>
    <TestMethod()> _
    Public Sub VorgangAbschliessenTest()
        If Not IntraSell_DLL.FunctionsDB.CurrentDB.State = Data.ConnectionState.Open Then
            IntraSell_DLL.FunctionsDB.CurrentDB.Open()
        End If
        Dim Typ As String = buchvorgangTableAdapterTest.VORGANG_TYP_AR_1

        Dim expected As Boolean = True
        Dim actual As Boolean
        actual = ModuleBuchVorgang.VorgangAbschliessen(Typ, buchvorgangTableAdapterTest.VORGANG_NUMMER_AR_1, True)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for VorgangStorno
    '''</summary>
    <TestMethod()> _
    Public Sub VorgangStornoTest()
        If Not IntraSell_DLL.FunctionsDB.CurrentDB.State = Data.ConnectionState.Open Then
            IntraSell_DLL.FunctionsDB.CurrentDB.Open()
        End If

        Dim VorgangTyp As String = buchvorgangTableAdapterTest.VORGANG_TYP_AR_1
        Dim VorgangNummer As Integer = buchvorgangTableAdapterTest.VORGANG_NUMMER_AR_1
        Dim expected As Boolean = True
        Dim actual As Boolean
        actual = ModuleBuchVorgang.VorgangStorno(VorgangTyp, VorgangNummer, True)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub


    '''<summary>
    '''A test for VorgangStorno
    '''</summary>
    <TestMethod()> _
    Public Sub VorgangKonvertierenTest()
        If Not IntraSell_DLL.FunctionsDB.CurrentDB.State = Data.ConnectionState.Open Then
            IntraSell_DLL.FunctionsDB.CurrentDB.Open()
        End If

        Dim VorgangTyp As String = buchvorgangTableAdapterTest.VORGANG_TYP_AR_1
        Dim VorgangTypTo As String = buchvorgangTableAdapterTest.VORGANG_TYP_AR_1
        Dim VorgangNummer As Integer = buchvorgangTableAdapterTest.VORGANG_NUMMER_AR_1
        Dim KundNr As Integer = 100

        Dim expected As String = "2012002"
        Dim actual As String
        actual = ModuleBuchVorgang.VorgangKonvertieren(VorgangTyp, VorgangTypTo, VorgangNummer, KundNr)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

End Class
