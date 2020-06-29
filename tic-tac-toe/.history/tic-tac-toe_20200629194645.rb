class Cell
  attr_accessor :symbol
  def initialize(starting_symbol = " ")
    @symbol = starting_symbol
  end
end

class Board
  private

  @@cells = Array.new(9, Cell.new)

  protected

  def Board.draw
    puts "#{@@cells[0].symbol}|#{@@cells[1].symbol}|#{@@cells[2].symbol}"
    puts "------"
    puts "#{@@cells[3].symbol}|#{@@cells[4].symbol}|#{@@cells[5].symbol}"
    puts "------"
    puts "#{@@cells[6].symbol}|#{@@cells[7].symbol}|#{@@cells[8].symbol}"
  end
end

class Game
  private
  @@players = ["PLAYER", "COMPUTER"]
  @@game_status = "OFF"
  @@moving_player

  def Game.new_game
    puts "Welcome to Tic Tac Toe!\n\n\n"
    Game.choose_starting_player

  end

  def Game.choose_starting_player
    @@moving_player = @@players.sample
  end
end

Game.new_game
