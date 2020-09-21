class Player #===> classe qui définit les joueurs non-humains (bots)
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name #===> nom du joueur
        @life_points = 10 #===> pv du joueur
    end

    def show_state #===> montre le nombre de points de vie du joueur
        puts "#{name} a #{@life_points} points de vie."
    end

    def gets_damage(damage) #===> calcule le nombre de points de vie du joueur après avoir reçu des dégats
        @life_points = @life_points - damage

        if @life_points <= 0 #===> afficher un message s'il est mort (life_points <= 0)
            puts "#{name} a subitement été atteint d'un décès incurable, sorry."

        else  #===> s'il est en vie, afficher ses pv restants
            puts "#{name} n'a plus que #{@life_points} points de vie."
        end
    end

    def attacks(target) #===> permet à un joueur d'attaquer un autre joueur
        puts "#{self.name} attaque #{target.name}!"
        result = compute_damage #===> on fait appel à compute_damage pour calculer l'étendue des dégats
        puts "Son attaque inflige #{result} dégats!"
        target.gets_damage(result) #===> on appelle la méthode gets_damage pour infliger à la cible (target) le nombre total des dégats
    end

    def  compute_damage #===> on calcule l'étendue des dégats aléatoirement
        return rand(1..6)
    end

end

class HumanPlayer < Player #===> classe qui définit les joueurs humains (utilisateurs) qui hérite des paramètres de la classe Player
    attr_accessor :weapon_level

    def initialize(name) #===> on applique tout de même quelques changements :
        @life_points = 100 #===> les joueurs humains ont 100 pv
        @weapon_level = 1 #===> ils ont une arme dont le niveau initial est 1
        @name = name
    end

    def show_state #===> on ajoute à cette méthode le niveau de l'arme du joueur
        print "#{name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage #===> les dégats ont maintenant multipliés par le niveau de l'arme du joueur
        return rand(1..6)*@weapon_level
    end

    def search_weapon #===> le joueur peux choisir de chercher une nouvelle arme dont le niveau est généré aléatoirement
        new_weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}."

        if new_weapon_level > @weapon_level #==> si le niveau de la nouvelle arme est supérieur à celui de l'ancienne, le joueur s'en équipe
            puts "Youhou, elle est grave mieux que la tienne, prends-la donc !"
            @weapon_level = new_weapon_level

        elsif @weapon_level > new_weapon_level #===> si le niveau est inférieur, le joueur garde son ancienne arme
            puts "Sainte Catherine Du Bois ! Cette arme ne te sied point, la tienne est d'une qualité et d'une finesse plus délectable. Laisse-donc ce vulgaire bout de féraille à sa place initiale. Tu ne la touche même pas."

        elsif @weapon_level == new_weapon_level # si les niveaux sont égaux... bah... dommage !
            puts "Ah, bah un peu inutile du coup..."
        end
    end

    def search_health_pack #===> le joueur peut choisir de chercher un pack de vie dont le contenu est généré aléatoirement par un lancé de dés
        chance = rand(1..6)
        
        if chance == 1 #==> si le dés fait 1, le joueur ne trouve rien
            puts "Tu n'as rien trouvé, parce que tu n'as pas levé les yeux de ton sandwish au saumon, probablement."

        elsif chance >= 2 && chance <= 5 #===> si le dés est compris entre 2 et 5 inclus, le pack contient 50pv
            puts "Oh yeah, un pack de +50 pv! Pas mal !"
            @life_points += 50
            if @life_points > 100 #==> la vie du joueur ne peut pas dépasser les 100pv
                @life_points = 100
            end
        
        elsif chance == 6 #===> si le dés fait 6, le pack contient 80pv
            puts "OMG ! Nan mais allô quoi, un pack de +80pv, sérieux ?! Tu t'mets bien mon coco!"
            @life_points +=80
            if @life_points > 100
                @life_points = 100
            end

        end

        puts "Tu as #{@life_points} points de vie!" #===> on affiche le nouveau nb de pv du joueur
    end

end
