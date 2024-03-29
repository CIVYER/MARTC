<?php
    header("Access-Control-Allow-Origin: *");  // Allow cross-origin requests
    $host = "localhost";  // Database host
    $dbname = "supermarket_3h";      // Database name
    $username = "it3h"; // Database username
    $password = "it3h";  // Database password

    try {
        // Create a PDO (PHP Data Objects) connection to the database
        $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);  // Set error handling mode

    } catch (PDOException $error) {
        // Handle any errors or exceptions (You may want to log the error details)
        echo $error->getMessage();
    }

?>
