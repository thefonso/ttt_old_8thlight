require 'board'
require 'minimax'

describe Algorithm::Minimax do
  

  describe 'best_answers' do
    it 'should return best answer' do
      board = Board.new
      minimax = described_class.new
      board.grid[:a1] = "X"
      board.grid[:a2] = "X"
      board.grid[:a3] = "O"
      board.grid[:b1] = "O"
      board.grid[:b2] = "O"
      board.grid[:b3] = " "
      board.grid[:c1] = "X"
      board.grid[:c2] = "X"
      board.grid[:c3] = " "
      minimax.best_answers(board).is_a?(Hash)
    end
  end
  describe 'max_move' do
    it 'should hold array of all moves'do
      board = Board.new
      minimax = described_class.new
      board.grid[:a1] = "X"
      board.grid[:a2] = "X"
      board.grid[:a3] = "O"
      board.grid[:b1] = "O"
      board.grid[:b2] = "O"
      board.grid[:b3] = " "
      board.grid[:c1] = "X"
      board.grid[:c2] = "X"
      board.grid[:c3] = " "
      minimax.max_move(board).is_a?(Symbol)
    end
  end
  describe 'min_move' do
    it 'should hold array of all moves'do
      board = Board.new
      minimax = described_class.new
      board.grid[:a1] = "X"
      board.grid[:a2] = "X"
      board.grid[:a3] = "O"
      board.grid[:b1] = "O"
      board.grid[:b2] = "O"
      board.grid[:b3] = " "
      board.grid[:c1] = "X"
      board.grid[:c2] = "X"
      board.grid[:c3] = " "
      minimax.min_move(board).is_a?(Symbol)
    end
  end
 
end
