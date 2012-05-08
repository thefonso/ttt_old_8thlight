class Move
  def initialize(usermove)
   #checks incoming move against availabe_moves array
    @move = usermove
  end
  #taken_moves live in array
  #available_moves live in array
  #pushes moves taken over to taken_moves array
  #when a move is made check for win


  def  Win
    #receives player identity, user or computer
    #checks to see if a win has occoured
    #store values in array
    @win = [
      ['a1','a2','a3'],   #horizontals
      ['b1','b2','b3'],
      ['c1','c2','c3'],

      ['a1','b1','c1'],   #verticals
      ['a2','b2','c2'],
      ['a3','b3','c3'],

      ['a1','b2','c3'],   #diagonals
      ['a3','b2','c1']
    ]

    #displays win message
    #user wins! or computer wins!
    #if win end game
  end


  def Regex
    #receives value to check against possible outcomes
    #returns a value
  end

end
