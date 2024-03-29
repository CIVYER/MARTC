<?php
    // connects to database
    include_once("../../DBconnect/dbconnect.php");

    // if login is clicked
    if(isset($_POST["login"])){

        // username, password is set to input from user 
        $username = $_POST["username"];
        $password = $_POST["password"];

        // initiallize variable password_db
        $password_db = false;
        $verify = false;

        // if email is entered for login instead of username
        if(str_contains($username, "@")){
            // gets the customer id of the existing email
            $stmt = $pdo->prepare('SELECT customer_ID FROM customer WHERE email = ?');
            $stmt->execute([$username]);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            $stmt->closeCursor();
            
            // selected customer id is used to select password connected to the email
            $stmt = $pdo->prepare('SELECT password FROM account WHERE customer_ID = ?');
            $stmt->execute([$result["customer_ID"]]);
            $password_db = $stmt->fetch(PDO::FETCH_ASSOC);
            $stmt->closeCursor();
        }
        // if username is used instead of email
        else{
            $stmt = $pdo->prepare('SELECT password FROM account WHERE username = ?');
            $stmt->execute([$username]);
            $password_db = $stmt->fetch(PDO::FETCH_ASSOC);
            $stmt->closeCursor();
        }

        // verify if the password input by user is the same as the one in the database
        if($password_db != false){
            $verify = password_verify($password, $password_db["password"]);
        }
        if($verify){
            // directs the user to homepage
            header("location: ../../BI/index.html");
            echo "insert success login code here";
        }
        else{
            echo "insert failed login code here";
        }
        
    }
    else{
        echo "naniii!!!";
    }
