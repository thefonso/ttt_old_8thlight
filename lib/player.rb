# I exist to hold each player and the player's value

class Player
  def initialize(letter) #Player receives a letter value, We'll use this to identify the play as human or ai
    @baordpiece = letter
  end
  
  def move_human(letter)
    puts "human move"
    @move = gets.chomp
    return @move
  end
  
  def move_computer(letter)
    puts "computer move"
    # @move = gets.chomp
    # return @move
  end
end