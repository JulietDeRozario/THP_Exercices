puts "Quelle est votre année de naissance ?"
birth=gets.chomp.to_i
age=0
year=birth
while year<2021 && age>-1
    age=year-birth
    puts "en #{year} :"
    puts "Vous aviez #{age} ans."
    year +=1
end