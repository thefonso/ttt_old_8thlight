class Player
  
  def initialize
    @move = ""
  end

  attr_reader :move


  def Computer
      # create new computer player
      # player can move
      # looks for winning move in "Win"
     puts "computer's move"
     move #calls move method
  end

  def Human
      # create new human player
      # player can move 
      # enter a grid location on command line...
      # that location will now hold an "X" as it's value 
      # and the grid will redisplay showing new "X" 
      puts "make your move human"
      move #calls move method
  end

  def move
      @move = gets.chomp
      puts "the move was #{@move}"
  end
end

