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
  describe 'find_max_answer' do
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
      minimax.find_max_answer(board).is_a?(Symbol)
    end
  end
   describe 'find_min_answer' do
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
      minimax.find_min_answer(board).is_a?(Symbol)
    end
  end
  describe 'potential_human_win_moves' do
    it 'should hold array of all moves' do
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
      minimax.potential_human_win_moves(board).should_not be_empty == []
      minimax.potential_human_win_moves(board)
    end
  end
  describe 'potential_computer_win_moves' do
    it 'should hold array of all moves' do
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
      minimax.potential_computer_win_moves(board).should_not be_empty == []
      minimax.potential_computer_win_moves(board)
    end
  end

  describe 'score' do
    it 'should score a board with a computer winning move' do
      board = Board.new
      minimax = described_class.new
      board.grid[:a1] = "O"
      board.grid[:b2] = "O"
      board.grid[:c3] = "O"
      minimax.score(board).should == 1
      minimax.score(board)
    end
    
    it 'should score a board with a human winning move' do
      board = Board.new
      minimax = described_class.new
      board.grid[:a1] = "X"
      board.grid[:b2] = "X"
      board.grid[:c3] = "X"
      minimax.score(board).should == -1
      minimax.score(board)
    end
    
  end
end
