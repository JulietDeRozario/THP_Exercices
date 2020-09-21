#===> Ajoute nb2 à nb1 (nb1+nb2)
def add(nb1, nb2)
    #==> Retourne le résultat
    return nb1+nb2
end

#===> Soustrait nb2 à nb1
def subtract(nb1, nb2)
    #==> Retourne le résultat
    return nb1-nb2
end

#===> Calcule la somme de tous les nombres d'un array
def sum(arr)
    #==> Retourne le résultat
    return arr.inject(0){|s,x| s + x }
end

#===> Multiplie nb1 par nb2
def multiply(nb1, nb2)
    #==> Retourne le résultat
    return nb1*nb2
end

#===> Elève le nb1 à la puissance nb2
def power(nb1, nb2)
    #==> Retourne le résultat
    return nb1**nb2
end

#===> Calcul le factoriel d'un nombre
def factorial(nb)
    #==> méthode Math.gamma qui permet de faire ce calcul, retourne le résultat
    return Math.gamma(nb+1)
end