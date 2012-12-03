
module Algorithm
  class Minimax # I return the best_move (win or block)
    include Library # TODO namespace these methods

    def minimax(board)
      turn_number = board.grid.select{ |k, v| v != " " }.keys.length
      # receive board...is the game over? check for conditions...
      # - if the game is a draw
      # - if the game is_a_human_win
      # - if the game is_a_computer_win
      #
      # if not won then return max_move

      return max_move(board, turn_number).max_by{|k,v|v}[0] # returns bestmove in hash
    end

    def max_move(board, turn_number)
      ply = turn_number
      virtual_board = board.dup
      available_moves = virtual_board.grid.select{ |k, v| v == " " }.keys
      scoreboard_hash = {}
      ai_score = {}
      human_score = {}
      code_plugin = ""
      # make move on board to build the stack
      #
      # loop - plays virtual_board move...looks for potenial win...scores move...
      available_moves.each do
        ai_winmove = attempt_win(virtual_board)
        human_winmove = block_human_win(virtual_board, code_plugin)

        if ai_winmove != nil && ply == 1 #ai win in one move
          ai_score[ai_winmove] = 1000
          ai_score 
        elsif ai_winmove != nil && ply >= 2
          ai_score[ai_winmove] = (1000 - ply)
          ai_score 
        end

        if human_winmove != nil && ply == 1 #human win in one move
          human_score[human_winmove] = -1000
          human_score
        elsif human_winmove != nil && ply >= 2
          human_score[human_winmove] = (-1000 + ply)
          human_score
        end
        scoreboard_hash = ai_score.merge(human_score)
      end

      # TODO compare values find greatest value, assign to best_move, return best move
      # scoreboard_hash = scoreboard.merge(min_move(board, ply))
       p scoreboard_hash

      return scoreboard_hash
    end

    def min_move(board, ply)
      code_plugin = ""
      human_winmove = block_human_win(board,code_plugin)

      score = {}
      score[human_winmove] = -1000
      p score
      return score
    end

  end
end
