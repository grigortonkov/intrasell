﻿'------------------------------------------------------------------------------
' <autogenerated>
'     This code was generated by a tool.
'     Runtime Version: 1.1.4322.2032
'
'     Changes to this file may cause incorrect behavior and will be lost if 
'     the code is regenerated.
' </autogenerated>
'------------------------------------------------------------------------------

Option Strict Off
Option Explicit On

Imports System
Imports System.Data
Imports System.Runtime.Serialization
Imports System.Xml


<Serializable(),  _
 System.ComponentModel.DesignerCategoryAttribute("code"),  _
 System.Diagnostics.DebuggerStepThrough(),  _
 System.ComponentModel.ToolboxItem(true)>  _
Public Class Stats
    Inherits DataSet
    
    Private tablelist_MembersPaymentOption As list_MembersPaymentOptionDataTable
    
    Private tablelist_MembershipTypes As list_MembershipTypesDataTable
    
    Public Sub New()
        MyBase.New
        Me.InitClass
        Dim schemaChangedHandler As System.ComponentModel.CollectionChangeEventHandler = AddressOf Me.SchemaChanged
        AddHandler Me.Tables.CollectionChanged, schemaChangedHandler
        AddHandler Me.Relations.CollectionChanged, schemaChangedHandler
    End Sub
    
    Protected Sub New(ByVal info As SerializationInfo, ByVal context As StreamingContext)
        MyBase.New
        Dim strSchema As String = CType(info.GetValue("XmlSchema", GetType(System.String)),String)
        If (Not (strSchema) Is Nothing) Then
            Dim ds As DataSet = New DataSet
            ds.ReadXmlSchema(New XmlTextReader(New System.IO.StringReader(strSchema)))
            If (Not (ds.Tables("list_MembersPaymentOption")) Is Nothing) Then
                Me.Tables.Add(New list_MembersPaymentOptionDataTable(ds.Tables("list_MembersPaymentOption")))
            End If
            If (Not (ds.Tables("list_MembershipTypes")) Is Nothing) Then
                Me.Tables.Add(New list_MembershipTypesDataTable(ds.Tables("list_MembershipTypes")))
            End If
            Me.DataSetName = ds.DataSetName
            Me.Prefix = ds.Prefix
            Me.Namespace = ds.Namespace
            Me.Locale = ds.Locale
            Me.CaseSensitive = ds.CaseSensitive
            Me.EnforceConstraints = ds.EnforceConstraints
            Me.Merge(ds, false, System.Data.MissingSchemaAction.Add)
            Me.InitVars
        Else
            Me.InitClass
        End If
        Me.GetSerializationData(info, context)
        Dim schemaChangedHandler As System.ComponentModel.CollectionChangeEventHandler = AddressOf Me.SchemaChanged
        AddHandler Me.Tables.CollectionChanged, schemaChangedHandler
        AddHandler Me.Relations.CollectionChanged, schemaChangedHandler
    End Sub
    
    <System.ComponentModel.Browsable(false),  _
     System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)>  _
    Public ReadOnly Property list_MembersPaymentOption As list_MembersPaymentOptionDataTable
        Get
            Return Me.tablelist_MembersPaymentOption
        End Get
    End Property
    
    <System.ComponentModel.Browsable(false),  _
     System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)>  _
    Public ReadOnly Property list_MembershipTypes As list_MembershipTypesDataTable
        Get
            Return Me.tablelist_MembershipTypes
        End Get
    End Property
    
    Public Overrides Function Clone() As DataSet
        Dim cln As Stats = CType(MyBase.Clone,Stats)
        cln.InitVars
        Return cln
    End Function
    
    Protected Overrides Function ShouldSerializeTables() As Boolean
        Return false
    End Function
    
    Protected Overrides Function ShouldSerializeRelations() As Boolean
        Return false
    End Function
    
    Protected Overrides Sub ReadXmlSerializable(ByVal reader As XmlReader)
        Me.Reset
        Dim ds As DataSet = New DataSet
        ds.ReadXml(reader)
        If (Not (ds.Tables("list_MembersPaymentOption")) Is Nothing) Then
            Me.Tables.Add(New list_MembersPaymentOptionDataTable(ds.Tables("list_MembersPaymentOption")))
        End If
        If (Not (ds.Tables("list_MembershipTypes")) Is Nothing) Then
            Me.Tables.Add(New list_MembershipTypesDataTable(ds.Tables("list_MembershipTypes")))
        End If
        Me.DataSetName = ds.DataSetName
        Me.Prefix = ds.Prefix
        Me.Namespace = ds.Namespace
        Me.Locale = ds.Locale
        Me.CaseSensitive = ds.CaseSensitive
        Me.EnforceConstraints = ds.EnforceConstraints
        Me.Merge(ds, false, System.Data.MissingSchemaAction.Add)
        Me.InitVars
    End Sub
    
    Protected Overrides Function GetSchemaSerializable() As System.Xml.Schema.XmlSchema
        Dim stream As System.IO.MemoryStream = New System.IO.MemoryStream
        Me.WriteXmlSchema(New XmlTextWriter(stream, Nothing))
        stream.Position = 0
        Return System.Xml.Schema.XmlSchema.Read(New XmlTextReader(stream), Nothing)
    End Function
    
    Friend Sub InitVars()
        Me.tablelist_MembersPaymentOption = CType(Me.Tables("list_MembersPaymentOption"),list_MembersPaymentOptionDataTable)
        If (Not (Me.tablelist_MembersPaymentOption) Is Nothing) Then
            Me.tablelist_MembersPaymentOption.InitVars
        End If
        Me.tablelist_MembershipTypes = CType(Me.Tables("list_MembershipTypes"),list_MembershipTypesDataTable)
        If (Not (Me.tablelist_MembershipTypes) Is Nothing) Then
            Me.tablelist_MembershipTypes.InitVars
        End If
    End Sub
    
    Private Sub InitClass()
        Me.DataSetName = "Stats"
        Me.Prefix = ""
        Me.Namespace = "http://www.tempuri.org/Stats.xsd"
        Me.Locale = New System.Globalization.CultureInfo("en-US")
        Me.CaseSensitive = false
        Me.EnforceConstraints = true
        Me.tablelist_MembersPaymentOption = New list_MembersPaymentOptionDataTable
        Me.Tables.Add(Me.tablelist_MembersPaymentOption)
        Me.tablelist_MembershipTypes = New list_MembershipTypesDataTable
        Me.Tables.Add(Me.tablelist_MembershipTypes)
    End Sub
    
    Private Function ShouldSerializelist_MembersPaymentOption() As Boolean
        Return false
    End Function
    
    Private Function ShouldSerializelist_MembershipTypes() As Boolean
        Return false
    End Function
    
    Private Sub SchemaChanged(ByVal sender As Object, ByVal e As System.ComponentModel.CollectionChangeEventArgs)
        If (e.Action = System.ComponentModel.CollectionChangeAction.Remove) Then
            Me.InitVars
        End If
    End Sub
    
    Public Delegate Sub list_MembersPaymentOptionRowChangeEventHandler(ByVal sender As Object, ByVal e As list_MembersPaymentOptionRowChangeEvent)
    
    Public Delegate Sub list_MembershipTypesRowChangeEventHandler(ByVal sender As Object, ByVal e As list_MembershipTypesRowChangeEvent)
    
    <System.Diagnostics.DebuggerStepThrough()>  _
    Public Class list_MembersPaymentOptionDataTable
        Inherits DataTable
        Implements System.Collections.IEnumerable
        
        Private columnPaymentMethod As DataColumn
        
        Private columnMembers As DataColumn
        
        Friend Sub New()
            MyBase.New("list_MembersPaymentOption")
            Me.InitClass
        End Sub
        
        Friend Sub New(ByVal table As DataTable)
            MyBase.New(table.TableName)
            If (table.CaseSensitive <> table.DataSet.CaseSensitive) Then
                Me.CaseSensitive = table.CaseSensitive
            End If
            If (table.Locale.ToString <> table.DataSet.Locale.ToString) Then
                Me.Locale = table.Locale
            End If
            If (table.Namespace <> table.DataSet.Namespace) Then
                Me.Namespace = table.Namespace
            End If
            Me.Prefix = table.Prefix
            Me.MinimumCapacity = table.MinimumCapacity
            Me.DisplayExpression = table.DisplayExpression
        End Sub
        
        <System.ComponentModel.Browsable(false)>  _
        Public ReadOnly Property Count As Integer
            Get
                Return Me.Rows.Count
            End Get
        End Property
        
        Friend ReadOnly Property PaymentMethodColumn As DataColumn
            Get
                Return Me.columnPaymentMethod
            End Get
        End Property
        
        Friend ReadOnly Property MembersColumn As DataColumn
            Get
                Return Me.columnMembers
            End Get
        End Property
        
        Public Default ReadOnly Property Item(ByVal index As Integer) As list_MembersPaymentOptionRow
            Get
                Return CType(Me.Rows(index),list_MembersPaymentOptionRow)
            End Get
        End Property
        
        Public Event list_MembersPaymentOptionRowChanged As list_MembersPaymentOptionRowChangeEventHandler
        
        Public Event list_MembersPaymentOptionRowChanging As list_MembersPaymentOptionRowChangeEventHandler
        
        Public Event list_MembersPaymentOptionRowDeleted As list_MembersPaymentOptionRowChangeEventHandler
        
        Public Event list_MembersPaymentOptionRowDeleting As list_MembersPaymentOptionRowChangeEventHandler
        
        Public Overloads Sub Addlist_MembersPaymentOptionRow(ByVal row As list_MembersPaymentOptionRow)
            Me.Rows.Add(row)
        End Sub
        
        Public Overloads Function Addlist_MembersPaymentOptionRow(ByVal PaymentMethod As String, ByVal Members As Integer) As list_MembersPaymentOptionRow
            Dim rowlist_MembersPaymentOptionRow As list_MembersPaymentOptionRow = CType(Me.NewRow,list_MembersPaymentOptionRow)
            rowlist_MembersPaymentOptionRow.ItemArray = New Object() {PaymentMethod, Members}
            Me.Rows.Add(rowlist_MembersPaymentOptionRow)
            Return rowlist_MembersPaymentOptionRow
        End Function
        
        Public Function GetEnumerator() As System.Collections.IEnumerator Implements System.Collections.IEnumerable.GetEnumerator
            Return Me.Rows.GetEnumerator
        End Function
        
        Public Overrides Function Clone() As DataTable
            Dim cln As list_MembersPaymentOptionDataTable = CType(MyBase.Clone,list_MembersPaymentOptionDataTable)
            cln.InitVars
            Return cln
        End Function
        
        Protected Overrides Function CreateInstance() As DataTable
            Return New list_MembersPaymentOptionDataTable
        End Function
        
        Friend Sub InitVars()
            Me.columnPaymentMethod = Me.Columns("PaymentMethod")
            Me.columnMembers = Me.Columns("Members")
        End Sub
        
        Private Sub InitClass()
            Me.columnPaymentMethod = New DataColumn("PaymentMethod", GetType(System.String), Nothing, System.Data.MappingType.Element)
            Me.Columns.Add(Me.columnPaymentMethod)
            Me.columnMembers = New DataColumn("Members", GetType(System.Int32), Nothing, System.Data.MappingType.Element)
            Me.Columns.Add(Me.columnMembers)
        End Sub
        
        Public Function Newlist_MembersPaymentOptionRow() As list_MembersPaymentOptionRow
            Return CType(Me.NewRow,list_MembersPaymentOptionRow)
        End Function
        
        Protected Overrides Function NewRowFromBuilder(ByVal builder As DataRowBuilder) As DataRow
            Return New list_MembersPaymentOptionRow(builder)
        End Function
        
        Protected Overrides Function GetRowType() As System.Type
            Return GetType(list_MembersPaymentOptionRow)
        End Function
        
        Protected Overrides Sub OnRowChanged(ByVal e As DataRowChangeEventArgs)
            MyBase.OnRowChanged(e)
            If (Not (Me.list_MembersPaymentOptionRowChangedEvent) Is Nothing) Then
                RaiseEvent list_MembersPaymentOptionRowChanged(Me, New list_MembersPaymentOptionRowChangeEvent(CType(e.Row,list_MembersPaymentOptionRow), e.Action))
            End If
        End Sub
        
        Protected Overrides Sub OnRowChanging(ByVal e As DataRowChangeEventArgs)
            MyBase.OnRowChanging(e)
            If (Not (Me.list_MembersPaymentOptionRowChangingEvent) Is Nothing) Then
                RaiseEvent list_MembersPaymentOptionRowChanging(Me, New list_MembersPaymentOptionRowChangeEvent(CType(e.Row,list_MembersPaymentOptionRow), e.Action))
            End If
        End Sub
        
        Protected Overrides Sub OnRowDeleted(ByVal e As DataRowChangeEventArgs)
            MyBase.OnRowDeleted(e)
            If (Not (Me.list_MembersPaymentOptionRowDeletedEvent) Is Nothing) Then
                RaiseEvent list_MembersPaymentOptionRowDeleted(Me, New list_MembersPaymentOptionRowChangeEvent(CType(e.Row,list_MembersPaymentOptionRow), e.Action))
            End If
        End Sub
        
        Protected Overrides Sub OnRowDeleting(ByVal e As DataRowChangeEventArgs)
            MyBase.OnRowDeleting(e)
            If (Not (Me.list_MembersPaymentOptionRowDeletingEvent) Is Nothing) Then
                RaiseEvent list_MembersPaymentOptionRowDeleting(Me, New list_MembersPaymentOptionRowChangeEvent(CType(e.Row,list_MembersPaymentOptionRow), e.Action))
            End If
        End Sub
        
        Public Sub Removelist_MembersPaymentOptionRow(ByVal row As list_MembersPaymentOptionRow)
            Me.Rows.Remove(row)
        End Sub
    End Class
    
    <System.Diagnostics.DebuggerStepThrough()>  _
    Public Class list_MembersPaymentOptionRow
        Inherits DataRow
        
        Private tablelist_MembersPaymentOption As list_MembersPaymentOptionDataTable
        
        Friend Sub New(ByVal rb As DataRowBuilder)
            MyBase.New(rb)
            Me.tablelist_MembersPaymentOption = CType(Me.Table,list_MembersPaymentOptionDataTable)
        End Sub
        
        Public Property PaymentMethod As String
            Get
                Try 
                    Return CType(Me(Me.tablelist_MembersPaymentOption.PaymentMethodColumn),String)
                Catch e As InvalidCastException
                    Throw New StrongTypingException("Der Wert kann nicht ermittelt werden, da er DBNull ist.", e)
                End Try
            End Get
            Set
                Me(Me.tablelist_MembersPaymentOption.PaymentMethodColumn) = value
            End Set
        End Property
        
        Public Property Members As Integer
            Get
                Try 
                    Return CType(Me(Me.tablelist_MembersPaymentOption.MembersColumn),Integer)
                Catch e As InvalidCastException
                    Throw New StrongTypingException("Der Wert kann nicht ermittelt werden, da er DBNull ist.", e)
                End Try
            End Get
            Set
                Me(Me.tablelist_MembersPaymentOption.MembersColumn) = value
            End Set
        End Property
        
        Public Function IsPaymentMethodNull() As Boolean
            Return Me.IsNull(Me.tablelist_MembersPaymentOption.PaymentMethodColumn)
        End Function
        
        Public Sub SetPaymentMethodNull()
            Me(Me.tablelist_MembersPaymentOption.PaymentMethodColumn) = System.Convert.DBNull
        End Sub
        
        Public Function IsMembersNull() As Boolean
            Return Me.IsNull(Me.tablelist_MembersPaymentOption.MembersColumn)
        End Function
        
        Public Sub SetMembersNull()
            Me(Me.tablelist_MembersPaymentOption.MembersColumn) = System.Convert.DBNull
        End Sub
    End Class
    
    <System.Diagnostics.DebuggerStepThrough()>  _
    Public Class list_MembersPaymentOptionRowChangeEvent
        Inherits EventArgs
        
        Private eventRow As list_MembersPaymentOptionRow
        
        Private eventAction As DataRowAction
        
        Public Sub New(ByVal row As list_MembersPaymentOptionRow, ByVal action As DataRowAction)
            MyBase.New
            Me.eventRow = row
            Me.eventAction = action
        End Sub
        
        Public ReadOnly Property Row As list_MembersPaymentOptionRow
            Get
                Return Me.eventRow
            End Get
        End Property
        
        Public ReadOnly Property Action As DataRowAction
            Get
                Return Me.eventAction
            End Get
        End Property
    End Class
    
    <System.Diagnostics.DebuggerStepThrough()>  _
    Public Class list_MembershipTypesDataTable
        Inherits DataTable
        Implements System.Collections.IEnumerable
        
        Private columnMembers As DataColumn
        
        Private columnTypeOfAccount As DataColumn
        
        Friend Sub New()
            MyBase.New("list_MembershipTypes")
            Me.InitClass
        End Sub
        
        Friend Sub New(ByVal table As DataTable)
            MyBase.New(table.TableName)
            If (table.CaseSensitive <> table.DataSet.CaseSensitive) Then
                Me.CaseSensitive = table.CaseSensitive
            End If
            If (table.Locale.ToString <> table.DataSet.Locale.ToString) Then
                Me.Locale = table.Locale
            End If
            If (table.Namespace <> table.DataSet.Namespace) Then
                Me.Namespace = table.Namespace
            End If
            Me.Prefix = table.Prefix
            Me.MinimumCapacity = table.MinimumCapacity
            Me.DisplayExpression = table.DisplayExpression
        End Sub
        
        <System.ComponentModel.Browsable(false)>  _
        Public ReadOnly Property Count As Integer
            Get
                Return Me.Rows.Count
            End Get
        End Property
        
        Friend ReadOnly Property MembersColumn As DataColumn
            Get
                Return Me.columnMembers
            End Get
        End Property
        
        Friend ReadOnly Property TypeOfAccountColumn As DataColumn
            Get
                Return Me.columnTypeOfAccount
            End Get
        End Property
        
        Public Default ReadOnly Property Item(ByVal index As Integer) As list_MembershipTypesRow
            Get
                Return CType(Me.Rows(index),list_MembershipTypesRow)
            End Get
        End Property
        
        Public Event list_MembershipTypesRowChanged As list_MembershipTypesRowChangeEventHandler
        
        Public Event list_MembershipTypesRowChanging As list_MembershipTypesRowChangeEventHandler
        
        Public Event list_MembershipTypesRowDeleted As list_MembershipTypesRowChangeEventHandler
        
        Public Event list_MembershipTypesRowDeleting As list_MembershipTypesRowChangeEventHandler
        
        Public Overloads Sub Addlist_MembershipTypesRow(ByVal row As list_MembershipTypesRow)
            Me.Rows.Add(row)
        End Sub
        
        Public Overloads Function Addlist_MembershipTypesRow(ByVal Members As Integer, ByVal TypeOfAccount As String) As list_MembershipTypesRow
            Dim rowlist_MembershipTypesRow As list_MembershipTypesRow = CType(Me.NewRow,list_MembershipTypesRow)
            rowlist_MembershipTypesRow.ItemArray = New Object() {Members, TypeOfAccount}
            Me.Rows.Add(rowlist_MembershipTypesRow)
            Return rowlist_MembershipTypesRow
        End Function
        
        Public Function GetEnumerator() As System.Collections.IEnumerator Implements System.Collections.IEnumerable.GetEnumerator
            Return Me.Rows.GetEnumerator
        End Function
        
        Public Overrides Function Clone() As DataTable
            Dim cln As list_MembershipTypesDataTable = CType(MyBase.Clone,list_MembershipTypesDataTable)
            cln.InitVars
            Return cln
        End Function
        
        Protected Overrides Function CreateInstance() As DataTable
            Return New list_MembershipTypesDataTable
        End Function
        
        Friend Sub InitVars()
            Me.columnMembers = Me.Columns("Members")
            Me.columnTypeOfAccount = Me.Columns("TypeOfAccount")
        End Sub
        
        Private Sub InitClass()
            Me.columnMembers = New DataColumn("Members", GetType(System.Int32), Nothing, System.Data.MappingType.Element)
            Me.Columns.Add(Me.columnMembers)
            Me.columnTypeOfAccount = New DataColumn("TypeOfAccount", GetType(System.String), Nothing, System.Data.MappingType.Element)
            Me.Columns.Add(Me.columnTypeOfAccount)
        End Sub
        
        Public Function Newlist_MembershipTypesRow() As list_MembershipTypesRow
            Return CType(Me.NewRow,list_MembershipTypesRow)
        End Function
        
        Protected Overrides Function NewRowFromBuilder(ByVal builder As DataRowBuilder) As DataRow
            Return New list_MembershipTypesRow(builder)
        End Function
        
        Protected Overrides Function GetRowType() As System.Type
            Return GetType(list_MembershipTypesRow)
        End Function
        
        Protected Overrides Sub OnRowChanged(ByVal e As DataRowChangeEventArgs)
            MyBase.OnRowChanged(e)
            If (Not (Me.list_MembershipTypesRowChangedEvent) Is Nothing) Then
                RaiseEvent list_MembershipTypesRowChanged(Me, New list_MembershipTypesRowChangeEvent(CType(e.Row,list_MembershipTypesRow), e.Action))
            End If
        End Sub
        
        Protected Overrides Sub OnRowChanging(ByVal e As DataRowChangeEventArgs)
            MyBase.OnRowChanging(e)
            If (Not (Me.list_MembershipTypesRowChangingEvent) Is Nothing) Then
                RaiseEvent list_MembershipTypesRowChanging(Me, New list_MembershipTypesRowChangeEvent(CType(e.Row,list_MembershipTypesRow), e.Action))
            End If
        End Sub
        
        Protected Overrides Sub OnRowDeleted(ByVal e As DataRowChangeEventArgs)
            MyBase.OnRowDeleted(e)
            If (Not (Me.list_MembershipTypesRowDeletedEvent) Is Nothing) Then
                RaiseEvent list_MembershipTypesRowDeleted(Me, New list_MembershipTypesRowChangeEvent(CType(e.Row,list_MembershipTypesRow), e.Action))
            End If
        End Sub
        
        Protected Overrides Sub OnRowDeleting(ByVal e As DataRowChangeEventArgs)
            MyBase.OnRowDeleting(e)
            If (Not (Me.list_MembershipTypesRowDeletingEvent) Is Nothing) Then
                RaiseEvent list_MembershipTypesRowDeleting(Me, New list_MembershipTypesRowChangeEvent(CType(e.Row,list_MembershipTypesRow), e.Action))
            End If
        End Sub
        
        Public Sub Removelist_MembershipTypesRow(ByVal row As list_MembershipTypesRow)
            Me.Rows.Remove(row)
        End Sub
    End Class
    
    <System.Diagnostics.DebuggerStepThrough()>  _
    Public Class list_MembershipTypesRow
        Inherits DataRow
        
        Private tablelist_MembershipTypes As list_MembershipTypesDataTable
        
        Friend Sub New(ByVal rb As DataRowBuilder)
            MyBase.New(rb)
            Me.tablelist_MembershipTypes = CType(Me.Table,list_MembershipTypesDataTable)
        End Sub
        
        Public Property Members As Integer
            Get
                Try 
                    Return CType(Me(Me.tablelist_MembershipTypes.MembersColumn),Integer)
                Catch e As InvalidCastException
                    Throw New StrongTypingException("Der Wert kann nicht ermittelt werden, da er DBNull ist.", e)
                End Try
            End Get
            Set
                Me(Me.tablelist_MembershipTypes.MembersColumn) = value
            End Set
        End Property
        
        Public Property TypeOfAccount As String
            Get
                Try 
                    Return CType(Me(Me.tablelist_MembershipTypes.TypeOfAccountColumn),String)
                Catch e As InvalidCastException
                    Throw New StrongTypingException("Der Wert kann nicht ermittelt werden, da er DBNull ist.", e)
                End Try
            End Get
            Set
                Me(Me.tablelist_MembershipTypes.TypeOfAccountColumn) = value
            End Set
        End Property
        
        Public Function IsMembersNull() As Boolean
            Return Me.IsNull(Me.tablelist_MembershipTypes.MembersColumn)
        End Function
        
        Public Sub SetMembersNull()
            Me(Me.tablelist_MembershipTypes.MembersColumn) = System.Convert.DBNull
        End Sub
        
        Public Function IsTypeOfAccountNull() As Boolean
            Return Me.IsNull(Me.tablelist_MembershipTypes.TypeOfAccountColumn)
        End Function
        
        Public Sub SetTypeOfAccountNull()
            Me(Me.tablelist_MembershipTypes.TypeOfAccountColumn) = System.Convert.DBNull
        End Sub
    End Class
    
    <System.Diagnostics.DebuggerStepThrough()>  _
    Public Class list_MembershipTypesRowChangeEvent
        Inherits EventArgs
        
        Private eventRow As list_MembershipTypesRow
        
        Private eventAction As DataRowAction
        
        Public Sub New(ByVal row As list_MembershipTypesRow, ByVal action As DataRowAction)
            MyBase.New
            Me.eventRow = row
            Me.eventAction = action
        End Sub
        
        Public ReadOnly Property Row As list_MembershipTypesRow
            Get
                Return Me.eventRow
            End Get
        End Property
        
        Public ReadOnly Property Action As DataRowAction
            Get
                Return Me.eventAction
            End Get
        End Property
    End Class
End Class