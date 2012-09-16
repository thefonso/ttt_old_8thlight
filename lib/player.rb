
    class Player

      attr_reader :boardpiece # i exist so game can read me

      def initialize(letter)
        @boardpiece = letter
      end

      def move_human(game)
        @game_two = game

        puts "human move..."
        # TODO - send error output if move not on board DONE
        #        
        human_move = gets.chomp

        human_symbol = human_move.to_sym
        # puts "has a1 key? "
        # puts $thegrid.has_key?(human_symbol)

        # look for move as key in $thegrid
        if $thegrid.has_key?(human_symbol)
          # puts "bingo"               
          @move = human_symbol              
        else
          puts "invalid move...try again"
          move_human(@game_two)
        end 
           
      end
      



      def move_computer(game)
        # ai should do three things
        # block human
        # attempt win
        # random move
        
        puts "computer move..."
        # all possible third moves as 'O' (computer)
        @human_winmoves = {
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
            #check opposites
            :wm17 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>" "},
            :wm18 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>" "},
            :wm19 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"X"},
            :wm20 => {:a1=>"X", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm21 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm22 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"X"},
            :wm23 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>"X"},
            :wm24 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>" "},
            #check crazy
            :wm25 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>" "},
            :wm26 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm27 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"X"},
            :wm28 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>" "},            
            :wm29 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>" "},
            :wm30 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>" "},
            :wm31 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>" "},
            :wm32 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>"X", :c3=>" "},
            :wm33 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm34 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm35 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>" "},
            :wm36 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"X"},
            :wm37 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm38 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm39 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>"X", :c2=>" ", :c3=>" "},
            :wm40 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>"X", :c3=>" "}
        }
        
        @ai_winmoves = {
            :wm01 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm02 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm03 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm04 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm05 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm06 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
            :wm07 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
            :wm08 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"O"},
            #check those corners
            :wm09 => {:a1=>"O", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm10 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm11 => {:a1=>" ", :a2=>"O", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm12 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm13 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>"O"},
            :wm14 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>"O"},
            :wm15 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>"O", :c3=>" "},
            :wm16 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
            #check opposites
            :wm17 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
            :wm18 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
            :wm19 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"O"},
            :wm20 => {:a1=>"O", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm21 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm22 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"O"},
            :wm23 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>"O"},
            :wm24 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
            #check crazy
            :wm25 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
            :wm26 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm27 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"O"},
            :wm28 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},            
            :wm29 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
            :wm30 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
            :wm31 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
            :wm32 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>"O", :c3=>" "},
            :wm33 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm34 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm35 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
            :wm36 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"O"},
            :wm37 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm38 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},
            :wm39 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>"O", :c2=>" ", :c3=>" "},
            :wm40 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>"O", :c3=>" "}
        }
        # match current answers located in @thegrid with possible @anskey array, iterate for each item
        @anskey={
            :wm01=>"c3",:wm02=>"c2",:wm03=>"c1",:wm04=>"b3",:wm05=>"b1",:wm06=>"a3",:wm07=>"a2",:wm08=>"a1",
            :wm09=>"a3",:wm10=>"c1",:wm11=>"a1",:wm12=>"c3",:wm13=>"c3",:wm14=>"c1",:wm15=>"c3",:wm16=>"a1",
            :wm17=>"b1",:wm18=>"b2",:wm19=>"b3",:wm20=>"a2",:wm21=>"b2",:wm22=>"b2",:wm23=>"c2",:wm24=>"b2",
            :wm25=>"a1",:wm26=>"a1",:wm27=>"a3",:wm28=>"a3",:wm29=>"c1",:wm30=>"c1",:wm31=>"c3",:wm32=>"c3",
            :wm33=>"a1",:wm34=>"a1",:wm35=>"c1",:wm36=>"c1",:wm37=>"a3",:wm38=>"a3",:wm39=>"c3",:wm40=>"c3"
        }
        #
        # scan board for available move locations
        # select all values where value is O for thegrid and copy those into keys_with_o
        @keys_with_o = $thegrid.select{ |k, v| v == "O" }.keys       # find Os on board
        # ai_win_moves = @ai_winmoves.select{ |k, v| v == "O" }.keys # find O win moves
        
        # select all values where value is X for thegrid and copy those into keys_with_x
        @keys_with_x = $thegrid.select{ |k, v| v == "X" }.keys       # find Xs on board
        # block_moves = @ai_winmoves.select{ |k, v| v == "X" }.keys  # find X win moves
        
        @thing = [] # initialize thing array
        
        if $thegrid[:b2] == " "   #AND center spot is empty
          ai_spot = "b2"
          puts "ai takes center "+ai_spot
          @move = ai_spot.to_sym  #must return this answer as a symbol
          
        else
          # TODO - Ai attempts win
          #
          attempt_win

        end
        
        return @move # had this guy in the wrong place
      end
      
      
      def attempt_win
 
        # thing = [] # initialize thing array
        @ai_winmoves.each do |k,v| # go threw each win moves.
          #get common elements between two arrays..recall from above that v contains a hash
          ai_keys = v.select{ |k, v| v == "O"}.keys
          # which moves can I take to win
          intersection = ai_keys & @keys_with_o
         
          if intersection.length
 
            @thing << k # add to answers array per iteration

              answer = @anskey[@thing.last].to_sym
            
              if $thegrid[answer] == " " #if win move space is not empty check for a block move
                @move = answer               
              else
                # puts "space taken attempt_block..."
                attempt_block
              end
            # end
          end
        end # END @ai_winmoves.each do |k,v|
      end
      
      def attempt_block
 
        # thing = [] # initialize thing array
        @human_winmoves.each do |k,v| # for test - go threw each win moves.
          #get common elements between two arrays..recall from above that v contains a hash
          human_keys = v.select{ |k, v| v == "X"}.keys
          # which moves can I take to block human
          intersection = human_keys & @keys_with_x
          
          if intersection.length >= 2

            @thing << k # adds a key per iteration

            @thing.each do |key|
 
              answer = @anskey[key].to_sym
 
              #TODO - start here
              if $thegrid[answer] != " " # spot taken
                # puts "space taken can not block"
              else
                @move = answer # for test - at last intersection value found...return it as move value
              end
            end
          end
        end # END @human_winmoves.each do |k,v|
      end
      
    end