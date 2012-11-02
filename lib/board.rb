class Board
  attr_reader :grid

  def initialize(cell_value = " ")
    @grid = {
      a1: cell_value, a2: cell_value, a3: cell_value,
      b1: cell_value, b2: cell_value, b3: cell_value,
      c1: cell_value, c2: cell_value, c3: cell_value
    }
  end
  
  def printgrid
    board = "\n"
    board << "a #{@grid[:a1]}|#{@grid[:a2]}|#{@grid[:a3]} \n"
    board << "----------\n"
    board << "b #{@grid[:b1]}|#{@grid[:b2]}|#{@grid[:b3]} \n"
    board << "----------\n"
    board << "c #{@grid[:c1]}|#{@grid[:c2]}|#{@grid[:c3]} \n"
    board << "----------\n"
    board << "  1 2 3\n"
  end
  
  def space_taken?(cell_location)
    cell_value = cell_location
    @grid[cell_value] != " "
  end
end