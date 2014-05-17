
Imports IntraSell_Net
Imports MagentoSync.MagentoSyncService

Public Class CatalogSync
    Dim magento As MagentoConn = New MagentoConn
    Dim tree As catalogCategoryTree = Nothing


    Public Sub InitialExportAllCategories()
        'export all categories from intrasell to magento 


        Try

            'read categories from intrasell 
            Dim ta As dsArtikelTableAdapters.grartikel_kategorienTableAdapter = New dsArtikelTableAdapters.grartikel_kategorienTableAdapter
            Dim data As dsArtikel._grartikel_kategorienDataTable = New dsArtikel._grartikel_kategorienDataTable

            ta.Fill(data)



            For Each ISCategory As dsArtikel._grartikel_kategorienRow In data
                If Not ISCategory.IsNameNull Then
                    ModuleLog.Log("Export ArtKatNR=" & ISCategory.ArtKatNr & " and Name=" & ISCategory.Name)

                    'export to magento 
                    Dim magentoCatalog = New MagentoSync.MagentoSyncService.catalogCategoryEntityCreate
                    magentoCatalog.name = ISCategory.Name

                    If Not ISCategory.IsDescNull Then magentoCatalog.description = ISCategory.Desc
                    magentoCatalog.is_activeSpecified = True
                    magentoCatalog.is_active = 1
                    magentoCatalog.is_anchorSpecified = True
                    magentoCatalog.is_anchor = 1
                    magentoCatalog.include_in_menu = 1
                    magentoCatalog.include_in_menuSpecified = True
                    ReDim magentoCatalog.available_sort_by(1)
                    magentoCatalog.available_sort_by = {"Name"}
                    magentoCatalog.default_sort_by = "Name"
                    'magentoCatalog.meta_description = ISCategory.
                    'magentoCatalog.meta_keywords
                    'magentoCatalog.meta_title


                    Dim filter As filters = New filters
                    ReDim filter.complex_filter(1)
                    filter.complex_filter(0) = New complexFilter
                    filter.complex_filter(0).key = "Name"
                    filter.complex_filter(0).value = New associativeEntity()
                    filter.complex_filter(0).value.key = "eq"
                    filter.complex_filter(0).value.value = ISCategory.Name

                    'filter.complex_filter "Email='" & ISCustomer.Email & "'")

                    magento.OpenConn()

                    Dim found As catalogCategoryEntity = findByName(ISCategory.Name)

                    If found Is Nothing Then
                        ModuleLog.Log("catalogCategoryCreate ArtKatNr=" & ISCategory.ArtKatNr & " and Name=" & ISCategory.Name)
                        Dim catalogId = magento.client.catalogCategoryCreate(magento.sessionid, 1, magentoCatalog, Nothing) '1 is root category 
                        tree = Nothing
                    End If

                End If
            Next

        Catch ex As Exception
            ModuleLog.Log(ex)
        Finally
            magento.CloseConn()
        End Try

    End Sub

    'returns category id by name existing in magento 
    Private Function findByName(name As String)
        magento.OpenConn()
        If tree Is Nothing Then tree = magento.client.catalogCategoryTree(magento.sessionid, Nothing, Nothing)
        Return findByNameRecursive(name, tree.children)
    End Function

    Private Function findByNameRecursive(name As String, ByRef children As catalogCategoryEntity()) As catalogCategoryEntity
        If children Is Nothing Then Return Nothing
        For Each c As catalogCategoryEntity In children
            If c.name = name Then Return c Else findByNameRecursive(name, c.children)
        Next
        Return Nothing
    End Function

    Public Sub InitialExportAllProducts()
        'export all products from intrasell to magento 
        Try

            'Dim taC As dsArtikelTableAdapters.grartikel_kategorienTableAdapter = New dsArtikelTableAdapters.grartikel_kategorienTableAdapter
            'Dim data As dsArtikel._grartikel_kategorienDataTable = New dsArtikel._grartikel_kategorienDataTable


            'read categories from intrasell 
            Dim ta As dsArtikelTableAdapters.grartikelTableAdapter = New dsArtikelTableAdapters.grartikelTableAdapter
            Dim data As dsArtikel.grartikelDataTable = New dsArtikel.grartikelDataTable

            ta.Fill(data)


            For Each ISArtikel As dsArtikel.grartikelRow In data
                If Not ISArtikel.Bezeichnung Is Nothing And ISArtikel.ProduktAktivOnline Then
                    ModuleLog.Log("Export ArtNr=" & ISArtikel.ArtNr & " and Name=" & ISArtikel.Bezeichnung)



                    Dim magentoProduct = New MagentoSync.MagentoSyncService.catalogProductCreateEntity

                    magentoProduct.name = ISArtikel.Bezeichnung '.Replace("'", "*")

                    'ReDim magentoProduct.category_ids(1) : magentoProduct.category_ids = {ISArtikel.ArtKatNr}
                    If Not ISArtikel.IsBeschreibungNull Then magentoProduct.description = ISArtikel.IsBeschreibungNull

                    magentoProduct.price = Replace(ISArtikel.PreisATS, ",", ".")
                    magentoProduct.status = "1"
                    magentoProduct.tax_class_id = "2"
                    magentoProduct.visibility = "1"

                    'magentoProduct.meta_title
                    'magentoProduct.meta_description
                    'magentoProduct.meta_keyword

                    If Not ISArtikel.IsGewichtNull Then magentoProduct.weight = ISArtikel.Gewicht.ToString.Replace(",", ".")

                    Dim filter As filters = New filters
                    ReDim filter.complex_filter(1)
                    filter.complex_filter(0) = New complexFilter
                    filter.complex_filter(0).key = "Name"
                    filter.complex_filter(0).value = New associativeEntity()
                    filter.complex_filter(0).value.key = "eq"
                    filter.complex_filter(0).value.value = ISArtikel.Bezeichnung


                    magento.OpenConn()

                    'export to magento : get set  
                    Dim defaultSet As catalogProductAttributeSetEntity = Nothing
                    Dim attributeSets As catalogProductAttributeSetEntity() = magento.client.catalogProductAttributeSetList(magento.sessionid)
                    For Each s In attributeSets
                        If s.name = "Default" Then
                            defaultSet = s
                        End If
                    Next

                    Dim found As catalogProductEntity = Nothing ' = magento.client.catalogProductList(filter)

                    If found Is Nothing Then
                        ModuleLog.Log("catalogProductCreate ArtNr=" & ISArtikel.ArtNr & " and Name=" & ISArtikel.Bezeichnung)
                        Dim catalogId = magento.client.catalogProductCreate(sessionId:=magento.sessionid, _
                                                                         type:="simple", _
                                                                         [set]:=defaultSet.set_id, _
                                                                         sku:=ISArtikel.ArtNr, _
                                                                         productData:=magentoProduct, _
                                                                         storeView:=Nothing)
                    End If

                End If
            Next

        Catch ex As Exception
            ModuleLog.Log(ex)
        Finally
            magento.CloseConn()
        End Try

    End Sub


End Class
