class Player
  
  def initialize(letter)
    @boardpiece = letter
  end

  def move_human(game)
    @move = gets.chomp
    puts "human move was #{@move}"
  end

  def move_computer(game)
    #looks for possible winning move in "win"
    #for now ....acts like human
    @move = gets.chomp
    puts "computer move was #{@move}"
  end

  def human
    #player can move
    move_human
  end

  def computer
    # player can move
    move_computer
  end

end
