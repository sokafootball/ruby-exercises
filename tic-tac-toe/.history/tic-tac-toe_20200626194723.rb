class Board
  @@cells = Array.new(9,Cell.new)

  protected
  def Board.draw
    puts "#{@@cells[0]}|#{@@cells[1]}|#{@@cells[2]}"
    puts "------"
    puts "#{@@cells[3]}|#{@@cells[4]}|#{@@cells[5]}"
    puts "------"
    puts "#{@@cells[6]}|#{@@cells[7]}|#{@@cells[8]}"
  end
end

class Cell

end
