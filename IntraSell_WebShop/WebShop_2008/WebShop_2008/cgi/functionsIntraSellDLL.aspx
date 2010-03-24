<script language="VB" runat="server">  
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001-2009 (R)
    ' See www.griton.eu for last changes. 
    '===========================================================================

    Public Function IntraSellPreise()
        'get from cache 
        If Session("IntraSell.IntraSellPreise") Is Nothing Then
            IntraSellPreise = Session("IntraSell.IntraSellPreise")
            Exit Function
        End If
  
        Dim isP
        isP = Server.CreateObject("IntraSell.IntraSellPreise")
        isP.init(Session("MyDSN"))
        Session("IntraSell.IntraSellPreise") = isP
        IntraSellPreise = isP
    End Function

    Public Function IntraSellVorgaengeAusdruck()
        'get from cache 
        If (Session("IntraSell.IntraSellVorgaengeAusdruck")) Is Nothing Then
            IntraSellVorgaengeAusdruck = Session("IntraSell.IntraSellVorgaengeAusdruck")
            Exit Function
        End If
  
        Dim isP
        isP = Server.CreateObject("IntraSell.IntraSellVorgaengeAusdruck")
        isP.init(Session("MyDSN"))
        Session("IntraSell.IntraSellVorgaengeAusdruck") = isP
        IntraSellVorgaengeAusdruck = isP
    End Function

</script>

