const scannedList = document.querySelector(".scannedList");
// logs whenever an sse event is opened
let scanned = [];
let amount = [];
// logs whenever an sse event is received
setInterval(() => {
    fetch(`./scanned.php`)
    .then(response => response.text())
    .then((data)=>{
        console.log(data);
        // logs whenever an sse event is received
        scanned = [];
        amount = [];
        let list = String(data).split("/////");
            
        list.pop();
        list.sort();
        for (let i = 0; i < list.length; i++) {
            if(!(scanned.includes(list[i]))){
                scanned.push(list[i]);
            }
        }
        for (let i = 0; i < scanned.length; i++) {
            amount[i] = 0;
            for (let j = 0; j < list.length; j++) {
                if(String(scanned[i]) == String(list[j])){
                    amount[i] = amount[i] + 1;
                }                    
            }                
        }
        scannedList.innerHTML = '';
        for (let i = 0; i < scanned.length; i++) {                
            let p = document.createElement('p');
            let text = document.createTextNode("Product: "+scanned[i] + " Amount = " + amount[i]);
            p.append(text);
            scannedList.append(p);
        }
    });
}, 500);
