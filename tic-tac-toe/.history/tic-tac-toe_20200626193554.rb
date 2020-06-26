class Board

  protected
  def Board.draw
    puts "#{cells[0]}|#{cells[1]}|#{cells[2]}"
    puts "___"
    puts "#{cells[3]}|#{cells[4]}|#{cells[5]}"
    puts "___"
    puts "#{cells[6]}|#{cells[7]}|#{cells[8]}"
  end
end

Board.draw
