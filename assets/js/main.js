let menuOpen = true;

// add hovered class to selected list item
let list = document.querySelectorAll(".navigation li");
let currPage = document.querySelector(".currPage");

function activeLink() {
  list.forEach((item) => {
    item.classList.remove("hovered");
  });
  this.classList.add("hovered");
}

function removeHover(){
  this.classList.remove("hovered")
  currPage.classList.add("hovered")
}

list.forEach((item) => item.addEventListener("mouseover", activeLink));
list.forEach((item) => item.addEventListener("mouseout", removeHover));

// Menu Toggle
let toggle = document.querySelector(".toggle");
let navigation = document.querySelector(".navigation");
let main = document.querySelector(".main");

toggle.onclick = function () {
  if(menuOpen){
    menuOpen=false;
  }
  else{
    menuOpen=true;
  }
  navigation.classList.toggle("active");
  main.classList.toggle("active");
};

navigation.addEventListener("mouseover",()=>{
  if(!menuOpen){
    menuOpen=true;
    navigation.classList.toggle("active");
    main.classList.toggle("active");
  }
})

const signOut = document.getElementById("Sign");

signOut.addEventListener("click", ()=>{
  location.href = "../LandingPage/landingpage.html";
})