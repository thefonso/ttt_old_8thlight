require_relative 'board'

class Player

  attr_reader :thegrid
  attr_reader :boardpiece 

  def initialize(player_letter)
    
    @player_symbol = player_letter
    
    @code_plugin = ""
    
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
        #check crazy
        # :wm25 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>"O", :c2=>" ", :c3=>" "},
        # :wm26 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        # :wm27 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"O"},
        # :wm28 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},            
        # :wm29 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
        # :wm30 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
        # :wm31 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>" ", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
        # :wm32 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>"O", :c3=>" "},
        # :wm33 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        # :wm34 => {:a1=>" ", :a2=>" ", :a3=>"O", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "},
        # :wm35 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>"O", :c3=>" "},
        # :wm36 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>"O", :b2=>" ", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"O"},
        # :wm37 => {:a1=>"O", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},
        # :wm38 => {:a1=>" ", :a2=>"O", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>" ", :c3=>" "},
        # :wm39 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>"O", :c2=>" ", :c3=>" "},
        # :wm40 => {:a1=>" ", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>" ", :b3=>"O", :c1=>" ", :c2=>"O", :c3=>" "}
    }
    
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
    
    @anskey={
        :wm01=>"c3",:wm02=>"c2",:wm03=>"c1",:wm04=>"b3",:wm05=>"b1",:wm06=>"a3",:wm07=>"a2",:wm08=>"a1",
        :wm09=>"a3",:wm10=>"c1",:wm11=>"a1",:wm12=>"c3",:wm13=>"c3",:wm14=>"c1",:wm15=>"c3",:wm16=>"a1",
        :wm17=>"b1",:wm18=>"b2",:wm19=>"b3",:wm20=>"a2",:wm21=>"b2",:wm22=>"b2",:wm23=>"c2",:wm24=>"b2",
        :wm25=>"a1",:wm26=>"a1",:wm27=>"a3",:wm28=>"a3",:wm29=>"c1",:wm30=>"c1",:wm31=>"c3",:wm32=>"c3",
        :wm33=>"a1",:wm34=>"a1",:wm35=>"c1",:wm36=>"c1",:wm37=>"a3",:wm38=>"a3",:wm39=>"c3",:wm40=>"c3"
    }
  end
end