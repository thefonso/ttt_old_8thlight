require_relative 'windetection'
require_relative 'player'


class Game 
  include WinDetection
  
  def initialize(human, computer, board)
    @player_human = human
    @player_computer = computer
    @board = board
  end


  def drawgrid
    @board.printgrid
  end
  
  def take_turn(turn_value)
    turn = turn_value
    
    if turn.even?          
      @player_human.move(@board)
      puts drawgrid        
      is_a_human_win(@board)      
    else
      @player_computer.move(@board)
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