require_relative './boardgame'
require_relative './boardcase'

class Game
  attr_accessor :name_player_1, :name_player_2, :players_array, :chosen_move_p1, :chosen_move_p2, :valid_moves, :current_board

  def initialize(name_player_1, name_player_2)
    @name_player_1 = name_player_1
    @name_player_2 = name_player_2
    #===> we create an array with our different players
    @players_array = [player_1 = Player.new(name_player_1), player_2 = Player.new(name_player_2)]
    player_1.sign = "X"
    player_2.sign = "O"
    @valid_moves = ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"] #===> we keep the values where the players can play
    @current_board = BoardGame.new #===> we create an instance of the BoardGame class
    @current_board = @current_board.board
  end

  #====> initiate a new empty board
  def new_board_game
    start_board = BoardGame.new #===> we create an instance of the BoardGame class
    start_board.generate_empty_board
  end

  #===> We ask where the player 1 wants to play
  def ask_move_p1
    loop do
      puts "\n#{@players_array[0].name}, choisissez la case où jouer: (A1/B2/C3...)"
      print "\n> "
      @chosen_move_p1 = gets.chomp.downcase
      if @valid_moves.include?(@chosen_move_p1) == true
        break
      end
      puts "Choix invalide, réessayer."
    end
    @valid_moves.delete chosen_move_p1
  end

  #===> We ask where the player 2 wants to play
  def ask_move_p2
    loop do
      puts "\n#{@players_array[1].name}, choisissez la case où jouer: (A1/B2/C3...)"
      print "\n> "
      @chosen_move_p2 = gets.chomp.downcase
      if @valid_moves.include?(@chosen_move_p2) == true
        break
      end
      puts "Choix invalide, réessayer."
    end
    @valid_moves.delete chosen_move_p2
  end

  #===> we execute player1's move
  def execute_move_p1
    @current_board.each do |key,value|
      key.to_s
      if @chosen_move_p1 == key
        @current_board[key] = players_array[0].sign
      end
    end
  end

  #===> we execute player2's move
  def execute_move_p2
    @current_board.each do |key,value|
      key.to_s
      if @chosen_move_p2 == key
        @current_board[key] = players_array[1].sign
      end
    end
  end

  #===> we check if there is a winner
  def winner?
    array_board = Array.new
    @current_board.each do |key,value|
      array_board << value
    end
    #===> we check if there are completed lines with the same sign(non-empty)
    if array_board[0] == array_board[1] && array_board[0] == array_board[2] &&  array_board[0] != " " #row1
      if array_board[0] == "X"
        puts "\n#{players_array[0].name} a gagné la partie !"
      elsif array_board[0] == "O"
        puts "\n#{players_array[1].name} a gagné la partie !"
      end
      return true
    elsif array_board[3] == array_board[4] && array_board[3] == array_board[5] && array_board[3] != " " #row2
      if array_board[3] == "X" #===> check which player won
        puts "\n#{players_array[0].name} a gagné la partie !"
      elsif array_board[3] == "O"
        puts "\n#{players_array[1].name} a gagné la partie !"
      end
      return true
    elsif array_board[6] == array_board[7] && array_board[6] == array_board[8] && array_board[6] != " "#rown3
      if array_board[6] == "X"
        puts "\n#{players_array[0].name} a gagné la partie !"
      elsif array_board[6] == "O"
        puts "\n#{players_array[1].name} a gagné la partie !"
      end
      return true
    #===> we check if there are completed columns with the same sign
    elsif array_board[0] == array_board[3] && array_board[0] == array_board[6] && array_board[0] != " " #col1
      if array_board[0] == "X"
        puts "\n#{players_array[0].name} a gagné la partie !"
      elsif array_board[0] == "O"
        puts "\n#{players_array[1].name} a gagné la partie !"
      end
      return true
    elsif array_board[1] == array_board[4] && array_board[1] == array_board[7] && array_board[1] != " " #col2
      if array_board[1] == "X"
        puts "\n#{players_array[0].name} a gagné la partie !"
      elsif array_board[1] == "O"
        puts "\n#{players_array[1].name} a gagné la partie !"
      end
      return true
    elsif array_board[2] == array_board[5] && array_board[2] == array_board[8] && array_board[2] != " " #col3
      if array_board[2] == "X"
        puts "\n#{players_array[0].name} a gagné la partie !"
      elsif array_board[2] == "O"
        puts "\n#{players_array[1].name} a gagné la partie !"
      end
      return true 
    #===> we check if there are completed diagonals with the same sign
    elsif array_board[0] == array_board[4] && array_board[0] == array_board[8] && array_board[0] != " " #diag1
      if array_board[0] == "X"
        puts "\n#{players_array[0].name} a gagné la partie !"
      elsif array_board[0] == "O"
        puts "\n#{players_array[1].name} a gagné la partie !"
      end
      return true
    elsif array_board[2] == array_board[4] && array_board[2] == array_board[6] && array_board[2] != " " #diag2
      if array_board[2] == "X"
        puts "\n#{players_array[0].name} a gagné la partie !"
      elsif array_board[2] == "O"
        puts "\n#{players_array[1].name} a gagné la partie !"
      end
      return true
    elsif #===> check if there is a draw (="match nul")
      @valid_moves == []
      puts "Match nul !"
      return true
    else
      return false
    end
  end

  #===> we update an display the board
  def current_game_board
    puts "     1   2   3"
    puts "  A  #{@current_board["a1"]} | #{@current_board["a2"]} | #{@current_board["a3"]} "
    puts separator =" "*4 + "─"*11
    puts "  B  #{@current_board["b1"]} | #{@current_board["b2"]} | #{@current_board["b3"]} "
    puts separator
    puts "  C  #{@current_board["c1"]} | #{@current_board["c2"]} | #{@current_board["c3"]} "
  end

  #===> we ask players if they want to play again
  def play_again
    if winner? == true || @valid_moves == []
      loop do
        puts "Voulez-vous refaire une partie ? (O/N)"
        print "> "
        answer = gets.chomp.upcase
        if answer == "O"
          return true
        elsif answer == "N"
          return false
        end
        break if answer == "O" || answer == "N"
        if answer != "O" && answer != "N"
          puts "Choix invalide."
        end
      end
    end
  end
end
