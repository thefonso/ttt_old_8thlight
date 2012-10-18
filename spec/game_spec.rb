require 'game'

describe 'Game class' do
  describe 'drawgrid method' do
  it 'draws the game grid to the screen' do
    @player_human = Player.new('X')
    @player_computer = Player.new('O')
    @board = Board.new
    @game = Game.new(@player_human, @player_computer, @board)

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
  describe 'play method' do
    it 'draws the game grid' do
      @player_human = Player.new('X')
      @player_computer = Player.new('O')
      @board = Board.new
      @game = Game.new(@player_human, @player_computer, @board)
      
      @game.should_receive(:puts).with("\na  | |  \n----------\nb  | |  \n----------\nc  | |  \n----------\n  1 2 3\n")
      @player_human.should_receive(:puts).with("human move...")
      @player_human.stub(:gets).and_return("a1")
      
      @game.play
    end
    xit 'alternates turns 9x between human and computer'
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