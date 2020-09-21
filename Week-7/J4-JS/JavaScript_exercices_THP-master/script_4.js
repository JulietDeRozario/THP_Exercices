const entrepreneurs = [
    { first: 'Steve', last: 'Jobs', year: 1955 },
    { first: 'Oprah', last: 'Winfrey', year: 1954 },
    { first: 'Bill', last: 'Gates', year: 1955 },
    { first: 'Sheryl', last: 'Sandberg', year: 1969 },
    { first: 'Mark', last: 'Zuckerberg', year: 1984 },
    { first: 'Beyonce', last: 'Knowles', year: 1981 },
    { first: 'Jeff', last: 'Bezos', year: 1964 },
    { first: 'Diane', last: 'Hendricks', year: 1947 },
    { first: 'Elon', last: 'Musk', year: 1971 },
    { first: 'Marissa', last: 'Mayer', year: 1975 },
    { first: 'Walt', last: 'Disney', year: 1901 },
    { first: 'Larry', last: 'Page', year: 1973 },
    { first: 'Jack', last: 'Dorsey', year: 1976 },
    { first: 'Evan', last: 'Spiegel', year: 1990 },
    { first: 'Brian', last: 'Chesky', year: 1981 },
    { first: 'Travis', last: 'Kalanick', year: 1976 },
    { first: 'Marc', last: 'Andreessen', year: 1971 },
    { first: 'Peter', last: 'Thiel', year: 1967 }
  ];

console.log("Filtre dans cette liste les entrepreneurs qui sont nés dans les années 70 :");
entrepreneurs.forEach(content => {
    if (content.year >= 1970 && content.year < 1980) {
        console.log(content.first + " " + content.last + " (" + content.year + ")");
    }
});
console.log("___________________________________________________________________");
console.log("Sors une array qui contient le prénom et le nom des entrepreneurs :");
let arrayNames = new Array;
entrepreneurs.forEach(content => {
  arrayNames.push(content.first +" "+ content.last);
});
console.log(arrayNames);

console.log("________________________________________________________________");
console.log("Quel âge aurait chaque inventeur aujourd'hui ?");
entrepreneurs.forEach(content => {
    console.log(content.first + " " + content.last + ` a aujourd'hui ${2020 - content.year} ans.`)
});

console.log("________________________________________________________________");
console.log("Trie les entrepreneurs par ordre alphabétique du nom de famille:");
let sortArray = new Array;
entrepreneurs.forEach(content => {
    sortArray.push(content.last + " " + content.first)
});
sortArray.sort() 
console.log(sortArray);