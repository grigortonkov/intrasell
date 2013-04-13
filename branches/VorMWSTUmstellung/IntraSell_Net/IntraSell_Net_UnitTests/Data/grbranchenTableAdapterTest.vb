Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net.dsBranchenTableAdapters



'''<summary>
'''This is a test class for grbranchenTableAdapterTest and is intended
'''to contain all grbranchenTableAdapterTest Unit Tests
'''</summary>
<TestClass()> _
Public Class grbranchenTableAdapterTest


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
    Public Sub grBranchen_InsertTest()

        Dim target As grbranchenTableAdapter = New grbranchenTableAdapter() ' TODO: Initialize to an appropriate value
        Dim BrNR As Integer = 1
        Dim Bezeichnung As String = "Einzehlhandel"
        Dim Gruppe As String = String.Empty
        Dim Integriert As Byte = 0
        Dim expected As Integer = 1
        Dim actual As Integer
        actual = target.Insert(BrNR, Bezeichnung, Gruppe, Integriert)
        Assert.AreEqual(expected, actual)

    End Sub
    '''<summary>
    '''A test for Insert
    '''</summary>
    <TestMethod()> _
    Public Sub grBranchen_Insert2Test()

        Dim target As grbranchenTableAdapter = New grbranchenTableAdapter() ' TODO: Initialize to an appropriate value
        Dim BrNR As Integer = 2
        Dim Bezeichnung As String = "Autohaus"
        Dim Gruppe As String = String.Empty
        Dim Integriert As Byte = 0
        Dim expected As Integer = 1
        Dim actual As Integer
        actual = target.Insert(BrNR, Bezeichnung, Gruppe, Integriert)
        Assert.AreEqual(expected, actual)

    End Sub

    '''<summary>
    '''A test for Update
    '''</summary>
    <TestMethod()> _
    Public Sub grBranchen_UpdateTest()
        Dim target As grbranchenTableAdapter = New grbranchenTableAdapter() ' TODO: Initialize to an appropriate value
        Dim BrNR As Integer = 1
        Dim Bezeichnung As String = "Einzehlhandel"
        Dim Gruppe As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Integriert As Object = 1
        Dim Original_BrNR As Integer = 1
        Dim expected As Integer = 1
        Dim actual As Integer
        actual = target.Update(BrNR, Bezeichnung, Gruppe, Integriert, Original_BrNR)
        Assert.AreEqual(expected, actual) 
    End Sub

    '''<summary>
    '''A test for Delete
    '''</summary>
    <TestMethod()> _
    Public Sub grBranchen_DeleteTest()
        Dim target As grbranchenTableAdapter = New grbranchenTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Original_BrNR As Integer = 0
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Delete(Original_BrNR)
        Assert.AreEqual(expected, actual)

    End Sub
End Class
