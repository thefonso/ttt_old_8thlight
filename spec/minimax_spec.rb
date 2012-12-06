require 'board'
require 'minimax'

class Test_Minimax_Ai
  include Algorithm::Minimax
end


  describe 'Test_Minimax_Ai' do
    before (:each) do
      @ply = 7
      @board = Board.new
      @minimax = Test_Minimax_Ai.new
      @board.grid[:a1] = "X"
      @board.grid[:a2] = "X"
      @board.grid[:a3] = " "
      @board.grid[:b1] = "O"
      @board.grid[:b2] = "O"
      @board.grid[:b3] = " "
      @board.grid[:c1] = "O"
      @board.grid[:c2] = "X"
      @board.grid[:c3] = "X" 
    end
    describe 'ai_move method'do
     it 'should return the max move for the ai'do
       @minimax.ai_moves(@board).is_a?(Symbol)
      end
    end
    describe 'max_move method' do
      it 'should hold array of all max and min moves'do
       @minimax.max_move(@board, @ply).is_a?(Symbol)
      end
    end
    describe 'min_move method' do
      it 'should return array of minimum moves'do
        @minimax.min_move(@board, @ply).is_a?(Symbol)
      end
    end
  end

