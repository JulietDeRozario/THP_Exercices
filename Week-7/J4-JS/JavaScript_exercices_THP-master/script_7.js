/* Les règles de conversations du bot sont les suivantes (rangées par priorité - si deux règles sont vraies, seule la plus haute dans la liste s'applique) :

    Si on lui pose une question (= la phrase finie par "?"), le bot répond "Ouais Ouais..." ;
    Si on lui hurle trop dessus (= la phrase est 100% en majuscules), le bot répond "Pwa, calme-toi..." ;
    Si la phrase que tu prononces contient le mot "Fortnite", le bot répond "on s' fait une partie soum-soum ?" ;
    Si on lui envoie un message vide, le bot répond "t'es en PLS ?" ;
    Pour tout autre phrase que tu lui envoies, le bot répond "balek." ; */
 

 function bot_answers_to(sentence) 
 {
    if(sentence === "") {
        return "T'es en PLS ?";
    }else if(is_the_sentence_a_question(sentence)) {
        return "Ouais Ouais...";
    }else if(are_you_yelling(sentence)) {
        return "Pwa, calme-toi...";
    }else if(are_you_talking_about_fortnite(sentence)) {
        return "On s'fait une partie soum-soum ?";
    }else {
        return "balek."
    }
 
 }

 function is_the_sentence_a_question(sentence)
 {
     return sentence[sentence.length - 1] === "?";
 }

 function are_you_yelling(sentence)
 {
    return sentence === sentence.toUpperCase();
 }
 
 function are_you_talking_about_fortnite(sentence)
 {
     return sentence.toLowerCase().search("fortnite") != -1;
 }

 while(true) {
    let sentence = prompt("Adressez-vous à Acné-bot: "); 
    console.log("you: " + sentence)
    console.log("Acne-bot: " + bot_answers_to(sentence));
    let answer;
    while(answer !== "o" && answer !== "n") {
        answer = prompt("Voulez-vous continuer de parler avec le bot ? (O/N)");
    }
    if(answer.toLocaleLowerCase() === "n") {
        alert("Au revoir !");
        break;
    }
 }