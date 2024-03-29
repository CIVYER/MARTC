let scannedObjects = new EventSource("./scanned.php");
const scannedList = document.querySelector(".scannedList");
const clear = document.getElementById("clear");
// logs whenever an sse event is opened
scannedObjects.onopen = e => {
    console.log('open', e)
    scannedList.innerHTML = '';
};

let scanned = [];
let amount = [];

// logs whenever an sse event is received
scannedObjects.onmessage = function(event) {
    scanned = [];
    amount = [];
    let list = String(event.data).split("/////");
        
    list.pop();
    // list.sort();
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
    scanned = scanned.reverse();
    amount = amount.reverse();
    for (let i = 0; i < scanned.length; i++) {                
        let p = document.createElement('p');
        let text = document.createTextNode(scanned[i] + " " + amount[i]);
        let btn = document.createElement("button");
        btn.value = scanned[i];
        btn.innerText = "-";
        btn.addEventListener("click", (e)=>{
            list.splice(list.indexOf(e.target.value),1);
            list.push("");
            list = list.join("/////");
            fetch(`./deleteItem.php?array=${list}`,{cache: "no-store"}).then(response => response.text).then((data)=>{});
        })
        p.append(text);
        scannedList.append(p);
        scannedList.append(btn);
    }
}

clear.addEventListener("click", ()=>{
    fetch(`./fromPhone.php?clear=clear`).then(response => response.text).then((data)=>{});
    location.reload();
});

