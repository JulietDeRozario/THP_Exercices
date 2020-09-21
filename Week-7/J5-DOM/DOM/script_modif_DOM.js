let imagesArray = ["https://img.icons8.com/color/480/000000/html-5.png", "https://img.icons8.com/color/480/000000/css3.png", "https://img.icons8.com/color/480/000000/javascript.png", "https://img.icons8.com/color/480/000000/ruby-programming-language.png", "https://img.icons8.com/color/480/000000/bootstrap.png", "https://img.icons8.com/color/480/000000/github.png", "http://jeudisdulibre.be/wp-content/uploads/2014/02/Ruby_on_Rails-logo.png", "https://avatars2.githubusercontent.com/u/25484553?s=200&v=4", "https://img.icons8.com/color/480/000000/heroku.png"];

function changeTitles(){
  console.log(document.querySelector("h1").innerHTML = "Ce que j'ai appris à THP");
  console.log(document.querySelector("section.jumbotron > div > p.lead").innerHTML = "THP est une formation qui, en 3 mois, à plein temps, vous apportera des connaissances actionnables pour vous permettre de voir plus loin. Chez nous, pas de professeurs, pas de locaux, mais un groupe de travail en présentiel. Après 11 semaines, les principaux langages et outils du web n'auront plus de secret pour vous !");
};

function changeCallToActions(){
  console.log(document.querySelector("section.jumbotron > div").children[2].children[0].innerHTML = "OK je veux tester !");
  console.log(document.querySelector("section.jumbotron > div").children[2].children[0].href = "http://www.thehackingproject.org");
  console.log(document.querySelector("section.jumbotron > div").children[2].children[1].innerHTML = "Non merci");
  console.log(document.querySelector("section.jumbotron > div").children[2].children[1].href = "https://www.pole-emploi.fr/accueil/");
};

function changeLogoName(){
  console.log(document.querySelector("header > div.navbar > div.container > a.navbar-brand > strong").innerText = "The Thp experience");
  console.log(document.querySelector("header > div.navbar > div.container > a.navbar-brand > strong").style.fontSize = "2em");
};

function populateImages(){
  let counter = 0;
  imagesArray.forEach(i => {
    console.log(document.querySelectorAll("main > div.album > div.container > div.row > div.col-md-4 > div.card > img.card-img-top")[counter].src = i);
    counter++;
  });

};

function deleteLastCards(){
  let id = document.querySelectorAll("main > div.album > div.container > div.row > div.col-md-4 > div.card").length - 1;
  let counter = 3;
  while(counter > 0){
    console.log(id)
    console.log(document.querySelectorAll("main > div.album > div.container > div.row > div.col-md-4 > div.card")[id].remove());
    counter--;
    id--;
  };
};

function changeCardsText(){
  let counter = 0;
  let text = ["L’HyperText Markup Language, généralement abrégé HTML, est le langage de balisage conçu pour représenter les pages web","Les feuilles de style en cascade, généralement appelées CSS de l'anglais Cascading Style Sheets, forment un langage informatique qui décrit la présentation des documents HTML et XML", "JavaScript est un langage de programmation de scripts principalement employé dans les pages web interactives mais aussi pour les serveurs. C'est un langage orienté objet à prototype."];
  let cardArray = document.querySelectorAll(".card-text");
  cardArray.forEach(card => {
    if(counter < 2){
      card.innerText = text[counter];
      counter ++;
    };
  });
};

function changeViewButtons(){
  btnGrp = document.getElementsByClassName("btn-group");
  // btnGrp[0].children[0].classList.remove("btn-outline-secondary");
  // btnGrp[0].children[0].classList.add("btn-success");
  // console.log(btnGrp[0].children[0].classList);
  let counter = 0;
  while(counter < 6){
    btnGrp[counter].children[0].classList.remove("btn-outline-secondary");
    btnGrp[counter].children[0].classList.add("btn-success");
    console.log(btnGrp[counter].children[0].classList);
    counter ++;
  };
};

changeTitles();
changeCallToActions();
changeLogoName();
populateImages();
deleteLastCards();
changeCardsText();
changeViewButtons();
