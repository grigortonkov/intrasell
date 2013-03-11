Imports System

Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net



'''<summary>
'''This is a test class for AnrufTest and is intended
'''to contain all AnrufTest Unit Tests
'''</summary>
<TestClass()> _
Public Class AnrufTest


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
    '''A test for BindingNavigatorAddNewItem_Click
    '''</summary>
    <TestMethod(), _
     DeploymentItem("IntraSell_Net.exe")> _
    Public Sub BindingNavigatorAddNewItem_ClickTest()
        Dim target As Anruf_Accessor = New Anruf_Accessor()
 
        Dim sender As Object = Nothing ' TODO: Initialize to an appropriate value
        Dim e As EventArgs = Nothing ' TODO: Initialize to an appropriate value
        target.BindingNavigatorAddNewItem_Click(sender, e)
        target.AdressenControl1.IDNR = 100
        target.NotizenTextBox.Text = "Automatisch erstellt"

        target.AnruflisteBindingNavigatorSaveItem_Click(Nothing, Nothing)

        'Assert.Inconclusive("A method that does not return a value cannot be verified.")
    End Sub
End Class
