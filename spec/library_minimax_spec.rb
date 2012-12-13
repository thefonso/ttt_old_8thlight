require 'game'
require 'board'
require 'library_minimax'

class LibraryMinimax
  include LibraryMinimax 
end

describe 'library_minimax' do
  before (:each) do
    @library_minimax = LibraryMinimax.new
    @player_human = Player.get_player('X')
    @player_computer = Player.get_player('O')
    @board = Board.new
    @game = Game.new(@player_human, @player_computer, @board)
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
    it 'receives current board, looks for human win, if win found returns...Human Wins' do
      myboard = Board.new
      myboard.grid[:a1] = "X"
      myboard.grid[:b2] = "X"
      myboard.grid[:c3] = "X"
      @library_minimax.should_receive(:puts).with("Human Wins")
      @library_minimax.is_a_human_win(myboard)
    end
  end
  describe 'is_a_computer_win' do
    xit 'receives current board, looks for computer win, if win found returns...Computer Wins' do
      myboard = Board.new
      myboard.grid[:a1] = "O"
      myboard.grid[:b2] = "O"
      myboard.grid[:c3] = "O"
      @game.should_receive(:puts).with("Computer Wins")
      @game.is_a_computer_win(myboard)
    end
  end
end