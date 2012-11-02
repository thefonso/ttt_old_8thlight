require_relative 'game'
require_relative 'board'

board = Board.new
human = Player.get_player('X')
computer = Player.get_player('O')

game = Game.new(human, computer, board)
game.play