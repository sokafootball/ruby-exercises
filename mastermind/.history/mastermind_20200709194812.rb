class Game
  def self.play
    self.print_welcome_msg
    self.start_game_loop
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
  @@guesses_history = Array.new()

  def self.start_game_loop
    loop do
      puts "------------------------------------------"
      self.generate_solution
      while (@@guesses_history.length <= NUMBER_OF_GUESSES)
        self.play_turn
        if (@@player_guess == @@solution)
          self.show_win_msg
          break
        end
      end
      self.show_lose_msg if @@guesses_history > NUMBER_OF_GUESSES
      puts "Press enter to start another game"
      gets
    end
  end

  def self.print_welcome_msg
    puts "Welcome to Mastermind!"
    puts "The objective of the game is to guess the combination of #{COMBINATION_LENGTH} numbers from 1 to #{NUMBER_OF_SYMBOLS} within #{NUMBER_OF_GUESSES} guesses."
    puts "Each guess will receive a feedback of symbols,
     \"#{FULL_MATCH}\" for a correct number in the correct position,
     \"#{HALF_MATCH}\" for a correct number in the wrong position,
     \"#{NO_MATCH}\" for a wrong number."
    puts "Good Luck!"
  end

  def self.show_lose_msg
    puts "You ran out of guesses, you lost!"
  end

  def self.play_turn
    self.get_player_guess
    @@guesses_history << {@@player_guess => self.calculate_feedback}
    self.print_guesses
  end

  def self.generate_solution
    @@solution = SYMBOLS.shuffle.first(COMBINATION_LENGTH)
  end

  def self.print_guesses
    puts "__________________________________________\n\n"
    @@guesses_history.each_with_index do |guess, idx|
      puts "#{idx + 1}. #{guess.keys[0]} | #{guess.values[0]} \n"
    end
    puts "__________________________________________\n\n"
  end

  def self.calculate_feedback()
    @@feedback = Array.new()
    @@player_guess.each_with_index do |num, idx|
      if (@@solution.include?(num))
        if (idx == @@solution.index(num))
          @@feedback << FULL_MATCH
        else
          @@feedback << HALF_MATCH
        end
      else
        @@feedback << NO_MATCH
      end
    end
    return @@feedback.sort!
  end

  def self.get_player_guess
    @@player_guess.clear
    @@available_symbols = SYMBOLS.values_at(0...NUMBER_OF_SYMBOLS)
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

Game.play


