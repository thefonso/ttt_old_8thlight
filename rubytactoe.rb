require_relative 'player'

class Game
  #initial values
  #globals listed here
  def initialize
    @thegrid = {
        :a1=>" ", :a2=>" ", :a3=>" ",
        :b1=>" ", :b2=>" ", :b2=>" ",
        :c1=>" ", :c2=>" ", :c3=>" "
    }
  end
  
    #accessor method
    attr_reader :thegrid
  
    #display grid on console
    def DrawGrid
      puts ""
      puts "a #{@thegrid[:a1]}|#{@thegrid[:a2]}|#{@thegrid[:a3]}"
      puts "----------"
      puts "b #{@thegrid[:b1]}|#{@thegrid[:b2]}|#{@thegrid[:b3]}"
      puts "----------"
      puts "c #{@thegrid[:c1]}|#{@thegrid[:c2]}|#{@thegrid[:c3]}"
      puts "----------"
      puts "  1 2 3"
    end
end

newgame = Game.new
newgame.DrawGrid

newplayer = Player.new
newplayer.Human
