Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net.dsAdressenTableAdapters



'''<summary>
'''This is a test class for ofadressen_zahlungsmethodenTableAdapterTest and is intended
'''to contain all ofadressen_zahlungsmethodenTableAdapterTest Unit Tests
'''</summary>
<TestClass()> _
Public Class ofadressen_zahlungsmethodenTableAdapterTest


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
    Public Sub ofadressen_zahlungsmethodenInsertTest()
        Dim target As ofadressen_zahlungsmethodenTableAdapter = New ofadressen_zahlungsmethodenTableAdapter() ' TODO: Initialize to an appropriate value
        Dim IdNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Methode As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Standart As Byte = 0 ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Insert(IdNr, Methode, Standart)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for Update
    '''</summary>
    <TestMethod()> _
    Public Sub UpdateTest()
        Dim target As ofadressen_zahlungsmethodenTableAdapter = New ofadressen_zahlungsmethodenTableAdapter() ' TODO: Initialize to an appropriate value
        Dim IdNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Methode As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Standart As Byte = 0 ' TODO: Initialize to an appropriate value
        Dim Original_IdNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Methode As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Standart As Byte = 0 ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Update(IdNr, Methode, Standart, Original_IdNr, Original_Methode, Original_Standart)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for Update
    '''</summary>
    <TestMethod()> _
    Public Sub ofadressen_zahlungsmethodenUpdateTest1()
        Dim target As ofadressen_zahlungsmethodenTableAdapter = New ofadressen_zahlungsmethodenTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Standart As Byte = 0 ' TODO: Initialize to an appropriate value
        Dim Original_IdNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Methode As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Standart As Byte = 0 ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Update(Standart, Original_IdNr, Original_Methode, Original_Standart)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for Delete
    '''</summary>
    <TestMethod()> _
    Public Sub ofadressen_zahlungsmethodenDeleteTest()
        Dim target As ofadressen_zahlungsmethodenTableAdapter = New ofadressen_zahlungsmethodenTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Original_IdNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Methode As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Standart As Byte = 0 ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Delete(Original_IdNr, Original_Methode, Original_Standart)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub
End Class
