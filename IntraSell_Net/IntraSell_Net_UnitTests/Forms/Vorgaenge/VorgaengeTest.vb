Imports System

Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net



'''<summary>
'''This is a test class for VorgaengeTest and is intended
'''to contain all Vorgaenge Unit Tests
'''</summary>
<TestClass()> _
Public Class VorgaengeTest


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
            testContextInstance = value
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
    '''A test for BindingNavigatorAddNewItem_Click
    '''</summary>
    <TestMethod(), _
     DeploymentItem("IntraSell_Net.exe")> _
    Public Sub Vorgang_NeueRechnung()
        Debug.Print("Start Vorgang_NeueRechnung")
        Dim target As Vorgang_Accessor = New Vorgang_Accessor()

        Dim sender As Object = Nothing
        Dim e As EventArgs = Nothing
        target.setSilent(True)
        target.Vorgang_Load(sender, e) 'load

        target.BeginNewVorgang("AR", "100") 'Start new 
        target.ArtikelControl1.ArtNr = 100

        target.ArtNr_Changed(target.ArtikelControl1.ArtNr) 'add new position 


        Assert.AreEqual(101, target.summeNetto)
        Assert.AreEqual(121, target.summeBrutto)
        Assert.AreEqual(20, target.MWST)

        Debug.Print("Creating Rechnung: " & target.NummerTextBox.Text)
        target.btnAbschliessen_Click()

        Assert.AreEqual(101, target.summeNetto)
        Assert.AreEqual(121, target.summeBrutto)
        Assert.AreEqual(20, target.MWST)
        'Assert.Inconclusive("A method that does not return a value cannot be verified.")
    End Sub
End Class
