require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#===> on crée nos deux joueurs
player1 = Player.new("Josianne")
player2 = Player.new("José")

#===> le jeu continue tant que nos joueurs ont des pv
while player1.life_points > 0 && player2.life_points > 0
    
    puts "----------------------------------------------------------------"
    puts "Voici l'état de nos combattants:"
    puts " "

    puts player1.show_state #===> on montre le niveau de pv de nos joueurs en appellant la méthode show_state

    puts player2.show_state

    puts "----------------------------------------------------------------"
    puts " "
    gets.chomp

    puts "Phase d'attaque activée: faites voler les dents!"

    player1.attacks(player2) #===> player 1 attaque player 2 en appellant la méthode attacks

        if player2.life_points <= 0 #==> le jeu s'arrête si le joueur cible meurt sur le coup
            break
        end

    puts " "
    gets.chomp

    puts "La vengeance est une entrée chaude: #{player2.name} riposte!" 

    player2.attacks(player1) #===> le joueur 2 riposte avec la méthode attacks

    puts " "
    gets.chomp
end

#Vous pouvez ajouter "binding.pry" si vous souhaitez créer de nouveaux joueurs et/ou modifier le déroulement du jeu

