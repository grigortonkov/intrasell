
Imports IntraSell_Net
Imports MagentoSync.MagentoSyncService

Public Class CatalogSync
    Dim magento As MagentoConn = New MagentoConn
    Public intrasell As IntraSellConn = New IntraSellConn

    Dim tree As catalogCategoryTree = Nothing

    Dim dataCats As dsArtikel._grartikel_kategorienDataTable = New dsArtikel._grartikel_kategorienDataTable


    Public Sub InitialExportAllCategories()
        'export all categories from intrasell to magento 


        Try
            intrasell.init()
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
                    magentoCatalog.available_sort_by = {"Best Value"}
                    magentoCatalog.default_sort_by = "Best Value"
                    Dim value = intrasell.vars.firstRow("select description  from `grartikel-kategorien` where ArtKatNr = " & ISCategory.ArtKatNr)
                    If Not IsDBNull(value) Then
                        magentoCatalog.meta_description = value
                    End If
                    value = intrasell.vars.firstRow("select  keywords  from `grartikel-kategorien` where ArtKatNr = " & ISCategory.ArtKatNr)
                    If Not IsDBNull(value) Then
                        magentoCatalog.meta_keywords = value
                    End If
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

                    Dim found As catalogCategoryEntity = findMagentoCatByName(ISCategory.Name)

                    Dim parentCat As catalogCategoryEntity = findMagentoCatByName(findISCatByID(ISCategory.ArtKatNrParent))
                    Dim parentCatId As String
                    If parentCat Is Nothing Then parentCatId = "3" Else parentCatId = parentCat.category_id '"3=Root Catalog"
                    If found Is Nothing Then
                        ModuleLog.Log("Create ArtKatNr=" & ISCategory.ArtKatNr & " and Name=" & ISCategory.Name)
                        Dim catalogId = magento.client.catalogCategoryCreate(magento.sessionid, parentCatId, magentoCatalog, Nothing) '1 is root category 
                        tree = Nothing
                    Else
                        ModuleLog.Log("Update ArtKatNr=" & ISCategory.ArtKatNr & " and Name=" & ISCategory.Name)
                        magento.client.catalogCategoryUpdate(magento.sessionid, found.category_id, magentoCatalog, Nothing) '1 is root category 
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
    Private Function findMagentoCatByName(name As String) As catalogCategoryEntity
        magento.OpenConn()
        If tree Is Nothing Then tree = magento.client.catalogCategoryTree(magento.sessionid, Nothing, Nothing)
        Return findByNameRecursive(name, tree.children)
    End Function

    Private Function findByNameRecursive(name As String, ByRef children As catalogCategoryEntity()) As catalogCategoryEntity
        If children Is Nothing Then Return Nothing
        For Each c As catalogCategoryEntity In children
            If c.name = name Then
                Return c
            Else
                Dim result As catalogCategoryEntity = findByNameRecursive(name, c.children)
                If Not result Is Nothing Then Return result
            End If
        Next
        Return Nothing
    End Function

    'returns intraSell catname 
    Private Function findISCatByID(artKatNr As String) As String

        'load IS cats 
        If dataCats.Rows.Count = 0 Then


            Dim taCat As dsArtikelTableAdapters.grartikel_kategorienTableAdapter = New dsArtikelTableAdapters.grartikel_kategorienTableAdapter

            taCat.Fill(dataCats)
        End If
        For Each c In dataCats
            If c.ArtKatNr = artKatNr Then Return c.Name
        Next
        Return Nothing
    End Function


    Public Sub InitialExportAllProducts()
        'export all products from intrasell to magento 
        Try
            intrasell.init()

            'read categories from intrasell 
            Dim ta As dsArtikelTableAdapters.grartikelTableAdapter = New dsArtikelTableAdapters.grartikelTableAdapter
            Dim data As dsArtikel.grartikelDataTable = New dsArtikel.grartikelDataTable

            ta.Fill(data)

            'TODO Bild
            'TODO Englischer Sprache
            For Each ISArtikel As dsArtikel.grartikelRow In data
                If Not ISArtikel.Bezeichnung Is Nothing And ISArtikel.ProduktAktivOnline And Not IsDBNull(ISArtikel.EAN) Then
                    ModuleLog.Log("Export ArtNr=" & ISArtikel.ArtNr & " and Name=" & ISArtikel.Bezeichnung)



                    Dim magentoProduct = New MagentoSync.MagentoSyncService.catalogProductCreateEntity

                    magentoProduct.name = ISArtikel.Bezeichnung '.Replace("'", "*")

                    'ReDim magentoProduct.category_ids(1) : magentoProduct.category_ids = {ISArtikel.ArtKatNr}
                    magentoProduct.categories = {findISCatByID(ISArtikel.ArtKatNr)}

                    If Not ISArtikel.IsBeschreibungNull Then
                        Dim desc = ISArtikel.Bezeichnung & " " & " EAN:" & ISArtikel.EAN & " " & ISArtikel.Beschreibung
                        magentoProduct.description = desc
                        magentoProduct.short_description = ISArtikel.Beschreibung
                    End If


                    magentoProduct.price = Replace(ISArtikel.PreisATS, ",", ".")
                    magentoProduct.status = "1"
                    magentoProduct.tax_class_id = "2"
                    magentoProduct.visibility = "4" 'catalog and search.

                    'magentoProduct.meta_title
                    magentoProduct.meta_description = intrasell.vars.firstRow("select description from `grArtikel-htmlinfo` where Artnr = " & ISArtikel.ArtNr)
                    magentoProduct.meta_keyword = intrasell.vars.firstRow("select keywords from `grArtikel-htmlinfo` where Artnr = " & ISArtikel.ArtNr)

                    If Not ISArtikel.IsGewichtNull Then
                        magentoProduct.weight = ISArtikel.Gewicht.ToString.Replace(",", ".")
                    Else
                        magentoProduct.weight = 1
                    End If


                    Dim filter As filters = New filters
                    ReDim filter.complex_filter(1)
                    filter.complex_filter(0) = New complexFilter
                    filter.complex_filter(0).key = "SKU"
                    filter.complex_filter(0).value = New associativeEntity()
                    filter.complex_filter(0).value.key = "eq"
                    filter.complex_filter(0).value.value = ISArtikel.EAN


                    magento.OpenConn()


                    'export to magento : get set  
                    Dim defaultSet As catalogProductAttributeSetEntity = Nothing
                    Dim attributeSets As catalogProductAttributeSetEntity() = magento.client.catalogProductAttributeSetList(magento.sessionid)
                    For Each s In attributeSets
                        If s.name = "Default" Then
                            defaultSet = s
                        End If
                    Next

                    Dim found As catalogProductEntity()
                    ReDim found(1)

                    magento.client.catalogProductList(found, magento.sessionid, filter, Nothing)

                    If found.Length = 0 Then
                        ModuleLog.Log("catalogProductCreate ArtNr=" & ISArtikel.ArtNr & " and Name=" & ISArtikel.Bezeichnung)
                        Dim catalogId = magento.client.catalogProductCreate(sessionId:=magento.sessionid, _
                                                                         type:="simple", _
                                                                         [set]:=defaultSet.set_id, _
                                                                         sku:=ISArtikel.EAN, _
                                                                         productData:=magentoProduct, _
                                                                         storeView:=Nothing)

                        loadimage(ISArtikel.ArtNr, catalogId)


                    Else 'update 
                        ModuleLog.Log("catalogProductUpdate ArtNr=" & ISArtikel.ArtNr & " and Name=" & ISArtikel.Bezeichnung)
                        'agento.client.catalogProduct
                        magento.client.catalogProductUpdate(sessionId:=magento.sessionid, _
                                                            product:=found(0).product_id, _
                                                            productData:=magentoProduct, _
                                                                         storeView:=Nothing, _
                                                                         identifierType:="productId")

                        loadimage(ISArtikel.ArtNr, found(0).product_id)
                    End If

                End If
            Next

        Catch ex As Exception
            ModuleLog.Log(ex)
        Finally
            magento.CloseConn()
        End Try

    End Sub


    Function readFileASbase64(filename As String) As String
        '# Example in vb.net:
        Dim str_file As String
        Dim arr_data() As Byte
        Dim str_base64 As String

        str_file = New System.IO.StreamReader(filename).ReadToEnd.ToString
        arr_data = System.Text.Encoding.ASCII.GetBytes(str_file)
        str_base64 = Convert.ToBase64String(arr_data)
        Return str_base64
        'Dim fs_outputfile As New System.IO.StreamWriter(filename) '"test-base64.txt")
        'fs_outputfile.Write(str_base64)
        'fs_outputfile.Close()
    End Function

    Private Sub loadimage(ByVal ArtNr As String, ByVal magentoProductId As String)
        'TODO  what if the image already loaded
        Try



            'add image if any found 
            Dim productimageFile = My.MySettings.Default.productimages & ArtNr & ".gif"
            'just for test
            productimageFile = My.MySettings.Default.productimages & "clock.gif"

            If IO.File.Exists(productimageFile) Then
                ModuleLog.Log("load image for ArtNr=" & ArtNr & " and Filename=" & productimageFile)

                Dim image As catalogProductAttributeMediaCreateEntity = New catalogProductAttributeMediaCreateEntity
                image.file = New catalogProductImageFileEntity
                'image.file.name = productimageFile
                image.file.content = readFileASbase64(productimageFile)
                image.file.mime = "image/gif"
                image.label = "image label"
                image.position = 100
                image.types = {"thumbnail"}
                image.exclude = 0

                magento.client.catalogProductAttributeMediaCreate(sessionId:=magento.sessionid, _
                                                                  product:=magentoProductId, _
                                                                  data:=image, _
                                                                  identifierType:="productId", _
                                                                  storeView:=Nothing)
            End If

        Catch ex As Exception
            ModuleLog.Log(ex)

        End Try
    End Sub

End Class
