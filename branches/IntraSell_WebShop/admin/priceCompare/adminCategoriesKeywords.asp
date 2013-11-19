<!--#include file="../client/intrasoft/menu.asp"-->
<SCRIPT LANGUAGE="JavaScript">

function doSubmit() {
	var field = document.forms("CategoryKeywords").item("MaxSizeForComboBox")
	if ( isNaN(field.value) || ( field.value < 0 ) || ( field.value > 100 ) ) {
		alert ('The value in field \"MaxSizeForComboBox\" must be a number between 0 and 100 !');
		field.focus();
		return false ;
	}	
	var mylist = document.forms("CategoryKeywords").item("KeywordsList") ;
	for ( var i = 0 ; i < mylist.length ; i++ ) 
	mylist[i].selected  = true ;
	return true ;	
}

function RestoreValues() {
	document.forms("CategoryKeywords").submit() ;
	document.forms("CategoryKeywords").item("Name").value = ""
	document.forms("CategoryKeywords").item("Order").value = ""
}	

function MoveUp() {
	var mylist = document.forms("CategoryKeywords").item("KeywordsList") ;
	if ( mylist.length ) {
		for ( var i = 0 ; i < mylist.length ; i++ ) 
			if ( mylist[i].selected ) break ;
		if ( i == mylist.length )
			alert( " You have to select a keyword from the list ! " ) ;
		else {
			var tempOption ;
			if ( mylist[0].selected ) 
				alert ("You can not move up '" + mylist[0].text + "'" );
			else {	
				for ( var i = 1 ; i < mylist.length ; i++ ) {
					if ( mylist[i].selected ) {
						tempOption = mylist[i-1].text ;
						mylist[i-1].text = mylist[i].text ;
						mylist[i].text = tempOption ;
						mylist[i-1].selected = true ;
						mylist[i].selected = false ;
					}	
				}
			}
		}
	} 	
	else
		alert ("The keyword list is empty ! ");			
}
	
function MoveDown() {
	var mylist = document.forms("CategoryKeywords").item("KeywordsList") ;
	if ( mylist.length ) {
		for ( var i = 0 ; i < mylist.length ; i++ ) 
			if ( mylist[i].selected ) break ;
		if ( i == mylist.length )
			alert( " You have to select a keyword from the list ! " ) ;
		else {
			var tempOption ;
			var last = mylist.length - 1 ;
			if ( mylist[last].selected ) 
				alert ("You can not move down '" + mylist[last].text + "'" ) ;
			else {	
				for ( var i = last - 1 ; i >= 0 ; i-- ) {
					if ( mylist[i].selected ) {
						tempOption = mylist[i+1].text ;
						mylist[i+1].text = mylist[i].text ;
						mylist[i].text = tempOption ;
						mylist[i+1].selected = true ;
						mylist[i].selected = false ;
					}	
				}
			}
		}
	}	
	else
		alert ("The keyword list is empty ! ");
}

function RemoveKeyword() {
	var mylist = document.forms("CategoryKeywords").item("KeywordsList") ;
	if ( mylist.length ) {
		for ( var i = 0 ; i < mylist.length ; i++ ) 
			if ( mylist[i].selected ) break ;
		if ( i == mylist.length )
			alert( " You have to select a keyword from the list ! " ) ;
		else {
			var truefalse ;
			truefalse = window.confirm(' Are you sure you want to remove the selected keywords ?');
			if (truefalse) {
				for ( var i = mylist.length ; i > 0 ; i-- ) {
					if ( mylist[i-1].selected ) {
						mylist[i-1] = null ; 
					}
				}	
			}
		}
	}
	else
		alert ("The keyword list is empty ! ");
}

function AddKeyword() {
	var mylist = document.forms("CategoryKeywords").item("KeywordsList") ;
	var name = document.forms("CategoryKeywords").item("Name").value ;
	var order = document.forms("CategoryKeywords").item("Order").value ;
	var newOption ;
	if ( ( name != "" ) && ( order != "" ) ) {
		if ( ( !isNaN( order ) ) && ( order > 0 ) && ( order <=  mylist.length + 1 ) ) {
			if (  mylist ) {
				for ( var i = 0 ; i < mylist.length ; i++ ) {
					if ( name == mylist[i].text ) break ;
				} ;
				if ( i == mylist.length ) {
					newOption = document.createElement("OPTION");
					newOption.text= name ;
					mylist.add(newOption,order-1);
					document.forms("CategoryKeywords").item("Name").value = ""
					document.forms("CategoryKeywords").item("Order").value = ""
				}
				else 
					alert ("You already have Keyword '" + name + "' !" );
			}
			else {		
				newOption = document.createElement("OPTION");
				newOption.text= name ;
				mylist.add(newOption,1);
				document.forms("CategoryKeywords").item("Name").value = ""
				document.forms("CategoryKeywords").item("Order").value = ""
			}		
		}
		else
			alert ("You have to type in a number between 1 and " + ( mylist.length + 1 ) + " in the feld 'Order' !" );
	}
	else
		alert ("You have to type in values in the felds 'Name' and 'Order' !" );
}
</SCRIPT>
<%#@~^3RsAAA==]frsP(EYzDMc&B b@#@&frh,kNnCY@#@&fbh~Dk|mY@#@&9rsP./@#@&fb:~d$VP@#@&GkhP1G!xO@#@&Gk:,3zhKD[/@#@&9rsP;UODbxo@#@&9ksPD+hw@#@&GkhP1CY	lhn@#@&frh,k~@#@&9b:~N@#@&+NbY,xP"+5E/Ocr2NbOJ*@#@&@#@&rNnlDPxP]n$En/DcJnlOHMJ#@#@&@#@&5?D.bxL,',JJ@#@&kOlMY~',In5!+/D p!+DHjODbxT`E/OCMYE#@#@&k6PdOmDY~@!@*PEJ,O4+U@#@&iN+km,xP"+5E/O 5E+Mz?DDk	LcJ9+kmE#@#@&i/GDD8X,'~];EndDR}E.H?OMk	o`rWM[+MJb@#@&ddnmDm4jYMP',]n;!+kY p;nMXjYMrxT`EdlD^4UY.J*@#@&d5UYMkxT'r_/Dl.Y{J~',/Ym.Y,@#@&irWPkWMY8X~@!@*PEJ,Otx~5UYDrUT'~;UOMkUTPLPJLWM[+M'EPLPdGMY4H@#@&ik0,[n/1P@!@*~JE~Dtnx,5?DDrUT'P5jDDrxT~LPELN/m{J,'P9+dm@#@&7r6P/CD1t?D.~@!@*PrJ~Y4n	P5?D.k	ox~$?Y.r	o~[,EL/nmD1t?DD{EPLPd+mD^4UYD@#@&d$?YMrUo{P$?ODrUTP'Pr'|mYH.{JP'~bNFlD~@#@&n^/d@#@&d$jYMkUo,'~EQ|lDHD{JPL~rNnlD@#@&+U[,kWd@#@&@#@&kW~bN|CO,@!@*PrE,Y4x@#@&P,P,]+GkhP(EO)MD`WS *@#@&i8;YzDM`q~qb,'~JA[kDP/CD+oG.HJ@#@&i8!Y)MDvF~y#,xPrl[:bx/CD+oK.k/Rmd2gnlD1.'E~LPrNnCY@#@&78!Yb..v SF*~{PEUtKhPhDK[E1YdJ@#@&78!YbM.`y~ *~xPrl9:rxK.KN;3DdRm/2_nlYH.{J~[,r9|CD@#@&PP,P(;YzD.`2~qb,'Pr/lD+oK.r+kPdkdYE@#@&d8ED)DM`fSy#Px~rl[:bU;lOoKDk/nnXSW.NkRCdaJ@#@&7P,PP@#@&74!YzD.`*S8#~',E:KDnmn+XAGMNd?ODkUT/r@#@&i4!ObMDccB b~{PJTnxDk1)dwJYm4s+]n9k.+1OWM{2.bm+/GswCDFXAKD9/Rm/a_bMYFlD1.xrP[,rNnlYi@#@&d@#@&ikWPdOmDOP@!@*PrJ~O4+x@#@&id]+GrsP8!YzDDv*B+#@#@&7d(EO)MD`lSF*P',E$l13:WKDG[!mO/r@#@&id8;DbD.cl~+#,x,JC9:bxnMW9;3D/ lkwE~LP;UODbxo,@#@&dx9Pr0~@#@&@#@&+^d+@#@&7]fkh~(EObM.v&Sy#@#@&@#@&d(;YzD.`y~qb,'PrjtKhPh.GN!mD/E@#@&7(EObM.`y~+b,'PEC9:rxh.KN;0YkRlkwr@#@&i4;YzD.c8~F*~',J29rOP;+D+LW.zr@#@&d(;YzD.c8~ b~{PEl9hbx/mYoWMkdRm/2J@#@&~~,P4!ObMD`2Sq#,',J/DnCD+~1AJ@#@&78!Yb..v&S *~{PEmNskx;lDnoKDr+kRCdag29rY{1+S'oDK:{|nXAGMNdJ@#@&+	N~r6d@#@&^mVsP9.mh	bx9WhhlMOFvJ)NskU~;lYLWMk+k~F+HhKD[/ESrJSJkOlD+ES(EY).M#@#@&@#@&b0~"+$E+kYvEbawsX~EOOKxJ*~@!@*PJr~Otx@#@&73nzSW.Nk~',In5!+/O wW.:vEn+zSWMN/dkkOJ*P@#@&i/5s,'Prj2d2Z:~~e,s"r\P2.bmnZKhwmDnFXG.9/~_3"2~zDD|lD1M~',J~[,k[FmYP,@#@&i/+D~./nlDPxPG8NZGx	nmDkGUc26n^!Yn`k5^#@#@&dD+:aP{~D;;+kYcEtl6UrysWM/G:(W~WaJb~@#@&7k6~Y:2~{PJE~Dtnx,@#@&d7D+swP{P8T!,B~f~P[n6lE^OP7lV!n@#@&i+^/n@#@&7ikWP&d1!:n.bm`~O:2P*~Dtn	@#@&ddiYhw,'~Z&xOcD+:ab@#@&ddirWPD+sw~@!~T,W.PDn:aP@*~8!!~O4+U@#@&7id7D+swP{P8T!@#@&7did]nkwW	d+cDbOnPr@!(@*@!0GUDP^W^GD{B.n9B@*\CX?ryoKD/K:(WAK6,\jUK~AAPC~	E:(nD,hkD4~\mV!+~4nOS+nx,TPmx[~8!!@!8M@*E@#@&7id7"+kwW	/ MkO+,JP4mYBk~h4XPD4nP7l^EnPrd,l;YKhlDk^C^VX~dY~YK~8!T,"@!z0KxD@*@!J4@*@!(D@*E@#@&di7+	NPbW@#@&idVd+7@#@&d7dDn:aPx~8!!@#@&id7IdaWUk+cDbY~J@!tf@*tlajby+wGD;W:(G$WXPtjjK~$APCP	;:(+.~SkY4~7lsE~(+OS+xPZPmUN,FT!@!4.@*r@#@&i7d"+/aGU/RqDrYn~rK4lDv/,h4z,Ytn~7lsE~b/~mEDW:mYb^l^VzPk+O~DWP8T!,"@!J4f@*@!4M@*E@#@&7i+UN,r0i@#@&7xN~r6d7@#@&7b0~M/nlYcA}oPmx[PM/FCDR2}oPDt+	@#@&di0KD~L~x,F~YK~I;;nkYRoGM:cJnnHhGMNkSkkYrbR;W;xD@#@&7id/$sP{PJ&Hj2"K,qHK6~aDrm/WswC.|+z	KD[/,cn+zqWMNq9~,)DD|CYgDS~gl:SP]rD9n.TBPtla?r"sGD;G:(W$GXP#~E,[~{@#@&id7iP,JPjl^;+k`EPLPHnXYq9cJaDk1n/WswmDn|nzqW.NkE~r|nzqWD[(9JbPL~r~~rPLPk9|mOPLPm@#@&d77iPPrSPEJPL~]+$E/ORoGM:cJnnXSW.[kSkdOr#cL*~LPEE~rP[,L,'Pr~EPLPOnswPL~J,#Ji@#@&did}4%ZGU	+^YbGxc+an1EYnck;s#,7,P@#@&di1+XY@#@&dVd+,d@#@&idk6~`,I+$;n/DRwW.:cEn+zhK.NkSrdDJ# /KEUY,x,!~*PDt+	@#@&7di/5V,'~EG2SAP2,0DKh~wMk1+/Wh2mDn|zKD[d,C3]AP)DDFmYHMP{PJ,[,rNnlO@#@&d77}4L;Gx	+mDrGxc+X+^EOnv/5V*~d,P@#@&id+sdd@#@&i7ih4bVPxKY,./nlORAro@#@&ddi70^lo,x~0mVk+@#@&77id%P{~F@#@&77idNG~@#@&7di7i0smo,'PvP;jYM`./nlOcr1lsnJ*#P{~/?DDvIn;;nkY sK.:vJFnHhW.[kSr/DE*`%*#,#@#@&di7diL~',L~Q,F@#@&7didSKG2PStbVnP%~@!'~I5E/O wWDhcr|nXSGMNddkkYJ*R;GE	Y~l	N~UKYP6slT@#@&@#@&7didb0~PWsmo~Y4nx,B~;aNlOn,3nXSGMN~KD9+D@#@&i7didd;^Px~rjnG)KAPwMr^+;WswCDnFX	WM[/,/nO,$r.[DD'r~LP%,O,FPLPrSPtla?bynoKDZKh4KAWX~xPrPLPO+h2,[~J,	CAI3~n+XAGMN(N,x,J~LPM/|mYvE|XAWMN([r#@#@&7didd}8%ZKx	+^YrG	Rn6^ED+cd$V#~7,P@#@&i7idn^/PB,Ns+D+~3XAGMN@#@&7diddk5sP{Prf3S3PAPWDKhPaDr^ZWh2mDn|zqW.9/,CAIA~|XAWMN([,'Pr~[,D/nCO`r|XAW.[&NE#@#@&did77}4L/G	xnmDrKx 6mED+vd;^#~d,P@#@&iddinx9Pk67@#@&idid./FCDR\W7n16O@#@&dd7Ax[d@#@&id7i@#@&ddi0K.PNPxP8POG,I+$;+kYRwG.:vJn+zhG.9/JkkOJ*R/G!xY@#@&id7dMdnlOcHK\+wkMdY@#@&7did[G,@#@&i7did0^CLP{PvP/?O.vDd|mO`r1ChJ#b~{P/?D.vIn$E/YcsK.:vJF+HhG.9/SbdYr#`NbbP*@#@&d7d77M/FlD HK\nH6Y@#@&id7ddGKw~StbV+,xKOPM/FlDR36wPl	[P	WY,WslTd@#@&7d77b0~`,UWDPWsmoPb~Dtnx,v,xnSP0+XSWM[@#@&d7didd5^P',Eqg?2"P~qgK}P2Dr^ZG:aCD|nzqWD[d,`F+H	KD[&NBPbMYnCYgDSPglhnBP$}.NDTB~\lX?bynsG.;Wh4K$WXPb~rP[~m@#@&7di7id~,J,.l^Ed`rP'Pg+aO&N`r2Dbm+;GhwmD|nX	GMNdJBE|X	GMNq[E*P'PrS,J~LPbN|mY,'P|@#@&did77iPPrSPEJPL~]+$E/ORoGM:cJnnXSW.[kSkdOr#cL*~LPEE~rP[,L,~[,JSJ,[~O:w,'PrP#r7@#@&idid7r8%;WUx^YbWU 6+^;D+c/$s*P7,P@#@&didinx9Pr0@#@&77i1+XO@#@&ddU[Pb0i@#@&dnU9Pr0@#@&+	N~r6PB~)awsX,$!YOKx@#@&@#@&k6~k9|CY,@!@*~rJP,Otx@#@&7d;^P{PE?3JAZPP,Hls+~o"rH~,TD)DDr0+s |mY+TWMr+	T~_2]3,bDDFlD1D,x~J,[,k[|COi@#@&dknY,DdFmYPx~K4%ZKU	+^DkKxRA6^ED+c/$Vb@#@&dmmOxm:+,x~Dk|mYcJHCs+E#@#@&d"+d2Kx/n qDrY~r@!WKDsPxm:xJrZCYoG.H|+HAWMN/rE~l1YbWU'EEmNhk	/lD+LGMk+dFXAWM[kRCkwQ|lD1MxJ,[~k9|CO,[PrEJ,:+D4GN{Jrn6?PEr@*E@#@&7I/2G	/+ 	MkO+,E@!YC(VPhbND4'EFT!uB~4ko4O'EF!ZYvP(WMNnDxvZB~msVkwC^bxoxvyB~ms^wC9Nbxo{BZv@*r@#@&dk;s~{PJU3SAZK,~MPwI}H~w.r1+/Ws2lM+FnHW.[kP	CA]AP)MYnlYgD,xPrP'PbNFCD@#@&id+DPDkFCY,',W8L/G	xnmDrW	R3amEOnv/5V*@#@&dr6PM/|mYc$rwPCx9P.dnlYc3rwPY4nUPEP	W~3nzSW.Nk~0KD~O4+P^CD+LWMz@#@&7imKExDP{~!,d7d@#@&7n^/+@#@&dimW!UOP{PZP@#@&77StrV~xKY~.k|lO AroP@#@&id71W!xY,',^W!xOP3Pq~@#@&di7Dk|lD \W7+g+aY@#@&idA+	[@#@&d7.k|lO tW-+wrM/Oi@#@&d+	N,r0@#@&7I/2G	/+c	DbY+,E@!YMP4+ro4O,'~B8T]E@*@!O9PmGskwCx{vlB~mVbox{B1nxD+.B,\Csbox,xBDWwE@*E@#@&d"+dwGUk+ MrYPE@!4c@*@!8@*|nXSGMNd,0KDPrPL~mmYUls+~',J@!J8@*@!ztW@*@!zDN@*@!&Y.@*r@#@&d"n/aWUdR.rD+~J@!OM@*@!DN,mW^/aCx{B+B@*@!8.@*@!4M@*[	4/aI@!zDN@*J@#@&7]/2W	d+c.rD+PE@!DN~l^rTxxEDbotDB,-l^kLx,'v^xY.B@*@!4@*\C6,?bynPoGMP/Ws8W,AGa=@!z8@*@!zON@*E@#@&7"+kwW	/ MkO+,J@!O9@*@!bUw!YP	Ch+{Btla?r"sGD;G:(W$GXBPdOHVn'EAbNO4)l!Br@#@&7k6P^W!xO~@*P!,OtxP@#@&7d"+kwGxdnc.kDnPr\Cs!+'vE,[~DkFmYcrHm6?byoWMZG:(W$GXJ#L~JEJ@#@&7nx9Pb07d7@#@&d]+k2W	/n qDkOn,J@*[	8kwILx(/wp[	8/ai'x(/2I@!zY9@*@!DN@*LU8/ai@!zON@*@!JY.@*r@#@&iIndaWxdnc.kDn,J@!DD@*@!Y9PmskTxxB1+UODB,^W^/wmUxByB@*@!8@*HnSPV+HAWMNl@!J4@*@!&DN@*J@#@&iInkwKx/Rq.kD+~J@!Y[~mVkTU'Em+	OnDEP1Ws/2C	'v E@*@!(@*FnHhW.[kPJkkO=@!&(@*@!zY9@*r@#@&iIn/aWUdRMrYPJ@!O[PmVboU'v^xO+Mv@*@!4@*)1YkGUk)@!z(@*@!zO9@*@!zYM@*r@#@&iIn/aWUdRMrYPJ@!O.@*@!Y9PCVrL	'vDbLtDB~@*gl:nl@!zON@*@!DN@*@!k	wEDP	C:'v1m:nv@*@!zD[@*r@#@&i]n/aW	/nR	.bYnPr@!Y9PAr9Ytxv2GYB,C^kL	'Em+	Y.B,\CVboUxEm+	O+MBPMGA/al	'v&v~1Ws/aCx{B+v@*JP@#@&iIn/aG	/ncMkYPr@!/VnmDPUCs+'EF+HhWM[dSb/DB~/r"'vFZvPkYzs'BAr9Y4)yTZB~sE^YkaV@*J@#@&70KD~r,'P8~YKPmK;UY,@#@&d7DdFmY HK-+wk.dD@#@&77GW~h4r^+~	WDPDk|mORAroP,@#@&7idk6~Z&xYv.d|mYvJ6D[nMJb#,xPbPO4x@#@&7id7+XrDP[K@#@&ddi+	[Pb07@#@&d77M/|mORtW\Hn6D@#@&d7SGGa@#@&dir0,DdFmYR36wPOtU,B~4l7+PDW,.+alrD,W.[D/@#@&didDkFCYcHK\nsr.kY@#@&i7d6W.~NP'~q,YGP1G!xOid@#@&didid;^PxPrjK9zK2,2Dbm+;GhwmD|nX	GMNdPknY,$6.9+DDxrP'PN~LPE,_2IAPnnXSW.N&N~x,JPL~Dk|lDcE|XSW.N([r#@#@&i7dir8%;WxUn1YrW	 6n1ED+`k;^bPiP~@#@&d77iD/nCYcHW7nH+XY@#@&7d7U6O@#@&7diIndaWxdncInNb.mO,JmN:bx;CYoGDb+dFXhK.NkRlk2EPLP$?ODrUTP@#@&i7+^/n@#@&dd7]/2W	dR	MkD+Pr@!K2YbWU@*rP'~M/|mO`r1lsnE#,[,J@!zG2DkGx@*E@#@&d7n	NPrW@#@&7xaD@#@&iI/wKxknRqDrYPE@!J/+^nmD@*J,@#@&dTbYHAA==^#~@%>
		</td>
		<td width="37%" align="center" valign="center"> 
		<input type="Button" class="SubmitButton" Value ="hinauf" style="width:60" OnClick="MoveUp();" id=Button1 name=Button1>
		</td>
		<tr>
		<td align="right" >Order:</td><td><input name="Order"></td>
		<td align = "center">
		<input type="Button" class="SubmitButton" Value ="hinab" style="width:60" OnClick="MoveDown();" id=Button2 name=Button2>
		</td>
		</tr>
		<tr>
			<td align="center" colspan="2"><input type="Button" class="SubmitButton" Value ="Add Keyword" style="width:110" OnClick="AddKeyword();" id=Button3 name=Button3></td>
			<td align = "center"><input type="Button" class="SubmitButton" Value ="Remove Keyword" style="width:110" OnClick="RemoveKeyword();" id=Button4 name=Button4></td>
		</tr>
		<tr><td colspan='5'><br>&nbsp;</td></tr>
		<tr height="10%">
		<td align="center" colspan="3"><input type="submit" value="Apply Changes" name="ApplyButton" OnClick="return doSubmit()"></td>
		<td align="center" colspan="2"><input type="submit" value="Restore Values" name="B2" OnClick="RestoreValues()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	</table>
	<br>
<%#@~^sAUAAA==n^/n,@#@&dI/aGxk+ MkOn,J@!4+@*;lYLGDb+kPJkdO=@!&ty@*J@#@&7d$VPx~r?3SA/:P~zDD|lD1MSPglh+BP).D|lDHDhlDUOPwI}H~$L.zDOk0nV |COoW.rxDPr~LPm@#@&iPP,P,~J,u2"2~)MY|mO1MnlMnUY,',OqJ~@#@&d~P,~P,@#@&7k+Y~.k|CY,x,W8NZKxxmDrW	R36m;O`/$s#@#@&dq4rVP	WOP.dnlORA6s@#@&77Gk/2smX/lDnTW.HPM/|mYvE1m:nJ*~~TBPDkFlD`Jz.O|mYgDE#S~rJSPrCNskU/mY+LGMkn/nnHhGMNkRlkwr@#@&id!+D?;8;lYLWMk+k~./nlD`Eb.OnlO1ME#BPqS,JJS~rl[:bU;lOoKDk/nnXSW.NkRCdaJ@#@&7dM/|mO HK\1n6O@#@&dA+	[@#@&d.dnlY ^^Wd+@#@&i/nDPM/|mY,xP	WOtbxL@#@&+x9~k6@#@&@#@&]+kwKxd+ 	MkO+,E@!J0G.s@*J@#@&@#@&jE(~GkdaVmXZmYLWMX~`D6O9b/w^CXBPk	OJ+7+^~~k[FmY~~,5EkY.S,wlLn,#~@#@&7Gkh,S\+^ZK;xD+.@#@&d]nkwW	d+cDbOnPr[	4dwIE@#@&7sK.Pd+-n^ZW;UD+.P{~ZPOKPbxYd+7nV,@#@&diIndaWxknRqDkDn~JLx(/2i'U(/2iLU4kwI'	4/2ILx8/aIr@#@&i16Y@#@&i]+kwGxk+ 	MkY~J@!lP4.n0,',JEJ~',wCo~[,J_FmY1.xrP'Pb[nlO,[,;EkYM~[,JEJ@*J~',`KMr:vY6D9r/aVmXb#~',J@!zm@*@!~I@*E@#@&2U[,?;4@#@&@#@&j!4,M+D?!8ZmYnoKDrnk`Pb[nmD+	OSPbxDSn\nsBP5EkODBP2CT+Pb@#@&d9ks~M/j!4@#@&dk;^~',Jj2d2/P,PbMO|mY1MS~1m:~~b.OnlO1MKlM+UO,sI6\,$LDz.DkVV |lD+TGDb+UT,J~',{@#@&~P,PP,E~_2"2~b.OnlO1MKlM+UO,'PE~LPrNhCM+UDP@#@&dk+D~Dk?;4,'~G(LZKUxmYbGURA6m;Ynck;s#@#@&dih4r^+PUGDP./U;(R3}s,@#@&idGr/aVCX;lOnTWDH~Dk?E(cE1m:Jb~~r	YJ+7nVBP.dUE4cEzDO|mOgDE*~,;EkYMSPalL+@#@&77V+YU;4;lYLGDb+kP./j;(`EbMO|mYH.r#~~r	YJ+7n^PQ,FBP;!/D.~,wCo@#@&7iD/U;4cHW7nH+XY@#@&7hnU9@#@&dUnY,Ddj!4Px~gWOtbUT@#@&Ax9P?!4@#@&@#@&mCV^P[.mhbUNKhnm.O vJzNhkU~;lO+TGDb+d~n+XAGMNdJBEr~EkYmY+r~(;YzD.#@#@&7aYBAA==^#~@%>