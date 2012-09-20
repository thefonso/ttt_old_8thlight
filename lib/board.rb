class Board
  attr_reader :board
  
  def initialize(cell_value = " ")
    @board = {
      a1: cell_value, a2: cell_value, a3: cell_value,
      b1: cell_value, b2: cell_value, b3: cell_value,
      c1: cell_value, c2: cell_value, c3: cell_value
    }
  end
  # 
  # def cell(cellnumber)
  #   @board[cellnumber]
  # end
  # 
  # def cell=(cellnumber, value)
  #   @board[cellnumber] = value
  # end
  
  def drawgrid
    board = "\n"
    board << "a #{@board[:a1]}|#{@board[:a2]}|#{@board[:a3]} \n"
    board << "----------\n"
    board << "b #{@board[:b1]}|#{@board[:b2]}|#{@board[:b3]} \n"
    board << "----------\n"
    board << "c #{@board[:c1]}|#{@board[:c2]}|#{@board[:c3]} \n"
    board << "----------\n"
    board << "  1 2 3\n"
  end
end