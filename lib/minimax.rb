
module Algorithm
  module Minmax # I return the best_move (win or block)
    include Library # TODO namespace these methods

    def minmax(ply, game)
      return max_move(game)
    end

    def max_move(ply, game,interger_alpha,interger_beta)
      if(game_over(game) || depth_limit_reached)
        return eval_game_state(game, max)
      else
        best_move = {}
        moves = generate_moves(game)
        moves.each do |move|
          move = min_move(apply_move(game),alpha, beta)
          if(value(move) > value(best_move))
            best_move = move
            alpha = value(move)
          end
          if(beta > alpha)
            return best_move
          end
        end
        return best_move
      end
    end
   
    def min_move(ply, game)
      if(game_over(game) || depth_limit_reached)
        return eval_game_state(game, min)
      else
        best_move = {}
        moves = generate_moves(game)
        moves.each do |move|
          move = max_move(apply_move(game),alpha, beta)
          if(value(move) > value(best_move))
            best_move = move
            beta = value(move)
          end
          if(beta < alpha)
            return best_move
          end
        end
        return best_move
      end
    end

  end
end
