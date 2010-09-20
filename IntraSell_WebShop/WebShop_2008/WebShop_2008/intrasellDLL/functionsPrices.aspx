<% 
    
    USE_AUFSCHLAG_KATEGORIE = False
    USE_STAFFELPREISE = False
    USE_VORKALKULIERTE_VKPREISE = True
    
%>

<script language="VB" runat="server">  

    Dim USE_AUFSCHLAG_KATEGORIE
    Dim USE_STAFFELPREISE
    Dim USE_VORKALKULIERTE_VKPREISE
  
    ' Proxy to the DLL Function 
    Public Function getPreis(ByVal IdNr, ByVal ArtNr, ByVal Stk) As Decimal
        If (ArtNr) Is Nothing Or ArtNr & "" = "" Then
            getPreis = 0
            Exit Function
        End If
  
        If Request.QueryString("debug") = "true" Then
            Response.Write("<br>" & Chr(13))
            Response.Write("get Price for IdNr = [" & IdNr & "]")
            Response.Write("<br>" & Chr(13))
            Response.Write("get Price for ArtNr = [" & ArtNr & "]")
            Response.Write("<br>" & Chr(13))
            Response.Write("get Price for Stk = [" & Stk & "]")
        End If
  
        If (IdNr) Is Nothing Or IdNr & "" = "" Then IdNr = 0
  
        'on error resume next
        getPreis = IntraSellPreise().getPreis(IdNr.ToString, ArtNr, Stk.ToString)
        'exit function 
    End Function



    Public Function makeNettoPreis(ByVal ArtNr As Object, ByVal Stk As Object, ByVal IdNr As Object) As Decimal
        makeNettoPreis = IntraSellPreise().makeNettoPreis(ArtNr, Stk, IdNr)
    End Function


    Public Function makeBruttoPreis(ByVal Preis As Object, ByVal MwstGroup As Object, ByVal Land As Object) As Decimal

        If Request.QueryString("debug") = "true" Then
            Response.Write("<br>" & Chr(13))
            Response.Write("get Price for Preis = [" & Preis & "]")
            Response.Write("<br>" & Chr(13))
            Response.Write("get Price for MwstGroup = [" & MwstGroup & "]")
            Response.Write("<br>" & Chr(13))
            Response.Write("get Price for Land = [" & Land & "]")
        End If
        Dim returnPreis : returnPreis = IntraSellPreise().makeBruttoPreis(Preis, MwstGroup, Land)
        If IsNumeric(Replace(returnPreis, ",", ".")) Then
            makeBruttoPreis = returnPreis
        Else
            Response.Write("<br><font color=red>Fehler in der Preisberechung: makeBruttoPreis=" & +returnPreis & "</font>")
            makeBruttoPreis = 0
        End If

    End Function

    Function makeBruttoPreis2(ByVal ArtNr As Object, ByVal Stk As Object, ByVal Land As Object) As Decimal

        If Request.QueryString("debug") = "true" Then
            Response.Write("<br>" & Chr(13))
            Response.Write("get Price for ArtNR = [" & ArtNr & "]")
            Response.Write("<br>" & Chr(13))
            Response.Write("get Price for Stk = [" & Stk & "]")
            Response.Write("<br>" & Chr(13))
            Response.Write("get Price for Land = [" & Land & "]")
        End If
  
        makeBruttoPreis2 = IntraSellPreise().makeBruttoPreis2(ArtNr, Stk, Land)
    End Function

    Public Function calculateBruttoPreis(ByVal VKPreis As Object, ByVal ArtNr As Object, ByVal IDNR As Object) As Decimal
        If Request.QueryString("debug") = "true" Then
            Response.Write("<br>" & Chr(13))
            Response.Write("get calculateBruttoPreis for VKPreis = [" & VKPreis & "]")
            Response.Write("<br>" & Chr(13) & " ArtNr = [" & ArtNr & "]")
            Response.Write("<br>" & Chr(13) & " IDNR = [" & IDNR & "]")
        End If
  
        calculateBruttoPreis = IntraSellPreise().calculateBruttoPreis(CDbl(VKPreis), CStr(ArtNr), CStr(IDNR))
    End Function

''' <summary>
''' getEKPreis
''' </summary>
''' <param name="ArtNr"></param>
''' <returns></returns>
''' <remarks></remarks>
    Function getEKPreis(ByVal ArtNr As Object) As Decimal
        getEKPreis = IntraSellPreise().getEKPreis(ArtNr)
    End Function

''' <summary>
''' getBestLieferant
''' </summary>
''' <param name="ArtNr"></param>
''' <returns></returns>
''' <remarks></remarks>
    Public Function getBestLieferant(ByVal ArtNr As Object) As String
        getBestLieferant = IntraSellPreise().getBestLieferant(ArtNr)
    End Function

    ''' <summary>
    ''' getLieferantLagerInfo
    ''' </summary>
    ''' <param name="ArtNR"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function getLieferantLagerInfo(ByVal ArtNR As Object) As String 
        Try 
            getLieferantLagerInfo = IntraSellPreise().getLieferantLagerInfo(ArtNR)
        Catch
            getLieferantLagerInfo =  Err.Description
        End Try
        
    End Function

''' <summary>
''' getVorgangTableForType
''' </summary>
''' <param name="Typ"></param>
''' <returns></returns>
''' <remarks></remarks>
    Public Function getVorgangTableForType(ByVal Typ As String)
        getVorgangTableForType = IntraSellPreise().getVorgangTableForType(Typ)
    End Function

''' <summary>
''' getVorgangArtikelTableForType
''' </summary>
''' <param name="Typ"></param>
''' <returns></returns>
''' <remarks></remarks>
    Public Function getVorgangArtikelTableForType(ByVal Typ  As String)
        getVorgangArtikelTableForType = IntraSellPreise().getVorgangArtikelTableForType(Typ)
    End Function

''' <summary>
''' getDruckForType
''' </summary>
''' <param name="Typ"></param>
''' <returns></returns>
''' <remarks></remarks>
    Public Function getDruckForType(ByVal Typ As String)
        getDruckForType = IntraSellPreise().getDruckForType(Typ)
    End Function


''' <summary>
''' getClientLand
''' </summary>
''' <param name="IdNr"></param>
''' <returns></returns>
''' <remarks></remarks>
    Public Function getClientLand(ByVal IdNr As String) As String 
        getClientLand = IntraSellPreise().getClientLand(IdNr)
    End Function

    Public Function getNewVorgangNummer(ByVal Typ As Object, ByVal IdNr As Object)
        getNewVorgangNummer = IntraSellPreise().getNewVorgangNummer(Typ, IdNr)
    End Function

    Public Function convertFromTo(ByVal FromOrder As String, ByVal ToOrder As String, ByVal fromNummer As String, ByVal NewKundNr As Object)
        convertFromTo = IntraSellPreise().convertFromTo(FromOrder, ToOrder, fromNummer, NewKundNr)
    End Function

</script>

