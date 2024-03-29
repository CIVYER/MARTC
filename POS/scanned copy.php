<?php
include_once("../DBconnect/dbconnect.php");


session_start();

header('Content-Type: text/event-stream');
header('Cache-Control: no-cache');


$filename = "somefile.txt";
$fh = fopen($filename, "a+");
while (true) { 
    echo "data: ". fread($fh, filesize($filename)) . "\n\n";
    
    ob_flush();
    flush();
    sleep(1);
    exit();
}
fclose($fh);


if(connection_aborted()) exit();

?>