require_relative '../spec_helper'

# the universe is vast and infinite....and...it is empty
describe "tic tac toe game" do
  context "the game class" do
    it "method drawgrid must return a 3x3 game grid" do
      player_h = double('human', :player_h => "X")
      player_c = double('computer', :player_c => "O")
      game = Game.new(player_h, player_c)
      game.should_receive(:drawgrid).and_return("\na #{$thegrid[:a1]}|#{$thegrid[:a2]}|#{$thegrid[:a3]} \n----------\nb #{$thegrid[:b1]}|#{$thegrid[:b2]}|#{$thegrid[:b3]} \n----------\nc #{$thegrid[:c1]}|#{$thegrid[:c2]}|#{$thegrid[:c3]} \n----------\n  1 2 3 \n")
      game.drawgrid
    end
  end
end
