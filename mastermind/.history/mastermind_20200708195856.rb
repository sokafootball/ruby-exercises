class Game
  private

  COMBINATION_LENGTH = 4
  NUMBER_OF_SYMBOLS = 8
  SYMBOLS = []
  (1..NUMBER_OF_SYMBOLS).each {|num| SYMBOLS << num}

  @@solution = []
  @@player_guess = []

  def self.generate_solution
    @@solution = SYMBOLS.shuffle.first(COMBINATION_LENGTH)
  end

  def self.ask_solution
    @@available_symbols = SYMBOLS
    while (@@player_guess.length != COMBINATION_LENGTH)
      puts "Choose symbol solution ##{player_guess.length - 1} from #{@@available_symbols}."
      @@chosen_solution = gets.chomp
      unless (@@available_symbols.include?(@@chosen_solution))
        puts "Your choice is not available, choose from #{@@available_symbols}."
        @@chosen_solution = gets.chomp
      end
      @@player_guess << @@chosen_solution
    end
  end
end

Game.generate_solution

