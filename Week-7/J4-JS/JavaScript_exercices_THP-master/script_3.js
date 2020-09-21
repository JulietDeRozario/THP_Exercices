let number = prompt("Combien d'étages voulez-vous pour votre pyramides ?");
let hashtag = "#";
let space = " ";
let counter = 1;
while (number > 0) {
    console.log(space.repeat(number) + hashtag.repeat(counter));
    counter++;
    number--;
}
