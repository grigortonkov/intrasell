<!--#include file="includeall.inc"-->
<!--#include file="Title.asp"-->
<body onLoad="FillBL();">
<%
'Create PLZ ARRRAY 
response.write "<SCRIPT>LandOrtPLZArray = new Array("
'fill with table values
dim sql, rsPLZ
'set rsPLZ = ObjConnection.execute("select * from grPLZ Where idnr In (select PLZ from lieferantenAdressen) order by BLAND, Ort, PLZ")
set rsPLZ = ObjConnectionexecute("select * from grPLZ order by BLAND, Ort, PLZ")

While not rsPLZ.EOF 
   response.write "new Array(""" & rsPLZ("BLAND") & """,""" & rsPLZ("Ort") & """,""" & rsPLZ("PLZ") & """)," & CHR(13) & CHR(10) 
   rsPLZ.MoveNext 
Wend
response.write "new Array("""","""",""""));</SCRIPT>"
%>

<SCRIPT>
/*LandOrtPLZArray = new Array(
new Array("Wi","Wien","10"),
new Array("O�","Linz","4020"),
new Array("O�","Urfahr","4040"),
new Array("O�","Traun","4050"),
new Array("O�","St.Magdalena","4070"),
new Array("Salz","Salzburg","8050")
);
*/
</SCRIPT>
<SCRIPT>
//
// Fill Ort
//
function FillBL(){
 //delete all old 
 selectElem = document.GeoSelect.BL; 
 for (i = 2; i<=selectElem.length; i++)
 	selectElem.options[i-1] = null;
 	  var addedItems = '';
 //add new 
 for (i = 0; i<LandOrtPLZArray.length; i++) {
	 		ortName = LandOrtPLZArray[i][0];
   			//check if added 
    		added = false;
 	 		if (addedItems.indexOf(ortName)>=0) 
 	 				   added = true;
 	 		
  			if (!added) {//add 
				NeuerEintrag = new Option(ortName,ortName,false,false);
		 		selectElem.options[selectElem.length] = NeuerEintrag;
		 		addedItems = addedItems + "," + ortName;
   			}//end add
 }
}
</SCRIPT>

<SCRIPT>
//
// Fill Ort
//
function FillOrt(){
 //delete all old 
 selectElem = document.GeoSelect.Ort;
 size = selectElem.length;
 for (i = 2; i<=size ; i++)
 	selectElem.options[1] = null;
  
  var addedItems = '';
 //add new 
 for (i = 1; i<=LandOrtPLZArray.length; i++) {
	 		ortName = LandOrtPLZArray[i-1][1];
   			//check if added 
    		addedOrt = false;
    		
    		if (document.GeoSelect.BL.value==LandOrtPLZArray[i-1][0]){ //same BL   
    			    			
 	 				if (addedItems.indexOf(ortName)>=0) 
 	 				   addedOrt = true;
 	 					
  					if (addedOrt==false) {//add 
						NeuerEintrag = new Option(ortName,ortName,false,false);
		 				selectElem.options[selectElem.length] = NeuerEintrag;
		 				addedItems = addedItems + "," + ortName;
   					}//end add
   			}//if		
 }//for
 
}
</SCRIPT>

<SCRIPT>
//
// Fill PLZ
//
function FillPLZ(){
 //delete all old 
 selectElem = document.GeoSelect.PLZ; 
 size = selectElem.length;
 for (i = 2; i<=selectElem.length; i++) {
 	selectElem.options[1] = null;
 }
 
 //add 
 for (i = 1; i<=LandOrtPLZArray.length; i++) {
	 		ortName = LandOrtPLZArray[i-1][2];
   			//check if added 
    		added = false;
    		
    		if (document.GeoSelect.Ort.value!=LandOrtPLZArray[i-1][1])//other Ort 
    		  added = true;

    		for (k = 1; k<=selectElem.length; k++) 			
 	 			if (selectElem.options[k-1].value == ortName){
 	 			      added = true;  
          }
 	 	 
  			if (!added) {//add 
				NeuerEintrag = new Option(ortName,ortName,false,true);
		 		selectElem.options[selectElem.length] = NeuerEintrag;
   			}
 	}
}
</SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
	<!-- 
function applyPLZ(toElementName){
		opener.document.all('BL').value = document.GeoSelect.BL.value; 
		opener.document.all('Ort').value = document.GeoSelect.Ort.value; 
   		opener.document.all('PLZ').value = document.GeoSelect.PLZ.value; 
   		window.close();		    

}
// -->
</SCRIPT>

<form method="POST"  name="GeoSelect">
  <table border="0" width="19%" height="84" cellspacing="0">
    <tr>
      <th width="100%" height="12" colspan="3">
        <p align="right">PLZ Selektor&nbsp;</th>
    </tr>
    <tr>
      <th width="8%" height="12">Bundesland</th>
      <th width="31%" height="12">Ort</th>
      <th width="61%" height="12">PLZ</th>
    </tr>
    <tr>
      <td width="8%" height="11"><select size="10" name="BL" Id="BL" OnClick="FillOrt();">
          <option>alle</option>
        </select></td>
      <td width="31%" height="11"><select size="10" name="Ort" OnClick="FillPLZ();">
          <option>alle</option>
        </select></td>
      <td width="61%" height="11"><select size="10" name="PLZ">
          <option>alle</option>
        </select></td>
    </tr>
    <tr>
      <td width="100%" height="23" colspan="3">
        <p align="center"><input type="button" value="Anwenden" name="B1" OnClick="applyPLZ('PLZ');"></td>
    </tr>
  </table>
</form>
</body>