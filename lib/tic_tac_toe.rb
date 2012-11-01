# require_relative 'player'
require_relative 'computer'
require_relative 'human'
require_relative 'game'
require_relative 'board'

board = Board.new
human = Human.new('X')
computer = Computer.new('O')

game = Game.new(human, computer, board)
game.play