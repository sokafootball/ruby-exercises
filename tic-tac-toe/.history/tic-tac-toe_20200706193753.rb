require 'pry'

module Constants
  EMPTY_CELL = " "
  PLAYER = "PLAYER"
  COMPUTER = "COMPUTER"
  PLAYER_SYMBOL = "O"
  COMPUTER_SYMBOL = "X"
end

class Cell
  attr_accessor :symbol
  def initialize(symbol = Constants::EMPTY_CELL)
    @symbol = symbol
  end
end

class Board

  @@cells = Array.new(9)
  for i in (0..8)
    @@cells[i] = Cell.new
  end

  def Board.cells
    @@cells
  end

  protected

  def Board.draw
    puts "\n\n"
    puts "#{@@cells[0].symbol}|#{@@cells[1].symbol}|#{@@cells[2].symbol}"
    puts "------"
    puts "#{@@cells[3].symbol}|#{@@cells[4].symbol}|#{@@cells[5].symbol}"
    puts "------"
    puts "#{@@cells[6].symbol}|#{@@cells[7].symbol}|#{@@cells[8].symbol}"
    puts "\n\n"
  end

  def Board.draw_legend
    puts "1|2|3"
    puts "------"
    puts "4|5|6"
    puts "------"
    puts "7|8|9"
  end

  def Board.wipe
    for i in (0..8)
      @@cells[i].symbol = Constants::EMPTY_CELL
    end
  end

  def Board.available_space?
    @@cells.any? {|cell| cell.symbol == Constants::EMPTY_CELL}
  end
end

class Game

  private
  @@players = [Constants::PLAYER, Constants::COMPUTER]
  @@moving_player = nil
  @@winning_player = nil

  def Game.set_new_game
    puts "Welcome to Tic Tac Toe!\n\n\n"
    @@winning_player = nil
    Board.wipe
    Game.choose_starting_player
    Board.draw_legend
    puts "\n\nChoose where to put your token by digiting the corresponding number and pressing enter.\n\n"
    Game.run_game
  end

  def Game.choose_starting_player
    @@moving_player = @@players.sample
  end

  def Game.run_game
    while (Board.available_space? && @@winning_player == nil) do
      Game.run_turn
      Board.draw
      Game.check_for_winner
    end
    Game.end_game
  end

  def Game.end_game
    if (@@winning_player == Constants::PLAYER)
      puts "You won!"
    elsif (@@winning_player == Constants::COMPUTER)
      puts "You lost!"
    else
      puts "It's a draw!"
    end
    puts "Press Enter to star a new game"
    player_input = gets
    Game.set_new_game
  end

  def Game.run_turn
    if @@moving_player == Constants::PLAYER
      run_player_turn
    else
      run_computer_turn
    end
    @@moving_player = @@moving_player == Constants::PLAYER ? Constants::COMPUTER : Constants::PLAYER
  end

  def Game.run_player_turn
    puts "Your turn..."
    chosen_cell = gets.chomp.to_i - 1
      while (chosen_cell < 0 || chosen_cell > 8 || Board.cells[chosen_cell].symbol != Constants::EMPTY_CELL)
        puts "That cell is not free, choose another one."
        chosen_cell = gets.chomp.to_i - 1
      end
      Board.cells[chosen_cell].symbol = Constants::PLAYER_SYMBOL
  end

  def Game.run_computer_turn
    puts "Computers moves..."
    @chosen_cell
    loop do
      @chosen_cell = rand(9)
      break if Board.cells[@chosen_cell].symbol == Constants::EMPTY_CELL
    end
    Board.cells[@chosen_cell].symbol = Constants::COMPUTER_SYMBOL
  end

  def Game.set_winner(token)
    if token == Constants::PLAYER_SYMBOL
      @@winning_player = Constants::PLAYER
    else
      @@winning_player = Constants::COMPUTER
    end
  end

  def Game.check_for_winner
    #check rows
    Game.set_winner(Board.cells[0].symbol) if (Board.cells[0].symbol != Constants::EMPTY_CELL && Board.cells[0].symbol ==  Board.cells[1].symbol && Board.cells[0].symbol == Board.cells[2].symbol)
    Game.set_winner(Board.cells[3].symbol) if (Board.cells[3].symbol != Constants::EMPTY_CELL && Board.cells[3].symbol ==  Board.cells[4].symbol && Board.cells[3].symbol == Board.cells[5].symbol)
    Game.set_winner(Board.cells[6].symbol) if (Board.cells[6].symbol != Constants::EMPTY_CELL && Board.cells[6].symbol ==  Board.cells[7].symbol && Board.cells[6].symbol == Board.cells[8].symbol)
    #check columns
    Game.set_winner(Board.cells[0].symbol) if (Board.cells[0].symbol != Constants::EMPTY_CELL && Board.cells[0].symbol ==  Board.cells[3].symbol && Board.cells[0].symbol == Board.cells[6].symbol)
    Game.set_winner(Board.cells[1].symbol) if (Board.cells[1].symbol != Constants::EMPTY_CELL && Board.cells[1].symbol ==  Board.cells[4].symbol && Board.cells[1].symbol == Board.cells[7].symbol)
    Game.set_winner(Board.cells[2].symbol) if (Board.cells[2].symbol != Constants::EMPTY_CELL && Board.cells[2].symbol ==  Board.cells[5].symbol && Board.cells[2].symbol == Board.cells[8].symbol)
    #check diagonals
    Game.set_winner(Board.cells[0].symbol) if (Board.cells[0].symbol != Constants::EMPTY_CELL && Board.cells[0].symbol ==  Board.cells[4].symbol && Board.cells[0].symbol == Board.cells[8].symbol)
    Game.set_winner(Board.cells[2].symbol) if (Board.cells[2].symbol != Constants::EMPTY_CELL && Board.cells[2].symbol ==  Board.cells[4].symbol && Board.cells[2].symbol == Board.cells[6].symbol)
  end

end

Game.set_new_game
