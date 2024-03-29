// PASSWORD VALIDATION



// OTP VERIFICATION INPUT
const inputs = document.querySelectorAll("input"),
    button = document.querySelector("button");

// iterate over all inputs
inputs.forEach((input, index1) =>{
    input.addEventListener("keyup", (e) =>{
        const currentInput = input,
            nextInput = input.nextElementSibling,
            prevInput = input.previousElementSibling;

        // one number per input only
            if(currentInput.value.length > 1){
                currentInput.value = "";
                return;
            }
        // enabling the next input
        if(nextInput && nextInput.hasAttribute("disabled") && currentInput.value !== ""){
            nextInput.removeAttribute("disabled");
            nextInput.focus();
        }
        // back key function to delete previous input and focus
        if(e.key === "Backspace"){
            inputs.forEach((input, index2) => {
                if(index1 <= index2 && prevInput){
                    input.setAttribute("disabled", true);
                    currentInput.value = "";
                    prevInput.focus();
                }
            });
        }
        if(!inputs[5].disabled && inputs[5].value !== ""){
            button.classList.add("active");
            return;
        }
        button.classList.remove("active");
    });
});

// focuses the first input
window.addEventListener("load", () => inputs[0].focus());