#===> convertir les degrés F en degrés C
def ftoc(temp)
    #==> Formule de convertion °F vers °C
     temp=(temp-32)*5/9.0
     #==> Retourne la valeur convertie en °C
     return temp
end

def ctof(temp)
    #==> Formule de convertion °C vers °F
    temp= (temp*9.0/5)+32
    #==> Retourne la valeur convertie en °F
    return temp
end