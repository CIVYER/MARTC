<?php 
// set cache-control header
header('Cache-Control: no-store, no-cache, must-revalidate, max-age=0');
header('Cache-Control: post-check=0, pre-check=0',false);

// set pragma header
header('Pragma: no-cache');

    if(isset($_GET['array'])){
        $filename = "somefile.txt";
        $fh = fopen($filename, "w");
        fwrite($fh, $_GET['array']);
    }
    exit();
?>