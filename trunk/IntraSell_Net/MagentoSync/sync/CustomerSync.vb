
Imports IntraSell_Net
Imports MagentoSync.MagentoSyncService
Imports IntraSell_Net.dsAdressen
Imports IntraSell_Net.dsAdressenTableAdapters
Imports IntraSell_DLL

Public Class CustomerSync
    Public magento As MagentoConn = New MagentoConn
    Public intrasell As IntraSellConn = New IntraSellConn

    ''' <summary>
    ''' export all intrasell customers to magento
    ''' </summary>
    ''' <param name="justIDNR"></param>
    ''' <remarks></remarks>
    Public Sub InitialExportAllIntraSellCustomers(Optional justIDNR As String = Nothing)
        'export all customers from intrasell to magenot 
        ModuleLog.Log("Start export all is customers")

        Try
            'read customers from intrasell 
            intrasell.init()

            Dim ta As dsAdressenTableAdapters.ofadressenTableAdapter = New dsAdressenTableAdapters.ofadressenTableAdapter
            Dim taWeitere As dsAdressenTableAdapters.ofadressen_weitereTableAdapter = New dsAdressenTableAdapters.ofadressen_weitereTableAdapter
            ta.Connection.ConnectionString = MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString
            taWeitere.Connection.ConnectionString = MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString

            Dim data As dsAdressen.ofadressenDataTable = New dsAdressen.ofadressenDataTable
            Dim dataWeitere As dsAdressen._ofadressen_weitereDataTable = New dsAdressen._ofadressen_weitereDataTable
            If String.IsNullOrEmpty(justIDNR) Then
                ta.Fill(data)
                taWeitere.Fill(dataWeitere)
            Else
                ta.FillByIDNR(data, justIDNR)
                taWeitere.FillByIDNR(dataWeitere, justIDNR)
            End If

            magento.OpenConn()

            Dim counter As Int16 = 0

            For Each ISCustomer As dsAdressen.ofadressenRow In data
                counter = 1 + counter
                If Not ISCustomer.IsEmailNull Then
                    ModuleLog.Log("Export IDNR=" & ISCustomer.IDNR & " and Email=" & ISCustomer.Email)

                    'export to magento 
                    Dim magentoCustomer = New MagentoSync.MagentoSyncService.customerCustomerEntityToCreate
                    magentoCustomer.customer_id = ISCustomer.IDNR
                    If Not ISCustomer.IsVornameNull Then magentoCustomer.firstname = ISCustomer.Vorname
                    If Not ISCustomer.IsNameNull Then magentoCustomer.lastname = ISCustomer.Name

                    'uid nummer 
                    If Not ISCustomer.IsUIDNull Then magentoCustomer.taxvat = ISCustomer.UID

                    If Not ISCustomer.IsEmailNull Then magentoCustomer.email = ISCustomer.Email
                    If Not ISCustomer.IsPasswortNull Then
                        If ISCustomer.Passwort.Length >= 6 Then
                            magentoCustomer.password = ISCustomer.Passwort
                        Else
                            magentoCustomer.password = "asdfgh" & ISCustomer.Passwort
                        End If
                    Else
                        magentoCustomer.password = "asdf" & (ISCustomer.IDNR * 2 + 4000000) 'something 
                    End If

                    Dim preisliste = intrasell.vars.firstRow("select Preisliste from `ofAdressen-Settings` where idnr = " & ISCustomer.IDNR)

                    magentoCustomer.group_id = MagentoUtils.getMagentoCustomerGroup(preisliste).customer_group_id
                    magentoCustomer.group_idSpecified = True
                    magentoCustomer.website_id = getMagentoStoreForMandant(ISCustomer.mandant).website_id ' '1-prospro, 2-arfaian
                    magentoCustomer.website_idSpecified = True


                    Dim filter As filters = New filters
                    ReDim filter.complex_filter(1)
                    filter.complex_filter(0) = New complexFilter
                    filter.complex_filter(0).key = "Email"
                    filter.complex_filter(0).value = New associativeEntity()
                    filter.complex_filter(0).value.key = "eq"
                    filter.complex_filter(0).value.value = ISCustomer.Email
                    'filter.complex_filter "Email='" & ISCustomer.Email & "'")


                    Dim found As customerCustomerEntity() = magento.client.customerCustomerList(magento.sessionid, filter)
                    If found.Length = 0 Then
                        ModuleLog.Log("customerCustomerCreate IDNR=" & ISCustomer.IDNR & " and Email=" & ISCustomer.Email)
                        Dim customerId = magento.client.customerCustomerCreate(magento.sessionid, magentoCustomer)

                        Dim billingAdresseFound = False
                        Dim shippingAdresseFound = False

                        'weitere adressefelder 
                        taWeitere.FillByIDNR(dataWeitere, ISCustomer.IDNR)
                        For Each ISCustomerWeitere As dsAdressen._ofadressen_weitereRow In dataWeitere
                            If Not ISCustomerWeitere.IsTypNull Then
                                Dim magentoAddress = New MagentoSync.MagentoSyncService.customerAddressEntityCreate
                                If Not ISCustomerWeitere.IsVornameNull Then magentoAddress.firstname = ISCustomerWeitere.Vorname
                                If Not ISCustomerWeitere.IsNameNull Then magentoAddress.lastname = ISCustomerWeitere.Name
                                If Not ISCustomerWeitere.IsAdresseNull Then magentoAddress.street = New String() {ISCustomerWeitere.Adresse}
                                If Not ISCustomerWeitere.IsOrtNull Then magentoAddress.city = ISCustomerWeitere.Ort
                                If Not ISCustomerWeitere.IsPLZNull Then magentoAddress.postcode = ISCustomerWeitere.PLZ
                                If Not ISCustomerWeitere.IsLandNull Then magentoAddress.country_id = getMagentoCountry(ISCustomerWeitere.Land)


                                If Not ISCustomerWeitere.IsTelNull Then magentoAddress.telephone = ISCustomerWeitere.Tel
                                If Not ISCustomerWeitere.IsFaxNull Then magentoAddress.fax = ISCustomerWeitere.Fax
                                If Not ISCustomerWeitere.IsFirmaNull Then magentoAddress.company = ISCustomerWeitere.Firma

                                If ISCustomerWeitere.Typ = "LI" Then
                                    magentoAddress.is_default_shipping = True
                                    magentoAddress.is_default_shippingSpecified = True
                                    shippingAdresseFound = True
                                End If
                                If ISCustomerWeitere.Typ = "AR" Then
                                    magentoAddress.is_default_billing = True
                                    magentoAddress.is_default_billingSpecified = True
                                    billingAdresseFound = True
                                End If
                                If Not magentoAddress.country_id Is Nothing Then
                                    magento.client.customerAddressCreate(magento.sessionid, customerId, magentoAddress)
                                End If
                            End If
                        Next



                        If True Then
                            Dim magentoAddress = New MagentoSync.MagentoSyncService.customerAddressEntityCreate
                            If Not ISCustomer.IsVornameNull Then magentoAddress.firstname = ISCustomer.Vorname
                            If Not ISCustomer.IsNameNull Then magentoAddress.lastname = ISCustomer.Name
                            If Not ISCustomer.IsAdresseNull Then magentoAddress.street = New String() {ISCustomer.Adresse}
                            If Not ISCustomer.IsOrtNull Then magentoAddress.city = ISCustomer.Ort
                            If Not ISCustomer.IsPLZNull Then magentoAddress.postcode = ISCustomer.PLZ
                            If Not ISCustomer.IsLandNull Then magentoAddress.country_id = getMagentoCountry(ISCustomer.Land)

                            If Not ISCustomer.IsTelNull Then magentoAddress.telephone = ISCustomer.Tel
                            If Not ISCustomer.IsFaxNull Then magentoAddress.fax = ISCustomer.Fax
                            If Not ISCustomer.IsFirmaNull Then magentoAddress.company = ISCustomer.Firma

                            magentoAddress.is_default_billing = Not billingAdresseFound
                            magentoAddress.is_default_shipping = Not shippingAdresseFound
                            If Not magentoAddress.country_id Is Nothing Then
                                magento.client.customerAddressCreate(magento.sessionid, customerId, magentoAddress)
                            End If
                        End If

                        ModuleLog.Log("Export DONE IDNR=" & ISCustomer.IDNR & " and Email=" & ISCustomer.Email)


                    Else
                        ModuleLog.Log("customer with this email already exists IDNR=" & ISCustomer.IDNR & " and Email=" & ISCustomer.Email)
                        ModuleLog.Log("customer update")
                        magento.client.customerCustomerUpdate(magento.sessionid, found(0).customer_id, magentoCustomer)

                    End If
                Else
                    ModuleLog.Log("customer with IDNR=" & ISCustomer.IDNR & " has no email")
                End If

                FormStart.setProgress(counter / data.Count)
            Next

        Catch ex As Exception
            ModuleLog.Log(ex)
        End Try

        magento.CloseConn()
        FormStart.setProgress(1)
    End Sub

    'Imports Customer from Order 
    Public Sub ImportNewMagentoCustomer(order As salesOrderEntity)
        ModuleLog.Log("Start import magento customer for order " & order.order_id)

        intrasell.init()

        Dim tam As dsAdressenTableAdapters.TableAdapterManager = New dsAdressenTableAdapters.TableAdapterManager()

        'check if customer is existing 
        Dim dsAdr As dsAdressen = New dsAdressen

        Dim ta As ofadressenTableAdapter = New ofadressenTableAdapter
        ta.Connection.ConnectionString = MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString

        Dim data As dsAdressen.ofadressenDataTable = New dsAdressen.ofadressenDataTable

        Dim taWeitere As ofadressen_weitereTableAdapter = New ofadressen_weitereTableAdapter
        taWeitere.Connection.ConnectionString = MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString
        Dim dataShipping As dsAdressen._ofadressen_weitereDataTable = New dsAdressen._ofadressen_weitereDataTable

        Dim taSettings As ofadressen_settingsTableAdapter = New ofadressen_settingsTableAdapter
        taSettings.Connection.ConnectionString = MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString

        Dim t As dsAuftraegeTableAdapters.buchauftragTableAdapter = New dsAuftraegeTableAdapters.buchauftragTableAdapter()
        tam.Connection = t.Connection

        Dim idnr = intrasell.vars.firstRow("select idnr from ofAdressen where Email = '" & order.customer_email & "'")

        If IsNothing(idnr) Then 'And order.customer_id Is Nothing 
            idnr = intrasell.vars.firstRow("select max(idnr) + 1  from ofAdressen")
        End If


        ta.FillByIDNR(data, idnr)
        'create customer if not existing 
        If IsNothing(idnr) Or data.Rows.Count = 0 Then
            ModuleLog.Log("Create customer with Email " & order.customer_email)
            'create customer with this shipping and invoice address 
            Dim newCustomer As ofadressenRow = dsAdr.ofadressen.NewofadressenRow

            newCustomer.mandant = My.MySettings.Default.MandantNr
            newCustomer.mandant = getIntraSellMandantForStoreName(order.store_name)
            newCustomer.Status = "Kunde"
            'If order.customer_id Is Nothing Then
            newCustomer.IDNR = idnr 'is null for anonymous customers
            ' Else
            'newCustomer.IDNR = order.customer_id 'registered
            'End If


            newCustomer.Name = order.customer_lastname
            newCustomer.Vorname = order.customer_firstname
            newCustomer.Email = order.customer_email

            'Dim invoiceAddress As customerAddressEntityItem = magento.client.customerAddressInfo(magento.sessionid, order.billing_address_id)
            Dim invoiceLand As String = getIntraSellLand(order.billing_address.country_id)
            newCustomer.Land = invoiceLand
            newCustomer.Adresse = order.billing_address.street
            newCustomer.PLZ = intrasell.kunden.getPLZCreateIfNeeded(invoiceLand, order.billing_address.city, order.billing_address.postcode)
            newCustomer.Ort = order.billing_address.city
            newCustomer.Tel = order.billing_address.telephone

            dsAdr.ofadressen.Rows.Add(newCustomer)

            'Settings 
            Dim newCustomerSettings As _ofadressen_settingsRow = dsAdr._ofadressen_settings.New_ofadressen_settingsRow
            newCustomerSettings.IDNR = newCustomer.IDNR 'order.customer_id
            newCustomerSettings.Preisliste = getMagentoCustomerbyId(order.customer_group_id).customer_group_code
            newCustomerSettings.Kundengruppe = "Online" 'hardcoded acc. specification

            dsAdr._ofadressen_settings.Rows.Add(newCustomerSettings)

        Else
            ModuleLog.Log("Won't update, customer with this Email exists " & order.customer_email)
            'TODO update what ? 
            ta.FillByIDNR(dsAdr.ofadressen, idnr)
        End If


        'Lieferadresse 
        If order.shipping_address_id <> order.billing_address_id Then

            Dim notexists As Boolean = IsDBNull(intrasell.vars.firstRow("select max(id) from `ofAdressen-weitere` where IDNR=" & idnr & " and Adresse='" & order.shipping_address.street & "' and Typ ='LI'"))
            If notexists Then
                'Create new Address 
                Dim newCustomerShipping As _ofadressen_weitereRow = dsAdr._ofadressen_weitere.New_ofadressen_weitereRow
                newCustomerShipping.IDNR = idnr 'order.customer_id
                newCustomerShipping.Typ = "LI"

                newCustomerShipping.Vorname = order.shipping_address.firstname
                newCustomerShipping.Name = order.shipping_address.lastname
                newCustomerShipping.Firma = order.shipping_address.company
                ' Dim shippingAddress As customerAddressEntityItem = magento.client.customerAddressInfo(magento.sessionid, order.shipping_address_id)
                newCustomerShipping.Land = getIntraSellLand(order.shipping_address.country_id)
                newCustomerShipping.Adresse = order.shipping_address.street
                newCustomerShipping.PLZ = intrasell.kunden.getPLZCreateIfNeeded(newCustomerShipping.Land, order.shipping_address.city, order.shipping_address.postcode)
                newCustomerShipping.Ort = order.shipping_address.city
                newCustomerShipping.Tel = order.shipping_address.telephone


                dsAdr._ofadressen_weitere.Rows.Add(newCustomerShipping)
            End If
        End If


        dsAdr.WriteXml(My.MySettings.Default.SyncFolder + "magento2intrasell_order_customer_" + order.order_id + ".xml")

        tam.UpdateAll(dsAdr)
        ta.Update(dsAdr.ofadressen)
        taWeitere.Update(dsAdr._ofadressen_weitere)
        taSettings.Update(dsAdr._ofadressen_settings)
        ModuleLog.Log("Done import magento customer for order " & order.order_id)
    End Sub

    ''' <summary>
    ''' Import all new customers since
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub ImportNewMagentoCustomers(Optional since As Date = Nothing)
        FormStart.setProgress(0)
        Dim counter As Integer = 0

        ModuleLog.Log("Start import magento customers since " & since)

        magento.OpenConn()
        Try

            Dim list As MagentoSyncService.customerCustomerEntity()
            If IsNull(since) Then
                list = magento.client.customerCustomerList(magento.sessionid, Nothing)
            Else
                'Filter 
                Dim filter As filters = New filters
                ReDim filter.complex_filter(1)
                filter.complex_filter(0) = New complexFilter
                filter.complex_filter(0).key = "created_at"
                filter.complex_filter(0).value = New associativeEntity()
                filter.complex_filter(0).value.key = "gt"
                filter.complex_filter(0).value.value = toMagentoDateFormat(since)

                list = magento.client.customerCustomerList(magento.sessionid, filter)
            End If

            ModuleLog.Log("Found " & list.Count.ToString & " customers.")
            Dim c As MagentoSyncService.customerCustomerEntity

            For i As Int32 = 0 To list.Count - 1
                c = list.ElementAt(i)
                ModuleLog.Log("Import customer  " & c.firstname & " " & c.lastname)
                ImportMagentoCustomer(c)
                counter += 1
                FormStart.setProgress(counter / list.Count)
            Next
        Catch ex As Exception
            ModuleLog.Log(ex)
        End Try
        magento.CloseConn()

        ModuleLog.Log("Done import magento customers since " & since)
        FormStart.setProgress(1)
    End Sub


    ''' <summary>
    ''' Import one new Customer from magento
    ''' </summary>
    ''' <param name="customer"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Sub ImportMagentoCustomer(customer As customerCustomerEntity)
        intrasell.init()



        'check if customer is existing 
        Dim dsAdr As dsAdressen = New dsAdressen

        Dim ta As ofadressenTableAdapter = New ofadressenTableAdapter
        ta.Connection.ConnectionString = MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString

        Dim tam As dsAdressenTableAdapters.TableAdapterManager = New dsAdressenTableAdapters.TableAdapterManager()
        tam.Connection = ta.Connection

        Dim data As dsAdressen.ofadressenDataTable = New dsAdressen.ofadressenDataTable

        Dim taWeitere As ofadressen_weitereTableAdapter = New ofadressen_weitereTableAdapter
        'taWeitere.Connection.ConnectionString = MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString
        taWeitere.Connection = ta.Connection
        Dim dataShipping As dsAdressen._ofadressen_weitereDataTable = New dsAdressen._ofadressen_weitereDataTable

        Dim taSettings As ofadressen_settingsTableAdapter = New ofadressen_settingsTableAdapter
        'taSettings.Connection.ConnectionString = MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString
        taSettings.Connection = ta.Connection
        Dim t As dsAuftraegeTableAdapters.buchauftragTableAdapter = New dsAuftraegeTableAdapters.buchauftragTableAdapter()
        't.Connection.ConnectionString = MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString
        t.Connection = ta.Connection
        'tam.Connection = t.Connection

        Dim idnr = intrasell.vars.firstRow("select idnr from ofAdressen where email = '" & customer.email & "'")

        If Not IsNull(idnr) Then
            ta.FillByIDNR(data, idnr)
        End If

        'create customer if not existing 
        If data.Rows.Count = 0 Then
            ModuleLog.Log("Create customer with email " & customer.email)
            'create customer with this shipping and invoice address 
            Dim newCustomer As ofadressenRow = dsAdr.ofadressen.NewofadressenRow


            newCustomer.mandant = My.MySettings.Default.MandantNr
            newCustomer.Status = "Neu"
            newCustomer.IDNR = customer.customer_id
            newCustomer.Name = customer.lastname
            newCustomer.Vorname = customer.firstname
            newCustomer.Email = customer.email
            'newCustomer.Passwort = customer.password_hash 'Exception: Die Spalte kann nicht auf 'Passwort' festgelegt werden. Der Wert überschreitet den MaxLength-Grenzwert dieser Spalte.
            If Not customer.taxvat Is Nothing Then
                newCustomer.UID = customer.taxvat 'UID Nummer
            End If

            'address 
            Dim adressen As customerAddressEntityItem() = magento.client.customerAddressList(magento.sessionid, customer.customer_id)

            If adressen.Count > 0 Then
                Dim hauptAdresse = adressen(0)

                Dim invoiceLand As String = getIntraSellLand(hauptAdresse.country_id)
                newCustomer.Land = invoiceLand
                newCustomer.Adresse = hauptAdresse.street
                newCustomer.PLZ = intrasell.kunden.getPLZCreateIfNeeded(invoiceLand, hauptAdresse.city, hauptAdresse.postcode)
                newCustomer.Ort = hauptAdresse.city
                newCustomer.Tel = hauptAdresse.telephone
                newCustomer.Fax = hauptAdresse.fax
                newCustomer.Firma = hauptAdresse.company

                dsAdr.ofadressen.Rows.Add(newCustomer)

                'Settings 
                Dim newCustomerSettings As _ofadressen_settingsRow = dsAdr._ofadressen_settings.New_ofadressen_settingsRow
                newCustomerSettings.IDNR = customer.customer_id
                newCustomerSettings.Preisliste = getMagentoCustomerbyId(customer.group_id).customer_group_code
                newCustomerSettings.Kundengruppe = "Online"
                dsAdr._ofadressen_settings.Rows.Add(newCustomerSettings)
            Else
                ModuleLog.Log("customer with email " & customer.email & " has no address! Cancel import in IntraSell.")
            End If

        Else
            ModuleLog.Log("won't update, customer with Email exists " & customer.email)
            'TODO update what ? 
            ta.FillByIDNR(dsAdr.ofadressen, idnr)
        End If


        ''Lieferadresse 
        'If order.shipping_address_id <> order.billing_address_id Then

        '    Dim exists = intrasell.vars.firstRow("select max(id) from `ofAdressen-weitere` where IDNR=" & idnr & " and Adresse='" & order.shipping_address.street & "' and Typ ='LI'")
        '    If IsDBNull(exists) Then
        '        'Create new Address 
        '        Dim newCustomerShipping As _ofadressen_weitereRow = dsAdr._ofadressen_weitere.New_ofadressen_weitereRow
        '        newCustomerShipping.IDNR = idnr 'order.customer_id
        '        newCustomerShipping.Typ = "LI"
        '        ' Dim shippingAddress As customerAddressEntityItem = magento.client.customerAddressInfo(magento.sessionid, order.shipping_address_id)
        '        newCustomerShipping.Land = getIntraSellLand(order.shipping_address.country_id)
        '        newCustomerShipping.Adresse = order.shipping_address.street
        '        newCustomerShipping.PLZ = intrasell.kunden.getPLZCreateIfNeeded(newCustomerShipping.Land, order.shipping_address.city, order.shipping_address.postcode)
        '        newCustomerShipping.Ort = order.shipping_address.city
        '        newCustomerShipping.Tel = order.shipping_address.telephone

        '        dsAdr._ofadressen_weitere.Rows.Add(newCustomerShipping)
        '    End If
        'End If


        dsAdr.WriteXml(My.MySettings.Default.SyncFolder + "magento2intrasell_customer_" + CStr(customer.customer_id) + ".xml")

        tam.UpdateAll(dsAdr)
        ta.Update(dsAdr.ofadressen)
        taWeitere.Update(dsAdr._ofadressen_weitere)
        taSettings.Update(dsAdr._ofadressen_settings)
    End Sub
End Class
