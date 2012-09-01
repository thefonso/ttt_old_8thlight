require_relative '../spec_helper'

# the universe is vast and infinite...it contains a game.... but no players
describe "tic tac toe game" do
  context "the player class" do
    it "must have a human player X"do
      player = Player.new()
      STDOUT.should_receive(:puts).with("human move")
      player.stub(:gets).and_return("")
      player.move_human("X")
    end
    it "must have a computer player O" do
      player = Player.new()
      STDOUT.should_receive(:puts).with("computer move")
      player.stub(:gets).and_return("")
      player.move_computer("O")
    end
  end
end
