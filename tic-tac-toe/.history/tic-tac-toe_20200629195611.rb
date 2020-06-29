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

  def Board.draw_legend
    puts "1|2|3"
    puts "------"
    puts "4|5|6"
    puts "------"
    puts "7|8|9"
  end
end

class Game
  private
  @@players = ["HUMAN", "COMPUTER"]
  @@moving_player = nil
  @@winning_player = nil

  def Game.set_new_game
    puts "Welcome to Tic Tac Toe!\n\n\n"
    Game.choose_starting_player
    puts "You can select where to put your token using the corresponding number:\n\n"
    Board.draw_legend
    Game.run_game
  end

  def Game.choose_starting_player
    @@moving_player = @@players.sample
  end

  def Game.run_game
    while (there_is_space && winning_player == nil) do
      Game.run_turn
    end
  end
end

Game.set_new_game
