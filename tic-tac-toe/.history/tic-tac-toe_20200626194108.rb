class Board
  @@cells = ["x","o","o","x","o","o"," ","o"," "]

  protected
  def Board.draw
    puts "#{@@cells[0]}|#{@@cells[1]}|#{@@cells[2]}"
    puts "------"
    puts "#{@@cells[3]}|#{@@cells[4]}|#{@@cells[5]}"
    puts "______"
    puts "#{@@cells[6]}|#{@@cells[7]}|#{@@cells[8]}"
  end
end

Board.draw
