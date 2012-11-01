require_relative 'player'

class Human < Player

  def move(board)

    puts "human move..."

    human_move = gets.chomp
    human_spot_to_take = human_move.to_sym
    
    if board.grid.has_key?(human_spot_to_take)
      if board.grid[human_spot_to_take] == " " 
        move = human_spot_to_take.to_sym 
        board.grid[move] = @player_symbol         
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