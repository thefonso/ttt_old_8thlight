require_relative 'library_rulebased'


module Algorithm
  module Regular
    include LibraryRulebased #TODO come back and namespace these methods from Library
 
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
  end
end
