# TODO - better WIN detection
# TODO - polymorph this

class Player

  attr_reader :boardpiece # i exist so game.rb can read me

  def initialize(letter)
    @boardpiece = letter
    @ai_winmoves = {
        :wm01 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm02 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm03 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm04 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm05 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm06 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
        :wm07 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
        :wm08 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"O"},
        #check those corners
        :wm09 => {:a1=>"O", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm10 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm11 => {:a1=>" ", :a2=>"O", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm12 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm13 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>"O"},
        :wm14 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>"O"},
        :wm15 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>"O", :c3=>" "},
        :wm16 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
        #check opposites
        :wm17 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
        :wm18 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
        :wm19 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"O"},
        :wm20 => {:a1=>"O", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm21 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm22 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"O"},
        :wm23 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>"O"},
        :wm24 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
        #check crazy
        :wm25 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
        :wm26 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm27 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"O"},
        :wm28 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},            
        :wm29 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
        :wm30 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
        :wm31 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
        :wm32 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>"O", :c3=>" "},
        :wm33 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm34 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm35 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
        :wm36 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"O"},
        :wm37 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm38 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm39 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>"O", :c2=>" ", :c3=>" "},
        :wm40 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>"O", :c3=>" "}
    }
    
    @human_winmoves = {
        :wm01 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm02 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm03 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm04 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm05 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm06 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>" "},
        :wm07 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>" "},
        :wm08 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"X"},
        #check those corners
        :wm09 => {:a1=>"X", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm10 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm11 => {:a1=>" ", :a2=>"X", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm12 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm13 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>"X"},
        :wm14 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>"X"},
        :wm15 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>"X", :c3=>" "},
        :wm16 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>" "},
        #check opposites
        :wm17 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>" "},
        :wm18 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>" "},
        :wm19 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"X"},
        :wm20 => {:a1=>"X", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm21 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm22 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"X"},
        :wm23 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>"X"},
        :wm24 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>" "},
        #check crazy
        :wm25 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>" "},
        :wm26 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm27 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"X"},
        :wm28 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>" "},            
        :wm29 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>" "},
        :wm30 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>" "},
        :wm31 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>" "},
        :wm32 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>"X", :c3=>" "},
        :wm33 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm34 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm35 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>" "},
        :wm36 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"X"},
        :wm37 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm38 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>" "},
        :wm39 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>"X", :c2=>" ", :c3=>" "},
        :wm40 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>"X", :c3=>" "}
    }
    
    @anskey={
        :wm01=>"c3",:wm02=>"c2",:wm03=>"c1",:wm04=>"b3",:wm05=>"b1",:wm06=>"a3",:wm07=>"a2",:wm08=>"a1",
        :wm09=>"a3",:wm10=>"c1",:wm11=>"a1",:wm12=>"c3",:wm13=>"c3",:wm14=>"c1",:wm15=>"c3",:wm16=>"a1",
        :wm17=>"b1",:wm18=>"b2",:wm19=>"b3",:wm20=>"a2",:wm21=>"b2",:wm22=>"b2",:wm23=>"c2",:wm24=>"b2",
        :wm25=>"a1",:wm26=>"a1",:wm27=>"a3",:wm28=>"a3",:wm29=>"c1",:wm30=>"c1",:wm31=>"c3",:wm32=>"c3",
        :wm33=>"a1",:wm34=>"a1",:wm35=>"c1",:wm36=>"c1",:wm37=>"a3",:wm38=>"a3",:wm39=>"c3",:wm40=>"c3"
    }
  end

  def move_human(gamepeice, board)
    @human_gamepeice = gamepeice

    puts "human move..."

    human_move = gets.chomp
    human_spot_to_take = human_move.to_sym
    
    if board.grid.has_key?(human_spot_to_take)
      if board.grid[human_spot_to_take] == " " 
        @move = human_spot_to_take            
      else
        puts "spot taken...try again"
        move_human(@human_gamepeice, board)
      end
    else
      puts "invalid move...try again"
      move_human(@human_gamepeice, board)
    end           
  end
  
  def move_computer(gamepeice, board)
    # 0.can you win
    # 1.can you block
    # 2.can you defend corners
    @computer_gamepeice = gamepeice
    
    puts "computer move..."
    
    # something ran here returns a move_value
    # computer_spot_to_take = move_value
    
    if board.grid[:b2] == " "
      ai_spot = "b2"
      @move = ai_spot.to_sym
    #elsif board.grid[computer_spot_to_take] != " "
    # do what ???
    else
      # FIXME - Ai attempts win...smelly code here
      i = 0
      until i == 4
         
        i = i+1 
          attempt_block(board)
          attempt_win(board)
      end
      # FIXME - Ai attempts win...smelly code here
    end    
    return @move if attempt_win(board) # is true
  end      
  
  def attempt_win(board)
    
    @keys_with_o = board.grid.select{ |k, v| v == "O" }.keys
    
    @answers_array = [] # initialize answers array
    
    @ai_winmoves.each do |k, v| # go through each win move in the ai_winmoves array above.         
      ai_keys = v.select{ |k, v| v == "O"}.keys # grab all computer player's Os from the value hash
      
      intersection = ai_keys & @keys_with_o 
      # get common elements between two arrays..note: keys_with_o = all current O's on game board
      if intersection.length >=2 # when two intersections exist it means two O's are on the board
        
        @answers_array << k # add to answers array per iteration

        @answers_array.each do |key|

          answer = @anskey[key].to_sym
        
          if board.grid[answer] == " " #if win move space is empty take it
            puts answer.to_s+" win move"
            @move = answer              
          else #check for a block move  
            # attempt_block    # handled at line 162               
          end
        end
      end
    end # END @ai_winmoves.each do |k,v|
    return @move 
  end
  
  def defend_corners(move, board)
    @corners = {
        :a1=>" ", :a3=>" ",
        :c1=>" ", :c3=>" "
    }
    @space_to_take = move
    @board = board
    
    if @board.grid[@space_to_take] != " "
      if @board.grid[:b2] == "X"
        # defend corners
        available_moves = @corners.select{ |k, v| v == " " }.keys
        puts "random move - corners"
        @move = available_moves[rand(available_moves.length)]
      else
        available_moves = @board.grid.select{ |k, v| v == " " }.keys
        puts "random move - any space"
        @move = available_moves[rand(available_moves.length)]
      end
      
      puts "random move - game.rb"
      @board.grid[@move] = @marker

    # elsif @board.grid[@space_to_take] != " " and  @player_letter == "X" # space taken and player human...this should not be here
    #   #spot taken try again
    #   @clear_old_move = gets.chomp
    #   @board.grid[@clear_old_move.to_sym] = @marker
    else
      @board.grid[@move.to_sym] = @marker
    end
    return @marker
  end
  
  def attempt_block(board)
    puts "running attempt_block..."
    @keys_with_x = board.grid.select{ |k, v| v == "X" }.keys 
    
    @blocks_array = [] # initialize blocks array
    
    @human_winmoves.each do |k,v| # for test - go threw each win moves.
      
      human_keys = v.select{ |k, v| v == "X"}.keys
      
      intersection = human_keys & @keys_with_x   # get common elements between two arrays  
      if intersection.length >= 2

        @blocks_array << k # adds a key per iteration

        @blocks_array.each do |key|

          answer = @anskey[key].to_sym

                     
          if board.grid[answer] != " " # spot taken
            puts "space taken can not block: " + answer.to_s 
          else
            puts answer.to_s+" blocked"
            @move = answer          
          end
        end
      end
    end # END @human_winmoves.each do |k,v|
    return @move
  end
end