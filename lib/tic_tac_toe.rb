require_relative 'player'
require_relative 'game'

board = Board.new
player_h = Player.new("X")
player_c = Player.new("O")

game = Game.new(player_h, player_c, board)
game.play