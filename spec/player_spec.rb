    require 'game'
    require 'board'
    # require_relative '../lib/board'
    # require_relative '../lib/game'

    describe Player do
      before (:each) do
        #Dry it up
        @player_h = Player.new('X')
        @player_c = Player.new('O')
        @board = Board.new
        @game = Game.new(@player_h, @player_c, @board) 
        # first set up my expectations         
        @player_h.should_receive(:puts).with("human move...")
        @player_h.stub(:gets).and_return("a1")

      end
      
      describe 'move_human' do
        it 'receives cli input and prints text to screen' do

          # now trigger them
          @player_h.move_human("X", @board)
        end
        it 'returns a move value' do

          # now trigger them
          @player_h.move_human("X", @board).should eq(:a1)     #return the value is what I mocked?
        end
      
      end
    end