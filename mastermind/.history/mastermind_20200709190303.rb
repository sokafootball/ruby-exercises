class Game
  def self.test
    Game.generate_solution
    player_gss = Game.get_player_guess
    Game.calculate_feedback(player_gss)
  end

  private
  NUMBER_OF_GUESSES = 12
  COMBINATION_LENGTH = 4
  NUMBER_OF_SYMBOLS = 8
  FULL_MATCH = "A"
  HALF_MATCH = "O"
  NO_MATCH = "X"
  SYMBOLS = []
  (1..NUMBER_OF_SYMBOLS).each {|num| SYMBOLS << num}

  @@solution = Array.new(COMBINATION_LENGTH)
  @@player_guess = Array.new()
  @@guesses_history = Array.new(NUMBER_OF_GUESSES)

  def self.generate_solution
    @@solution = SYMBOLS.shuffle.first(COMBINATION_LENGTH)
  end

  def self.calculate_feedback(player_guess)
    @@feedback = Array.new()
    player_guess.each_with_index do |num, idx|
      if (@@solution.include?(num))
        if (idx == @@solution.index(num))
          @@feedback << FULL_MATCH
        else
          @@feedback << HALF_MATCH
        end
      else
        @@feedback << NO_MATCH
      end
      p @@feedback.sort!
    end
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
    return @@player_guess
  end
end

Game.test


