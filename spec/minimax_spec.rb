require 'board'
require 'minimax'

describe Algorithm::Minimax do
  before (:each) do
    @ply = 7
    @board = Board.new
    @minimax = described_class.new
    @board.grid[:a1] = "X"
    @board.grid[:a2] = "X"
    @board.grid[:a3] = "O"
    @board.grid[:b1] = "O"
    @board.grid[:b2] = "O"
    @board.grid[:b3] = " "
    @board.grid[:c1] = "X"
    @board.grid[:c2] = "X"
    @board.grid[:c3] = " " 
  end
  describe 'main minmax method'do
   xit 'should return the max move for the ai'do
      @minimax.max_move(@board, @ply).is_a?(Symbol)
    end
  end
  describe 'method max_move' do
    it 'should hold array of all max and min moves'do
      @minimax.max_move(@board, @ply).is_a?(Symbol)
    end
  end
  describe 'method min_move' do
    xit 'should return array of minimum moves'do
      @minimax.min_move(@board, @ply).is_a?(Symbol)
    end
  end
 
end
