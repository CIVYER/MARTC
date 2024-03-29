<?php
    include_once("../DBconnect/dbconnect.php");
    
    // when customer clicked submit button on customer support page
    
    if(isset($_POST['submit'])){
        $customer_ID = $_POST['customerID'];
        $title = $_POST['title'];
        $description = $_POST['description'];
    
        $stmt = $pdo->prepare("INSERT INTO customer_support(customer_ID, title, description) VALUES(?, ?, ?)");
        $stmt->execute([$customer_ID, $title, $description]);
    }

?>