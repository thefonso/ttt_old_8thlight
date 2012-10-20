require_relative 'player'
require_relative 'board'
#
# Just a Tic Tac Toe game class


# TODO - Human moves first 
#
#
class Game 
  #initial values
  #globals listed here
  ##
  attr_reader :win_moves
  attr_reader :thegrid
  attr_reader :corners
  attr_reader :gamegrid
  
  #create players
  def initialize(player_h, player_c, board)
    #bring into existence the board and the players
    @player_h = player_h
    @player_c = player_c
    @board = board
    
    #make a global var for drawgrid used by player
    $gamegrid = drawgrid  
  end

  ##
  #display grid on console
  def drawgrid
    @board.drawgrid
  end
  def take_turn(turn_value) #TODO - refactor me
    turn = turn_value
    puts drawgrid
    
    if turn.even?
          
      @player = @player_h.move_human("X", @board)
        
      @move = @player.to_sym
      @marker = @player_h.boardpiece
        
      is_a_human_win(@board)
          
    else
          
      @player = @player_c.move_computer("O", @board)
        
      @move = @player
      @marker = @player_c.boardpiece
        
      is_a_computer_win(@board)
      
    end   
  end
  ##
  #start the game here
  def play    
    #make a move 
    turn = 0   
    9.times do
    
      take_turn(turn)
      
    turn += 1
    end # 9.times ends
  end


  def is_a_human_win(board)
    #all moves as human (X)
    @win_moves = {
      :wm01 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"X"},
      :wm02 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>" "},
      :wm03 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>" "},
      :wm04 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>"X", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm05 => {:a1=>"X", :a2=>"X", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm06 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>"X", :c3=>"X"},
      :wm07 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>" "},
      :wm08 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>"X"}
    }
    #select all values where value is X for thegrid and copy those into keys_with_x
    keys_with_x = @board.grid.select{ |k, v| v == "X" }.keys

    matching_moves = @win_moves.select{ |k, v| v.select{ |k, v| v == "X" }.keys == keys_with_x }

    # if matching_moves.keys contains anything with wm print results
    str = matching_moves.keys.to_s
    if str =~ /wm/ #match found then...
      puts "WIN DETECTED - Human"
      puts drawgrid
      exit
    end
  end
  
  def is_a_computer_win(board)
    # all possible third moves as 'O' (computer)
    @ai_winmoves = {
      :wm01 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"O"},
      :wm02 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
      :wm03 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
      :wm04 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>"O", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm05 => {:a1=>"O", :a2=>"O", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm06 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>"O", :c3=>"O"},
      :wm07 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
      :wm08 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>"O"}
    }
    # select all values where value is X for thegrid and copy those into keys_with_x
    keys_with_o = @board.grid.select{ |k, v| v == "O" }.keys
    
    matching_moves = @ai_winmoves.select{ |k, v| v.select{ |k, v| v == "O" }.keys == keys_with_o }
    
    # if matching_moves.keys contains anything with wm print results
    test_str = matching_moves.keys.to_s
    if test_str =~ /wm/ #match found then...
      puts "WIN DETECTED - computer "+test_str
      puts drawgrid
      exit
    end
  end
  
end