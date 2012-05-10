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

      4.times do

       @move = @player_h.move_human("X")
       index = @move.to_sym
       @thegrid[index] = @player_h.boardpiece
       
       drawgrid 
       
       #switch players
       @move = @player_c.move_computer("O")
       index = @move.to_sym
       @thegrid[index] = @player_c.boardpiece
      
       drawgrid
      end
    end

    def win
      #match current answers located in #thegrid
      #with possable answers array
      false
    end
end


player_h = Player.new("X")
player_c = Player.new("O")

game = Game.new(player_h, player_c)
game.play

