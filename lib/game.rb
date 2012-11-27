require_relative 'gamestate'
require_relative 'player'

# Final Game States are ranked according to whether they’re a win, draw, or loss.
# Intermediate Game States are ranked according to whose turn it is and the available moves.
# If it’s X’s turn, set the rank to that of the maximum move available. In other words, if a move will result in a win, X should take it.
# If it’s O’s turn, set the rank to that of the minimum move available. In other words, If a move will result in a loss, X should avoid it.

# how to auto generate moves? how to keep record of board?


class Game 
  include GameState
  
  
  def initialize(human, computer, board)
    @player_human = human
    @player_computer = computer
    @board = board
  end


  def drawgrid
    @board.printgrid
  end
  # TODO proper use of OOP needed here
  def take_turn(turn_value)
    turn = turn_value
    if turn.even?          
      Player.get_player('X').move(@board) 
      puts drawgrid 
      is_a_human_win(@board)   
    else
      Player.get_player('O').move(@board)
      puts drawgrid 
      is_a_computer_win(@board)
    end   
  end


  def play    
    puts drawgrid
 
    turn = 0   
    10.times do
    
      take_turn(turn)
      
    turn += 1
    end
  end
  
end