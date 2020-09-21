#===> Retourne le plus grand nombre
def who_is_bigger(nb1, nb2, nb3)
    #==> Création d'un hash pour incrémenter mes valeurs à une clé (ici a, b et c comme demandé dans l'énoncé)
    hash = {"a" => nb1, "b" => nb2, "c" => nb3}
    #==> Retourne un message d'erreur si une des valeurs est nulle
    if nb1 === nil || nb2 === nil || nb3 === nil
        return "nil detected"
      else
        #==> Retourne la clé de la plus grande valeur du tableau
        max = hash.values.max
        return "#{hash.key(max)} is bigger"
      end
end

#===> Renverse, met en majuscules et jette les L, T et A
def reverse_upcase_noLTA(string)
    return string.upcase.reverse.delete('LTA')
end

#===> Vérifie si 42 est une valeur du array
def array_42(arr)
    arr.include? 42
end

#==> The magic_array function takes an array of number or an array of
  # array of number as parameter and return the same array :
  # - flattened (i.e. no more arrays in array)
  # - sorted
  # - with each number multiplicated by 2
  # - with each multiple of 3 removed
  # - with each number duplicate removed (any number should appear only once)
  # - sorted
def magic_array(a)
    a.flatten.sort.map{|i|i*2}.delete_if{|i|i%3==0}.uniq
end