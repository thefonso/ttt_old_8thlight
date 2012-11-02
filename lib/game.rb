require_relative 'computer'
require_relative 'human'


class Game 
  
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
        
      is_a_human_win(@board)
    else
      @player_computer.move(@board)
      
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
  
  # TODO - better WIN detection...add draw
  def is_a_human_win(board)

    win_moves = {
      :wm01 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"X"},
      :wm02 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>" "},
      :wm03 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>" "},
      :wm04 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>"X", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm05 => {:a1=>"X", :a2=>"X", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm06 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>"X", :c3=>"X"},
      :wm07 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>" "},
      :wm08 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>"X"}
    }

    keys_with_x = board.grid.select{ |k, v| v == "X" }.keys

    matching_moves = win_moves.select{ |k, v| v.select{ |k, v| v == "X" }.keys == keys_with_x }

    string_contains = matching_moves.keys.to_s
    if string_contains =~ /wm/ #match found then...
      puts "WIN DETECTED - Human"
      puts drawgrid
      exit
    else
      puts drawgrid
    end
  end
  
  def is_a_computer_win(board)

    ai_winmoves = {
      :wm01 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"O"},
      :wm02 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
      :wm03 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
      :wm04 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>"O", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm05 => {:a1=>"O", :a2=>"O", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm06 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>"O", :c3=>"O"},
      :wm07 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
      :wm08 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>"O"}
    }

    keys_with_o = board.grid.select{ |k, v| v == "O" }.keys
    
    matching_moves = ai_winmoves.select{ |k, v| v.select{ |k, v| v == "O" }.keys == keys_with_o }
    
    test_string_contains = matching_moves.keys.to_s
    if test_string_contains =~ /wm/ #match found then...
      puts "WIN DETECTED - computer "+test_str
      puts drawgrid
      exit
    else
      puts drawgrid
    end
  end 
end