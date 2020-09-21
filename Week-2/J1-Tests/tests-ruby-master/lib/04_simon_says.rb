#===> Renvoie un echo du string str
def echo(str)
    str
end

#===> Renvoie le string en majuscules
def shout(sentence)
    sentence.upcase
end

#===> Répète le string par défaut au moins une fois, sinon autant de fois que la valeur de "repeat"
def repeat(str, repeat=2)
    ((str + " ")*repeat).strip
end

#===> Retourne le.s "chars" premier.s caractère.s du string str
def start_of_word(str, chars=1)
    str[0..(chars-1)]
end

#===> Retourne le premier mot du string
def first_word(str)
    #==> split permet de créer un découpage dans le string en fonction des espaces
    str.split[0]
end

#===> Retourne toutes les premiers lettres de chaque mot du string en majuscules, sauf les petits mots
def titleize(str)
    #==> On note les petis mots en les plaçant dans un tableau
    do_not_cap=["and","the"]
    #==> mon array sentence contiendra tous les mots qui reformeront le string avec nos nouveaux parmètres
    sentence=[]
    #==> Je fais le tour du string en parcourant chaque mot
    str.split.map {|word|
        if do_not_cap.include?(word) 
            #==> Si le mot est un petit mot (appartient au array do_not_cap), je l'incrémente tel quel dans le array sentence
            sentence<<word
        else
            #==> Si il n'est pas un petit mot, je l'incrémente après lui avoir appliqué la méthode capitalize qui met sa première lettre en majuscule
            sentence<<word.capitalize
        end
        #==> Pour que le premier mot du string soit forcément capitalized, j'utilise la méthode sur le premier mot du array sentence
        sentence[0].capitalize!
      }.join(" ") #===> on regroupe tout dans un string espacés par... un espace !
      #==> Retourne notre tableau sentence converti en string.
      sentence.join(" ")

end