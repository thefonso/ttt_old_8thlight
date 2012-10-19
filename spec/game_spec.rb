require 'game'

describe 'Game class' do
  before (:each) do
    @player_human = Player.new('X')
    @player_computer = Player.new('O')
    @board = Board.new
    @game = Game.new(@player_human, @player_computer, @board)
  end
  describe 'drawgrid method' do
  it 'draws the game grid to the screen' do
    @game.drawgrid.should == <<-EOF.gsub(/^ {6}/, '')
      
      a  | |  
      ----------
      b  | |  
      ----------
      c  | |  
      ----------
        1 2 3
      EOF
    
    end
  end
  describe 'take_turn method' do
    xit 'receives turn value' do
    end
    xit 'returns grid with moves on board' do
    end
  end
  describe 'play method' do
    it 'calls the take_turn method 9 times' do
      @game.should_receive(:take_turn).at_least(9).times
      
      @game.play
    end
  end
  describe 'does move exist' do
    xit 'receives a move and a player value'
    xit 'places move on game grid and returns marker'
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