require_relative '../spec_helper'

# the universe is vast and infinite....and...it is empty

describe "the game" do
  it "must output a 3x3 game grid on the CLI" do
    player_h = double('human', :player_h => "X")
    player_c = double('computer', :player_c => "O")
    game = Game.new(player_h, player_c)
    
    STDOUT.should_receive(:puts).with("\na #{$thegrid[:a1]}|#{$thegrid[:a2]}|#{$thegrid[:a3]} \n----------\nb #{$thegrid[:b1]}|#{$thegrid[:b2]}|#{$thegrid[:b3]} \n----------\nc #{$thegrid[:c1]}|#{$thegrid[:c2]}|#{$thegrid[:c3]} \n----------\n  1 2 3 \n")
    
    game.play
  end
  it "must have a human player" do
    pending "human is X"
  end
  it "must have a computer player" do
    pending "ai is O"
  end
end
