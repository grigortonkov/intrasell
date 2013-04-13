<!--#include file="../client/intrasoft/menu.asp"-->
<SCRIPT LANGUAGE="JavaScript">
function CheckForEmptyField( field1, field2 ) {
	var myform = document.forms("FTPform");
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
	var myform = document.forms("FTPform")
	myform.item("merch").value = m  ;
	if ( m == 'all' ) {
		for ( i = 0 ; i < myform.elements.length; i++ ) {
			elem = myform.elements[i] ;
			switch ( elem.name.substring(0,7) ) {
				case "ftpserv" :
					if ( CheckForEmptyField ( elem.name , 'FTP Server')) return false ;
					break ;
				case "ftpuser" :
					if ( CheckForEmptyField ( elem.name , 'FTP Username')) return false ;
					break ;
				case "ftppass" :
					if ( CheckForEmptyField ( elem.name , 'FTP Password')) return false ;
					break ;
				case "filenam" :
					if ( CheckForEmptyField ( elem.name , 'Filename')) return false ;
					break ;
					/*
					if ( CheckForEmptyField ( elem.name , 'stars')) return false ;
					if ( isNaN( elem.value ) || ( elem.value > 5 ) ) {
						alert('The Value in field \"Stars\" must be numeric and less than 5 !');
						elem.focus();
						return false ;
					}	
					break ;*/
			};		
		};	
		return true ;
	}
	else {
		if ( CheckForEmptyField ( 'ftpserver' + m , 'FTP Server')) return false ;
		if ( CheckForEmptyField ( 'ftpusername' + m , 'FTP Username')) return false ;
		if ( CheckForEmptyField ( 'ftppassword' + m , 'FTP Password')) return false ;
		if ( CheckForEmptyField ( 'filename' + m , 'Filename')) return false ;
	}	
	return true ;
}
</SCRIPT>


</SCRIPT>

<%#@~^dRUAAA==9b:~(EDbDM`WS *@#@&fb:~d$V@#@&9ksPDk@#@&fb:,:nD^4	lh+@#@&fb:~O:w@#@&GkhPsnMm4@#@&Gk:,/$s?DDrxT@#@&hDm4~',D+$;n/D`r:nD^4r#@#@&@#@&4!Y).M`FSq*PxPrKMWWbVJ@#@&4!ObMDcFB b~{PJm[:bxH.^tmxD/KDGWbVnRmdwQ:n.1t'E~LPh+M^4@#@&(EDbDM`ySF*PxPr2rUkY+^sE	o+	E@#@&(EDb.Dc+B bP{~JmNhr	H+.^4lUYkKmXhxDRlkwQh+Mm4'rP'~s+D14@#@&4ED).Dv&BFbPx~r?OlMdJ@#@&8;DbD.c2~+#,x,JC9:bxHD14l	Yd?Dl.dcl/aE@#@&4ED).DvcBFbPx~rMnY,KDbmndr@#@&8;Db.Dv*B b,',Jl9:bUMYKDbmndcl/aE@#@&ml^s~NMlSrx[GSnCDDq`rb[hbxP\nMm4l	OkPo:n,?+DYbUor~EJBJdOmY+rS4!YbM.bd@#@&id@#@&@#@&b0~D5E/OcrM+OKMk^+k$!YOKxr#P@!@*,EJ,Y4+	P@#@&iI+k2W	/+c]nNbDmOPc~rl[:bUMYK.bm+d m/2gsnMm4{J,[Ps+M^t,#@#@&x[~b0d@#@&di@#@&i@#@&k6PM+5EndD`Eja[lD+$;DYWUE*P@!@*,ErPO4+	P@#@&dbWPs+.m4Px~rlV^EPDt+	@#@&di/$V~'~E,?3SA/K,Psr0+.C	Ynxz[M+dk+	RqG1"SP^kn0DCUD+xz[D//U sbDsl~s]6tPskW+MlUOxb[./d+	~rP',{@#@&did,~J,qH1AI~B}q1,2Dbm+;GhwmDCC+U[^+.P}HP,Vrn6+DCUD+Ub9./dxcqfgI,xwMk^+;Wh2mD+_C+	NV. Vb+6+.lUOgD~J@#@&di/nO,D/~x,W8L;G	xn1YbWxc2Xnm!Yn`k;sb@#@&diAtbV+,UGY,DkR3ro@#@&d7dsnD1t~x,D/cE&fHIrb@#@&7idk;V,',EP`n9b:2~,aDk1nZK:wm.nCm+	Ns+.D,/nY,WYa/n.7+DxvrP'PMn$EnkYvJ0DwknD7+.JL:n.1t#,'P|@#@&i77d,PrBSPWOaEd+MUls+xvrP[~.;;+kOvJWDw!/+Mxmh+r[h+Mm4b,[Prv~,0Ya2C/khKD['vELP.+$;+kYcE6Yw2Ck/AWM[r[hD1t#,[,m@#@&d7diP~EE~P6rVxlsnxBrPLP.+5;/O`rWk^+UCs+J'hD^t*~LPEEPqC2"2,Jk0nDmxOHMP',EPLP:.^t@#@&id7dv]/2W	d+c.rD+PEj5S~),E,[~UpdP[,J@!$I@*J@#@&id7G(LZKUxmYbGURA6m;Ynck;s#@#@&did.dcHW-ng+aY@#@&idAx9@#@&idsnD1t~',JCs^Jd@#@&dV/@#@&di/$V~'~E,?3SA/K,PorM:l~o"r\P^r0nMl	Y+	b9.+k/nx,u3"2P&91"P',E~[,:D^t~@#@&d7/OPM/~x,W4%/KxU+1ObWUc2X+m!Yc/$Vb@#@&d7d$VP{~J,jnG)P2,$aDrmn/K:2lMnCm+U[^+DD~k+OP6Oa/nM\D'EJ,'PM+5E/Ocr0Yad+M\+ME':D1tbP'~|@#@&di7P,JvS,0Y2;k+.xmh'vrPLPD;!n/D`E0Dw;dDxmh+r[:.^t*PLPEBS~6Y2wmd/SW.[{BJ'~M+5EdD`E6Yawlk/SGD9J':D^4*P[,m@#@&ddi~~JE~,0rVnUm:n'EEPLP.n$E+dOvJWk^n	lhJL:+Mm4bPLPEB,u3"2Pdr+6+DmUO1MP{PEP'~s+.m4@#@&idv]/wGUk+ MrD+~r?5SP=Pr~[,?}S,[~E@!AI@*E@#@&ddK8%ZKx	+^YrG	R36^ED+cd$V#@#@&i+UN,r6d@#@&+	NPb0i@#@&k;sP{PE~U2SA/K,PVbnW+Ml	Ynx)[M+d/URC~~2Mkmn/K:2lMn_ln	N^+Dce,oI}H~Vb+WnMlxDnxzNDdd+	PrP'Pm@#@&d~Pr~qg13],9r(H,w.k1n;WhalM+Cm+	[VD~rgP~sb+0.l	Y+	)[D/k+UR(9gI~'a.k1+/Gswl.n_lnx9sD ^k0+Ml	O1MPE@#@&/nO,D/,xPK4L;GUxmDkGx 3X+^EDn`k;sb@#@&IndaWU/ qDrD+,J@!6WMhPmmOkKxxErlNsrxt+D14CxD/wY2RCdaJEPsnY4W[xrJn6j:JEPb[{Bo:n6WDsB,Uls+xBwKKWKD:E@*J,[P;u]`8&*P'P/u"`q!*@#@&"+d2Kx/n qDrY~r@!r	w!YPDXan'EtrN9+Uv,xlsn'E:+M^4B,\mV;+xvrP'PsnD1t~',JB@*E,[~Z_]vFf*PLPZ_Ivq!*@#@&I/2G	/+c	DbY+,E@!Ym4^+~4G.9+.'ETB,hr[Dt'vqZ!YB,^Vskwmmk	o{v!EP^+^V2C9Nk	L'E!B@*E~[,Z_IcFfb,[~Z_]`8!b@#@&I+d2Kxd+c	MkOPr@!YM@*@!ON,mGVkwCU{B%E~l^ko	xvmxD+.B@*@!(@*@!t2@*29kO~s+D^4mxOBk~`wsKl9P/YDrxT/@!z4&@*@!J4@*@!&Y9@*@!JO.@*rPLP/C]c8&bPL~Z_IcqZ#@#@&r6PUWD~M/ ~rwPl	N,UWDP./c26o,YtUP@#@&d"ndwKxk+ .rD+~J@!OD@*@!O[,mWsdalU'E0EPC^kTx'EmUYDv@*r@#@&7"+/aGxk+Rq.rYPr@!rx2;DPOXan'E/;8skYv~7lsExEj29lD+PzV^vP	lh+{Bi29lY$EDYW	v~W	m^k^3xErDnY!.x,NGj!4:rOvBCV^v*JE@*@!JYN@*@!JOD@*J~PLP/u"`F2bPLPZ_]cFZ#@#@&7IndaWU/ MkOn,J@!O.@*@!ON,^KVdal	'BRB,CVboU'EmnUD+DE@*[	4/aI@!zDN@*@!&Y.@*rP'P;uIvFfb,[P/u"`q!*@#@&d]/aWxk+c	DbYnPr@!O.@*@!Y9~l^ko	xvmxD+.B~AbNOt{vFR]v@*@!4@*Jr0nDmUD@!&DN@*@!Y9PmskTxxB1+UODB@*@!4@*sKh~j+M\D@!zO[@*@!ON,CVboUxEm+UODv@*@!8@*sPhP`/+MPgC:@!&Y9@*E~LPZ_]`8&#,'~Z_IvFT#@#@&iIn/aGxk+ 	MkYn~r@!ON,C^kL	'Em+	Y.B@*@!8@*wKK~hl/kAWMN@!JO[@*@!Y9PCVrL	'vmUYDv@*@!4@*or^+Ulsn@!zO9@*@!YN@*}rY&xO+M\Cs@!zY9@*@!J4@*@!O[@*@!zDN@*@!O[@*@!&Y9@*@!JY.@*rPP'~;C]`8f*P',Z_I`8!*@#@&ih4k^+~UKYPMdRArs,@#@&diI/2WUdR	DbO+,J@!OM@*@!O[,lskTU{B.bo4YB@*[	8/ai'x(/2ILx4k2irP[,.d`rsbDhlEb,[~J=@!zDN@*E,P[~/_IcF2b,[~;C"`FZ#@#@&diIn/aWUdRMrYPJ@!O[PmVboU'v^xO+Mv@*@!kU2!YPUCs+xB6Oa/nM\DJ,[,./vJ(fgIEb,[PrvPDXwxvY6DB~/Oz^+xBSrNDtlqZ!B~-mV;+{vrP',Dk`J6Yad+M\nDr#~',JB@*@!zDN@*r~~[,Z_IcFfb,[~Z_]`8!b@#@&dd]nkwGxknc.bYPJ@!Y9~l^kLx{B^n	Y+Mv@*@!kxa;OP	ls+xBWOaEd+MUls+E~LPDdcrq91"E*P',JEPYHwxBD+aYEPdOHV+{vhbNY4l!EP7lsEnxEJ~[,./vJWOaE/n.	lh+rb,[~rB@*@!zDN@*EPLP/C"`qf*P[,/C"`FZb@#@&id"+dwGUk+ MrYPE@!DNPCsboU'E^xODE@*@!bxa;Y,xC:'vWDwwmd/SWD9E~[,Dk`Eq9H"JbPL~JEPOza+'v2m/dhK.9B~kYHV+{BSrNDtlvZB~-mVExBrP[,.d`r0Dw2lddSW.NrbPLPEv@*@!zO[@*J~[,/_Ic8&*P[,Z_]`8!b@#@&d7]/wKU/RMrO+,J@!Y[PCsboU'E^+	Yn.E@*@!rUaEOP	Cs+xE0bV+	lsnJ,[~Dk`E(G1IrbPLPJE~OXa+{BO+aOEPdYHs+{BAr9YtlqR!vP7C^En{BrP[,DkcJ6ks+	lhnr#PL~JE@*@!JO[@*rPLP/C]c8&bPL~Z_IcqZ#@#@&7iIn/aG	/ncMkYPr@!Y9PCVboUx1+xDnD@*@!/snmDP	lh+xv\+rY&UYD-C^JP'~M/cJ&9gIE*PLPJEPkOX^+xBSk[O4)vZv@*rP[,/uIvF2#~[~/_IcFZb@#@&d7]/wGUk+ MrD+~r@!KwYbW	@**,Hrx@!zG2DkW	@*@!KwYbGU@*2!,Hrx@!&KwOkKU@*@!W2ObWx@*q,?ON@!&KwObW	@*@!KwDrW	@*+c,?O[@!zWaOkKx@*@!G2YbW	@*qPAG1tn@!JGwDkGU@*@!zdn^+^Y@*@!JY[@*J,P[,Z_]`8&bPLP/u"`FZb@#@&dd"ndwKxk+ .rD+~J@!ON,lsrTx'vs0OB@*'	4dai@!kxaED~YHwn'E/;8skYE~\mVExvjaNmYnB~Um:n'Eiw9lOn~EYOG	B~W	^^k^0'rJNK?!8:bYcJ,[~.k`J&91"J#,'~J*Jr@*@!zO[@*J~[,/C"`qf*P[~/_IcFZb@#@&7iI/wKxknRqDrYPE@!DNPmskTx'Esn0DB@*@!rx2;DPOXan'E/;8skYv~7lsExEMnDPhDk1+kvP	lh+{B!nDnDb^+kAEDOGxEPKx^Vr^0'EJMnY!DU~9W?;8skO`r~LP.k`rqfgIrbPLPE#rJ@*@!JYN@*EPLPZ_]cF2#,[~Zu]vFT#@#@&diDd tW\nH6O@#@&7S+U9@#@&dI/aGxk+ MkOn,J@!D.@*@!YN,^GVkwmxxB0v,lskTU'EmnUD+Dv@*Lx8/aI@!zO9@*@!zYM@*r~[,ZuIvFfb,[P;uIvF!*@#@&d"+kwGxdnc.kDnPr@!O.@*@!Y[~1Ws/aC	'vRB,lVbo	xB1+UYDv@*rP[,/C"`F2b~[,Z_IcFTb@#@&7IdwKxdncDrOPE@!bUaEO,YHw+{Bk;4skOB,\Cs!+'Eiw9lY~)V^B,xC:nxEj2NmO+~EOOKxB~G	msk1V{JEM+DED	P9G?!4hkD`vC^VB*EJ@*@!zD[@*@!JYM@*EP~',ZuIvq&*P'~;CIcqZ#@#@&U9Pr6@#@&I+kwKU/R	DbYnE@!zYm8V@*J,'~Z_IvFf#~',ZuIvq!*@#@&.kRmsGk+@#@&knDP.kP{PxKY4rxT@#@&mmVs~9DlS	k	NWSKCDD vJ)Nhr	P\+M^tmxOd,sKK~U+OYbUTJSrJBJ/DlDnJB4;YzD.b,VCQGAA==^#~@%>
