#minimax pseudo code

require 'facets'
require_relative 'library_minimax'
require 'pry'

module Algorithm
  module Minimax 
    include LibraryMinimax



    def score_the_boards(board, player)

      # virtual_boards_hash = build_virtual_boards_hash(board, player).each_key # returns virtual_boards_hash
      virtual_boards_hash = build_virtual_boards_hash(board, player).select{ |k, v| v }.values
      p "VALUES "+virtual_boards_hash.to_s
      scores_hash = {}

      #find_win_lose_draw_scores
      virtual_boards_hash.each do |test_board|
        p "TEST_BOARD "+test_board.to_s
        if ai_win_moves(test_board) != nil #game continues
          if ai_win_moves(test_board) == 1
            scores_hash[test_board] = (1000 - ply) # computer_win
            p scores_hash[test_board]
          elsif human_win_moves(test_board) == 1
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



    #builds hash of hash of fake boards
    def build_virtual_boards_hash(board, player)
      virtual_board = board.dup
      i = 0
      virtual_board_hash = {}
      new_board_hash = {}
      
      empty_spaces_on_board = virtual_board.grid.select{ |k, v| v == " " }.keys
      
      
      while i < empty_spaces_on_board.length do
        empty_space_symbol = empty_spaces_on_board[i]
        index_mark = 'VB'+i.to_s
                  
        new_board_hash = {index_mark => move_as_somebody(board, player, empty_space_symbol).grid}
                
        virtual_board_hash = virtual_board_hash.merge(new_board_hash)        

        i += 1
      end
      return virtual_board_hash
    end



    #takes board....returns new board
    def move_as_somebody(board, player, empty_space)
      new_board = board
      if player == 'X'
        new_board.grid[empty_space] = player
      else
        player == 'O'
        new_board.grid[empty_space] = player
      end
      return new_board
    end

  end
end
