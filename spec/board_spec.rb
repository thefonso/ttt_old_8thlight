require 'board'

describe Board do
  describe 'drawgrid' do
    it 'draws a blank grid given no input' do
      board = Board.new
      board.drawgrid.should == <<-EOF.gsub(/^ {6}/, '')
      
      a  | |  
      ----------
      b  | |  
      ----------
      c  | |  
      ----------
        1 2 3
      EOF
    end
  end
  
  it "creates a blank board with nine spaces" do
    board = Board.new
    board.board.all? { |e| e[1] == " "}.should be_true
  end
  
  it "has a cell method to get the value of specified cell" do
    board = Board.new("A")
  end
end