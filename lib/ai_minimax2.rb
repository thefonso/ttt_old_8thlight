#minimax pseudo code

require 'facets'
require_relative 'library_minimax'
require 'pry'

module Algorithm
  module Minimax 
    include LibraryMinimax

    def minmax(board,player)
      allboards = score_the_boards(board, player)
      max_board = allboards.max_by{|k,v| v}[0]
      #p "Max board "+max_board.to_s
      min_board = allboards.min_by{|k,v| v}[0]
      #p "Min board "+min_board.to_s
      answers = (max_board.to_a - min_board.to_a).flatten
      intersect = Hash[*answers.flatten]

      max_move = intersect.select{|k,v| v == 'O'}.keys[0]
      #p min_move = intersect.select{|k,v| v == 'X'}.keys[0]
    end

    def score_the_boards(board, player)
      @count = 0
      ply = 0
      @i = 0
      test_boards_hash = {}
      test_boards_hash = generate_boards(board, player)
      scores_hash = {}
      test_boards_hash.each do |key, value|
        if is_a_computer_win(value) != nil 
          if is_a_computer_win(value) == 1
            scores_hash[value] = (1000 - ply)
          elsif is_a_human_win(value) == 1
            scores_hash[value] = (-1000 + ply)
          else
            #scores_hash[value] = 0 #no value
            #p scores_hash[test_board] 
          end
        else
          puts 'D R A W'
        end
        ply -= 5
      end
      #p "SCORES HASH "+scores_hash.to_s
      return scores_hash
    end


    def generate_boards(board, player)
      @virtual_board_hash ||= {}
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
