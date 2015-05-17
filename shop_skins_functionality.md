# Introduction #

Use these tags to develope your shop.


# Details #
```
<?xml version="1.0" encoding="UTF-8" ?>
<!-- edited with XML Spy v4.4 U (http://www.xmlspy.com) by Tropicana (DPEE) -->
<!--Description of IntraSell webshop template Tags. These file describes where the tags can be used and their behaviour. -->
<template_descriptions>
	<description>
		This file describes all possible TAGS you can use in the software skins. 
		The sofwate has allways information about the ArtNr, ArtKatNr (Category) and the user (if logged). 
		</description>
	<general_template>
		<tag>
			<name>[SQL:<![CDATA[select count(*) anz from grArtikel;]]>]</name>
			<description>Example [SQL:<![CDATA[select count(*) anz from grArtikel;]]>].</description>
		</tag>
		<tag>
			<name>[SQL_SIMPLE:<![CDATA[select count(*) anz from grArtikel;]]>]</name>
			<description>Example [SQL_SIMPLE:<![CDATA[select count(*) anz from grArtikel;]]>] .</description>
		</tag>
	</general_template>
	
	 <module_template>
		<tag>
			<name>[ECARD_LINK]</name>
			<description>returns the start lonk for the ecard service</description>
		</tag>
 
	</module_template>
	
	<category_template>
		<when> In every shop page. Use these tags in the skin shtml files or in the category template field.
	 </when>
		<tag>
			<name>[SHOP_TITLE]</name>
			<description>Inserts shop title.</description>
		</tag>
		<tag>
			<name>[BANNER1]</name>
			<description>Inserts banner in the page.</description>
		</tag>
		<tag>
			<name>[BANNER2]</name>
			<description>Inserts banner in the page.</description>
		</tag>
		<tag>
			<name>[BANNER3]</name>
			<description>Inserts banner in the page.</description>
		</tag>
		<tag>
			<name>[SEARCHFORM]</name>
			<description>Detailed product search form</description>
		</tag>
		<tag>
			<name>[SIMPLE_SEARCH_FORM]</name>
			<description>Simple search form</description>
		</tag>
		<tag>
			<name>[SUBCATEGORIES]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[CATEGORYNR]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[SUBCATEGORIESTREE]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[CATEGORYPATH]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[CATEGORYPATH_NOLINKS]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[CATEGORY_SUBLIST]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[SUBCATEGORY_IMAGES]</name>
			<description>Lists all subcategories with images in a 4*4 Table</description>
		</tag>
		<tag>
			<name>[CATEGORY_FILTER]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[TOPPRODUCTS]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[TOPPRODUCTS_VERTICAL]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[TOPPRODUCTS_SELECTED]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name> [TOPPRODUCTS_TYPE:Top5]</name>
			<description>[TOPPRODUCTS_TYPE" 'usage [TOPPRODUCTS_TYPE:Top5]</description>
		</tag>
		<tag>
			<name>[BESTSELLERS]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[VISITED_PRODUCTS]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[VISITED_PRODUCTS_HORIZONTAL]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[MOSTCLICKEDPRODUCTS]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[MOSTCLICKEDCATEGORIES]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[FEATUREDMERCHANTS]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[REVIEWS]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[NEWPRICES]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[NEWSLETTER]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[PRODUCTLIST]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[TOOLBAR]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[TOPDEAL]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[CHEAPPRODUCTS]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[CATEGORYNAME]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[FUNCTION1]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[FUNCTION2]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[FUNCTION3]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>"[EMBED" 'usage: [EMBED:test/function1.htm]</name>
			<description>"[EMBED" 'usage: [EMBED:test/function1.htm]</description>
		</tag>
		<tag>
			<name>[LANGUAGE_SELECTION]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[CONTENT_LINKS]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[WEB_PAGES_LINKS]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[CURRENT_USER]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[LOGOUT_LINK]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[USER_LINKS]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[PRODUCT_CLEARANCE_LIST]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[PRODUCT_CLEARANCE_ALL]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[PRODUCT_PRICE_DROPS]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[PRODUCT_PRICE_DROPS_ALL]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[BASKET_STATE]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[PRODUCT_MANUFACTURER_DISCOUNT_ALL]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[BASKET_RELATED_PRODUCTS]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[FAQ_LIST]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[PAGETOSHOW]</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>[COUNT_ONLINE]</name>
			<description>Count of users currently online</description>
		</tag>
		<tag>
			<name>ALL TAGS FROM USER TEMPLATE</name>
			<description>empty</description>
		</tag>
		<tag>
			<name>ALL TAGS FROM PRODUCT TEMPLATE</name>
			<description>only when ArtNr in querystring</description>
		</tag>
		<tag>
			<name>[NEW_PRODUCTS]</name>
			<description>Newly inserted Products.</description>
		</tag>
		<tag>
			<name>[LAND]</name>
			<description>by defaukt AT ot VAR DEFAULT_SHOP_LAND</description>
		</tag>
		<tag>
			<name>[SESSION_LAST_SEARCH]</name>
			<description> shows the last query in this sessions</description>
		</tag>
		<tag>
			<name>[SESSION_SEARCHES]</name>
			<description> shows list with all queries in this sessions</description>
		</tag>
	</category_template>
	<product_template>
		<when>In every page called with my pageToShow=productView and ArtNr=[N] parameters.
	 </when>
		<tag>
			<name>[ArtNr]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[ProduktAktiv]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[EAN]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[Bezeichnung]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[Bezeichnung1]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[MWSTGROUP]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[Beschreibung]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[Firma]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[HerstellerLink]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[HerstellerLogo]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[HerstellerLogoURL]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[makeImgTagFirma]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[makeImgTag]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[makeImgTagName:imageName]</name>
			<description>Please specify the additional image name!</description>
			<date_creation>17.06.2004</date_creation>
		</tag>
		<tag>
			<name>[makeImgTagLarge]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[Modifikationen]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[makeBruttoPreis]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[herstellerRabatt]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[herstellerRabattText]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[compareProductsSelectForm]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[HTMLInfo]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[HTMLInfoName:InfoAutor]</name>
			<description>REtusn special HTML info on a certain date!</description>
			<date_creation>17.06.2004</date_creation>
		</tag>
		<tag>
			<name>[makeListKeywords]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[createProductSpecialChoice]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[createTechnicalInfo]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[createStaffelPreiseTable]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[makeReviewStars]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[count_product_reviews]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[makeReviewsPage]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[makeWriteReviewForm]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[makeWriteReviewForm]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[verwandteProdukte]</name>
			<description>
			EN: insert rows in table 'grartikel-verwandteartikel' with type 'Related-Products'
			DE:Fügen Sie Datensatz in die Tabelle 'grartikel-verwandteartikel' mit dem Typ 'Related-Products'</description>
		</tag>
		<tag>
			<name>[verwandteProdukte:Bezeichnung]</name>
			<description>Erlaubt verschiedene Listen von verwandte Produkte</description>
		</tag>
		<tag>
			<name>[priceCompare].[makeProductMechantList]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[HerstellerAdresse]</name>
			<description>Returns the full address of the product producer</description>
			<date_creation>17.06.2004</date_creation>
		</tag>
		<tag>
			<name>[LieferantAdresse]</name>
			<description>Returns the full address of the product merchant/delivery company.</description>
			<date_creation>17.06.2004</date_creation>
		</tag>
		<tag>
			<name>[DieAnderenKaufenAuch]</name>
			<description>Returns the list of product other usrs buy.</description>
			<date_creation>17.06.2004</date_creation>
		</tag>
		<tag>
			<name>[Eigenschaft:EigenschaftName]</name>
			<description>Returns the Property if exists else "".</description>
			<date_creation>18.06.2004</date_creation>
		</tag>
		<tag>
			<name>[herstellerNr]</name>
			<description>Returns the herstellerNr</description>
			<date_creation>18.06.2004</date_creation>
		</tag>
		<tag>
			<name>[Picture]</name>
			<description>Returns the Picture Field in Product Table</description>
			<date_creation>28.10.2004</date_creation>
		</tag>
		<tag>
			<name>[Gewicht]</name>
			<description>Returns the Gewicht Field in Product Table</description>
			<date_creation>28.10.2004</date_creation>
		</tag>
	</product_template>
	<product_small_template />
	<user_template>
		<when>In pageToShow=MyAccount page.
	   </when>
		<tag>
			<name>[IDNR]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_COUNT_POINTS]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_COUNT_POINTS_WRITE_REVIEW]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_COUNT_POINTS_PRODUCT_RATING]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_COUNT_POINTS_SEND_TO_FRIEND]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_COUNT_POINTS_ORDERS]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_SUM_POINTS_WRITE_REVIEW]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_SUM_POINTS_PRODUCT_RATING]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_SUM_POINTS_SEND_TO_FRIEND]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_SUM_POINTS_ORDERS]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[COUNT_PRODUCTS_BOOKMARKS]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[COUNT_CARTS_BOOKMARKS]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_ADDRESS]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_NAME]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_FIRSTNAME]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_VORNAME]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_FIRMA]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_TEL]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_MOBIL]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_EMAIL]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_DATE_REGISTRATION]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[COUNT_ORDERS]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[COUNT_DELIVERIES]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[COUNT_INVOICES]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[COUNT_ORDERED_PRODUCTS]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[USER_ADDRESS_SHIPPING]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[NEWSLETTER_COUNT_AKTIVE]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[NEWSLETTER_COUNT_DEAKTIVE]</name>
			<description>Attribute</description>
		</tag>
	</user_template>
	<hersteller_template>
		<tag>
			<name>[COUNT_PRODUCTS_AKTIV]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[COUNT_PRODUCTS_INAKTIV]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[COUNT_PRODUCTS_DETAIL_VIEW]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[COUNT_PRODUCTS_LIST_VIEW]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[COUNT_PRODUCTS_CONTACT]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[COUNT_PRODUCTS_ADDED_BOOKMARKS]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[COUNT_PRODUCTS_SENDTOFRIEND]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[COUNT_PRODUCTS_CONTACTME]</name>
			<description>Attribute</description>
		</tag>
		<tag>
			<name>[COUNT_USER_QUERIES]</name>
			<description>Attribute</description>
		</tag>
	</hersteller_template>
	<productList_template>
		<filename>productList_header.htm
	</filename>
		<example>
	<![CDATA[
	
<table border="1" width="100%">
  <tr>
				<td width="33%">[PRODUCTLIST_SEARCH_DESCRIPTION] </td>
				<td width="33%">[PRODUCTLIST_BUTTON_HIDE_IMAGES]</td>
				<td width="34%">[PRODUCTLIST_SEARCH_DESCRIPTION_SAVE_BUTTON] </td>
			</tr>
            <tr>
				<td width="33%">[PRODUCTLIST_PRODUCT_COUNT]</td>
				<td width="33%">&nbsp;</td>
				<td width="34%">&nbsp;[PRODUCTLIST_SORT_BY] [PRODUCTLIST_FILTER_BY] </td>
			</tr>
</table>

]]>
	</example>
		<tag>
			<name>[PRODUCTLIST_SEARCH_DESCRIPTION]</name>
			<description>Wonach der Benutzer sucht, in Worten Beschrieben.</description>
		</tag>
		<tag>
			<name>[PRODUCTLIST_SEARCH_DESCRIPTION_SAVE_BUTTON]</name>
			<description>Button für Speichern Wonach der Benutzer sucht, in Worten Beschrieben.</description>
		</tag>
		<tag>
			<name>[PRODUCTLIST_BUTTON_HIDE_IMAGES]</name>
			<description>Button für Speichern Wonach der Benutzer sucht, in Worten Beschrieben.</description>
		</tag>
		<tag>
			<name>[PRODUCTLIST_SORT_BY]</name>
			<description>Sort By Drop Down Listing or Simple Link List.</description>
		</tag>
		<tag>
			<name>[PRODUCTLIST_FILTER_BY]</name>
			<description>Filter By Drop Down List.</description>
		</tag>
		<tag>
			<name>[PRODUCTLIST_PRODUCT_COUNT]</name>
			<description>Anzahl von gefundene Objekte.</description>
		</tag>
		<tag>
			<name>[PRODUCTLIST_PAGES]</name>
			<description>Pager</description>
		</tag>
	</productList_template>
</template_descriptions>


```