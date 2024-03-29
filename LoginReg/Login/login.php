<?php
    // connects to database
    include_once("../../DBconnect/dbconnect.php");

    $error = "";

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
            $error="Credentials are wrong or does not exist!";
        }
        
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mart</title>
    <link rel="stylesheet" href="style.css">
    
</head>
<body>
    <div class="container">
        <div class="login-container">

            <div class="login-deco-container">
                <div class="login-deco">
                    <i class="fa-solid fa-cloud small-cloud-icon"></i>
                    <i class="fa-solid fa-cloud big-cloud-icon"></i>
                    <div class="lock">
                        <i class="fa-solid fa-lock lock-icon"></i>
                        <i class="fa-solid fa-circle-check check-icon"></i>
                    </div>
                </div>
                <span class="footer">MART-O</span>
            </div>
            <form class="login-form" action="" method="post">
                <div class="login-form-items">
                    <span class="login-label">LOG IN</span>
                    <p id="error">
                        <?php echo $error ?>
                    </p>
                    <div class="text-input-container">
                        <label class="form-label">USERNAME</label>
                        <input type="text" name="username" id="username" class="text-style" required>
                    </div>
                    <div class="text-input-container">
                        <label class="form-label">PASSWORD</label>
                        <input type="password" name="password" id="password" class="text-style" required>
                    </div>
                    <input class="login-btn" type="submit" name="login" value="SIGN IN">
                    <span onclick="location.href = '../ForgotPass/forgot-password_recovery.html'" class="form-label">Forgot your password?</span>
                </div>
            </form>
        </div>
    </div>
</body>
<script>
    const error = document.getElementById("error");
    setTimeout(() => {
        error.innerHTML = "";
    }, 1000);
</script>
</html>