class Player
  attr_reader :boardpiece

  def initialize(letter)
    @boardpiece = letter
  end

  def move_human(game)
    puts "human move..."
    @move = gets.chomp
  end

  def move_computer(game)
    puts "computer move..."
    #looks for possible winning move in "ai_moves"
    #for now ....acts like human
    @move = gets.chomp
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
