    require 'game'
    require 'board'
    # require_relative '../lib/board'
    # require_relative '../lib/game'

    describe Player do
      describe 'move_human' do
        it 'receives cli input' do
          player_h = Player.new('X')
          player_c = Player.new('O')
          board = Board.new
          game = Game.new(player_h, player_c, board) 
          # first set uo my expectations         
          player_h.stub(:gets).and_return("a1")
          player_h.should_receive(:puts).with("human move...")
          # now trigger them
          player_h.move_human("X", board)
        end
        xit 'and returns a move value'
        
      end
    end