require 'game'
require 'board'
require 'library_rulesbased'

class LibraryRulesbased
  include LibraryRulesbased 
end

describe 'library_rulesbased' do
  before (:each) do
    @library_rulesbased = LibraryRulesbased.new
    @player_human = Player.get_player('X')
    @player_computer = Player.get_player('O')
    @board = Board.new
    @game = Game.new(@player_human, @player_computer, @board)
  end
  describe 'ai_defends_corners' do
    xit 'returns a random move' do

    end
  end
  describe 'ai_takes_center' do
    xit 'returns a random move' do

    end
  end 
  describe 'defend_corners' do
    xit 'returns a random move' do

    end
  end
  describe 'defend_cross' do
    xit 'returns a random move' do

    end
  end
  describe 'random_move' do
    xit 'returns a random move' do

    end
  end
  describe 'block_human_win' do
    xit 'returns a random move' do

    end
  end
  describe 'attempt_win' do
    xit 'returns a random move' do

    end
  end
  describe 'win_loose_draw' do
    xit 'checks to see is a win, loose, or draw exist in game state' do

    end
  end

  describe 'is_a_human_win' do
    it 'receives current board, looks for human win, if win found returns...Human Wins' do
      myboard = Board.new
      myboard.grid[:a1] = "X"
      myboard.grid[:b2] = "X"
      myboard.grid[:c3] = "X"
      @library_rulesbased.should_receive(:puts).with("Human Wins")
      @library_rulesbased.is_a_human_win(myboard)
    end
  end
  describe 'is_a_computer_win' do
    xit 'receives current board, looks for computer win, if win found returns...Computer Wins' do
      myboard = Board.new
      myboard.grid[:a1] = "O"
      myboard.grid[:b2] = "O"
      myboard.grid[:c3] = "O"
      @library_rulesbased.should_receive(:puts).with("Computer Wins")
      @library_rulesbased.is_a_computer_win(myboard)
    end
  end
end

