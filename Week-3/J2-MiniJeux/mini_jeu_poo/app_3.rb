require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#===> message d'accueil
puts "
                     ████████╗██╗  ██╗███████╗     ██████╗  █████╗ ███╗   ███╗███████╗
                     ╚══██╔══╝██║  ██║██╔════╝    ██╔════╝ ██╔══██╗████╗ ████║██╔════╝
                        ██║   ███████║█████╗      ██║  ███╗███████║██╔████╔██║█████╗  
                        ██║   ██╔══██║██╔══╝      ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝  
                        ██║   ██║  ██║███████╗    ╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗
                        ╚═╝   ╚═╝  ╚═╝╚══════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝                                                                                
"
puts ""
puts  "                          -----------------------------------------------"
puts  "                         |  Bienvenue sur ''ILS VEULENT TOUS MA POO'' !  |"
puts  "                         |Le but du jeu est d'être le dernier survivant !|"
puts  "                          -----------------------------------------------"
puts "_______________________________________________________________________________"
puts ""
puts "Quel est votre nom, preux chevalier ?"
puts ""
print ">"
#===> on crée un objet my_game, de la classe game, qui prend en paramètre le nom de m'utilisateur
my_game = Game.new(gets.chomp)

puts ""
puts ""

#===> boucle do...while (que j'aime fort), qui lance le jeu au moins une fois et l'arrête si la condition du "break" est appliquée
loop do
    puts ""

    my_game.new_player_in_sight #===> on fait entrer de nouveaux ennemis en vue (ou pas)

    gets.chomp
    
    my_game.show_players


    my_game.menu #===> on lance le menu des choix
    puts ""
    puts ""
    print ">"

    my_game.menu_choice(choice = gets.chomp) #===> on lance la méthode qui applique notre choix

    gets.chomp

    my_game.kill_player #===> si des joueurs sont morts, ont les retire du jeu (tu tableau enemies_in_sight et on enlève un joueur dans player_left)

    my_game.enemies_attack #===> tour d'attaque des ennemis

    my_game.end #===> affiche victoire ou défaite en cas de fin de partie

    break if my_game.is_still_ongoing? != true #===> si la méthode is_still_ongoing retourne true (le joueur a encore des pv et tous les bots ne sont pas morts), la boucle se relance
end

#Vous pouvez ajouter "binding.pry" si vous souhaitez créer de nouveaux joueurs et/ou modifier le déroulement du jeu