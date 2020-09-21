const books = [
    { title: 'Gatsby le magnifique', id: 133712, rented: 39 },
    { title: 'A la recherche du temps,perdu', id: 237634, rented: 28 },
    { title: 'Orgueil & Préjugés', id: 873495, rented: 67 },
    { title: 'Les frères Karamazov', id: 450911, rented: 55 },
    { title: 'Dans les forêts de Sibérie', id: 8376365, rented: 15 },
    { title: 'Pourquoi j\'ai mangé mon père', id: 450911, rented: 45 },
    { title: 'Et on tuera tous les affreux', id: 67565, rented: 36 },
    { title: 'Le meilleur des mondes', id: 88847, rented: 58 },
    { title: 'La disparition', id: 364445, rented: 33 },
    { title: 'La lune seule le sait', id: 63541, rented: 43 },
    { title: 'Voyage au centre de la Terre', id: 4656388, rented: 38 },
    { title: 'Guerre et Paix', id: 748147, rented: 19 }
  ];

console.log("Est-ce que tous les livres ont été au moins empruntés une fois ?")
let hasBeenRented;
books.forEach(content => {
    if (content.rented < 1){
        hasBeenRented = false;
    }
});
if(hasBeenRented !== false) {
    console.log("oui");
} else {
    console.log("non");
}

console.log("_________________________________________________________________")
console.log("Quel est le livre qui a été le plus empreinté ?")
let rents = new Array;
books.forEach(content => {
    rents.push(content.rented);
});
let max = Math.max(...rents);
console.log(books.find(obj => obj.rented == max).title);

console.log("_______________________________________________________________")
console.log("Quel est le livre le moins emprunté ?")
let min = Math.min.apply(null, rents);
console.log(books.find(obj => obj.rented == min).title);

console.log("_______________________________________________________________")
console.log("Trouve le livre avec l'ID: 873495:");
console.log(books.find(obj => obj.id == 873495).title);

console.log("______________________________________________________________")
console.log("Supprime le livre avec l'ID: 133712");
console.log(books.find(obj => obj.id == 133712).title + " va être supprimé !");
delete books[books.findIndex(obj => obj.id == 133712)];
console.log("Suppression effectuée avec succès:");
console.log(books);

console.log("____________________________________________________________")
console.log("Trie les livres par ordre alphabétique: ")
let booksSort = new Array;
books.forEach(content => {
  booksSort.push(content.title);  
})
booksSort = booksSort.sort()
console.log(booksSort);


