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
        :b1=>" ", :b2=>" ", :b3=>" ",
        :c1=>" ", :c2=>" ", :c3=>" "
    }

    @taken = []
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
      turn = 0

      9.times do
        if turn.even?
          @player = @player_h.move_human("X")
          @marker = @player_h.boardpiece

          @move = @player
          index = @move.to_sym
          does_move_exist(index,@marker)
        else
          @player = @player_c.move_computer("O")
          @marker = @player_c.boardpiece

          @move = @player
          index = @move.to_sym
          does_move_exist(index,@marker)
        end


       drawgrid
       turn += 1
      end
    end
    
    def does_move_exist(symbol,letter)
      @symbol = symbol
      @marker_two = letter
      if @thegrid[@symbol] != " "
        puts "Spot taken...try again"
        #clear old move, make new move
        @move = gets.chomp.to_sym 
        does_move_exist(@move,@marker_two)
      else
        @symbol = @move.to_sym
        @thegrid[@symbol] = @marker
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

