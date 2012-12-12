#minimax pseudo code

require 'facets'
require_relative 'library_minimax'
require 'pry'

module Algorithm
  module Minimax 
    include LibraryMinimax
      

    def score_the_boards(board, player)
      @virtual_board_hash = {}
      @count = 0
      ply = 5
      @i = 0
      test_boards_hash = {}
      # virtual_boards_hash = generate_boards(board, player).each_key # returns virtual_boards_hash
      test_boards_hash = generate_boards(board, player)
      # p virtual_boards_hash
      scores_hash = {}
      # p "TEST_BOARD = "+test_boards_hash.to_s
      #find_win_lose_draw_scores
      test_boards_hash.each do |key, value|
        
        # p value.to_s
      
        # p "AI_WIN_MOVES "+is_a_human_win(value).to_s
        
      if is_a_computer_win(value) != nil #game continues
        if is_a_computer_win(value) == 1
          scores_hash[value] = (1000 - ply) # computer_win
          #p scores_hash[test_board]
        elsif is_a_human_win(value) == 1
          scores_hash[value] = (-1000 + ply) # human_win
          #p scores_hash[test_board] 
        else
          scores_hash[value] = 0 #no value
          #p scores_hash[test_board] 
        end
      else
        puts 'D R A W'
      end
      end
      #returns all boards
      p "SCORES HASH "+scores_hash.to_s
      return scores_hash
    end

    def go(board, player)
      @virtual_board_hash = {}
      @count = 0
      @i = 0

      p generate_boards(board, player)
    end
    
    def generate_boards(board, player)
      virtual_board = board.dup
      new_board_hash = {}
      empty_spaces = virtual_board.grid.select{ |k, v| v == " " }.keys

      empty_spaces.each do |space|
      
        cloned_board = Board.new
        cloned_board.grid = board.grid.clone

        if player == 'O'
          new_board = move_as_somebody(cloned_board, 'X', space)
          new_player = 'X'
           @virtual_board_hash[@i] = new_board.grid
        else
          new_board = move_as_somebody(cloned_board, 'O', space)
          new_player = 'O'
           @virtual_board_hash[@i] = new_board.grid
        end
        generate_boards(new_board, new_player)
        
      end
      return @virtual_board_hash
    end

    def move_as_somebody(board, player, empty_space)      
      board.grid[empty_space] = player
      @i+=1
      return board
    end

  end
end
