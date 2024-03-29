<!-- when a button is clicked it will generate a qr code for a loyalty_card if the customer
is going to be requesting for a loyalty_card -->
<?php
    include_once("../DBconnect/dbconnect.php");
    require_once("./phpqrcode/qrlib.php");

    if(isset($_GET["qrText"])){
        $qrText = $_GET["qrText"];
        $customer_ID = $qrText;
    
        $savePath = "./qrCodes/";
        $qrCode = $savePath."LYT-".$qrText.".png";
    
        QRcode::png("LYT-".$qrText, $qrCode, 'H', 10, 3);

        $stmt = $pdo->prepare('UPDATE loyalty_card SET barcode=? WHERE customer_ID=?');
        $stmt->execute(["LYT-".$qrText, $customer_ID]);
        $stmt->closeCursor();
    }
    
    $stmt = $pdo->prepare('SELECT * FROM customer');
    $stmt->execute();
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();

?>

<!-- example for the qr code button -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php foreach($results as $rows){
        extract($rows);    
    ?>
        <form action="qrGenerator.php" method="get">
            <img src="./qrCodes/LYT-<?php echo $customer_ID?>.png" alt="">
            <p>customer# <?php echo $customer_ID ?></p>
            <input type="button" value="Generate QR" onclick="location.href = 'qrGenerator.php?qrText=<?php echo $customer_ID ?>';">
        </form>
    <?php } ?>
</body>
</html>