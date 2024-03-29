<?php 


    if(isset($_GET['try'])){
        $filename = "somefile.txt";
        $fh = fopen($filename, "a+");
        fwrite($fh, $_GET['try'] . "/////");
    }
    if(isset($_GET['clear'])){
        $filename = "somefile.txt";
        $fh = fopen($filename, "w");
        fwrite($fh,"");
    }


?>