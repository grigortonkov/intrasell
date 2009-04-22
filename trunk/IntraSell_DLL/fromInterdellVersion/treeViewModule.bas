Attribute VB_Name = "TreeViewModule"
Option Compare Database
Public Const TREE_VIEW_WIDTH = 3800
Public Const TOP_POSITION_OF_FORMS = 0
Public Const FORMS_WIDTH = 11300
Public Const FORMS_HEIGHT = 9500




'OPEN FORMS
Public Sub treeViewActionClick(ByRef treeView, ByRef nodeName)
   Dim sql, rs
   
   'Me.RecordSource
   
   If "qryCats" = "qryCats" Then
      sql = "select * from treeCats where Name like '" & nodeName & "'"
      Set rs = CurrentDb.openRecordset(sql)
      If Not rs.EOF Then
      
      'OPEN FORM
         Dim FormToOpen: FormToOpen = rs("formToOpen")
         If FormToOpen <> "" Then
         Dim whereCodition
         If InStr(FormToOpen, ",") > 0 Then
              whereCodition = Mid(FormToOpen, InStr(FormToOpen, ",") + 1)
              FormToOpen = Left(FormToOpen, InStr(FormToOpen, ",") - 1)
         End If
           'check if filter is given
               'DoCmd.OpenForm FormToOpen, acDesign, , whereCodition
               'Forms(FormToOpen).PopUp = False
               'DoCmd.Save acForm, FormToOpen
               DoCmd.OpenForm FormToOpen, acNormal, , whereCodition
               Forms(FormToOpen).Filter = whereCodition
               Forms(FormToOpen).FilterOn = True
               DoCmd.MoveSize TREE_VIEW_WIDTH, TOP_POSITION_OF_FORMS, FORMS_WIDTH, FORMS_HEIGHT
               'Call translate(FormToOpen)
               
         End If
      
      'CHECK IF UPDATE NEEDED
       Dim sqlToExecute: sqlToExecute = rs("SQLQueryForChilds")
       If sqlToExecute <> "" Then
       sql = "select count(*) from (" & sqlToExecute & ")"
       Debug.Print sql
           Set rs = CurrentDb.openRecordset(sql)
           If Not rs.EOF Then
              Dim a1: a1 = rs(0)
              Dim a2: a2 = treeView.Nodes(treeView.SelectedItem.index).Children
              If a1 <> a2 Then
                'MsgBox "Update!"
                Call treeViewActionDblClick(treeView, nodeName)
              End If
              
           End If
           
       End If
  
      
      End If
   End If
   
End Sub


'REFRESH
Public Sub treeViewActionDblClick(ByRef treeView, ByRef nodeName)
   Dim sql, rs
   
   'Me.RecordSource
   
   If "qryCats" = "qryCats" Then
      sql = "select * from treeCats where Name like '" & nodeName & "'"
      Set rs = CurrentDb.openRecordset(sql)
      If Not rs.EOF Then
      
 
      'FILL CHILDS
      
       Dim sqlToExecute: sqlToExecute = rs("SQLQueryForChilds")
       If sqlToExecute <> "" Then
           deleteAllChilds treeView
           
           Set rs = CurrentDb.openRecordset(sqlToExecute)
            rs.MoveFirst
            
           Dim curField: curField = 0
          
           
           While Not rs.EOF
           curField = curField + 1
           If curField = 100 Then
              If MsgBox("Es sind mehr als 100 Eintraege vorhanden. Fortsetzen?", vbYesNo) = vbNo Then
                   Exit Sub
             End If
           End If
           
              If rs.Fields.Count >= 4 Then
                addTreeChild treeView, rs(0), rs(1), rs(2), rs(3)
              Else
                    If rs.Fields.Count >= 3 Then
                      addTreeChild treeView, rs(0), rs(1), rs(2), ""
                    Else
                          If rs.Fields.Count >= 2 Then
                              addTreeChild treeView, rs(0), rs(1), "", ""
                          Else
                              If rs.Fields.Count >= 1 Then
                                  addTreeChild treeView, rs(0), "", "", ""
                              End If
                          End If
                    End If
                End If
           
              rs.MoveNext
           Wend
 
       End If
     
      
      End If
   End If
   
End Sub




Private Sub addTreeChild(ByRef TreeView1, ByVal childName As String, ByVal FormToOpen As String, ByVal sqlQueryForChild As String, ByVal Icon)
'Add a node using tvwChild
    Dim oNodex As Node
    Dim skey As String
    Dim iIndex As Integer
        
    'On Error GoTo myerr 'if the treeview does not have a node selected
    'the next line of code will return an error number 91
    iIndex = TreeView1.SelectedItem.index 'Check to see if a Node is selected
    skey = GetNextKey(TreeView1) ' Get a key for the new Node
    Set oNodex = TreeView1.Nodes.Add(iIndex, tvwChild, skey, childName, CInt(Icon), CInt(Icon))
    oNodex.EnsureVisible 'make sure the child node is visible
    
    InsertOrUpdate childName, FormToOpen, sqlQueryForChild
    
    Exit Sub
myerr:
    'Display a messge telling the user to select a node
    MsgBox ("You must select a Node to do an Add Child" & vbCrLf _
       & "If the TreeView is empty us Add Last to create the first node")
    Exit Sub
End Sub

 
Function InsertOrUpdate(ByVal Name As String, ByVal FormToOpen As String, ByVal SQLQueryForChilds As String)

        DoCmd.SetWarnings False
        Dim sql, rs
            sql = "select * from treeCats where Name like '" & Name & "'"
            Set rs = CurrentDb.openRecordset(sql)
            If rs.EOF Then
              sql = "INSERT INTO treeCats (ID, IDParent, Name, formToOpen, sqlQueryforchilds, CanBedeleted, CanBeRenamed) " & _
                  "values(0,0,'" & Name & "','" & FormToOpen & "','" & SQLQueryForChilds & "',0,0)"
            Else
              sql = "UPDATE treeCats SET formToOpen ='" & FormToOpen & "', sqlQueryforchilds='" & SQLQueryForChilds & "' where name like '" & Name & "'"
            End If
            'close record set
            rs.Close
        
        DoCmd.RunSQL sql
        DoCmd.SetWarnings True
End Function

 

Public Function GetNextKey(ByRef TreeView1) As String
'Returns a new key value for each Node being added to the TreeView
'This algorithm is very simple and will limit you to adding a total of 999 nodes
'Each node needs a unique key. If you allow users to remove Nodes you can't use
'the Nodes count +1 as the key for a new node.

    Dim sNewKey As String
    Dim iHold As Integer
    Dim i As Integer
    On Error GoTo myerr
    'The next line will return error #35600 if there are no Nodes in the TreeView
    iHold = Val(TreeView1.Nodes(1).Key)
    For i = 1 To TreeView1.Nodes.Count
        If Val(TreeView1.Nodes(i).Key) > iHold Then
            iHold = Val(TreeView1.Nodes(i).Key)
        End If
    Next
    iHold = iHold + 1
    sNewKey = CStr(iHold) & "_"
    GetNextKey = sNewKey 'Return a unique key
    Exit Function
myerr:
    'Because the TreeView is empty return a 1 for the key of the first Node
    GetNextKey = "1_"
    Exit Function
End Function


Public Function deleteAllChilds(ByRef TreeView1)
   Dim oNodex As Node
    Dim skey As String
    Dim iIndex As Integer
        
   ' On Error GoTo myerr 'if the treeview does not have a node selected
    ' the next line of code will return an error number 91
    iIndex = TreeView1.SelectedItem.index 'Check to see if a Node is selected
    Dim childIndex
    Dim i
    For i = 1 To TreeView1.Nodes(iIndex).Children
       childIndex = TreeView1.Nodes(iIndex).Child.FirstSibling.index
       TreeView1.Nodes.Remove childIndex
    Next
    
    'oNodex.EnsureVisible 'make sure the child node is visible
    Exit Function
'myerr:
    'Display a messge telling the user to select a node
'    MsgBox ("You must select a Node to do an Delete All Childs" & vbCrLf _
'       & "If the TreeView is empty us Add Last to create the first node")
'    Exit Function
End Function

