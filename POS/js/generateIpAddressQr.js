// can add button to generate connect scanner with qr
const ipAddress = document.getElementById("ipAddress");
fetch(`./connectScanner/connectScanner.php`)
.then(response => response.text())
.then((data)=>{
    console.log(data.split("IPv4 Address. . . . . . . . . . . : ")[1]);
    setInterval(() => {
        ipAddress.src = "./connectScanner/ipAddress.png";
    }, 0);
});
