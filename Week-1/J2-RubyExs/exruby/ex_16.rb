puts "Quel est votre âge ?"
age=gets.chomp.to_i
birth=2020-age
year=birth
ago=0
old=age
while old>0
    old=age-ago
    puts "Il y a #{ago} années, vous aviez #{old} ans."
    ago+=1
end

