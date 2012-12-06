require_relative 'library'

module Algorithm
  module Minimax 
    include Library 
    # max_move-find winningest Computer move, scores it, add it to answer hash
    # min_move-find winningest Human move,    scores it, add it to answer hash
    def ai_moves(board)
      turn_number = board.grid.select{ |k, v| v != " " }.keys.length

      move = max_move(board, turn_number)
      if turn_number != 9 && move != {}
        best_move = move.max_by{|k,v|v}[0]
        board.grid[best_move] = @player_symbol 
      else
        win_lose_draw(board)
      end

    end

    def max_move(board, turn_number)
      ply = turn_number
      virtual_board = board.dup
      available_moves = virtual_board.grid.select{ |k, v| v == " " }.keys
      scoreboard_hash = {}
      ai_score = {}

      available_moves.each do
      ai_winmove = attempt_win(virtual_board) #suspect

      if ai_winmove == nil && ply == 1
        ai_winmove = ai_first_move(virtual_board)
        ai_score[ai_winmove] = 1000
        ai_score
      elsif ai_winmove == nil && ply >= 2
        ai_winmove = ai_second_move(virtual_board)
        ai_score[ai_winmove] = 1000
        ai_score
      end

      if ai_winmove != nil && ply == 1 #ai win in one move
        ai_score[ai_winmove] = 1000
        ai_score 
      elsif ai_winmove != nil && ply >= 2
        ai_score[ai_winmove] = (1000 - ply)
        ai_score
      end

      ai_min_move = min_move(virtual_board, ply)  # grab the human max moves...the computer min_move

      scoreboard_hash = ai_score.merge(ai_min_move)
     end

      #p scoreboard_hash
      best_answer = scoreboard_hash
      return best_answer
    end

    def min_move(board, ply)
      human_score = {}
      code_plugin = ""
      human_winmove = block_human_win(board, code_plugin)

      if human_winmove != nil && ply == 1 #human win in one move
        human_score[human_winmove] = -1000
        human_score
      elsif human_winmove != nil && ply >= 2
        human_score[human_winmove] = (-1000 + ply)
        human_score
      end

     return human_score
    end

  end
end
