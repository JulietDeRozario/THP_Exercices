function factorial(num) 
{ 
  if (num === 0)
 {
    return 1;
 }
  return num * factorial(num-1);        
}
let num = prompt("Choisissez un nombre à factoriser: ");
console.log(`le résultat est ${factorial(num)}.`);
