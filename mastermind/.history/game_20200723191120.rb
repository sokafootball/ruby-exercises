require_relative "costants"
require_relative "board"

class Game

  def self.play
    self.print_welcome_msg
    self.start_game_loop
  end

  private

  SYMBOLS = []
  (1..Options::NUMBER_OF_SYMBOLS).each {|num| SYMBOLS << num}

  @@solution = Array.new()
  @@player_guess = Array.new()
  @@guesses_history = Array.new()

  def self.start_game_loop
    loop do
      puts UI::SEPARATOR
      self.generate_solution
      while (@@guesses_history.length < Options::NUMBER_OF_GUESSES)
        self.play_turn
        if (@@player_guess == @@solution)
          self.show_win_msg
          break
        end
      end
      self.show_lose_msg if @@guesses_history.length >= Options::NUMBER_OF_GUESSES

      puts "Press enter to start another game"
      gets
      @@guesses_history = []
    end
  end

  def self.print_welcome_msg
    puts "Welcome to Mastermind!"
    puts "The objective of the game is to guess the combination of #{Options::COMBINATION_LENGTH} numbers from 1 to #{Options::NUMBER_OF_SYMBOLS} within #{Options::NUMBER_OF_GUESSES} guesses."
    puts "Each guess will receive a feedback of symbols:
     \"#{UI::FULL_MATCH}\" for a correct number in the correct position,
     \"#{UI::HALF_MATCH}\" for a correct number in the wrong position,
     \"#{UI::NO_MATCH}\" for a wrong number."
    puts "Good Luck!"
  end

  def self.show_win_msg
    puts "You won! Well done!"
  end

  def self.show_lose_msg
    puts "You ran out of guesses, you lost!"
  end

  def self.play_turn
    @@guesses_history << {self.get_player_guess => self.calculate_feedback}
    #self.print_guesses
    Board.print_guesses
  end

  def self.generate_solution
    @@solution = SYMBOLS.shuffle.first(Options::COMBINATION_LENGTH)
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
          @@feedback << UI::FULL_MATCH
        else
          @@feedback << UI::HALF_MATCH
        end
      else
        @@feedback << UI::NO_MATCH
      end
    end
    return @@feedback.sort!
  end

  def self.get_player_guess
    @@player_guess = []
    @@available_symbols = SYMBOLS.values_at(0...Options::NUMBER_OF_SYMBOLS)
    while (@@player_guess.length != Options::COMBINATION_LENGTH)
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
