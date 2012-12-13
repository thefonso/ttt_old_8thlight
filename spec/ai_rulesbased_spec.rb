require 'board'
require 'game'
require 'ai_rulesbased'

class Rulesbased_Ai
  include Algorithm::Regular
end

describe 'Rulesbased Ai' do

  describe 'ai_moves' do
    before (:each) do
      @player = "X"
      @count = 0
      @ply = 2
      @board = Board.new
      @minimax = Rulesbased_Ai.new
      @board.grid[:a1] = "X"
      @board.grid[:a2] = " "
      @board.grid[:a3] = " "
      @board.grid[:b1] = " "
      @board.grid[:b2] = "O"
      @board.grid[:b3] = " "
      @board.grid[:c1] = " "
      @board.grid[:c2] = " "
      @board.grid[:c3] = "X"
    end
    it 'returns a symbol' do
      @minimax.ai_moves.is_a?(Symbol)
    end   
  end
end
