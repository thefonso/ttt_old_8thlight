        # 5
        # turn is O
        boards = @minimax.generate_boards("X+X+O++++")
        boards.should include("X+XOO++++")
        boards.should include("X+X+OO+++")
        boards.should include("X+X+O+O++")
        boards.should include("X+X+O++O+")
        boards.should include("X+X+O+++O")

        
        # 4
        # turn is X
        boards = @minimax.generate_boards("X+XOO++++")
        boards.should include("X+XOOX+++")
        boards.should include("X+XOO+X++")
        boards.should include("X+XOO++X+")
        boards.should include("X+XOO+++X")

        
        # 3
        # turn is O
        boards = @minimax.generate_boards("X+XOOX+++")
        boards.should include("X+XOOXO++")
        boards.should include("X+XOOX+O+")
        boards.should include("X+XOOX++O")

        
        # 2
        # turn is X
        boards = @minimax.generate_boards("X+XOOXO++")
        boards.should include("X+XOOXOX+")
        boards.should include("X+XOOXO+X")

        
        # 1
        # turn is O
        boards = @minimax.generate_boards("X+XOOXOX+")
        boards.should include("X+XOOXOXO")

        
                
        # ...