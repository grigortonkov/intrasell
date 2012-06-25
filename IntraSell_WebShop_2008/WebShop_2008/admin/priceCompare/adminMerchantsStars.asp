<!--#include file="../client/intrasoft/menu.aspx"-->
<SCRIPT LANGUAGE="JavaScript">
function CheckForEmptyField( field1, field2 ) {
	var myform = document.forms("Starsform");
	var myfield = eval ( 'myform.item(\"' + field1 + '\")');
	if ( myfield.value == "")  {
		alert('Geben Sie einen Wert in das Feld \"' + field2+ '\" ein.');
		myfield.focus();
		return true ;
	}
	return false ;
}	

function doSubmit( m ) {
	var elem
	document.forms("Starsform").item("merch").value = m  ;
	if ( m == 'all' ) {
		for ( i = 0 ; i < document.forms("Starsform").elements.length; i++ ) {
			elem = document.forms("Starsform").elements[i] ;
			switch ( elem.name.substring(0,4) ) {
				case "User" :
					if ( CheckForEmptyField ( elem.name , 'Username')) return false ;
					break ;
				case "Pass" :
					if ( CheckForEmptyField ( elem.name , 'Password')) return false ;
					break ;
				case "Star" :
					if ( CheckForEmptyField ( elem.name , 'stars')) return false ;
					if ( isNaN( elem.value ) || ( elem.value > 5 ) ) {
						alert('The Value in field \"Stars\" must be numeric and less than 5 !');
						elem.focus();
						return false ;
					}	
					break ;
			};		
		};	
		return true ;
	}
	else {
		if ( CheckForEmptyField ( 'Username' + m , 'Username')) return false ;
		if ( CheckForEmptyField ( 'Password' + m , 'Password')) return false ;
		if ( CheckForEmptyField ( 'Stars' + m , 'Stars')) return false ;
		elem = document.forms("Starsform").item("Stars" + m ) ;
		if ( isNaN( elem.value ) || ( elem.value > 5 ) ) {
			alert('The Value in field \"Stars\" must be numeric and less than 5 !');
			elem.focus();
			return false ;
		}	
	}	
	
	return true ;
}
</SCRIPT>
<%#@~^/hIAAA==9b:~(EDbDM`2S *@#@&fb:~d$V@#@&9ksPDk@#@&fb:,:nD^4	lh+@#@&fb:~n9kY@#@&GkhPkOmDd@#@&Gk:,mK;xD@#@&fb:~hDm4@#@&s+D14~',D;;+dOvJh+M^tr#@#@&@#@&4;OzD.`8S8#~{PrnDK0bs+r@#@&4!Y).M`FB+#,'PrC[:bxt+.m4C	YdnMG0bVn m/wE@#@&4;Yz.M`+BF*P',JArxkYnV^EULxJ@#@&4!YbM.c B *PxPEC9:rxtnD1tCUD/nCzs+UYcCkwE@#@&(EYzDMc&BFbP{PEo:nPknYDkxTdE@#@&4!Y)D.c2~+#,xPrl[hbxHn.1tCxDdwY2clkwJ@#@&1CV^P[Dmh	r	NWSKlMYFvE)Nsk	P\+.^4lUYk~?Dl.dr~JESr/OlDnr~8!YzDD*@#@&r0,:nD1t~@!@*PJr~PDt+	~~B,+9kO'dOmDd@#@&7k6PhnMmt~@!@*PEl^srPO4+	@#@&idk5V,'~J`n9):2Pa.k1+ZKh2lM+_lnx[sD~/OPhlzhxY\G9+~',vrP',D;E/DcJhlz:xO\KN+r~[,:+M^4#,[,{@#@&77iP~JESP`/n.gl:n~{PvJ,',Dn$E/YvJ`d+MxC:J'hDm4bPLPJES~nm/khGDO~{PvJ,'PM+5;/YcEhld/SGMNEL:Dm4#i'P|@#@&did~~rB~,jYmD/,x~J,[,Dn;;nkYcJUOlM/E's+D^4*P'Pr~qC3"2,Sk0.l	YHD,'~E,[PsnD1t@#@&77W(L;WUxn^DkGxc36m;O`/5s*@#@&dsk+~EPs+D1t,xPmVs@#@&d7d$VP{~J,?2d3/K,P^kn0n.mxO+	)NM+ddxR(9gI~~,sb+WDmxYxz[D/d+	RHCs+Pw]rtPVbnW+Ml	Ynx)[M+d/UPrP'~|@#@&77,P~P,~rP(g1AIPxr&HPaDrmZGhalDulxN^n.P}1,PsknWDCxDnxzN.nk/+U &fHI,xaDr1+;W:alMnCm+UN^+. ^k+6nDmxYg.~J@#@&idd+O~M/~',G4NZGU	+mOrKx 2Xn1EO`k;V*@#@&7dqtrVPUGDPDk 2}s@#@&77ds+Mm4Px~M/cJ&91"Jb@#@&dd7d$V~',E`n9zKAPwMk1nZK:2lM+uCxN^nD,/+D~KlH:xOHG[PxPEEPLP.n$E+dOvJKlHhxOtW9+J,[,h+Mm4#,[~m@#@&di7diJBB~i/Dglh+~x,BEPL~D;;nkY`Eik+.xmhJ's+Mmt*PL~JE~~nm/dAKDY,xPEJPL~.+$E/O`EKm/dhK.Nr[hnMmtb7LPm@#@&7id7iJE~PUYm./,'~J,[~.;EdYvJ?DC./r[s+.m4b,[~J,	CAI3~dk+WnMlUYg.,'~rPLP:D14@#@&d7dK4%/Kxx^YbWxc3a+1ED+c/5s*@#@&di7DkR\G7+1naD@#@&diAx[@#@&id:D14P{PEl^VE@#@&d+	[Pb0@#@&7h+Mm4PxPEE@#@&nx9~k6@#@&d$VPx~rPj2d3;K~,Vb+0DmUYx)NM+ddxRCSPaDk1n/WswmDnCCn	Ns+M e,s]6tPVrn6+.l	Ox)9D//x,EPLPm@#@&d~~rPqgH2"P9}(HPaDbmnZGhal.+_C+	NsnMPrH~,Vr+6nMlUD+	bNM+kd+	R(fgI~xaDk1nZK:wm.nCm+	Ns+. ^kn0.l	YH.,J@#@&dY~Dk~{PG(L;Wx	+1OkKx 2X+^;D+`k5V*@#@&"ndwKxk+ .rD+~J@!WWM:~C1YkGU{JEl9hbx\D1tl	YkjYmDdRm/2ErP:OtKN'rEKrUKrJ~k[xE?OlMd0KDhv,xlhn{BjYm.k0GM:E@*J,PL~Z_IcF2#~',ZC"cFZ#@#@&]n/aW	/nR	.bYnPr@!k	w;O,YX2n{B4k9[xv,xm:+{BsnD1tv@*rP'~;CIvq&*P[,/uIvFZ#@#@&]nkwGxknRqDrOPJ@!Om4s+,8KD[D{B!EPSrNDtxBF!Yv@*JP,'P;CIvqf#,[,ZuIcqZ#@#@&"n/aWUdR.rD+~J@!OM@*@!DN,mW^/aCx{BB,lsrTx'E^+	Y+Mv@*@!(@*@!tf@*3[bY~:.m4lUOE/PdOmDdPL~k+ODk	o/@!z4f@*@!z8@*@!zO[@*@!zD.@*rPPL~/C"`8&bP'~;C]`8T#@#@&rW,xWO~M/ A}o,lU9P	WY,Dk 2}s~Y4+U~@#@&d"n/aWxkn MkD+~J@!OM@*@!Y9~mKVd2mx'vEPCVbL	'v1+	Y+MB@*EP,[~Z_Icq2#PL~Z_I`8Tb@#@&d"+dwGUk+ MrYPE@!bxw;O,YzwxE/;(:bYB,\msE'vjaNCOPb^sB,xlsnxB`w9lO+)s^A;YDGxEPGU1Vk^V{JENKj!4hbYvBl^VEbJr@*@!zDN@*@!JYD@*EP,P[,/uIvF2#~[~/_IcFZb@#@&d]nkwWUdR	DbOPE@!YM@*@!DN,^W^/2l	'vEPl^ro	'B1nUYDE@*'x8dai@!zD[@*@!zO.@*JP'~;C]`8f*P',Z_I`8!*@#@&iIn/aWUdRMrYPJ@!O.@*@!Y9PCVrL	'vmUYDv@*@!4@*Jr0nDmUD@!&DN@*@!Y9PmskTxxB1+UODB@*@!4@*j/.~1m:@!&Y[@*@!Y[PmskTxxv1+xOnMB@*@!(@*aldkhKDN@!zD[@*rP'P;C]c8&#,'P;CIvqT#@#@&iIn/2G	/nRq.kD+~E@!YN~C^kLx{v1+UD+MB@*@!4@*jYmDd@!JY[@*@!YN,CVbox{v^+	YDv@*@!8@*nCXsnxDP\G9+@!&O9@*@!Y9@*Lx8kwp@!zDN@*@!z(@*@!zDD@*E,[P;uIvF&*~'P;C"`q!b@#@&dAtbs+,xGO,D/ 3}s~@#@&7iInkwKx/Rq.kD+~J@!Y.@*@!YN,CVbox{v.kTtDB@*[U8kwI[	8/ai'U(/wIE,[~DkcrsrM:mJ#,[,E)@!zON@*J~',ZC"cF2#PL~/C"`8!b@#@&7iIn/aGxk+ 	MkYn~r@!ON,C^kL	'Em+	Y.B@*@!rxaEO~	l:xB`/+MUC:J,[~Ddcrq91"E#,[~EEPYz2'vYaDB~kYHV+{BSrNDtl,ZB~-mVExBrP[,.d`rjk+.xChJbPL~JE@*@!&DN@*E~LP/C"c8&b,[,ZC"`8T#@#@&7d"+d2Kx/ MkY~E@!DN,lskLU{B^+	O+MB@*@!bxw;O,xC:xEnCk/SWD9J,'PM/cJ&fH]r#PL~JEPYH2n'Ewm/dhG.9B~/DzV'vAbNY4lO!vP7C^En{BrP[,DkcJhld/SW.Or#PL~JE@*@!JO[@*rPLP/C]c8&bPL~Z_IcqZ#@#@&7iIn/aG	/ncMkYPr@!Y9PCVboUxEm+	O+MB@*@!rUw!Y,xC:nxE?OlMdJ,[~.k`J(9gIE#,',Jv,YHw+{BDn6DB~/DXsn{Bhb[Y4)cZv~\mV!+xBE~LP./vE?Dl.dr#P'~rB@*@!JO9@*E,[,ZC"`8f#,[~Z_IcqZ#@#@&7d"+/aGU/RqDrYn~r@!ON,CVboUx1+xOnM@*@!/smO,xm:+{BhCXs+UYtW[nrP[,./vJqGH]J*PLPEB~dDXs+{vhbNO4=,!v@*@!W2YbG	J@#@&dik0,DkcJhlz:xO\KN+rbP{PJ(Cd+rPDtnx~@#@&d7d"n/aWUdR.rD+~J,jAS3;KAfJ@#@&i7+	N~k6@#@&7iI+k2W	/+c	.kD+,J@*4Cd@!&WaOkKx@*@!KwYrG	J~[,/_Ic8&*P[,Z_]`8!b@#@&d7r6PDkcJhlXsnUYtW9+E#~x,Jhk9[VJ~O4+x~@#@&d7d"nkwG	/RMkDnPrPj2d2/PAfJ@#@&di+x9~r0@#@&id]+d2Kxd+c	DbYn~r@*:r[9Vn@!JGaYrKx@*@!WaYbGxrP'P;C]c8&#,'P;CIvqT#@#@&idr0~.k`Enmz:xO\KN+Eb,'~JDGaJ~DtxP@#@&i7d"+dwKxdncDbO+,JPU3J2;KAfE@#@&7i+UN,r0@#@&77"+/2G	/nRq.bYn,J@*YWa@!JGwDkGx@*@!&O9@*J,'P;CIvqf#,[,ZuIcqZ#@#@&i7I/2G	/+ 	MkO+,E@!Y[,l^ko	'Es+6Yv@*Lx8dai@!bUw!YPDz2+{BkE8:rOEP-l^;+{Bi29lYnv,xC:xEj29lD+A!YDGxEPGx1Vr^0'Jr.+DED	~[WUE(:rYcE,[~DkcJ&fH]r#P'~r#EJ@*@!JY[@*@!JYD@*J,'P;C]`8&b~LPZ_]`8!#@#@&7dM/cHG\nH6O@#@&7hx[@#@&dIndaWU/ qDrD+,J@!DD@*@!Y9P^W^/2C	'B+vPmVkTUxB1+	YnDv@*Lx8/aI@!JY[@*@!zY.@*rP'P;u"`q2#,[P;C"cFZ#@#@&iIndaWxknRqDkDn~J@!YM@*@!Y[~1Ws/aCx{Bv,lVrL	'vmUD+.E@*rP[,Z_]`8&bPLP/u"`FZb@#@&dId2W	/R	DrOPE@!bUw!Y~OHw+xvkE8:bOEP-mV!+'Eja[lD+~b^Vv~	l:xB`wNmOnb^V~EOYGUEPGx1sk13xErD+O;Mx~NKj!4hbYvBl^VEbJr@*@!zDN@*@!JYD@*EP,[P;u]`8&*P'P/u"`q!*@#@&x[~b0@#@&]/2W	dR	MkD+J@!zDC4^+@*J,[~/_I`8f#,[P;u]`8!*@#@&Dd 1VG/@#@&k+O~M/Px~	WOtbUT@#@&1l^VP9DmAbx[WSnC.D `r)Nskx,\nD1tmxO/~jDl./rSJr~EdDlYnEB4;Yz.M#~Ql4FAA==^#~@%>
