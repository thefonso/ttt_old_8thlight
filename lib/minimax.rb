require_relative 'library_minimax'
require 'pry'

module Algorithm
  module Minimax 
    include LibraryMinimax

    def ai_moves(board)
      real_board = board
      turn_number = 1
      best_move_virtual_board = minimax(board,turn_number)#returns a best_move_virtual_board based on real board input
      if best_move_virtual_board != nil
        if best_move_virtual_board == 1
          puts 'Computer Wins'
        elsif best_move_virtual_board == -1
          puts 'Human Wins'
        elsif best_move_virtual_board == 0
          puts 'D R A W'
        end
      else
        best_move = best_move_virtual_board & real_board
      end
      return best_move
    end

    def minimax(board, turn_number)
      ply = turn_number
      virtual_board = board.dup
      spaces_on_virtual_board = virtual_board.grid.select{ |k, v| v == " " }.keys

      scoreboard_hash = {}
      ai_score = {}

      # take first empty space...put move on board...send board back via recursive loop
      # check for win

      result = win_lose_draw(board)
      # if result == nil # game is not over
      if ply != 10

        spaces_on_virtual_board.each do |turn|
          puts "TURN "+turn.to_s
          minimax(virtual_board,(ply+1))
        end

        p "AI SCORE "+ai_score.to_s #when loop ends return stack_hash
        return ai_score
      elsif result == 1
        return 1 # Computer win
      elsif result == -1
        return -1 # Human win
      elsif result == 0
        return 0
      end
    end
    
    def generate_board(board, ply)
      #STEP 1 - receive a board
      #STEP 2 - place a move on the board
      #STEP 3 - return the new board
      turn = ply

      @player_symbol = 'X'
      empty_spaces_on_board = board.grid.select{ |k, v| v == " " }.keys
      answer = empty_spaces_on_board[0].to_sym
      board.grid[answer] = @player_symbol
      return board.grid[answer]
    end

  end
end
