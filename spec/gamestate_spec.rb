  require 'gamestate'
  require 'board'
  require 'game'

  describe 'Gamestate module method' do
    before (:each) do
      @player_human = Player.get_player('X')
      @player_computer = Player.get_player('O')    
    end
    describe 'is_a_human_win' do
      it 'receives current board if win found returns...Human Wins' do
        class GamestateTester
          include ::GameState
        end
        human_win_test = GamestateTester.new
        myboard = Board.new
        myboard.grid[:a1] = "X"
        myboard.grid[:b2] = "X"
        myboard.grid[:c3] = "X"
        human_win_test.should_receive(:puts).with("Human Wins").and_return('1')
        human_win_test.is_a_human_win(myboard)
      end
    end
    describe 'is_a_computer_win' do
      it 'receives current board if win found returns...Computer Wins' do
        class GamestateTester
          include ::GameState
        end
        computer_win_test = GamestateTester.new
        myboard = Board.new
        myboard.grid[:a1] = "O"
        myboard.grid[:b2] = "O"
        myboard.grid[:c3] = "O"

        computer_win_test.should_receive(:puts).with("Computer Wins").and_return('-1')
        computer_win_test.is_a_computer_win(myboard)
      end
    end
  end