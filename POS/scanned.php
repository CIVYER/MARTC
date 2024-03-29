<?php
include_once("../DBconnect/dbconnect.php");


session_start();

// header('Content-Type: text/event-stream');
header('Cache-Control: no-cache');


$filename = "somefile.txt";
$fh = fopen($filename, "a+");
try {
    $read = fread($fh, filesize($filename));
    echo $read;
    //code...
} catch (\Throwable $th) {
    //throw $th;
}
fclose($fh);

exit();
?>