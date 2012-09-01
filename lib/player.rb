# I exist to hold each player and the player's value

class Player
  
  # def initialize(letter) #when I'm created I must receive a letter
  #   @boardpiece = letter
  # end
  
  def move_human(letter)
    puts "human move"
    @move = gets.chomp
    return @move
  end
  
  def move_computer(leter)
    puts "computer move"
    @move = gets.chomp
    return @move
  end
end