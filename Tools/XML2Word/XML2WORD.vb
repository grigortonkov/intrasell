Option Strict Off
Option Explicit On

Imports Microsoft.Office.Interop

''' <summary>
''' API for XML2WORD
''' </summary>
''' <remarks></remarks> 
Public Class XML2WORD

    Dim m_oXML As XmlDataDocument
    Dim m_sSource As String
    Dim m_sWordTemplate As String
    Dim m_bFile As Boolean
    Dim m_sErr As String
    Dim m_sDocPath As String
    Dim m_sDocPrefix As String

    ''' <summary>
    ''' Filename of the XML contianing information to be merged. 
    ''' </summary>
    ''' <value></value>
    ''' <remarks></remarks>
    Public WriteOnly Property XMLFile() As String
        Set(ByVal Value As String)

            m_sSource = Value
            m_bFile = True

        End Set
    End Property

    ''' <summary>
    ''' Alternative to XMLFile, provide the XML as string.
    ''' </summary>
    ''' <value></value>
    ''' <remarks></remarks>
    Public WriteOnly Property XMLString() As String
        Set(ByVal Value As String)

            m_sSource = Value
            m_bFile = False

        End Set
    End Property

    ''' <summary>
    ''' Last API Error
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public ReadOnly Property LastError() As String
        Get

            LastError = m_sErr

        End Get
    End Property

    ''' <summary>
    ''' Filename of the word DOT (document template)
    ''' </summary>
    ''' <value></value>
    ''' <remarks></remarks>
    Public WriteOnly Property WordTemplate() As String
        Set(ByVal Value As String)

            m_sWordTemplate = Value

        End Set
    End Property

    ''' <summary>
    ''' Path the documents to be generated into.
    ''' </summary>
    ''' <value></value>
    ''' <remarks></remarks>
    Public WriteOnly Property Path() As String
        Set(ByVal Value As String)

            m_sDocPath = Value

        End Set
    End Property

    ''' <summary>
    ''' Prefix of the generated word documents.
    ''' </summary>
    ''' <value></value>
    ''' <remarks></remarks>
    Public WriteOnly Property DocumentPrefix() As String
        Set(ByVal Value As String)

            m_sDocPrefix = Value

        End Set
    End Property

    ''' <summary>
    ''' Starts MS Word and merges a XML with the word template file.
    ''' </summary>
    ''' <param name="FilenamePrefix"></param>
    ''' <param name="showAppWindow">Show Word instance during generation</param>
    ''' <param name="closeAppWindowAtEnd">if true the Word instance will be disposed, 
    '''       if false the Word instance will be visible at end of generation.</param>
    ''' <returns>true or false</returns>
    ''' <remarks></remarks>
    Public Function Execute( _
    Optional ByVal FilenamePrefix As String = "", _
    Optional ByVal showAppWindow As Boolean = False, _
    Optional ByVal closeAppWindowAtEnd As Boolean = True) As Boolean

        Dim bLoaded As Boolean
        Dim oWordDoc As Word.Document
        Dim oWordField As Word.MailMergeField
        Dim oWordTable As Word.Table
        Dim oWordFieldRange As Word.Range
        Dim oXMLDocNode As Xml.XmlNode
        Dim oXMLFieldNode As Xml.XmlNode
        Dim oXMLParentNode As Xml.XmlNode
        Dim oXMLNextNode As Xml.XmlNode
        Dim oXMLDoc As Xml.XmlNode
        Dim nParentIndex As Short
        Dim nRow As Short
        Dim nCol As Short
        Dim bRowColFound As Boolean
        Dim bTableField As Boolean
        Dim sFieldSplit() As String
        Dim sFieldSplitName() As String ' name of the Merge Field Tag 

        Dim n As Short
        Dim i As Short
        Dim sPath As String
        Dim bTablesProcessed() As Boolean
        Dim nTable As Short

        oWord.Visible = showAppWindow 'True

        If m_oXML Is Nothing Then
            m_oXML = New Xml.XmlDataDocument()
        End If
        'm_oXML.async = False

        If m_bFile Then
            m_oXML.Load(m_sSource)
            bLoaded = True
        Else
            m_oXML.LoadXml(m_sSource)
            bLoaded = True
        End If

        If bLoaded Then

            If m_sDocPath = "" Then
                sPath = GetPath(m_sWordTemplate)
            Else
                sPath = m_sDocPath
            End If

            oXMLDoc = m_oXML.DocumentElement

            If oXMLDoc.HasChildNodes Then
                For Each oXMLDocNode In oXMLDoc.ChildNodes

                    oWordDoc = oWord.Documents.Add(m_sWordTemplate, False)
                    ReDim bTablesProcessed(oWordDoc.Tables.Count)
                    For Each oWordField In oWordDoc.MailMerge.Fields

                        oWordField.Select()
                        oWordFieldRange = oWord.Selection.Range

                        bTableField = False
                        nTable = -1
                        For Each oWordTable In oWordDoc.Tables
                            nTable = nTable + 1
                            If oWordFieldRange.InRange(oWordTable.Range) Then
                                bTableField = True
                                Exit For
                            End If
                        Next oWordTable

                        sFieldSplit = Split(oWordField.Code.Text, " ")
                        ' sFieldSplit = Split(sFieldSplit(3), "_") 'TODO 2 is wrong moved to 3 

                        sFieldSplitName = Split(sFieldSplit(3), "_") 'TODO 2 is wrong moved to 3 
                        sFieldSplit = sFieldSplitName

                        oXMLFieldNode = oXMLDocNode
                        'UPGRADE_NOTE: Object oXMLParentNode may not be destroyed until it is garbage collected.
                        ' Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1029"'
                        oXMLParentNode = Nothing
                        For n = LBound(sFieldSplit) To UBound(sFieldSplit)
                            Try
                                oXMLFieldNode = oXMLFieldNode.SelectSingleNode(sFieldSplit(n))
                            Catch
                                Debug.Write(Err.Description)
                            End Try

                            If oXMLFieldNode Is Nothing Then
                                Exit For
                            End If
                            If bTableField And oXMLParentNode Is Nothing Then
                                oXMLNextNode = oXMLFieldNode.NextSibling
                                If Not oXMLNextNode Is Nothing Then
                                    If oXMLNextNode.Name = oXMLFieldNode.Name Then 'baseName
                                        oXMLParentNode = oXMLFieldNode
                                        nParentIndex = n
                                        Exit For
                                    End If
                                End If
                            End If
                        Next n

                        If bTableField And Not oXMLParentNode Is Nothing Then
                            nRow = 0
                            nCol = 0
                            Do While Not oXMLParentNode Is Nothing
                                oXMLFieldNode = oXMLParentNode
                                For n = nParentIndex + 1 To UBound(sFieldSplit)
                                    oXMLFieldNode = oXMLFieldNode.SelectSingleNode(sFieldSplit(n))
                                    If oXMLFieldNode Is Nothing Then
                                        Exit For
                                    End If
                                Next n
                                If oXMLFieldNode Is Nothing Then
                                    oWordFieldRange.Text = "Unresolved fieldname"
                                Else
                                    If nRow = 0 Then
                                        bRowColFound = False
                                        For nRow = 1 To oWordTable.Rows.Count
                                            For nCol = 1 To oWordTable.Columns.Count
                                                If oWordFieldRange.InRange(oWordTable.Cell(nRow, nCol).Range) Then
                                                    bRowColFound = True
                                                    Exit For
                                                End If
                                            Next nCol
                                            If bRowColFound Then
                                                Exit For
                                            End If
                                        Next nRow
                                        If Not oXMLFieldNode.ChildNodes.Item(0) Is Nothing Then
                                            oWordFieldRange.Text = oXMLFieldNode.ChildNodes.Item(0).InnerText
                                        End If

                                    Else
                                        nRow = nRow + 1
                                        If Not bTablesProcessed(nTable) Then
                                            If nRow <= oWordTable.Rows.Count Then
                                                oWordTable.Rows.Add(oWordTable.Rows.Item(nRow))
                                            Else
                                                oWordTable.Rows.Add()
                                            End If
                                        End If
                                        If Not oXMLFieldNode.ChildNodes.Item(0) Is Nothing Then
                                            oWordTable.Cell(nRow, nCol).Range.Text = oXMLFieldNode.ChildNodes.Item(0).InnerText
                                        End If
                                    End If
                                    'oXMLParentNode = oXMLParentNode.nextSibling
                                End If
                                oXMLParentNode = oXMLParentNode.NextSibling
                            Loop
                            bTablesProcessed(nTable) = True
                        Else
                            If oXMLFieldNode Is Nothing Then
                                oWordFieldRange.Text = "Unresolved fieldname"
                            Else
                                Try
                                    If oXMLFieldNode.ChildNodes.Item(0) Is Nothing Then
                                        oWordFieldRange.Text = "-"
                                    Else
                                        oWordFieldRange.Text = oXMLFieldNode.ChildNodes.Item(0).InnerText
                                    End If

                                Catch
                                    oWordFieldRange.Text = Err.Description
                                End Try

                            End If
                        End If

                    Next oWordField

                    i = i + 1
                    oWordDoc.SaveAs(sPath & m_sDocPrefix & FilenamePrefix & CStr(i) & ".doc")

                Next oXMLDocNode

            End If

        Else

        End If

        If closeAppWindowAtEnd Then
            CType(oWord, Word._Application).Quit()
            oWord = Nothing
        Else
            'show Word 
            CType(oWord, Word._Application).Visible = True
        End If

        m_oXML = Nothing

    End Function


    Sub Class_Initialize()

        If nRef = 0 Then
            oWord = New Word.Application()
        End If
        nRef = nRef + 1

    End Sub

    Public Sub New()
        MyBase.New()
        Class_Initialize()
    End Sub

    Private Sub Class_Terminate()

        m_oXML = Nothing
        nRef = nRef - 1
        If nRef = 0 Then
            oWord = Nothing
        End If

    End Sub

    Protected Overrides Sub Finalize()
        Class_Terminate()
        MyBase.Finalize()
    End Sub
End Class