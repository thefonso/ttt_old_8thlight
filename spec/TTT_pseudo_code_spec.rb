require 'board'
require 'TTT_pseudo_code'

class Pseudo_Minimax_Ai
  include Algorithm::Minimax
end


  describe 'Pseudo_Minimax_Ai' do
    before (:each) do
      @player = "X"
      @ply = 2
      @board = Board.new
      @minimax = Pseudo_Minimax_Ai.new
      @board.grid[:a1] = "X"
      @board.grid[:a2] = " "
      @board.grid[:a3] = " "
      @board.grid[:b1] = " "
      @board.grid[:b2] = "O"
      @board.grid[:b3] = " "
      @board.grid[:c1] = " "
      @board.grid[:c2] = " "
      @board.grid[:c3] = " "
    end

    describe 'score_the_boards(board, player)' do
      it 'should retrun a hash with range of answers 1000 to -1000' do
       @minimax.score_the_boards(@board, @player).is_a?(Hash)
      end
    end
    describe 'build_virtual_boards_hash(board, player)' do
      xit 'should hold array of all max moves'do
       @minimax.build_virtual_boards_hash(@board, @player).is_a?(Hash)
      end
    end
    describe 'move_as_somebody(board, player, empty_space)' do
      empty_space = :a3
      index = 'VB7'
      xit 'should return new board hash of hash'do
       @minimax.move_as_somebody(@board, @player, empty_space).is_a?(Hash)
      end
    end
  end


