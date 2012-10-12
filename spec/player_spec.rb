require 'game'
require 'board'

describe 'Player class' do  
  before (:each) do
    #Dry it up
    @player_h = Player.new('X')
    @player_c = Player.new('O')
    @board = Board.new
    @game = Game.new(@player_h, @player_c, @board)
  end

  describe 'move_human' do
    before (:each) do
      # first set up my expectations         
      @player_h.should_receive(:puts).with("human move...")
      @player_h.stub(:gets).and_return("a1")
    end
    it 'receives cli input and prints text to screen' do
      # now trigger them
      @player_h.move_human("X", @board)
    end
    it 'returns a move value' do
      # now trigger them
      @player_h.move_human("X", @board).should eq(:a1)     #return the value is what I mocked?
    end     
  end

  describe 'move_computer' do
    it 'should print - ...computer move... - to screen' do
      # first set up my expectations
      @player_c.should_receive(:puts).with("computer move...")
      # now trigger them
      @player_c.move_computer("O", @board)
    end
    it 'returns a value' do
      # first set up my expectations
      @player_c.stub(:get).and_return()
      # now trigger them
      # @player_c.move_computer("O", @board)
    end
  end
  
  describe 'attempt_win' do
    xit 'checks for a win move'
  end
  
  describe 'attempt_block'do
    xit 'looks for a block move'
  end
end