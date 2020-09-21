console.log("Coder la vie :");
let acidesAmines = 
{
Sérine: ["UCU", "UCC", "UCA", "UCG", "AGU", "AGC"],
Proline: ["CCU", "CCC", "CCA", "CCG"],
Leucine: ["UUA", "UUG"],
Phénylalanine: ["UUU", "UUC"],
Arginine: ["CGU", "CGC", "CGA", "CGG", "AGA", "AGG"],
Tyrosine: ["UAU", "UAC"]
};

function find_life(str)
{
    let codons = new Array;
    let avn = new Array;
    let counter = 0;
    while (counter < str.length) {
        codons.push(str[counter] + str[counter + 1] + str[counter + 2]);
        counter += 3
    }
    codons.forEach(groupOf3Letters => {
        Object.keys(acidesAmines).forEach(key => {
            acidesAmines[key].forEach(value => {
                if(groupOf3Letters == value){
                    avn.push(key);
                }
            })
        })    
    });
    console.log(avn);
};

let str1 = "UUACGCAGUAGA";
let str2 ="CCGUCGUUGCGCUACAGC";
let str3 = "CCUCGCCGGUACUUCUCG";

console.log("La suite d'acides aminés de la chaîne " + str1 + " est:");
find_life(str1);
console.log("La suite d'acides aminés de la chaîne " + str2 + " est :");
find_life(str2);
console.log("La suite d'acides aminés de la chaîne " + str3 + " est :");
find_life(str3);




