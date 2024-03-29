<?php
    // connects to the database
    include_once("../DBconnect/dbconnect.php");

    $sql = "SELECT * FROM customer JOIN address on customer.customer_ID = address.customer_ID";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($result as $row) {
        extract($row);

        echo "email: " . $email . "_____";
        echo "fName: " . $fName . "_____";
        echo "lName: " . $lName . "_____";
        echo "mName: " . $mName . "_____";
        echo "phone_no: " . $phone_no . "_____";
        echo "street: " . $street . "_____";
        echo "city: " . $city . "_____";
        echo "state: " . $state . "_____";
        echo "zip_code: " . $zip_code . "_____";
        echo "<br><br>";
    }


?>