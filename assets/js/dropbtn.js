function myFunction(element) {
    if(menuOpen){
        var dropdownContent = document.getElementById(String(element.id) + "-Dropdown");
        dropdownContent.style.display = "block";
    }
}
function myFunctionoutMain(element) {
    var dropdownContent = document.getElementById(String(element.id) + "-Dropdown");
    if (menuOpen && dropdownContent.style.display === "block") {
        dropdownContent.style.display = "none";
    }
}
function myFunctionout(element) {
    var dropdownContent = document.getElementById(element.id);
    if (menuOpen && dropdownContent.style.display === "block") {
        dropdownContent.style.display = "none";
    }
}