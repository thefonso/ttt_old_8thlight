  require_relative '../spec_helper'

  # the universe is vast and infinite....and...it is empty
  describe "tic tac toe game" do
    context "the game class" do
     it "method drawgrid must return a 3x3 game grid" do
        player_h = Player.new("X")
        player_c = Player.new("O")
        game = Game.new(player_h, player_c)
        game.drawgrid.should eq("\na #{$thegrid[:a1]}|#{$thegrid[:a2]}|#{$thegrid[:a3]} \n----------\nb #{$thegrid[:b1]}|#{$thegrid[:b2]}|#{$thegrid[:b3]} \n----------\nc #{$thegrid[:c1]}|#{$thegrid[:c2]}|#{$thegrid[:c3]} \n----------\n  1 2 3 \n")
        game.drawgrid
     end
     it "play method must display 3x3 game grid" do
        human = Player.new("X")
        computer = Player.new("O")
        game = Game.new(human, computer)
        STDOUT.should_receive(:puts).and_return("\na #{$thegrid[:a1]}|#{$thegrid[:a2]}|#{$thegrid[:a3]} \n----------\nb #{$thegrid[:b1]}|#{$thegrid[:b2]}|#{$thegrid[:b3]} \n----------\nc #{$thegrid[:c1]}|#{$thegrid[:c2]}|#{$thegrid[:c3]} \n----------\n  1 2 3 \n")
        game.play
      end
      it "play method must display 3x3 game grid" do
        human = Player.new("X")
        computer = Player.new("O")
        game = Game.new(human, computer)
        STDOUT.should_receive(:puts).with("computer move")
        game.play
      end
    end
  end
