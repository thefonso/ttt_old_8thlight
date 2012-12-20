require 'library_minimax'
class LibraryMinimaxClass
  include LibraryMinimax 
end
require 'game'
require 'board'

describe 'library_minimax' do
  before (:each) do
    @library_minimax = LibraryMinimaxClass.new
  end

  describe 'win_loose_draw' do
    xit 'checks to see is a win, loose, or draw exist in game state' do

    end
  end
  describe 'random_move' do
    xit 'returns a random move' do

    end
  end
  describe 'is_a_human_win' do
    it 'receives current board, looks for human win, if win found returns...1' do
      myboard = Board.new
      myboard.grid[:a1] = "X"
      myboard.grid[:b2] = "X"
      myboard.grid[:c3] = "X"
      @library_minimax.is_a_human_win(myboard).should == 1
      @library_minimax.is_a_human_win(myboard)
    end
  end
  describe 'is_a_computer_win' do
    it 'receives current board, looks for computer win, if win found returns...1' do
      myboard = Board.new
      myboard.grid[:a1] = "O"
      myboard.grid[:b2] = "O"
      myboard.grid[:c3] = "O"
      @library_minimax.is_a_computer_win(myboard).should == 1
      @library_minimax.is_a_computer_win(myboard)
    end
  end
end
