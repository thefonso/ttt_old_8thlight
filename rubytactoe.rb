require_relative 'player'
#
#Just a Tic Tac Toe game class
class Game 
  #initial values
  #globals listed here
  ##
  attr_reader :win_moves
  attr_reader :thegrid
  attr_reader :gamegrid

  
  #create players
  def initialize(player_h, player_c)
    #bring into existence the board and the players
    @player_h = player_h
    @player_c = player_c
  
    $thegrid = {
        :a1=>" ", :a2=>" ", :a3=>" ",
        :b1=>" ", :b2=>" ", :b3=>" ",
        :c1=>" ", :c2=>" ", :c3=>" "
    }
    #make a global var for drawgrid used by player
    $gamegrid = drawgrid
  
  end

  ##
  #display grid on console
  # TODO make this RETURN and not PUTS
  def drawgrid
    
    board = "\n"
    board << "a #{$thegrid[:a1]}|#{$thegrid[:a2]}|#{$thegrid[:a3]} \n"
    board << "----------\n"
    board << "b #{$thegrid[:b1]}|#{$thegrid[:b2]}|#{$thegrid[:b3]} \n"
    board << "----------\n"
    board << "c #{$thegrid[:c1]}|#{$thegrid[:c2]}|#{$thegrid[:c3]} \n"
    board << "----------\n"
    board << "  1 2 3 \n"
    return board
    
  end

  ##
  #start the game here
  def play
    #draw the board
    # drawgrid
    #FIXME make me drawgrid's return value
    puts drawgrid
    
    #make a move
    turn = 0

    9.times do
      if turn.even?
        #TODO check for a win by X...if win then exit game
        @player = @player_h.move_human("X")
        @move = @player.to_sym
        @marker = @player_h.boardpiece
        
        does_move_exist(@move,@marker)
        is_a_human_win
        # puts drawgrid
      else
        #TODO check for a win by O...if win then exit game
        @player = @player_c.move_computer("O")
        @move = @player.to_sym
        puts "9x loop symbol value"
        puts @move
        puts "symbol inside 9x loop:"
        puts @move.is_a?(Symbol)
        @marker = @player_c.boardpiece
        
        does_move_exist(@move,@marker)
        is_a_computer_win
        # puts drawgrid
      end

     puts drawgrid
     # reset gamegrid value
     # $gamegrid = drawgrid
     
     turn += 1
     puts "turn: "
     puts turn
    end
  end

  def does_move_exist(move,letter) # FIXME - what am I returning?
    @symbol = move
    @marker_two = letter
    if $thegrid[@symbol] != " " and  @marker_two == "O"
      puts "@symbol value in does_move_exist"
      puts @symbol
      puts "Spot taken...ai...trying again"
      # scan board for available moves...
      available_moves = $thegrid.select{ |k, v| v == " " }.keys
      puts "random move"
      @move = available_moves[rand(available_moves.length)]
      puts @move
      #return this move on the board
      $thegrid[@move] = @marker
    elsif $thegrid[@symbol] != " " and  @marker_two == "X"
      puts "Spot taken...human...try again"
      #clear old move, make new move
      @move = gets.chomp
      # does_move_exist(@move,@marker_two)
      #return this move on the board
      $thegrid[@move.to_sym] = @marker
    else
      #return this move on the board
      puts "does_move_exist..says spot available..."
      $thegrid[@move.to_sym] = @marker
    end
  end

  def is_a_human_win
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
    keys_with_x = $thegrid.select{ |k, v| v == "X" }.keys

    matching_moves = @win_moves.select{ |k, v| v.select{ |k, v| v == "X" }.keys == keys_with_x }

    # if matching_moves.keys contains anything with wm print results
    str = matching_moves.keys.to_s
    if str =~ /wm/ #match found then...
      puts "WIN DETECTED - Human" #TODO - which player won?
      puts drawgrid
      exit
    end
  end
  
  def is_a_computer_win
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
    keys_with_o = $thegrid.select{ |k, v| v == "O" }.keys
    
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



player_h = Player.new("X")
player_c = Player.new("O")



game = Game.new(player_h, player_c)
game.play

