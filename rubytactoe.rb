require_relative 'player'

class Game 
  #initial values
  #globals listed here
  def initialize(player_h, player_c)
    #bring into existence the board and the players
    @player_h = player_h
    @player_c = player_c
  
    @thegrid = {
        :a1=>" ", :a2=>" ", :a3=>" ",
        :b1=>" ", :b2=>" ", :b2=>" ",
        :c1=>" ", :c2=>" ", :c3=>" "
    }
  end


    #display grid on console
    def drawgrid
      puts ""
      puts "a #{@thegrid[:a1]}|#{@thegrid[:a2]}|#{@thegrid[:a3]}"
      puts "----------"
      puts "b #{@thegrid[:b1]}|#{@thegrid[:b2]}|#{@thegrid[:b3]}"
      puts "----------"
      puts "c #{@thegrid[:c1]}|#{@thegrid[:c2]}|#{@thegrid[:c3]}"
      puts "----------"
      puts "  1 2 3"
    end

    def play
      #draw the board
      drawgrid
      #make a move
      while win != true

        player_h.move_human
        #check for win
        win
        if win != true
          #redraw grid
          drawgrid
          #switch players
          player_c.move_computer
          # play again
          play
        else
          #print winning message
          puts "winner"
        end
      end
    end

    def win
      false
    end
end

game = Game.new(player_h, player_c)
game.play

player_h = Player.new("X")
player_c = Player.new("O")

