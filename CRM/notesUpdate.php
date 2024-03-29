<?php
    include_once("../DBconnect/dbconnect.php");

    if(isset($_POST["save"])){

        // remember to change what is inside the post after front end
        $note = $_POST["note"];
        
        // saves the notes to database
        $stmt = $pdo->prepare("UPDATE notes SET note_text=? WHERE customer_ID=?");
        $stmt->execute([$note,$customer_ID]);
    }
    
?>