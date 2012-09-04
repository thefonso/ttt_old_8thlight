require_relative "player"
#
#Just a Tic Tac Toe game class
class Game
  #create players
  def initialize(player_h, player_c)
    #bring into existence the board and the players
    @player_h = player_h
    @player_c = player_c
    #value hash for the grid lives here
    $thegrid = {
        :a1=>" ", :a2=>" ", :a3=>" ",
        :b1=>" ", :b2=>" ", :b3=>" ",
        :c1=>" ", :c2=>" ", :c3=>" "
    }
    #make a global var for drawgrid which is used by external player class
    $gamegrid = drawgrid
  
  end
  #display grid on console
  def drawgrid
    
    board = "\n"
    board << "a #{$thegrid[:a1]}|#{$thegrid[:a2]}|#{$thegrid[:a3]} \n"
    board << "----------\n"
    board << "b #{$thegrid[:b1]}|#{$thegrid[:b2]}|#{$thegrid[:b3]} \n"
    board << "----------\n"
    board << "c #{$thegrid[:c1]}|#{$thegrid[:c2]}|#{$thegrid[:c3]} \n"
    board << "----------\n"
    board << "  1 2 3 \n"
    return board
    
  end
  #start the game
  def play
    #draw the board
    # puts drawgrid
    #external call to player class
    @player = @player_c.move_computer("O")
  end
end

player_h = Player.new("X")
player_c = Player.new("O")


game = Game.new(player_h, player_c)
game.play