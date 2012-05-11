class Player
  attr_reader :boardpiece

  def initialize(letter)
    @boardpiece = letter
  end

  def move_human(game)
    puts "human move..."
    @move = gets.chomp
    #check thegrid for... ans exist?
  end

  def move_computer(game)
    puts "computer move..."
    #looks for possible winning move in "win_moves"
    #for now ....acts like human
    @move = gets.chomp
    #looks in thegrid for answer...if exist...
    #...try again...else...place answer
  end

  def win_moves

  end

  def taken
    taken_array = []
  end

end
