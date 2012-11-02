require_relative 'player'

class Computer < Player
  
  
  def move(board)
    
    puts "computer move..." 
    
    taken_moves = board.grid.select{ |k, v| v != " " }.keys.length
  
    if taken_moves == 1 
      @move = ai_first_move(board)      
    elsif board.grid[:b2] != " " and taken_moves == 3
      @move = ai_second_move(board)
    elsif board.grid[:b2] != " " and taken_moves == 5
      @move = ai_third_move(board)
    elsif board.grid[:b2] != " " and taken_moves == 6
      @move = ai_fourth_move(board)
    else
      @move = ai_fifth_move(board)
    end
    board.grid[@move] = @player_symbol    
  end


  def ai_first_move(board)
    if board.grid[:b2] == "X"
      ai_defends_corners(board)
    elsif board.grid[:b2] == " "
      ai_takes_center(board)
    end
  end
  
  def ai_second_move(board) 
    if board.grid[:b2] == "X"
      block_human_win_defend_corners(board)
    elsif board.grid[:b2] == "O"
      block_human_win_defend_cross(board)
    end
    return @move
  end
  
  def ai_third_move(board)
      block_human_win_only(board) unless !attempt_win(board).nil?
    return @move
  end
  
  def ai_fourth_move(board)
    if board.grid[:b2] == "O"
      block_human_win_and_random_move(board) unless !attempt_win(board).nil? 
    elsif board.grid[:b2] == "X"
      block_human_win_and_random_move(board)     
    end
    return @move
  end
  
  def ai_fifth_move(board)
    ai_fourth_move(board)
  end
  
  
  
  
  def block_human_win_defend_corners(board)
    @code_plugin = defend_corners(board)
    block_human_win(board, @code_plugin)
  end
  
  def block_human_win_defend_cross(board)
    @code_plugin = defend_cross(board)
    block_human_win(board, @code_plugin)
  end
  
  def block_human_win_only(board)
    @code_plugin = ""
    block_human_win(board, @code_plugin)
  end
  
  def block_human_win_and_random_move(board)
    @code_plugin = random_move(board)
    block_human_win(board, @code_plugin)
  end
  
  def ai_defends_corners(board)
    @move = defend_corners(board)
  end
  
  def ai_takes_center(board)
      ai_spot = "b2"
      @move = ai_spot.to_sym
  end

    
  
  def defend_corners(board)
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

        return @move
      else

        return nil
      end
    end
  end
  
  def defend_cross(board)
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

        return @move
      else
        return nil
      end
    end
  end
  
  def random_move(board)
    open_spaces_on_board = board.grid.select{ |k, v| v == " " }.keys
    @move = open_spaces_on_board.sample
    return @move
  end

  
  
  def block_human_win(board, code_plugin)

  @block_keys_array = []
    
    @keys_with_x = board.grid.select{ |k, v| v == "X" }.keys  
    
    @human_winmoves.each do |k,v| 
      human_winmoves_keys = v.select{ |k, v| v == "X"}.keys
      
      human_moves_to_block = human_winmoves_keys & @keys_with_x   
        
      if human_moves_to_block.length >= 2 #one block available       
        @block_keys_array << k 
        
        
        @block_keys_array.each do |key|          
          answer = @anskey[key].to_sym
                     
          if board.grid[answer] != " " 
            
            code_plugin
          else
            
            @move = answer  
            return @move        
          end           
        end
      end
    end
  end
 
  def attempt_win(board)

    @answers_array = []
    @board = board
    @places_on_board_with_o = board.grid.select{ |k, v| v == "O" }.keys
        
    @ai_winmoves.each do |key, value|
      
      ai_winmoves_keys_with_o_detected = value.select{ |key, value| value == "O"}.keys
      
      intersection = ai_winmoves_keys_with_o_detected & @places_on_board_with_o
      
      if intersection.length >=2 # two O's on board
        
        @answers_array << key 

        @answers_array.each do |key|

          answer = @anskey[key].to_sym
        
          if board.grid[answer] == " "
            
            @move = answer
            return @move
          else
            @move = nil
          end
        end
      else
        @move = nil
      end
    end
    
    return @move  
  end
  
end
