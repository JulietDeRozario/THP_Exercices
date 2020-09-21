require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#===> on affiche un message de bienvenue
puts  "                                  -----------------------------------------------"
puts  "                                 |  Bienvenue sur ''ILS VEULENT TOUS MA POO'' !  |"
puts  "                                 |Le but du jeu est d'être le dernier survivant !|"
puts  "                                  -----------------------------------------------"
puts ""
puts "Quel est votre nom, preux chevalier ?"

#==> on crée notre joueur humain (utilisateur)
user = HumanPlayer.new(gets.chomp)

#==> on crée nos deux ennemis qu'on incrémente dans un tableau
enemies = []

player1 = Player.new("José")

player2 = Player.new("Josianne")

enemies << player1
enemies << player2

#==> Tant que les pv du joueurs sont supérieurs à 0, le jeu continue
while user.life_points >0

    gets.chomp

    puts user.show_state #===> on affiche l'état de l'utilisateur

    #===> menu des choix
    puts "-------------------------------------------------------------------------------"
    puts "Quelle action veux tu effectuer ?"
    puts ""
    puts "a- chercher une meilleure arme"
    puts "b- essayer de trouver un pack de soin"
    puts ""
    puts "Attaquer comme un bourrain"
    #===> on affiche l'état des joueurs qu'on peut attaquer, à condition qu'ils soient en vie
    if player1.life_points > 0 
        print "1- "
        print player1.show_state
    end 
    if player2.life_points > 0
        print "2- "
        print player2.show_state 
    end
    print ">"
    choice = gets.chomp
    
    #===> résultat du choix
    if choice == "a"
        user.search_weapon #===> cherche une nouvelle arme si le joueur entre 'a'
    
    elsif choice == "b" #===> cherche un pack de vie si le joueur entre 'b'
        user.search_health_pack

    elsif choice == "1" #===> attaque José si le joueur entre "1"
        user.attacks(player1)

    elsif choice == "2" #===> attaque Josianne si le joueur entre "2"
        user.attacks(player2)

    else #===> si le joueur entre une mauvaise valeur, sont tour est sauté (niak niak niak)
        puts "Ce choix est invalide, tu es soudain pris d'une crise d'epilepsie, les ennemis en profitent pour t'attaquer! (Tu réfléchiras la prochaine fois avant de jouer au clown)"
    end

    break  if player1.life_points <= 0 && player2.life_points <= 0 #===> le jeu s'arrête si les deux bots sont décédés

    gets.chomp

    #===> tour d'attaque des ennemis
    puts "Les ennemis attaquent:"
    enemies.each do |ennemy| #==> chaque ennemi vivant attaque l'utilisateur
        if ennemy.life_points > 0
        ennemy.attacks(user)
        end
    end

end

if user.life_points > 0 #===> si le jeu s'est arrêté alors que le joueur a tous ses pv, c'est qu'il a tué tous les bots : victoire
    puts "Victoire, bravo !"

else  #==> sinon, c'est qu'il est mort : oups
    puts "Tu as réussi à perdre en démarant à 100pv... Laborieux !"
end

 #Vous pouvez ajouter "binding.pry" si vous souhaitez créer de nouveaux joueurs et/ou modifier le déroulement du jeu