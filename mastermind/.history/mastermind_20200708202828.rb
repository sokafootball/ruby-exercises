class Game
  private
  NUMBER_OF_GUESSES = 12
  COMBINATION_LENGTH = 4
  NUMBER_OF_SYMBOLS = 8
  SYMBOLS = []
  (1..NUMBER_OF_SYMBOLS).each {|num| SYMBOLS << num}

  @@solution = []
  @@player_guess = []
  @@guesses_history = []

  def self.generate_solution
    @@solution = SYMBOLS.shuffle.first(COMBINATION_LENGTH)
  end



  def self.get_player_guess
    @@available_symbols = SYMBOLS
    while (@@player_guess.length != COMBINATION_LENGTH)
      puts "Choose symbol solution ##{@@player_guess.length + 1} from #{@@available_symbols}."
      @@chosen_symbol = gets.chomp.to_i
      until (@@available_symbols.include?(@@chosen_symbol))
        puts "#{@@chosen_symbol} is not available, choose from #{@@available_symbols}."
        @@chosen_symbol = gets.chomp.to_i
      end
      @@player_guess << @@chosen_symbol
      @@available_symbols.delete(@@chosen_symbol)
      puts "Your guess is #{@@player_guess}"
    end
  end
  return @@player_guess
end

Game.ask_solution

