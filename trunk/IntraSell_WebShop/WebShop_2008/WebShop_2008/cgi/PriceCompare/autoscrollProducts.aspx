<!--#include file="includeall.inc"-->
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN//3.2">
<html>
<head>
    <title>autoscroll page script</title>

    <script language="JavaScript">
          <!--
        var isStopped = false;
        var timer = 0;
        var height = 450;
        function transport(h) {
            window.scroll(0, h)
            setTimeout("polling()", 50)
        }
        function polling() {
            if (!isStopped) {
                if (timer > height) {
                    timer = 0
                }
                h = (timer * 1)
                timer++
                transport(h);
            }
        }
        setTimeout("polling()", 1000)
              
              //-->
    </script>

</head>
<body onload="polling()" onmouseover="isStopped=true;//alert('what!');">
    <%#@~^1QAAAA==@#@&frsPk;VBPMd@#@&?nY,Dd~{PW(%ZKxx^OkKxc+a+^;D+cJknVmO~zDYH.,0.Ws~TD)MYb3+^J*@#@&StrVPUGDPDk +K0P@#@&./c:K\nxnaDP@#@&,~I/2G    /+     MkO+,hm3nhDKNE1YhCo?hl^Vc.k`Jz.YgDJ*S~J9+6l;VO m/2J,b@#@&hnU9P@#@&.kR^VKdP@#@&r0AAAA==^#~@%>
</body>
</html>
