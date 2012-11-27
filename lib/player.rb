require_relative 'board'
require_relative 'ai'
# TODO give choice of who can make first move


class Human
  def move(board)
    @player_symbol = 'X'
    puts "human move..."
    
    human_move = gets.chomp
    human_spot_to_take = human_move.to_sym
    
    if board.grid.has_key?(human_spot_to_take)
      if board.grid[human_spot_to_take] == " " 
        mymove = human_spot_to_take.to_sym 
        board.grid[mymove] = @player_symbol         
      else
        puts "spot taken...try again"
        move(board)
      end
    else
      puts "invalid move...try again"
      move(board)
    end 
  end          
end


class Computer
  include Algorithm::Regular

  def move(board)
    @player_symbol = 'O'
    puts "computer move..." 
    
    ai_moves(board)
    
  end

end


class Player
  def self.get_player(letter)
    @player_symbol = letter    
    @code_plugin = ""
    
    if letter == 'X'
      return Human.new
    else
      return Computer.new
    end
  end
end