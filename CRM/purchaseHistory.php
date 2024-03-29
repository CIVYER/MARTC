<?php
    include_once("../DBconnect/dbconnect.php");

    $customerID = 2;
    if(isset($_GET["ID"])){
        $customerID = $_GET["ID"];
    }


    $sql = "SELECT * FROM purchase INNER JOIN customer ON purchase.customer_ID = customer.customer_ID AND customer.customer_ID = ?";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$customerID]);
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($result as $row){
        extract($row);

        echo "email: " . $email . "_____";
        echo "total_amount: " . $total_amount . "_____";
        echo "date: " . $date . "_____";

    }


?>