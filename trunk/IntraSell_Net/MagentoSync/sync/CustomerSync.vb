 
Imports IntraSell_Net

Public Class CustomerSync
    Dim magento As MagentoConn = New MagentoConn


    Public Sub InitialExportAllIntraSellCustomers()
        'export all customers from intrasell to magenot 
        magento.OpenConn()
        Try
            'read customers from intrasell 

            Dim ta As dsAdressenTableAdapters.ofadressenTableAdapter = New dsAdressenTableAdapters.ofadressenTableAdapter
            Dim data As dsAdressen.ofadressenDataTable = New dsAdressen.ofadressenDataTable

            ta.Fill(data)

            For Each ISCustomer As dsAdressen.ofadressenRow In data
                If Not ISCustomer.IsEmailNull Then
                    ModuleLog.Log("Export IDNR=" & ISCustomer.IDNR)

                    'export to magento 
                    Dim magentoCustomer = New MagentoSync.MagentoSyncService.customerCustomerEntityToCreate
                    magentoCustomer.customer_id = ISCustomer.IDNR
                    If Not ISCustomer.IsVornameNull Then magentoCustomer.firstname = ISCustomer.Vorname
                    If Not ISCustomer.IsNameNull Then magentoCustomer.lastname = ISCustomer.Name
                    If Not ISCustomer.IsEmailNull Then magentoCustomer.email = ISCustomer.Email
                    If Not ISCustomer.IsPasswortNull Then
                        If ISCustomer.Passwort.Length >= 6 Then
                            magentoCustomer.password = ISCustomer.Passwort
                        Else
                            magentoCustomer.password = "asdfgh" + ISCustomer.Passwort
                        End If

                    Else
                        magentoCustomer.password = "asdf" + (ISCustomer.IDNR * 2 + 4000000) 'something 
                    End If



                    Dim customerId = magento.client.customerCustomerCreate(magento.sessionid, magentoCustomer)

                    If False Then
                        Dim magentoAddress = New MagentoSync.MagentoSyncService.customerAddressEntityCreate
                        magentoAddress.firstname = ISCustomer.Vorname
                        magentoAddress.lastname = ISCustomer.Name
                        magentoAddress.street(0) = ISCustomer.Adresse
                        magentoAddress.city = ISCustomer.Ort

                        magentoAddress.postcode = ISCustomer.PLZ
                        magentoAddress.country_id = ISCustomer.Land

                        'magentoAddress.is_default_billing
                        'magentoAddress.is_default_shipping

                        magento.client.customerAddressCreate(magento.sessionid, customerId, magentoAddress)
                    End If
                End If
            Next

        Catch ex As Exception
            ModuleLog.Log(ex)
        End Try

        magento.CloseConn()
    End Sub

    Public Sub ImportNewMagentoCustomers()

        magento.OpenConn()
        Try
            Dim list As MagentoSyncService.customerCustomerEntity() = magento.client.customerCustomerList(magento.sessionid, Nothing)
            Debug.Print("Found " & list.Count.ToString & " customers.")
            Dim c As MagentoSyncService.customerCustomerEntity

            For i As Int32 = 0 To list.Count - 1
                c = list.ElementAt(i)
                Debug.Print("Firstname " & c.firstname)
            Next
        Catch ex As Exception
            Debug.Print("Ex = " & ex.StackTrace)
        End Try
        magento.CloseConn()

    End Sub

End Class
