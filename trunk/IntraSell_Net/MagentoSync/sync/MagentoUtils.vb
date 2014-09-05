
Imports IntraSell_Net
Imports MagentoSync.MagentoSyncService
Imports IntraSell_Net.dsAdressen
Imports IntraSell_Net.dsAdressenTableAdapters
Imports IntraSell_DLL

Module MagentoUtils

    Dim magento As MagentoConn = New MagentoConn
    Dim intrasell As IntraSellConn = New IntraSellConn

    Dim customerGroups As customerGroupEntity()
    Dim countries As MagentoSyncService.directoryCountryEntity()

    Public Function toMagentoDateFormat(d As Date)
        Return d.Year & "-" & d.Month & "-" & d.Day & " " & d.Hour & ":" & d.Minute & ":" & d.Second
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
            If entity.customer_group_code = intrasSellPreisliste Then
                Return entity
            End If
        Next
        Return customerGroups(0) 'falls nicht gefunden wurde 
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

    Sub loadCountries()
        magento.OpenConn()
        If countries Is Nothing Then
            countries = magento.client.directoryCountryList(sessionId:=magento.sessionid)
        End If
    End Sub

    Function getMagentoCountry(intrasellLandNr As String)
        loadCountries()
        Dim iso2 = intrasell.vars.firstRow("Select iso2 from grland where idnr = " & intrasellLandNr)
        For Each c In countries
            If c.iso2_code = iso2 Then Return c.country_id
        Next
        Return Nothing
    End Function


    Function getIntraSellLand(country_id)
        Return intrasell.vars.firstRow("select idnr from grLand where iso2='" & country_id & "'")
    End Function
End Module
