require 'board'
require 'minimax'

describe Algorithm::Minimax do
  
  describe 'score' do
    it 'should score a board with a computer winning move' do
      board = Board.new
      minimax = described_class.new
      board.grid[:a1] = "O"
      board.grid[:b2] = "O"
      board.grid[:c3] = "O"
      minimax.score(board).should == 1
      # minimax.should_receive(:puts).with("Computer Wins").and_return('1')
      minimax.score(board)
    end
    
    it 'should score a board with a human winning move' do
      board = Board.new
      minimax = described_class.new
      board.grid[:a1] = "X"
      board.grid[:b2] = "X"
      board.grid[:c3] = "X"
      # minimax.score(board).should == -1
      minimax.should_receive(:puts).with("Human Wins").and_return('-1')
      minimax.score(board)
    end
    
  end
end