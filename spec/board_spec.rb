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
    board.grid.keys.each do |key|
      board.space_taken?(key).should be_false
    end
  end
  
  it "can set the value of a specified cell" do
    board = Board.new("A")
    board.grid[:a1] = "C"
    board.grid[:a1].should == "C"
  end
  
  it "checks if a space is taken or not" do
    board = Board.new(" ")
    board.grid[:a1] = "x"
    board.space_taken?(:a1).should be_true
    board.space_taken?(:a2).should be_false
  end
end