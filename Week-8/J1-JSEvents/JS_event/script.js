//fonctionnalité 1

let foot = document.querySelector("footer");
let count = 0;
console.log(foot);
function footerClick() {
  count ++;
  console.log("clique numéro " + count)
};
foot.addEventListener("click", footerClick);


//fonctionnalité 2
let navBarHeader = document.getElementById("navbarHeader");
let hamburger = document.querySelector(".navbar-toggler")
console.log(navBarHeader);
function editCollapse() {
  navBarHeader.classList.toggle('collapse');
};
hamburger.addEventListener("click", editCollapse);

//fonctionnalité 3
let editBtn = document.querySelector(".btn-outline-secondary");
let editTxt = document.querySelector(".card-text");
function changeColor() {
  editTxt.style.color = "red";
};
editBtn.addEventListener("click", changeColor);


//fonctionnalité 4
let editBtn1 = document.querySelectorAll(".btn-outline-secondary")[1];
let editTxt1 = document.querySelectorAll(".card-text")[1];
function greenText() {
  if (editTxt1.style.color === "") {
    editTxt1.style.color = "green";
  } else {
    editTxt1.style.color = "";
  }
};
editBtn1.addEventListener("click", greenText);

//fonctionnalité 5
let navBar = document.querySelector(".navbar");
let bootstrap = document.querySelector("link");
let isNuke = false;
console.log(navBar);
console.log(bootstrap);
function nuke() {
  if (isNuke === false) {
    bootstrap.removeAttribute('rel');
    isNuke = true;
  } else {
    bootstrap.setAttribute("rel","stylesheet");
    isNuke = false;
  }
};
navBar.addEventListener("dblclick", nuke);

//fonctionnalité 6
let cards = document.querySelectorAll(".card-body");
let viewButtons = document.querySelectorAll(".card-body > .d-flex > .btn-group > .btn-success");

function resizeCards(event){
  let eventButton = event.target;
  cards.forEach(card => {
    if (card.children[0].style.visibility !== "hidden"){
      if(eventButton.parentElement.parentElement.parentElement == card) {
        card.children[0].style.visibility="hidden";
        card.parentElement.children[0].style.width = "20%";
      };
    }else{
      card.children[0].style.visibility = "";
      card.parentElement.children[0].style.width = "";
    };
  });
};

viewButtons.forEach(button => {
  button.addEventListener("mouseover", resizeCards);
});

//fonctionnalité 7
let btnForward = document.querySelector(".jumbotron > div > p > .btn-secondary");
let parentCards = document.querySelector("div.album > div.container > div.row"); // This selector is outside because we use it quite often.
function moveForward(){
  let firstCard = document.querySelector("div.album > div.container > div.row").firstElementChild;
  let lastCard = document.querySelector("div.album > div.container > div.row").lastElementChild;
  // console.log("firstCard = " + firstCard);
  // console.log("lastCard = " + lastCard);
  parentCards.insertBefore(lastCard, firstCard);
};
btnForward.addEventListener("click", moveForward);


//fonctionnalité 8
let btnBackward = document.querySelector(".jumbotron > div > p > .btn-primary");
btnBackward.href = "#";
function moveBackward(){
  let firstCard = document.querySelector("div.album > div.container > div.row").firstElementChild;
  // let lastCard = document.querySelector("div.album > div.container > div.row").lastElementChild;
  // console.log("last card = " + lastCard);
  // console.log("parentCards[5] = " + parentCards[5]);
  parentCards.insertBefore(firstCard, parentCards[5]);
};
btnBackward.addEventListener("click", moveBackward);

//fonctionnalité 9
let btnLogo = document.querySelector(".navbar-brand");
let container = document.querySelector(".album > .container");

function moveCards(){
  btnLogo.addEventListener("keypress", chooseMove);
  function chooseMove(e){
    let allCards = new Array;
    if(e.code == "KeyQ"){
      if(document.querySelectorAll(".col-md-4").length !== 0){
       allCards = document.querySelectorAll(".col-md-4");
      }else{
       allCards = document.querySelectorAll(".col-md-3");
      };
      allCards.forEach(card => {
        card.className = "col-md-3";
        container.className = "container ml-0"
      });
    }else if(e.code == "KeyP"){
      if(document.querySelectorAll(".col-md-4").length !== 0){
       allCards = document.querySelectorAll(".col-md-4");
      }else{
       allCards = document.querySelectorAll(".col-md-3");
      };
      allCards.forEach(card => {
        card.className = "col-md-3";
        container.className = "container mr-0";
      });
    }else if(e.code == "KeyY"){
      if(document.querySelectorAll(".col-md-4").length !== 0){
       allCards = document.querySelectorAll(".col-md-4");
      }else{
       allCards = document.querySelectorAll(".col-md-3");
      };

      allCards.forEach(card => {
        card.className = "col-md-3";
        container.className = "container mx-auto";
      });
    }else if(e.code == "KeyB"){
      if(document.querySelectorAll(".col-md-4").length !== 0){
       allCards = document.querySelectorAll(".col-md-4");
      }else{
       allCards = document.querySelectorAll(".col-md-3");
      };
      allCards.forEach(card => {
      card.className = "container col-md-4";
      container.className = "container";
      });

    };
  };
};


btnLogo.addEventListener("mousedown", moveCards)
