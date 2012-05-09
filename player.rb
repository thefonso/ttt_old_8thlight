

class Player
  
  def initialize(letter)
    @boardpiece = letter
  end

   def move
        @move = gets.chomp
        puts "the move was #{@move}"
   end
 

 # def computer
      # create new computer player
      # player can move
      # looks for winning move in "Win"
  #   puts "computer's move"
   #  move #calls move method
 # end


end

