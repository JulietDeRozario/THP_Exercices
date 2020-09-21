require_relative './controller'

class Router

  def initialize
    @controller = Controller.new
  end

  def perform
    puts "Bienvenue au royaume du gossip !"

    while true

      #==> menu
      puts "----------------------------------"
      puts "Tu veux faire quoi jeune mouss' ?"
      puts "1. Je veux créer un potin"
      puts "2. Je veux voir les potin"
      puts "3. Supprimer un potin"
      puts "4. Je veux quitter l'app"
      print "> "
      params = gets.chomp.to_i #==> on récupère le choix de l'utilisateur
      system "clear"

      case params #==> execute son choix

      when 1
        puts "Tu as choisi de créer un gossip" 
        @controller.create_gossip
      when 2
        puts "Voici les gossips de THP :"
        @controller.index_gossips
      when 3
        puts "Tu as choisis de supprimer un potin"
        @controller.delete_gossip
      when 4
        puts "À bientôt !"
        break #==> sort de la boucle while si l'utilisateur ne souhaite plus utiliser l'app

      else
        puts "Ce choix n'existe pas, merci de ressayer" #==> message d'erreur en cas de choix invalide

      end
    end
  end
end