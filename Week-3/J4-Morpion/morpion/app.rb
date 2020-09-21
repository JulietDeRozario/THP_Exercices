require 'bundler'
Bundler.require

require_relative 'lib/player.rb'
require_relative 'lib/game.rb'
require_relative 'lib/boardgame.rb'
require_relative 'lib/boardcase.rb'

#===> message d'accueil et réation des joueurs (objets d'instance de la classe Players)


puts " 

  ██████  ▄▄▄     ▄▄▄█████▓ ▄▄▄       ███▄    █ 
▒██    ▒ ▒████▄   ▓  ██▒ ▓▒▒████▄     ██ ▀█   █ 
░ ▓██▄   ▒██  ▀█▄ ▒ ▓██░ ▒░▒██  ▀█▄  ▓██  ▀█ ██▒
  ▒   ██▒░██▄▄▄▄██░ ▓██▓ ░ ░██▄▄▄▄██ ▓██▒  ▐▌██▒
▒██████▒▒ ▓█   ▓██▒ ▒██▒ ░  ▓█   ▓██▒▒██░   ▓██░
▒ ▒▓▒ ▒ ░ ▒▒   ▓▒█░ ▒ ░░    ▒▒   ▓▒█░░ ▒░   ▒ ▒ 
░ ░▒  ░ ░  ▒   ▒▒ ░   ░      ▒   ▒▒ ░░ ░░   ░ ▒░
░  ░  ░    ░   ▒    ░        ░   ▒      ░   ░ ░ 
      ░        ░  ░              ░  ░      
"
puts " 
  █▀▄▀█ ████▄ █▄▄▄▄ █ ▄▄  ▄█ ████▄    ▄   
  █ █ █ █   █ █  ▄▀ █   █ ██ █   █     █  
  █ ▄ █ █   █ █▀▀▌  █▀▀▀  ██ █   █ ██   █ 
  █   █ ▀████ █  █  █     ▐█ ▀████ █ █  █ 
     █          █    █     ▐       █  █ █ 
    ▀          ▀      ▀            █   ██ 
                                        
  █     ▄███▄         ▄▄▄▄▄ ▄███▄     ▄   
  █     █▀   ▀      ▄▀  █   █▀   ▀     █  
  █     ██▄▄            █   ██▄▄    █   █ 
  ███▄  █▄   ▄▀      ▄ █    █▄   ▄▀ █   █ 
      ▀ ▀███▀         ▀     ▀███▀   █▄ ▄█ 
                                     ▀▀▀        
"

#===> we ask the players' names
puts "Entrez un pseudo pour le joueur 1 : "
print "> "
name_player_1 = gets.chomp
puts "Entrez un pseudo pour le joueur 2 : "
print "> "
name_player_2 = gets.chomp
system "clear"


#===> the loop turns while the players ask to play again
loop do
  #===> we create a instance of the Game class
  my_game = Game.new(name_player_1, name_player_2)
  system "clear"
  my_game.new_board_game
  #===> the loop turns until there is no winner or draw
  loop do
    my_game.ask_move_p1
    my_game.execute_move_p1
    system "clear"
    my_game.current_game_board
    break if my_game.winner? == true
    my_game.ask_move_p2
    my_game.execute_move_p2
    system "clear"
    my_game.current_game_board
    break if my_game.winner? == true
  end
break if my_game.play_again == false
end
