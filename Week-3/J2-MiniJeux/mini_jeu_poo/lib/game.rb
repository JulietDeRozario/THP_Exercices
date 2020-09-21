class Game
    attr_accessor :human_player, :enemies, :user, :players_left, :enemy_nb

    def initialize(human_player)
        
        @human_player = human_player
        user = HumanPlayer.new(human_player) #==> à partir de notre objet my_game, on crée un nouveau joueur humain 
        @user = user
        @players_left = 10 #===> il y a dix ennemis à tuer ar défault
        @enemy_nb = 0 #===> variable que je vais utiliser pour nommer mes ennemis ("ennemy 1", "ennemy 2"... etc)
        @enemies_in_sight = [] #===> tableau des ennemis en vue, initialement vide
    end


    def kill_player #===> supprime un ennemi du jeu s'il n'a plus de pv
        @enemies_in_sight.each do |enemy|
            if enemy.life_points <= 0
                @enemies_in_sight.delete(enemy) #==> on le retire donc du tableau des ennemis en vue
                @players_left -=1 #==> et on enlève un au nombre d'ennemis restants à tuer
            end
        end
    end

    def is_still_ongoing? #==> retourne true si l'utilisateur est encore en vie, et s'il reste des bots à tuer
        user.life_points > 0 && @players_left > 0
    end

    def show_players #===> on montre l'état de notre utilisateur ainsi que le nombre d'ennemi restant
            puts user.show_state
            puts "Il reste encore #{@players_left} ennemis à abattre!"       
    end

    def menu #===> menu des choix
        gets.chomp
        puts "-------------------------------------------------------------------------------"
        puts "Quelle action veux-tu effectuer ?"
        puts ""
        puts "a- chercher une meilleure arme"
        puts "b- essayer de trouver un pack de soin"
        puts ""
        puts "Attaquer comme un bourrain:"
        @enemies_in_sight.each do |enemy|
            #==> affiche le numéro à l'index de l'ennemi et son état : 0- ennemi n°1 a 10 pv
             print "#{@enemies_in_sight.find_index(enemy)}- "
             print enemy.show_state
             puts ""
        end
    
    end

    def menu_choice(choice = gets.chomp) #===> execute le choix

        if choice == 'a'
            user.search_weapon #===> cherche une arme si l'utilisateur entre 'a'

        elsif choice == 'b'
            user.search_health_pack #===> cherche un pack de vie si l'utilisateur entre 'b'

        elsif choice.to_i >= 0 && choice.to_i <= @enemies_in_sight.size #===> si l'utilisateur entre un nombre entre 0 et le nombre d'ennemis en vue :
            user.attacks(@enemies_in_sight[choice.to_i]) #===> l'utilisateur attaque l'ennemi qui à l'index du nb entré


        elsif choice != 'a' && choice != 'b' && (choice.to_i < 0 || choice.to_i > @enemies_in_sight.size) || choice == nil
            puts "Valeur incorrecte, vous faites soudain une crise d'epilepsie, les ennemis en profitent pour attaquer!"
            #===> si la valeur est incorrecte, le joueur passe son tour
        end
    end

    def enemies_attack #===> les ennemis en vue attaquent
        puts "Les ennemis attaquent!" if @enemies_in_sight.size != 0 #==> pas besoin d'afficher ce message s'il ne reste plus d'ennemis
        @enemies_in_sight.each do |enemy|
            enemy.attacks(user) #===> chaque ennemi en vue attaque l'utilisateur
        end
    end

    def new_player_in_sight #===> fait apparaître (ou pas) un nouvel ennemi en vue

        if @enemy_nb < 10 #==> à condition qu'il n'y en ait pas déjà 10
            how_many = rand(1..6)

            if how_many == 1 #===> si le dés fait 1, pas de nouvel ennemi
                puts "Aucun nouvel ennemi en vue!"
            
            elsif how_many >= 2 && how_many <= 4 #===> si le dés est compris entre 2 et 5 inclus, un nouvel ennemi
                @enemy_nb += 1 
                puts "Un nouvel ennemi en vue!"
                @enemies_in_sight << Player.new("ennemi n°#{@enemy_nb}") #==> on le nomme "ennemi n°" suivi de son numéro d'apparition (@enemy_nb)

            elsif how_many >= 5 && how_many <= 6 #===> si le dés fait 6, deux nouveau ennemis
                @enemy_nb += 1
                @enemies_in_sight << Player.new("ennemi n°#{@enemy_nb}") 

                if enemy_nb < 10 #===> le deuxième n'apparait que si le premier ne fait pas monter le nombre d'ennemis en vue à 10
                    @enemy_nb += 1  
                    @enemies_in_sight << Player.new("ennemi n°#{@enemy_nb}")
                    puts "Deux nouveaux ennemis en vue!"
                
                else  #==> sinon, le deuxième ennemi n'apparait pas, un seul nouvel ennemi en vue
                    puts "Un nouvel ennemi en vue!"

                end
            end
        end
    end    

    def end #===> message de fin
        if user.life_points <= 0 #===> si les pv du joueur sont inférieur ou = 0, défaite
            puts "Tu as perdu, malgré tes 100pv... Et bien, bravo !"

        elsif players_left == 0 #===> si tous les ennemis sont morts : victoire 
            puts "Victoire !"
        end
    end    
end