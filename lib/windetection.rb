module WinDetection  

  def is_a_human_win(board)

    win_moves = {
      :wm01 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"X"},
      :wm02 => {:a1=>" ", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>" ", :c2=>"X", :c3=>" "},
      :wm03 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>"X", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>" "},
      :wm04 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>"X", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm05 => {:a1=>"X", :a2=>"X", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm06 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>"X", :c3=>"X"},
      :wm07 => {:a1=>"X", :a2=>" ", :a3=>" ", :b1=>"X", :b2=>" ", :b3=>" ", :c1=>"X", :c2=>" ", :c3=>" "},
      :wm08 => {:a1=>" ", :a2=>" ", :a3=>"X", :b1=>" ", :b2=>" ", :b3=>"X", :c1=>" ", :c2=>" ", :c3=>"X"}
    }

    x_on_the_gameboard = board.grid.select{ |k, v| v == "X" }.keys

      
    win_moves.each do |k,v|
      win_moves_keys = v.select{ |k, v| v == "X"}.keys
        
      matching_moves = win_moves_keys & x_on_the_gameboard
        
      if matching_moves.length >= 3 
        
        p 'key: '+k.to_s
          
        string_contains = k.to_s
        if string_contains =~ /wm/ 
          puts "WIN DETECTED - Human"

          exit
        else

        end
      end
    end
  end
    
  
  def is_a_computer_win(board)

    ai_winmoves = {
      :wm01 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"O"},
      :wm02 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
      :wm03 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
      :wm04 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>"O", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm05 => {:a1=>"O", :a2=>"O", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
      :wm06 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>"O", :c3=>"O"},
      :wm07 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
      :wm08 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>"O"}
    }

    o_on_the_gameboard = board.grid.select{ |k, v| v == "O" }.keys
    
    
    ai_winmoves.each do |k,v|
      ai_winmoves_keys = v.select{ |k, v| v == "O"}.keys
        
      matching_moves = ai_winmoves_keys & o_on_the_gameboard
        
      if matching_moves.length >= 3 
        
        p 'key: '+k.to_s
          
        test_string_contains = k.to_s
        if test_string_contains =~ /wm/ 
          puts "WIN DETECTED - computer "

          exit
        else

        end
      end
    end
  end 
end