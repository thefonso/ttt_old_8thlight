require_relative 'player'
require_relative 'game'

board = Board.new
human = Player.new("X")
computer = Player.new("O")

game = Game.new(human, computer, board)
game.play