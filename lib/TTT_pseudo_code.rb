#minimax pseudo code

require 'facets'
require_relative 'library_minimax'
require 'pry'

module Algorithm
  module Minimax 
    include LibraryMinimax
      
    def initialize
      @@virtual_board_hash = {}
      @@count = 0
    end

    def score_the_boards(board, player)

      # virtual_boards_hash = generate_boards(board, player).each_key # returns virtual_boards_hash
      virtual_boards_hash = generate_boards(board, player).select{ |k, v| v }.values
      p "VALUES "+virtual_boards_hash.to_s
      scores_hash = {}

      #find_win_lose_draw_scores
      virtual_boards_hash.each do |test_board|

        p "TEST_BOARD "+test_board.to_s
        p "AI_WIN_MOVES "+is_a_computer_win(test_board).to_s

        if is_a_computer_win(test_board) != nil #game continues
          if is_a_computer_win(test_board) == 1
            scores_hash[test_board] = (1000 - ply) # computer_win
            p scores_hash[test_board]
          elsif is_a_human_win(test_board) == 1
            scores_hash[test_board] = (-1000 + ply) # human_win
            p scores_hash[test_board] 
          else
            scores_hash[test_board] = 0 #no value
            p scores_hash[test_board] 
          end
        else
          puts 'D R A W'
        end
      end
      #returns all boards
      p scores_hash
      return scores_hash
    end


    #builds hash of hashes of fake boards
    def generate_boards(board, player, count)
      i = count
      virtual_board = board.dup
      index_mark = "vb"+i.to_s

      new_board_hash = {}
      
      empty_spaces = virtual_board.grid.select{ |k, v| v == " " }.keys

      empty_spaces.each do |space|
      
        cloned_board = Board.new
        cloned_board.grid = board.grid.clone
        if player == 'O'
          new_board = move_as_somebody(cloned_board, 'X', space)
          new_player = 'X'
          new_board_hash = new_board_hash.merge(new_board.grid)
        else
          new_board = move_as_somebody(cloned_board, 'O', space)
          new_player = 'O'
          new_board_hash = new_board_hash.merge(new_board.grid)
        end
        generate_boards(new_board, new_player, i+=1)
        p @@virtual_board_hash = new_board_hash.merge(new_board_hash)
        # @@virtual_board_hash = new_board_hash.store(index_mark, generate_boards(new_board, new_player, i+=1))
      end
      return @@virtual_board_hash
    end



    def move_as_somebody(board, player, empty_space)      
      board.grid[empty_space] = player
      return board
    end

  end
end
