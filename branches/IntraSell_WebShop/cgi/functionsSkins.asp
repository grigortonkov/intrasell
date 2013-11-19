<%
'===========================================================================
' Autor: Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 
'===========================================================================


public SKINNUMBER: SKINNUMBER = varvalue("SKINNUMBER") 'configuration
public SKIN: SKIN = "/skins/skin" & SKINNUMBER 'configuration

'rem use <=imageFullName("noxel-b.gif")>
' Skin  - defines the skin that must be used for this shop
function imageFullName(imageName)
if basename="" then basename = Session ("BASENAME")

select case imageName
		case "isell_verysmall.gif" : imageFullName = basename +"/isell_verysmall.gif"  
		'LINKS
		case "agbs.gif" : imageFullName = basename + skin +"/images/links/agbs.gif"  
		case "datenschutz.gif" : imageFullName = basename + skin +"/images/links/datenschutz.gif"  
		case "emailnewsletter.gif" : imageFullName = basename + skin +"/images/links/emailnewsletter.gif"  
		case "home.gif" : imageFullName = basename + skin +"/images/links/home.gif"  
		case "kontakt.gif" : imageFullName = basename + skin +"/images/links/kontakt.gif"  
		case "lieferung.gif" : imageFullName = basename + skin +"/images/links/lieferung.gif"  
		case "pricehits.gif" : imageFullName = basename + skin +"/images/links/pricehits.gif"  
		case "resources.gif" : imageFullName = basename + skin +"/images/links/resources.gif"  
		case "produkte.gif" : imageFullName = basename + skin +"/images/links/produkte.gif"  
		case "toplinks.gif" : imageFullName = basename + skin +"/images/links/toplinks.gif"  
		case "basket1.jpg" : imageFullName = basename + skin +"/images/links/basket1.jpg"  
		case "basket2.jpg" : imageFullName = basename + skin +"/images/links/basket2.jpg" 
		case "basket3.jpg" : imageFullName = basename + skin +"/images/links/basket3.jpg" 
		case "basket4.jpg" : imageFullName = basename + skin +"/images/links/basket4.jpg" 
		case "returningcustomer.gif" : imageFullName = basename + skin +"/images/links/returningcustomer.gif"  
		case "newaccount.gif" : imageFullName = basename + skin +"/images/links/newaccount.gif"  
		case "forgotpassword.gif" : imageFullName = basename + skin +"/images/links/forgotpassword.gif"  
		case "paypal.gif" : imageFullName = basename + skin +"/images/links/paypal.gif" 
        

		'BUTTONS
		case "bestellen.gif" : imageFullName = basename + skin +"/images/buttons/bestellen.gif"  
		case "button.gif" : imageFullName = basename + skin +"/images/buttons/button.gif"  
		case "buy.gif" : imageFullName = basename + skin +"/images/buttons/buy.gif"  
		case "compare.gif" : imageFullName = basename + skin +"/images/buttons/compare.gif"  		
		case "go.gif" : imageFullName = basename + skin +"/images/buttons/go.gif"  
		case "druck.gif" : imageFullName = basename + skin +"/images/buttons/druck.gif"  
		case "emailafriend.gif" : imageFullName = basename + skin +"/images/buttons/emailafriend.gif"  
		case "search.gif" : imageFullName = basename + skin +"/images/buttons/search.gif"  
		case "shopbags.gif" : imageFullName = basename + skin +"/images/buttons/shopbags.gif"  
		case "updatewarenkorb.gif" : imageFullName = basename + skin +"/images/buttons/updatewarenkorb.gif"  
		case "weiteraussuchen.gif" : imageFullName = basename + skin +"/images/buttons/weiteraussuchen.gif"  
		case "zurkasse.gif" : imageFullName = basename + skin +"/images/buttons/zurkasse.gif"  
		case "delete.gif" : imageFullName = basename + skin +"/images/buttons/delete.gif"  
		case "save.gif" : imageFullName = basename + skin +"/images/buttons/save.gif"
		case "question.gif" : imageFullName = basename + skin +"/images/buttons/question.gif"   
		case "login.gif" : imageFullName = basename + skin +"/images/buttons/login.gif"   
		case "logout.gif" : imageFullName = basename + skin +"/images/buttons/logout.gif"   
        case "change_order.gif" : imageFullName = basename + skin +"/images/buttons/change_order.gif"  

		'BORDERS
		case "default.gif" : imageFullName = basename + skin +"/images/borders/default.gif"  
		case "edge_cut.gif" : imageFullName = basename + skin +"/images/borders/edge_cut.gif"  

		'ICONS
		case "arrow.gif" : imageFullName = basename + skin +"/images/icons/arrow.gif"  
		case "callmeback.gif" : imageFullName = basename + skin +"/images/icons/callmeback.gif"  
		case "dot.gif" : imageFullName = basename + skin +"/images/icons/dot.gif"  
		case "email.gif" : imageFullName = basename + skin +"/images/icons/email.gif"  
		case "emailafriend.gif" : imageFullName = basename + skin +"/images/icons/emailafriend.gif"  
		case "smile.gif" : imageFullName = basename + skin +"/images/icons/smile.gif"  
        case "package.png" : imageFullName = basename + skin +"/images/icons/package.png" 
        case "printer.png" : imageFullName = basename + skin +"/images/icons/printer.png"  
        case "data_information.png" : imageFullName = basename + skin +"/images/icons/data_information.png"  


		'COMPANY
		case "company.gif": imageFullName = basename + "/company/images/"  & VARVALUE("COMPANY_LOGO_IMAGE")
		case "rechnung.gif": imageFullName = basename + "/company/images/rechnung.gif"  	
end select

end function 

%>
