class Program
    attr_accessor :player
    attr_accessor :dice
    attr_accessor :choice
    attr_accessor :shot
    attr_accessor :tab
    attr_accessor :answer

    def initialize
        @player=0
        @dice=0
        @choice=0
        @shot=0
        answer=""
        @stat=[]
    end

    def launch
        puts "Bienvenue dans ce jeu super cool, je te souhaite de bien kiffer !"
        puts "Veux-tu commencer une partie ? (O/N)"
        answer=gets.chomp
        if answer =="o" || answer=="O"
            puts "Choisissez un mode : (1/2)"
            puts "1: Mode joueur actif"
            puts "2: Mode statistiques sur 100 parties automatiques"
            choice=gets.chomp.to_i
            if choice==1
                @answer="O"
                classic_game
            elsif choice ==2
                average_finish_time
            elsif choicetest !=1 && choice !=2
                puts "Veuillez choisir un mode valide : (1/2)"
                choice=gets.chomp.to_i
            end
        end
    end

    def classic_game
        while answer== "O" || answer== "o"
            puts "Mode joueur actif"
            puts"lançage du dés..."
            dice=rand(1..6)
            puts "Vous avez tiré : #{dice}"
            if dice==1 && @player==0
                puts "Vous ne pouvez pas reculer."
                puts "Vous rester sur la case 0"
            elsif dice==1 && @player!=0
                puts "Vous reculez d'une case, vous êtes désormais sur la case #{@player -1}."
                @player=@player-1
            elsif dice==2 || dice==3 || dice==4
                puts "Il ne se passe rien, vous restez donc sur votre case #{@player}."
            elsif dice==5 || dice==6
                puts"Vous avancez d'une case ! Bravo ! Vous êtes maintenant sur la case #{@player +1}."
                @player= @player+1
            end
            if @player!=10
                puts "Voulez-vous continuer à jouer ? (O/N)"
                answer=gets.chomp
            end
            if answer!="N" && answer!="n" && answer!="O" && answer!="o"
                puts "Voulez-vous continuer à jouer ? (O/N)"
                answer=gets.chomp 
            end
            if @player==10 
                puts "Vous êtes arrivé sur la case 10, c'est gagné !"
            break
            elsif answer=="n" || answer=="N"
                puts "Au revoir !"
            break
            end
        end
    end

    def average_finish_time
        result =0
        puts "Mode automatique, simulation de 100 parties"
        puts "..........................................."
        100.times do
            while @player!=10
            dice=rand(1..6)
            @shot+=1
            if dice==1 && player!=0
                @player=@player-1
            elsif dice==2 || dice==3 || dice==4
            elsif dice==5 || dice==6
                @player= @player+1
            end
            end
            if @player==10
                @stat<<shot
                @shot=0
                @player=0
            end
        end
        result =@stat.inject(0, :+)
        puts "#{result/100} est le nombre moyen de coups par partie."
    end
end

def perform
    game= Program.new
    game.launch
end
perform
