require 'game'

describe 'Game class' do
  before (:each) do
    @player_human = Player.get_player('X')
    @player_computer = Player.get_player('O')
    @board = Board.new
    @game = Game.new(@player_human, @player_computer, @board)
  end
  describe 'drawgrid method' do
    it 'should call @board.drawgrid' do
      @board.should_receive(:printgrid)
      @game.drawgrid
    end
  end
  describe 'take_turn method' do
    xit 'draws the game grid' do
      test_value = 1
      @game.should_receive(:drawgrid).at_least(:once)
      @game.take_turn(test_value)
    end
    it 'runs game sequence' do
      test_value = 1
      @game.should_receive(:take_turn).exactly(1).times
      @game.take_turn(test_value)
    end
  end
  describe 'play method' do
    it 'calls the take_turn method 9 times' do
      @game.should_receive(:take_turn).at_least(9).times       
      @game.play
    end
  end
  describe 'is_a_human_win' do
    it 'receives current board, looks for human win, if win found returns...Human Wins' do
      myboard = Board.new
      myboard.grid[:a1] = "X"
      myboard.grid[:b2] = "X"
      myboard.grid[:c3] = "X"
      @game.should_receive(:puts).with("Human Wins")
      @game.is_a_human_win(myboard)
    end
  end
  describe 'is_a_computer_win' do
    it 'receives current board, looks for computer win, if win found returns...Computer Wins' do
      myboard = Board.new
      myboard.grid[:a1] = "O"
      myboard.grid[:b2] = "O"
      myboard.grid[:c3] = "O"
      @game.should_receive(:puts).with("Computer Wins")
      @game.is_a_computer_win(myboard)
    end
  end
end