// PASSWORD DOES NOT MATCH VALIDATION
function check() {
    var input = document.getElementById('password1');
    if(input.value != document.getElementById('password').value){
        input.setCustomValidity("Password doesn't match");
    } else{
        input.setCustomValidity('');
    }
}

//PASSWORD TOGGLE VISIBILITY
let visibilityOFF = document.getElementById("visibilityOFF");
let password = document.getElementById("password");
let visibilityOFF1 = document.getElementById("visibilityOFF1");
let password1 = document.getElementById("password1");

visibilityOFF.onclick = function(){
    if(password.type == "password"){
        password.type = "text";
        visibilityOFF.setAttribute("data-feather", "eye-off");
    }else{
        password.type="password";
        visibilityOFF.setAttribute("data-feather", "eye");
    }
}
visibilityOFF1.onclick = function(){
    if(password1.type == "password"){
        password1.type = "text";
        visibilityOFF1.setAttribute("data-feather", "eye-off");
    }else{
        password1.type="password";
        visibilityOFF1.setAttribute("data-feather", "eye");
    }
}




