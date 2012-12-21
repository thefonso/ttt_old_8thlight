require 'board'
require 'ai_minimax2'

class Pseudo_Minimax_Ai
  include Algorithm::Minimax
  
  module Algorithm::Minimax
    def i=(param)
      @i = param
    end
    def initialize_hash
      @virtual_board_hash = {}
    end
  end
end


  describe 'Pseudo_Minimax_Ai' do
    before (:each) do
      @player = "X"
      @count = 0
      @ply = 2
      @board = Board.new
      @minimax = Pseudo_Minimax_Ai.new
      @minimax.i = 0
      @board.grid[:a1] = "X"
      @board.grid[:a2] = "X"
      @board.grid[:a3] = "O"
      @board.grid[:b1] = " "
      @board.grid[:b2] = "O"
      @board.grid[:b3] = "X"
      @board.grid[:c1] = "O"
      @board.grid[:c2] = "O"
      @board.grid[:c3] = "X"
    end

    describe 'minimax' do
      it 'should return a symbol' do
        @minimax.minmax(@board, @player).is_a?(Symbol)
      end
    end
    describe 'score_the_boards(board, player)' do
      it 'should return a hash' do
       @minimax.score_the_boards(@board, @player).is_a?(Hash)
      end

      it 'should return a hash with range of answers 1000 to -1000' do
       @minimax.score_the_boards(@board, @player).is_a?(Hash)
      end
    end
    describe 'generate_boards(board, player)' do
      it 'returns a hash' do
        @minimax.generate_boards(@board, @player).is_a?(Hash)
      end

      it 'holds all the boards' do
        @player = "X"
        @count = 0
        @ply = 2
        @board = Board.new
        @minimax = Pseudo_Minimax_Ai.new
        @minimax.i = 0
        @board.grid[:a1] = "X"
        @board.grid[:a2] = " "
        @board.grid[:a3] = " "
        @board.grid[:b1] = " "
        @board.grid[:b2] = "O"
        @board.grid[:b3] = " "
        @board.grid[:c1] = " "
        @board.grid[:c2] = " "
        @board.grid[:c3] = "X"
        # # 7
        # # turn is X
        boards = @minimax.generate_boards(@board, @player) # what follows are from this branch
        boards.value?({:a1=>"X", :a2=>"O", :a3=>"X", :b1=>"O", :b2=>"O", :b3=>"X", :c1=>"O", :c2=>"X", :c3=>"X"})
        boards.value?({:a1=>"X", :a2=>"X", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>" "})
        boards.value?({:a1=>"X", :a2=>" ", :a3=>" ", :b1=>" ", :b2=>"O", :b3=>" ", :c1=>" ", :c2=>" ", :c3=>"O"})
        # boards.value?("XX++O++++") # reset board then...
        # boards.value?("X+X+O++++") # reset board then...
        # boards.value?("X++XO++++") # ...
        # boards.value?("X+++OX+++")
        # boards.value?("X+++O+X++")
        # boards.value?("X+++O++X+")

        # boards.value?("X+++O+++X")
        # 
        # # 6
        # # turn is O
        # boards = @minimax.generate_boards("XX++O++++")
        # boards.should include("XXO+O++++")
        # boards.should include("XX+OO++++")
        # boards.should include("XX++OO+++")
        # boards.should include("XX++O+O++")
        # boards.should include("XX++O++O+")
        # boards.should include("XX++O+++O")
        # 
        # # 5
        # # turn is X
        # boards = @minimax.generate_boards("XXO+O++++")
        # boards.should include("XXOXO++++")
        # boards.should include("XXO+OX+++")
        # boards.should include("XXO+O+X++")
        # boards.should include("XXO+O++X+")
        # boards.should include("XXO+O+++X")
        # 
        # # 4
        # # turn is O
        # boards = @minimax.generate_boards("XXOXO++++")
        # boards.should include("XXOXOO+++")
        # boards.should include("XXOXO+O++")
        # boards.should include("XXOXO++O+")
        # boards.should include("XXOXO+++O")
        # 
        # # 3
        # # turn is X
        # boards = @minimax.generate_boards("XXOXOO+++")
        # boards.should include("XXOXOOX++")
        # boards.should include("XXOXO++X+")
        # boards.should include("XXOXO+++X")
        # 
        # # 2
        # # turn is O
        # boards = @minimax.generate_boards("XXOXOOX++")
        # boards.should include("XXOXOOXO+")
        # boards.should include("XXOXO+++O")
        # 
        # # 1
        # # turn is X
        # boards = @minimax.generate_boards("XXOXOOXO+")
        # boards.should include("XXOXOOXOX")
                
        # ...

        # 7!
        # 7 * 6 * 5 * 4 * 3 * 2

        # @minimax.generate_boards(@board, @player)
      end
    end
    describe 'move_as_somebody(board, player, empty_space)' do
      empty_space = :a3
      index = 'VB7'
      it 'should return new board hash of hash'do
       @minimax.move_as_somebody(@board, @player, empty_space).is_a?(Hash)
      end
    end
  end


