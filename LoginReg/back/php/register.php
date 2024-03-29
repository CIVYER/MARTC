<?php
    // connects to the database
    include_once("../../DBconnect/dbconnect.php");

    // if register button is pressed
    if(isset($_POST["register"])){

        // sets variables to user input
        $email = strtolower($_POST["email"]);
        $username = $_POST["username"];
        $password = password_hash($_POST["password"],PASSWORD_DEFAULT);
        $fName = ucfirst($_POST["fName"]);
        $lName = ucfirst($_POST["lName"]);
        $mName = ucfirst($_POST["mName"]);
        $phoneNumber = $_POST["phoneNumber"];
        $street = $_POST["street"];
        $city = $_POST["city"];
        $state = $_POST["state"];
        $zipcode = $_POST["zipcode"];
        
        // check if the email already registered by another user
        $sql = "SELECT email FROM customer WHERE email=?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$email]);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $stmt->closeCursor();
   
        
        try {
            // if email is already registered redirect the user or give an error message
            if(count($result) > 0){
                header("location: ../register.html?emailUsed");
            }
            // if email is not registered info submitted by the user is saved in the database
            else{

                // fname lname mname email and phone no is saved to customer table
                $sql = "INSERT INTO customer(
                    fName, 
                    lName, 
                    mName, 
                    email, 
                    phone_no) 
                    
                    VALUES(?,?,?,?,?)";
        
                $stmt = $pdo->prepare($sql);
                $stmt->execute([
                    $fName,
                    $lName,
                    $mName,
                    $email,
                    $phoneNumber
                ]);
                $stmt->closeCursor();
                
                // customer id is selected to be used below
                $sql = "SELECT customer_ID FROM customer WHERE email=?";
                $stmt = $pdo->prepare($sql);
                $stmt->execute([$email]);
                $result = $stmt->fetch(PDO::FETCH_ASSOC);
    
                $customer_ID = $result['customer_ID'];

                $stmt->closeCursor();
        
                // with customer id insert the username and password to database date of its creation and login status to 0/false
                $sql = "INSERT INTO account(customer_ID, username, password, login_status, date_created) 
                        VALUES(?,?,?,?,CURRENT_DATE)";
        
                $stmt = $pdo->prepare($sql);
                $stmt->execute([
                    $customer_ID,
                    $username,
                    $password,
                    0
                ]);
                $stmt->closeCursor();

                // address submitted by the user is saved in the database
                $sql = "INSERT INTO address(customer_ID, street, city, state, zip_code) 
                        VALUES(?,?,?,?,?)";
        
                $stmt = $pdo->prepare($sql);
                $stmt->execute([
                    $customer_ID,
                    $street,
                    $city,
                    $state,
                    $zipcode
                ]);
                $stmt->closeCursor();

                // initialize the notes table to be edited later
                $sql = "INSERT INTO notes(customer_ID, note_text) 
                        VALUES(?, ?)";
        
                $stmt = $pdo->prepare($sql);
                $stmt->execute([
                    $customer_ID,
                    "No notes yet"
                ]);
                $stmt->closeCursor();
                
                // initialize loyalty card table in case customer wants to create a loyalty card
                $sql = "INSERT INTO loyalty_card(customer_ID) 
                        VALUES(?)";
        
                $stmt = $pdo->prepare($sql);
                $stmt->execute([
                    $customer_ID
                ]);
                $stmt->closeCursor();
                echo "successfully inserted";
                header("location: ../login.php");
            }
    
            
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
        
    }
?>