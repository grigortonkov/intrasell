<script language="VB" runat="server">  
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001-2009 (R)
    ' See www.griton.eu for last changes. 
    '===========================================================================

    'initialisiert alle module beim beginn der session 
    Public Sub IntraSellDLL_InitOnPageLoad() 
        InitModule("IntraSell.IntraSellPreise", True)
        InitModule("IntraSell.IntraSellVorgaengeAusdruck", True)
        InitModule("IntraSell.IntraSellDictionary", True)
    End Sub 
      
      
    'gibt die DB Verbindung wieder frei für alle module beim ende der session 
    Public Sub IntraSellDLL_DestroyOnPageEnd() 
        IntraSellPreise().destroy()
        IntraSellVorgaengeAusdruck().destroy()
        IntraSellDictionary().destroy()
    End Sub 
   
   
    'for compatibility reasons 
    const dbOpenDynaset As Object = 0 
    
    Function OpenRecordset(ByVal sql As String, ByVal something As Object)
        'Response.Write sql
        OpenRecordset = objConnectionExecute(sql)
    End Function

    Sub msgbox(ByVal t1 As String, ByVal t2 As String )
        Response.Write(t1)
    End Sub
   
      
     Public Function InitModule(ByVal modName As String, ByVal callInit As Boolean) As Object
        'get from cache 
        If Not Session(modName) Is Nothing Then
            InitModule = Session(modName)
            If callInit then 
                InitModule.init(Session("MyDSN"))
            End If  
            Exit Function
        End If
      
        'init
        Dim isP As Object = Server.CreateObject(modName)
        If callInit then 
            isP.init(Session("MyDSN"))
        End If  
        Session(modName) = isP
        InitModule = isP
    End Function
    
     ''' <summary>
    ''' IntraSellPreise
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function IntraSellPreise() As Object
        IntraSellPreise = InitModule("IntraSell.IntraSellPreise", False)
    End Function

    ''' <summary>
    ''' IntraSellVorgaengeAusdruck
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function IntraSellVorgaengeAusdruck() As Object
        IntraSellVorgaengeAusdruck = InitModule("IntraSell.IntraSellVorgaengeAusdruck", False)
    End Function
    
    ''' <summary>
    ''' IntraSellDictionary
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function IntraSellDictionary() As Object
        IntraSellDictionary = InitModule("IntraSell.IntraSellDictionary", False)
    End Function

</script>

