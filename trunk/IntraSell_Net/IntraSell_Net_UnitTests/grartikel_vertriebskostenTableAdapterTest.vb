Imports System

Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net.dsPreiseTableAdapters



'''<summary>
'''This is a test class for grartikel_vertriebskostenTableAdapterTest and is intended
'''to contain all grartikel_vertriebskostenTableAdapterTest Unit Tests
'''</summary>
<TestClass()> _
Public Class grartikel_vertriebskostenTableAdapterTest


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
            testContextInstance = Value
        End Set
    End Property

#Region "Additional test attributes"
    '
    'You can use the following additional attributes as you write your tests:
    '
    'Use ClassInitialize to run code before running the first test in the class
    '<ClassInitialize()>  _
    'Public Shared Sub MyClassInitialize(ByVal testContext As TestContext)
    'End Sub
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
    Public Sub InsertTest()
        Dim target As grartikel_vertriebskostenTableAdapter = New grartikel_vertriebskostenTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Methode As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Typ As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Destination As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim GewichtVon As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim GewichtBis As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim FixeKosten As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim VariableKostenNachGewicht As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim VariableKostenNachUmsatz As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim ArtNr As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Insert(Methode, Typ, Destination, GewichtVon, GewichtBis, FixeKosten, VariableKostenNachGewicht, VariableKostenNachUmsatz, ArtNr)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub
End Class
