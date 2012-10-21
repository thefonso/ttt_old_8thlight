require 'game'

describe 'Game class' do
  before (:each) do
    @player_human = Player.new('X')
    @player_computer = Player.new('O')
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
    it 'draws the game grid' do
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
  
  describe 'PutMoveOnBoard' do
    xit 'should put a move on the game board' do
      @game.should_receive(:grid)
      @game.PutMoveOnBoard(:a1)
    end
  end
  
  describe 'is_a_human_win' do
    xit 'receives current board'
    xit 'looks for human win'
    xit 'if win found returns WIN DETECTED'
  end
  describe 'is_a_computer_win' do
    xit 'receives current board'
    xit 'looks for computer win'
    xit 'if win found returns WIN DETECTED'
  end
end