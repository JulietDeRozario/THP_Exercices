puts "Quelle est votre année de naissance ?"
birth=gets.chomp.to_i
while birth<2021
    puts birth
    birth+=1
end