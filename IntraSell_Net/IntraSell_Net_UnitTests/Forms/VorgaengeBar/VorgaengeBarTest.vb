Imports System

Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net



'''<summary>
'''This is a test class for AnrufTest and is intended
'''to contain all AnrufTest Unit Tests
'''</summary>
<TestClass()> _
Public Class VorgaengeBarTest


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
    Public Sub VorgangBar_NeueBarrechnung()
        Debug.Print("Start VorgangBar_NeueBarrechnung")
        Dim target As VorgangBar_Accessor = New VorgangBar_Accessor()

        Dim sender As Object = Nothing ' TODO: Initialize to an appropriate value
        Dim e As EventArgs = Nothing ' TODO: Initialize to an appropriate value
        target.VorgangBar_Load(sender, e) 'load

        target.btnNeu_Click(sender, e) 'Start new 
        target.ArtikelControl1.ArtNr = 100

        target.ArtNr_Changed(target.ArtikelControl1.ArtNr) 'add new position 

        target.GegebenBarTextbox.Text = 200
        Assert.AreEqual("€ 78,80", target.RestgeldTextbox.Text)
        Debug.Print("Creating Barrechnung: " & target.NummerTextBox.Text)
        target.btnAbschliessen_Click(sender, e) 'Vorgang Abschliessen

        Assert.AreEqual("", target.GegebenBarTextbox.Text) 'clear again
        Assert.AreEqual("", target.RestgeldTextbox.Text) 'clear again
        'Assert.Inconclusive("A method that does not return a value cannot be verified.")
    End Sub
End Class
