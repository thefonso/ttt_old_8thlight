
module Algorithm
  class Minimax # I return the best_move (win or block)
    include Library # TODO namespace these methods

    def minmax(ply, board)
      return max_move(board)
    end
    
    def score(board)  # scores move as win or lose
      if is_a_computer_win(board) == 1
        return 1
      elsif is_a_human_win(board) == -1
        return -1
      end
    end

    def best_answers(board)
      best_answer = 0
      scores = {}
      scores = max_move(board).merge(min_move(board))
      p scores
      scores.each do |k,v|
        if v == 1000
          best_answer = k; break
        elsif v == -1000
          best_answer = k; break
        end
      end
      p 'BEST_ANSWER'
      p best_answer = scores.min.first
      return best_answer
    end

    def max_move(board)
      best_answer = attempt_win(board)

      scoreboard = {}
      scoreboard[best_answer] = 1000
      scoreboard
    end

    def min_move(board)
      plugin = ""
      best_move = block_human_win(board,plugin)

      scoreboard = {}
      scoreboard[best_move] = -1000
      scoreboard
    end

  end
end
