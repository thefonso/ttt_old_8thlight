require_relative 'library'
require_relative 'player'




class Game 
  include Library #TODO namespace these methods
  
  
  def initialize(human, computer, board)
    @player_human = human
    @player_computer = computer
    @board = board
  end


  def drawgrid
    @board.printgrid
  end

  def take_turn(turn_value)
    if turn_value.even?
      Player.get_player('X').move(@board)
      is_a_human_win(@board)
    else
      Player.get_player('O').move(@board)
      is_a_computer_win(@board)
    end
  end


  def play
    puts drawgrid
 
    turn = 0
    10.times do
    
     take_turn(turn)
      
    turn += 1
    puts drawgrid
    end
  end
  
end
