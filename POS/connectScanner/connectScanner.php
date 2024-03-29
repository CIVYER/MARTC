<?php
    include_once("../../DBconnect/dbconnect.php");
    require_once("./phpqrcode/qrlib.php");
        $ip = explode("IPv4 Address. . . . . . . . . . . : ",system('ipconfig | findstr /i "ipv4"'))[1];
        $savePath = "./";
        $qrCode = $savePath."ipAddress.png";
    
        QRcode::png($ip, $qrCode, 'H', 10, 3);
?>