require 'game'

describe 'Game class' do
  describe 'drawgrid method'do
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
  describe 'play method'do
    xit 'draws the game grid'
    xit 'alternates turns 9x between human and computer'
  end
  describe 'does move exist'do
    xit 'receives a move and a player value'
    xit 'places move on game grid and returns marker'
  end
  describe 'is_a_human_win' do
    xit 'does stuff'
  end
  describe 'is_a_computer_win'do
    xit 'does stuff'
  end
end