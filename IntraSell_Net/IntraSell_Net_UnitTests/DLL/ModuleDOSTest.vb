Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net
Imports System.IO



'''<summary>
'''This is a test class for ModuleDOSTest and is intended
'''to contain all ModuleDOSTest Unit Tests
'''</summary>
<TestClass()> _
Public Class ModuleDOSTest


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
            testContextInstance = value
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
    '''A test for RenameFile
    '''</summary>
    <TestMethod()> _
    Public Sub RenameFileTest()
        Dim oldfilename As String = "C:\file1.txt"
        Dim newfilename As String = "C:\temp\subfolder\file2.txt"

        'Create File as preparation 
        Dim f As StreamWriter = New StreamWriter(oldfilename)
        f.Write("nothing")
        f.Close()


        ModuleDOS.RenameFile(oldfilename, newfilename)
        'Assert.Inconclusive("A method that does not return a value cannot be verified.")

        File.Delete(newfilename)
    End Sub
End Class
