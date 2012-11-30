require_relative 'library'


module Algorithm
  module Regular
    include Library #TODO come back and namespace these methods from Library
 
    def ai_moves(board)
      taken_moves = board.grid.select{ |k, v| v != " " }.keys.length

      if taken_moves == 1 
        @move = ai_first_move(board)      
      elsif board.grid[:b2] != " " and taken_moves == 3
        @move = ai_second_move(board)
      elsif board.grid[:b2] != " " and taken_moves == 5
        @move = ai_third_move(board)
      elsif board.grid[:b2] != " " and taken_moves == 7
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
    end # Intermediate Game State

    def ai_second_move(board) 
      if board.grid[:b2] == "X"
        block_human_win_defend_corners(board)
      elsif board.grid[:b2] == "O"
        block_human_win_defend_cross(board)
      end
      return @move
    end # Intermediate Game State 

    def ai_third_move(board)
      block_human_win_only(board) unless !attempt_win(board).nil?
      return @move
    end # Intermediate Game State 

    def ai_fourth_move(board)
      if board.grid[:b2] == "O"
        block_human_win_and_random_move(board) unless !attempt_win(board).nil? 
      elsif board.grid[:b2] == "X"
        block_human_win_and_random_move(board)     
      end
      return @move
    end # Intermediate Game State

    def ai_fifth_move(board)
      ai_fourth_move(board)
    end # Final Game State

  end
end
