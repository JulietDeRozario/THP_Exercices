#Retourne la suite de caractères entre guillemets suivant le "puts"
puts "On va compter le nombre d'heures de travail à THP"
#Retourne suite de caractères "Travail :" + le temps de travail en heures : 10h/j x 5j/sem x 11 semaines de formations
puts "Travail : #{10 * 5 * 11}"
#Retourne suite de caractères "En minutes ça fait :" suivi du temps converti en minutes : 
# 10h/j x 5j/sem x 11 semaines de formations x 60min/h
puts "En minutes ça fait : #{10 * 5 * 11 * 60}"
#Retourne suite de caractères "Et en secondes ?"
puts "Et en secondes ?"
#Retourne la conversion : 10h/j x 5j/sem x 11 semaines de formations x 60min/h x 60sec/min
puts 10 * 5 * 11 * 60 * 60
#Retourne la suite de caractères entre guillemets suivant le "puts"
puts "Est-ce que c'est vrai que 3 + 2 < 5 - 7 ?"
#Booleen qui teste l'infériorité entre 3+2 et 5-7 (false) 
puts 3 + 2 < 5 - 7
#Retourne suite de caractères "ça fait combien 3+2 ?" suivi du résultat du calcul 
puts "Ça fait combien 3 + 2 ? #{3 + 2}"
#Retourne suite de caractères "ça fait combien 5-7  ?" suivi du résultat du calcul
puts "Ça fait combien 5 - 7 ? #{5 - 7}"
#Retourne suite de caractères "Ok, c'est faux alors !"
puts "Ok, c'est faux alors !"
#Retourne suite de caractères "C'est drôle ça, faisons-en plus :"
puts "C'est drôle ça, faisons-en plus :"
#Retourne suite de caractères "Est-ce que 5 est plus grand que -2 ?" suivi du résultat du calcul 
puts "Est-ce que 5 est plus grand que -2 ? #{5 > -2}"
#Retourne suite de caractères "Est-ce que 5 est supérieur ou égual à -2 ?" suivi du résultat du calcul 
puts "Est-ce que 5 est supérieur ou égal à -2 ? #{5 >= -2}"
#Retourne suite de caractères "Est-ce que 5 est inférieur ou égual à -2 ?" suivi du résultat du calcul
puts "Est-ce que 5 est inférieur ou égal à -2 ? #{5 <= -2}"

#Les valeurs entre #{} sont sorties des guillemets dans une table de hashage pour effectuer le calcul