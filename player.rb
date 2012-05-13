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
    #looks for possible winning move in "win_moves"
    #for now ....acts like human
    @move = gets.chomp
  end

end
