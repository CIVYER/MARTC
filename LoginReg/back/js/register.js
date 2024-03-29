// elements::

// ::generally used
const regBtn = document.getElementById("regBtn");

// ::password
const password = document.getElementById("password")
const con_password = document.getElementById("con_password")

regBtn.addEventListener("click", (event) =>{
    // validate password
    if(String(password.value).length < 6){
        password.setCustomValidity("Password Must Contain 6 or More Characters");
    }
    else{
        password.setCustomValidity("");
    }

    if(password.value != con_password.value){
        con_password.setCustomValidity("Password Must Match Each Other");
    }
    else{
        con_password.setCustomValidity("");
    }

});

