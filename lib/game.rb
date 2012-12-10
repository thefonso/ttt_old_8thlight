require_relative 'library_rulebased'
require_relative 'player'

class Game 
  include LibraryRulebased #TODO namespace these methods  
  
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
    else
      Player.get_player('O').move(@board)
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
