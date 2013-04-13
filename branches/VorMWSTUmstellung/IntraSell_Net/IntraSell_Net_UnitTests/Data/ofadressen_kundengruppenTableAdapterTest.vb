Imports System

Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net.dsAdressenTableAdapters



'''<summary>
'''This is a test class for ofadressen_kundengruppenTableAdapterTest and is intended
'''to contain all ofadressen_kundengruppenTableAdapterTest Unit Tests
'''</summary>
<TestClass()> _
Public Class ofadressen_kundengruppenTableAdapterTest


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
    Public Sub ofAdressenKundengruppen_InsertTest()
        Dim target As ofadressen_kundengruppenTableAdapter = New ofadressen_kundengruppenTableAdapter()
        Dim Gruppe As String = "Endkunden"
        Dim KundenNrKreisVon As Nullable(Of Integer) = 1
        Dim KundenNrKreisBis As Nullable(Of Integer) = 100
        Dim VorgangNrKreisVon As Nullable(Of Integer) = 1
        Dim VorgangNrKreisBis As Nullable(Of Integer) = 100
        Dim RechungenMitMWST As Byte = 1
        Dim expected As Integer = 1
        Dim actual As Integer
        actual = target.Insert(Gruppe, KundenNrKreisVon, KundenNrKreisBis, VorgangNrKreisVon, VorgangNrKreisBis, RechungenMitMWST)
        Assert.AreEqual(expected, actual)
    End Sub

    <TestMethod()> _
    Public Sub ofAdressenKundengruppen_InsertTest2()
        Dim target As ofadressen_kundengruppenTableAdapter = New ofadressen_kundengruppenTableAdapter()
        Dim Gruppe As String = "Export (ohne MwSt)"
        Dim KundenNrKreisVon As Nullable(Of Integer) = 100
        Dim KundenNrKreisBis As Nullable(Of Integer) = 200
        Dim VorgangNrKreisVon As Nullable(Of Integer) = 100
        Dim VorgangNrKreisBis As Nullable(Of Integer) = 200
        Dim RechungenMitMWST As Byte = 0
        Dim expected As Integer = 1
        Dim actual As Integer
        actual = target.Insert(Gruppe, KundenNrKreisVon, KundenNrKreisBis, VorgangNrKreisVon, VorgangNrKreisBis, RechungenMitMWST)
        Assert.AreEqual(expected, actual)
    End Sub
    '''<summary>
    '''A test for Delete
    '''</summary>
    <TestMethod()> _
    Public Sub ofAdressenKundengruppen_DeleteTest()
        Dim target As ofadressen_kundengruppenTableAdapter = New ofadressen_kundengruppenTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Original_KGR As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Gruppe As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_KundenNrKreisVon As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_KundenNrKreisBis As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_VorgangNrKreisVon As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_VorgangNrKreisBis As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_RechungenMitMWST As Byte = 0 ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Delete(Original_KGR, Original_Gruppe, Original_KundenNrKreisVon, Original_KundenNrKreisBis, Original_VorgangNrKreisVon, Original_VorgangNrKreisBis, Original_RechungenMitMWST)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for Update
    '''</summary>
    <TestMethod()> _
    Public Sub ofAdessenKundengruppen_UpdateTest()
        Dim target As ofadressen_kundengruppenTableAdapter = New ofadressen_kundengruppenTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Gruppe As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim KundenNrKreisVon As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim KundenNrKreisBis As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim VorgangNrKreisVon As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim VorgangNrKreisBis As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim RechungenMitMWST As Byte = 0 ' TODO: Initialize to an appropriate value
        Dim Original_KGR As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Gruppe As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_KundenNrKreisVon As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_KundenNrKreisBis As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_VorgangNrKreisVon As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_VorgangNrKreisBis As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_RechungenMitMWST As Byte = 0 ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Update(Gruppe, KundenNrKreisVon, KundenNrKreisBis, VorgangNrKreisVon, VorgangNrKreisBis, RechungenMitMWST, Original_KGR, Original_Gruppe, Original_KundenNrKreisVon, Original_KundenNrKreisBis, Original_VorgangNrKreisVon, Original_VorgangNrKreisBis, Original_RechungenMitMWST)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub
End Class
