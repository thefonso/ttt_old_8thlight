class Aimove
  # as an ai I need to make a random first and second move
  # as an ai I need to scan for a winning move
  def ai_move(game)
    # all possible third moves as 'O' (computer)
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
      :wm24 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "}
    }
    # match current answers located in @thegrid with possible @anskey array, iterate for each item
    @anskey={
      :wm01=>":c3",:wm02=>":c2",:wm03=>":c1",:wm04=>":b3",:wm05=>":b1",:wm06=>":a3",:wm07=>":a2",:wm08=>":a1",
      :wm09=>":a3",:wm10=>":c1",:wm11=>":a1",:wm12=>":c3",:wm13=>":c3",:wm14=>":c1",:wm15=>":c3",:wm16=>":a1",
      :wm17=>":b1",:wm18=>":b2",:wm19=>":b3",:wm20=>":a2",:wm21=>":b2",:wm22=>":b2",:wm23=>":c2",:wm24=>":b2"
    }
    #
    # scan board for available move locations
    # compare result to ai_winmoves
    # make move
    @ai_winmoves.each do |key, value|
      if value==$thegrid
        # if board looks like wm01 then set @move = @anskey[:wm01] 
        # which sets :c3 as ans
        @move = @anskey[key]

      else
        # scan board for available moves... 
        @available_moves = $thegrid.select{ |k, v| v == " " }.keys
        # then make a random move
        @move = @available_moves[rand(@available_moves.length)]

      end
    end 
  end

end