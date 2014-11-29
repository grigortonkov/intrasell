
Imports IntraSell_Net
Imports MagentoSync.MagentoSyncService
Imports IntraSell_Net.dsAdressen
Imports IntraSell_Net.dsAdressenTableAdapters
Imports IntraSell_DLL

''' <summary>
''' utilities for synchronisation betwen intrasell and magento 
''' </summary>
''' <remarks></remarks>
Module MagentoUtils

    Dim magento As MagentoConn = New MagentoConn
    Dim intrasell As IntraSellConn = New IntraSellConn

    Dim customerGroups As customerGroupEntity()
    Dim countries As MagentoSyncService.directoryCountryEntity()
    Dim stores As MagentoSyncService.storeEntity()

    Public Function toMagentoDateFormat(d As Date)
        'Return d.Year & "-" & d.Month & "-" & d.Day & " " & d.Hour & ":" & d.Minute & ":" & d.Second
        Return d.ToString("yyyy-MM-dd HH:mm:ss")
    End Function

    Sub loadStores()
        magento.OpenConn()
        If stores Is Nothing Then
            stores = magento.client.storeList(sessionId:=magento.sessionid)
        End If
    End Sub

    ''' <summary>
    ''' 
    ''' returns the Store 
    ''' 
    ''' </summary>
    ''' <param name="storename"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getMagentoStore(ByVal storename As String) As storeEntity
        loadStores()
        For Each entity As storeEntity In stores
            If entity.code = storename Then
                Return entity
            End If
        Next
        Return stores(0) 'falls nicht gefunden wurde 
    End Function

    Function getMagentoStoreForMandant(mandant) As storeEntity
        If mandant = 1 Then 'arfaian
            Return getMagentoStore("deu") 'for arfaian
        Else 'prospro
            Return getMagentoStore("de") 'for pros pro
        End If
    End Function

    Function getIntraSellMandantForStoreName(storeName As String) As String
        If storeName.Contains("Arfaian") Then 'arfaian
            Return 1 'for arfaian
        Else 'prospro
            Return 2 'for pros pro
        End If
    End Function

    Sub loadCustomerGroups()
        magento.OpenConn()
        If customerGroups Is Nothing Then
            customerGroups = magento.client.customerGroupList(sessionId:=magento.sessionid)
        End If
    End Sub

    ''' <summary>
    ''' get the group by name 
    ''' </summary>
    ''' <param name="intrasSellPreisliste"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getMagentoCustomerGroup(ByVal intrasSellPreisliste As String) As customerGroupEntity
        loadCustomerGroups()
        For Each entity As customerGroupEntity In customerGroups
            If entity.customer_group_code = getMappingIS(intrasSellPreisliste) Then
                Return entity
            End If

        Next
        Return customerGroups(0) 'falls nichts gefunden wurde 
    End Function

    ''' <summary>
    ''' getthe group by id
    ''' </summary>
    ''' <param name="customer_group_id"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getMagentoCustomerbyId(ByVal customer_group_id As String) As customerGroupEntity
        loadCustomerGroups()
        For Each entity As customerGroupEntity In customerGroups
            If entity.customer_group_id = customer_group_id Then
                Return entity
            End If
        Next
        Return Nothing
    End Function

    ''' <summary>
    ''' Load Countries from magento
    ''' </summary>
    ''' <remarks></remarks>
    Sub loadCountries()
        magento.OpenConn()
        If countries Is Nothing Then
            countries = magento.client.directoryCountryList(sessionId:=magento.sessionid)
        End If
    End Sub

    ''' <summary>
    ''' get the country_id from magento 
    ''' </summary>
    ''' <param name="intrasellLandNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getMagentoCountry(intrasellLandNr As String)
        loadCountries()
        Dim iso2 = intrasell.vars.firstRow("Select iso2 from grland where idnr = " & intrasellLandNr)
        For Each c In countries
            If c.iso2_code = iso2 Then Return c.country_id
        Next
        Return Nothing
    End Function


    ''' <summary>
    ''' get country in intrasell
    ''' </summary>
    ''' <param name="country_id"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getIntraSellLand(country_id)
        Return intrasell.vars.firstRow("select idnr from grLand where iso2='" & country_id & "'")
    End Function

    ''' <summary>
    ''' SKU2ArtNr  -mapping function 
    ''' </summary>
    ''' <param name="sku"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function SKU2ArtNr(sku As String)
        Return intrasell.vars.firstRow("select artnr from grArtikel where EAN='" & sku & "'")
    End Function

    ''' <summary>
    ''' 
    ''' returns the artnr of special artikel, if not existing creates artikel in intrasell
    ''' </summary>
    ''' <param name="description"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function Description2ArtNr(description As String)
        Dim artikel = intrasell.vars.firstRow("select artnr from grArtikel where Bezeichnung='" & description & "'")


        If IsNothing(artikel) Then
            Dim nArtNR = firstRow("select 1+max(artnr) from grArtikel")
            Dim sql As String = "insert into grArtikel (artnr, ean, bezeichnung, PreisATS, PreisATS_Brutto) values ( " & nArtNR & ", '" & nArtNR & "', '" & description & "',0,0)"
            RunSQL(sql)
            Return (Description2ArtNr(description))
        Else
            Return artikel
        End If

    End Function


    ''' <summary>
    ''' convert string contaiong decimal point to decimal type 
    ''' </summary>
    ''' <param name="stringWithPoint"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function toDecimal(stringWithPoint As String) As Decimal
        Try

      
        If stringWithPoint.Contains(".") Then
            Return Split(stringWithPoint, ".")(0) + Left(Split(stringWithPoint, ".")(1), 2) / 100
        Else
            Return stringWithPoint * 1
            End If
        Catch ex As Exception
            ModuleLog.Log("error in toDecimal for string " & stringWithPoint & ". Expected format NNNN.NN")
            ModuleLog.Log(ex)
            Return 0
        End Try
    End Function

    ''' <summary>
    ''' Seach the first column of the mapping list in Settings.Mappings and when mapping is found delivers the second column
    ''' </summary>
    ''' <param name="isKey"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getMappingIS(ByVal isKey) As String
        Dim map As String = My.MySettings.Default.Mappings
        map = map.Replace(vbNewLine, "")
        map = map.Replace(vbCr, "")
        map = map.Replace(vbCrLf, "")
        For Each s In map.Split(";")
            Dim k = s.Split("=")
            If Trim(k(0)).StartsWith(Trim(isKey)) Then
                Return k(1)
            End If
        Next
        Throw New Exception("No mapping found for " & isKey)
    End Function
End Module
