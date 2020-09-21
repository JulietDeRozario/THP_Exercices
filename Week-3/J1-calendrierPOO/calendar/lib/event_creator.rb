require 'pry'
require 'bundler'
Bundler.require

class EventCreator
   @@title
   @@date
   @@duration
   @@attendes

    def get_event_title
        puts "Hey, tu veux créer un événement ?"
        puts "Envoie 'Event' au 71010"
        puts "'Event' au 71010"
        puts "Non, j'déconne, balance le nom de ton truc:"
        @@title = gets.chomp
    end

    def get_event_date
        puts "Et c'est quand ton machin ?"
        @@date = gets.chomp
    end 

    def get_event_duration    
        puts "Combien de minutes tu vas y perdre ?"
        @@duration = gets.chomp
    end

    def get_event_attendes
        puts "Fais péter les emails de tes guests:"
        @@attendes = gets.chomp
        puts "Cool"
    end

    def puts_event
        puts "Evénement: #{@@title}"
        puts "Programmé le: #{@@date}"
        puts "Durée: #{@@duration} min"
        puts "emails des invités: #{@@attendes}"
    end

    def perform 
        get_event_title
        get_event_date
        get_event_duration
        get_event_attendes
        puts_event
    end

    EventCreator.new.perform
end

