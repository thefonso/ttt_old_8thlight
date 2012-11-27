require_relative 'board'
require_relative 'ai'
# TODO give choice of who can make first move
# TODO implement minimax algroithum 
#  STEP 1 extract currernt ai into seperate module (include AI::Algorithm::regular)
#  STEP 2 import new ai module (include AI::Algorithm::minimax)

class Human
  def move(board)
    @player_symbol = 'X'
    puts "human move..."
    
    human_move = gets.chomp
    human_spot_to_take = human_move.to_sym
    
    if board.grid.has_key?(human_spot_to_take)
      if board.grid[human_spot_to_take] == " " 
        mymove = human_spot_to_take.to_sym 
        board.grid[mymove] = @player_symbol         
      else
        puts "spot taken...try again"
        move(board)
      end
    else
      puts "invalid move...try again"
      move(board)
    end 
  end          
end


class Computer
  include ComputerBrain
  # Final Game States are ranked according to whether they’re a win, draw, or loss.
  #
  # Intermediate Game States are ranked according to whose turn it is and the available moves.
  # If it’s X’s turn, set the rank to that of the maximum move available. In other words, if a move will result in a win, X should take it.
  # If it’s O’s turn, set the rank to that of the minimum move available. In other words, If a move will result in a loss, X should avoid it.
  #
  # how to auto generate moves? how to keep record of board?
  def move(board)
    @player_symbol = 'O'
    puts "computer move..." 
    
    ai_moves(board)
    
  end

end


class Player
  def self.get_player(letter)
    @player_symbol = letter    
    @code_plugin = ""
    
    if letter == 'X'
      return Human.new
    else
      return Computer.new
    end
  end
end