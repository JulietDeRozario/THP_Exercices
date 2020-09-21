require_relative './boardcase.rb'

class BoardGame < BoardCase
  attr_accessor :row1, :row2, :row3, :col1, :col2, :col3, :diag1, :diag2, :board

  def initialize
    @board = {"a1" => " ", "a2" => " ", "a3" => " ", "b1" => " ", "b2" => " ", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => " "}
  end

  #===> we generate an empty board
  def generate_empty_board
    puts "     1   2   3"
    puts "  A  #{a1 = ' '} | #{a2 = ' ' } | #{a3 = ' '} "
    puts separator  = " "*4 + "─"*11
    puts "  B  #{b1 = ' '} | #{b2 = ' '} | #{b3 = ' '} "
    puts separator
    puts "  C  #{c1 = ' '} | #{c2 = ' '} | #{c3 = ' '} "
  end



end
