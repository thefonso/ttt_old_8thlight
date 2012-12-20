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
end
