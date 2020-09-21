puts "Quel est votre âge ?"
age=gets.chomp.to_i
birth=2020-age
year=birth
ago=0
old=age
while old>0
    old=age-ago
    puts "Il y a #{ago} années, vous aviez #{old} ans."
    if ago==old
        puts "Donc il y a #{ago} années, vous aviez la moitié de l'âge que vous avez aujourd'hui."
    end
    ago+=1
end