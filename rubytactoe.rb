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

    #note turn this into a method and pass piece as var
    @win_moves = {
      :wm01 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm02 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm03 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm04 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm05 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm06 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>" "},
      :wm07 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>" "},
      :wm08 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"X"},
      #check those corners
      :wm09 => {:a1=>"X", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm10 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm11 => {:a1=>" ", :a2=>"X", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm12 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm13 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>"X"},
      :wm14 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>"X"},
      :wm15 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>"X", :c3=>" "},
      :wm16 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>" "},
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
      turn = 0

      9.times do
        if turn.even?
          @player = @player_h.move_human("O")
          @marker = @player_h.boardpiece

          @move = @player
          index = @move.to_sym
          does_move_exist(index,@marker)
        else
          @player = @player_c.move_computer("X")
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

    def ai_move
      @anskey={
        :wm01=>":c3",:wm02=>":c2",:wm03=>":c1",:wm04=>":b3",:wm05=>":b1",:wm06=>":a3",:wm07=>":a2",:wm08=>":a1",
        :wm09=>":a3",:wm10=>":c1",:wm11=>":a1",:wm12=>":c3",:wm13=>":c3",:wm14=>":c1",:wm15=>":c3",:wm16=>":a1"
      }
      #match current answers located in @thegrid with possable answers array iterate for each item
      @win_moves.each {|key, value| 
        #check for truth
        if value==@thegrid 
          #send key name to var
          Puts "a winning move was found"
        else
          Puts "keep playing"
        end 
      }
    end
end


player_h = Player.new("X")
player_c = Player.new("O")

game = Game.new(player_h, player_c)
game.play

