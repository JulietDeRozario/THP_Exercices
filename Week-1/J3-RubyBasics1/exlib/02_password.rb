def signup
    puts "Choisissez un mot de passe :"
    password=gets.chomp
end

def login(password)
    puts "Saisissez votre mot de passe :"
    answer=gets.chomp
    if answer==password
        puts "Bienvenue" 
    end       
    while answer!=password
        puts "Mauvais mot de passe réessayer :" 
        answer =gets.chomp
    end
end

def welcome_screen
    puts "Page secrète de la NASA : !!!Confidentiel!!!"
    puts "ET est inspiré d'une histoire réelle"
end

def perform
    password=signup
    login(password)
    welcome_screen
end

perform
