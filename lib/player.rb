# TODO - better WIN detection
# TODO - polymorph this

class Player

  attr_reader :thegrid
  attr_reader :boardpiece 

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

  def move_human(board)

    player_symbol = "X"

    puts "human move..."

    human_move = gets.chomp
    human_spot_to_take = human_move.to_sym
    
    if board.grid.has_key?(human_spot_to_take)
      if board.grid[human_spot_to_take] == " " 
        move = human_spot_to_take.to_sym
        # return move 
        board.grid[move] = player_symbol         
      else
        puts "spot taken...try again"
        move_human(board)
      end
    else
      puts "invalid move...try again"
      move_human(board)
    end           
  end

  def move_computer(board)
    
    puts "computer move..." 
    
    taken_moves = board.grid.select{ |k, v| v != " " }.keys.length
    p taken_moves
    
    if taken_moves == 1 
      @move = ai_first_move(board)
    elsif board.grid[:b2] != " " and taken_moves == 3
      @move = ai_second_move(board)
    elsif board.grid[:b2] != " " and taken_moves == 5
      @move = ai_third_move(board)
    else
      @move = ai_fourth_move(board)
    end
    @player_symbol = "O"
    board.grid[@move] = @player_symbol
  end
   



  def ai_first_move(board)   
    p "1st move called"
    if board.grid[:b2] == "X"
      ai_defends_corners(board)
    elsif board.grid[:b2] == " "
      ai_takes_center(board)
    end
  end
  
  def ai_second_move(board)
    p "2nd move called"    
    if board.grid[:b2] == "X"
      block_human_win_and_defend_corners(board) 
    elsif board.grid[:b2] == "O"
      block_human_win_and_defend_cross(board)
    end
    return @move
  end
  
  def ai_third_move(board)
    p "3rd move called"    
      block_human_win(board) unless !attempt_win(board).nil?
    return @move
  end
  
  def ai_fourth_move(board)
    p "4th move called"
    if board.grid[:b2] == "O"
      block_human_win_and_random_move(board) unless !attempt_win(board).nil?
    elsif board.grid[:b2] == "X"
      block_human_win_and_random_move(board)
    end
    return @move
  end
  

  
  def ai_defends_corners(board)
    p "ai_defends_corners called"
    @move = defend_corners(board)
  end
  
  def ai_takes_center(board)
    p "ai_takes_center called"
      ai_spot = "b2"
      @move = ai_spot.to_sym
  end
  
  
  #FIXME - violates do-one-thing
  def block_human_win_and_defend_corners(board)

  @block_keys_array = []
  p "block_human_win called"
    
    @keys_with_x = board.grid.select{ |k, v| v == "X" }.keys  
    
    @human_winmoves.each do |k,v| 
      human_winmoves_keys = v.select{ |k, v| v == "X"}.keys
      
      human_moves_to_block = human_winmoves_keys & @keys_with_x   
        
      if human_moves_to_block.length >= 2 #one block available       
        @block_keys_array << k 
        
        @block_keys_array.each do |key|          
          answer = @anskey[key].to_sym
            
          if board.grid[answer] != " " # spot taken
            p 'spot taken cannot block: '+answer.to_s
            defend_corners(board)
          else
            p answer.to_s+" blocked"
            @move = answer  
            return @move        
          end           
        end
      end
    end # END @human_winmoves.each do |k,v|
  end
  #FIXME - violates do-one-thing
  def block_human_win_and_defend_cross(board)
 
  @block_keys_array = []
  p "block_human_win called"
    
    @keys_with_x = board.grid.select{ |k, v| v == "X" }.keys  
    
    @human_winmoves.each do |k,v| 
      human_winmoves_keys = v.select{ |k, v| v == "X"}.keys
      
      human_moves_to_block = human_winmoves_keys & @keys_with_x   
        
      if human_moves_to_block.length >= 2 #one block available       
        @block_keys_array << k 
        
        @block_keys_array.each do |key|          
          answer = @anskey[key].to_sym
            
          if board.grid[answer] != " " # spot taken
            p 'spot taken cannot block: '+answer.to_s
            defend_cross(board)
          else
            p answer.to_s+" blocked"
            @move = answer  
            return @move        
          end           
        end
      end
    end # END @human_winmoves.each do |k,v|
  end
  
  
  
  def defend_corners(board)
    p "defend_corners called"
    answers_array = []
  
    corners = {
        :a1 => " ", :a3 => " ",
        :c3 => " ", :c1 => " "
    }
    
    available_moves = board.grid.select{ |k, v| v == " " }.keys
    corner_keys = corners.select{ |k,v| v == " "}.keys
    
    intersection = available_moves & corner_keys
    
    intersection.each do |k,v|
    
      if intersection.length >= 1
      
        answers_array << k
          
        @random_corner = intersection.sample 
        @move = @random_corner
        puts @move.to_s+" corner move"
        puts intersection.to_s+" intersects"
        return @move
      else
        p "no intersects"
        return nil
      end
    end
  end
  
  def defend_cross(board)
    p "defend_cross called"
    answers_array = []
    cross = {
        :a2 => " ", :b1 => " ",
        :b3 => " ", :c2 => " "
    }
    
    available_moves = board.grid.select{ |k, v| v == " " }.keys
    cross_keys = cross.select{ |k,v| v == " "}.keys
    
    intersection = available_moves & cross_keys
    
    intersection.each do |k,v|
    
      if intersection.length >= 1
      
        answers_array << k
          
        @random_cross = intersection.sample 
        @move = @random_cross
        puts @move.to_s+" cross move"
        puts intersection.to_s+" cross intersects"
        return @move
      else
        p "no cross intersects"
        return nil
      end
    end
  end
  
  
  def block_human_win(board)

  @block_keys_array = []
  p "block_human_win called"
    
    @keys_with_x = board.grid.select{ |k, v| v == "X" }.keys  
    
    @human_winmoves.each do |k,v| 
      human_winmoves_keys = v.select{ |k, v| v == "X"}.keys
      
      human_moves_to_block = human_winmoves_keys & @keys_with_x   
        
      if human_moves_to_block.length >= 2 #one block available       
        @block_keys_array << k 
        p '@blocks_array: '+@blocks_array.to_s 
        
        @block_keys_array.each do |key|          
          answer = @anskey[key].to_sym
            
          if board.grid[answer] != " " # spot taken
            p 'spot taken cannot block: '+answer.to_s
            
          else
            p answer.to_s+" blocked"
            @move = answer  
            return @move        
          end           
        end
      end
    end # END @human_winmoves.each do |k,v|
  end
  
  def attach_to_human(board)
    p "attach_to_human called"
    @board = board
    
    available_moves = board.grid.select{ |k, v| v == " " }.keys
    
    next_to_human = available_moves.find_all { |cell_location|
      case cell_location
      when :a1
        board.grid[:a2] == 'X' or board.grid[:b1] == 'X'
      when :a2
        board.grid[:a1] == 'X' or board.grid[:a3] == 'X' 
      when :a3
        board.grid[:a2] == 'X' or board.grid[:b3] == 'X'
      when :b1
        board.grid[:a1] == 'X' or board.grid[:c1] == 'X'
      when :b3
        board.grid[:a3] == 'X' or board.grid[:c3] == 'X'
      when :c1
        board.grid[:b1] == 'X' or board.grid[:c2] == 'X' 
      when :c2
        board.grid[:c1] == 'X' or board.grid[:c3] == 'X'
      when :c3
        board.grid[:c2] == 'X' or board.grid[:b3] == 'X'
      end
    }
    @move = next_to_human.sample
    return @move
  end
 
  def attempt_win(board)
    p "attempt_win called"
    @board = board
    @keys_with_o = board.grid.select{ |k, v| v == "O" }.keys
    
    @answers_array = []
    
    @ai_winmoves.each do |k, v| 
      ai_keys = v.select{ |k, v| v == "O"}.keys # grab all computer player's Os from the value hash
      
      intersection = ai_keys & @keys_with_o 
     
      if intersection.length >=2 # two intersections mean two O's are on the board
        
        @answers_array << k 

        @answers_array.each do |key|

          answer = @anskey[key].to_sym
        
          if board.grid[answer] == " " #if win move space is empty take it
            p answer.to_s+" win move"
            @move = answer                          
          else
            return nil
          end
        end
      end
    end # END @ai_winmoves.each do |k,v|
    return @move 
  end
  
 

  #FIXME - violates do-one-thing
  def block_human_win_and_random_move(board)

  @block_keys_array = []
  p "block_human_win called"
  # TODO - if all block_array values not empty return nil
    
    @keys_with_x = board.grid.select{ |k, v| v == "X" }.keys  
    
    @human_winmoves.each do |k,v| 
      human_winmoves_keys = v.select{ |k, v| v == "X"}.keys
      
      human_moves_to_block = human_winmoves_keys & @keys_with_x   
      # p 'human_moves_to_block: '+human_moves_to_block.to_s
        
      if human_moves_to_block.length >= 2 #one block available       
        @block_keys_array << k 
        
        @block_keys_array.each do |key|          
          answer = @anskey[key].to_sym
            
          if board.grid[answer] != " " 
            p 'spot taken cannot block: '+answer.to_s
            random_move(board)
          else
            p answer.to_s+" blocked"
            @move = answer  
            return @move        
          end           
        end
      end
    end # END @human_winmoves.each do |k,v|
  end

  def random_move(board)
    p 'random_move called'
    open_spaces_on_board = board.grid.select{ |k, v| v == " " }.keys
    @move = open_spaces_on_board.sample
    return @move
  end
  
end