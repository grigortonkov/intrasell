<% 
    
    USE_AUFSCHLAG_KATEGORIE = False
    USE_STAFFELPREISE = False
    USE_VORKALKULIERTE_VKPREISE = True
    
%>

<script language="VB" runat="server">  

    Dim USE_AUFSCHLAG_KATEGORIE
    Dim USE_STAFFELPREISE
    Dim USE_VORKALKULIERTE_VKPREISE
 
    'for compatibility reasons 
    Const dbOpenDynaset = 0
    Function OpenRecordset_(ByVal sql, ByVal something)
        'Response.Write sql
        'on error resume next 
        OpenRecordset_ = objConnectionExecute(sql)
    End Function

    Sub msgbox_(ByVal t1, ByVal t2)
        Response.Write(t1)
    End Sub

 
    ' Proxy to the DLL Function 
    Public Function getPreis(ByVal IdNr, ByVal ArtNr, ByVal Stk)
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
        getPreis = IntraSellPreise().getPreis(IdNr, ArtNr, Stk)
        'exit function 
    End Function



    Public Function makeNettoPreis(ByVal ArtNr, ByVal Stk, ByVal IdNr)
        makeNettoPreis = IntraSellPreise().makeNettoPreis(ArtNr, Stk, IdNr)
    End Function


    Public Function makeBruttoPreis(ByVal Preis, ByVal MwstGroup, ByVal Land)

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

    Function makeBruttoPreis2(ByVal ArtNr, ByVal Stk, ByVal Land)

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

    Public Function calculateBruttoPreis(ByVal VKPreis, ByVal ArtNr, ByVal IDNR)
        If Request.QueryString("debug") = "true" Then
            Response.Write("<br>" & Chr(13))
            Response.Write("get calculateBruttoPreis for VKPreis = [" & VKPreis & "]")
            Response.Write("<br>" & Chr(13) & " ArtNr = [" & ArtNr & "]")
            Response.Write("<br>" & Chr(13) & " IDNR = [" & IDNR & "]")
        End If
  
        calculateBruttoPreis = IntraSellPreise().calculateBruttoPreis(CDbl(VKPreis), CStr(ArtNr), CStr(IDNR))
    End Function

    Function getEKPreis(ByVal ArtNr)
        getEKPreis = IntraSellPreise().getEKPreis(ArtNr)
    End Function

    Public Function getBestLieferant(ByVal ArtNr)
        getBestLieferant = IntraSellPreise().getBestLieferant(ArtNr)
    End Function

    Public Function getLieferantLagerInfo(ByVal ArtNR)
        getLieferantLagerInfo = IntraSellPreise().getLieferantLagerInfo(ArtNR)
    End Function

    Public Function getVorgangTableForType(ByVal Typ)
        getVorgangTableForType = IntraSellPreise().getVorgangTableForType(Typ)
    End Function

    Public Function getVorgangArtikelTableForType(ByVal Typ)
        getVorgangArtikelTableForType = IntraSellPreise().getVorgangArtikelTableForType(Typ)
    End Function

    Public Function getDruckForType(ByVal Typ)
        getDruckForType = IntraSellPreise().getDruckForType(Typ)
    End Function

    Public Function getClientLand(ByVal IdNr)
        getClientLand = IntraSellPreise().getClientLand(IdNr)
    End Function

    Public Function getNewVorgangNummer(ByVal Typ, ByVal IdNr)
        getNewVorgangNummer = IntraSellPreise().getNewVorgangNummer(Typ, IdNr)
    End Function

    Public Function convertFromTo(ByVal FromOrder, ByVal ToOrder, ByVal fromNummer, ByVal NewKundNr)
        convertFromTo = IntraSellPreise().convertFromTo(FromOrder, ToOrder, fromNummer, NewKundNr)
    End Function

</script>

