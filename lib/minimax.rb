#require_relative 'ai'

module Algorithm
  class Minimax # I return the best_move (win or block)
    include Library # TODO namespace these methods
    
    def minmax(board)
      return max_move(board)
    end

    def max_move(board)
      ai_winmove = attempt_win(board)
      #what ply here?      
      scoreboard = {}
      scoreboard[ai_winmove] = 1000

      #compare values find greatest value
      scores = {}
      scores = scoreboard.merge(min_move(board))
      
    end

    def min_move(board)
      #what ply here?
      code_plugin = ""
      human_winmove = block_human_win(board,code_plugin)

      scoreboard = {}
      scoreboard[human_winmove] = -1000
      scoreboard
    end

  end
end
