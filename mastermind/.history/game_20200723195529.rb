require_relative "costants"
require_relative "board"
require_relative "sign"
require_relative "computer"

class Game

  def self.play
    self.print_welcome_msg
    self.start_game_loop
  end

  private

  SIGNS = []
  (1..Options::NUMBER_OF_SIGNS).each {|num| SIGNS << Sign.new(num)}

  @@solution = Array.new()
  @@player_guess = Array.new()

  def self.start_game_loop
    loop do
      puts UI::SEPARATOR
      self.generate_solution
      while (Board.guesses_history.length < Options::NUMBER_OF_GUESSES)
        self.play_turn
        if (@@player_guess == @@solution)
          self.show_win_msg
          break
        end
      end
      self.show_lose_msg if Board.guesses_history.length >= Options::NUMBER_OF_GUESSES

      puts "Press enter to start another game"
      gets
      Board.reset_guesses
    end
  end

  def self.print_welcome_msg
    puts "Welcome to Mastermind!"
    puts "The objective of the game is to guess the combination of #{Options::COMBINATION_LENGTH} numbers from 1 to #{Options::NUMBER_OF_SIGNS} within #{Options::NUMBER_OF_GUESSES} guesses."
    puts "Each guess will receive a feedback of signs:
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
    Board.guesses_history << {self.get_player_guess => computer.calculate_feedback}
    Board.print_guesses
  end

  def self.generate_solution
    @@solution = SIGNS.shuffle.first(Options::COMBINATION_LENGTH).map {|sign| sign.char}
  end

  def self.calculate_feedback()
    @@feedback = Array.new()
    @@player_guess.each_with_index do |sign, idx|
      if (@@solution.include?(sign))
        if (idx == @@solution.index(sign))
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
    @@available_signs = SIGNS.map {|sign| sign.char}
    while (@@player_guess.length != Options::COMBINATION_LENGTH)
      puts "Choose symbol solution ##{@@player_guess.length + 1} from #{@@available_signs}."
      @@chosen_symbol = gets.chomp.to_i
      until (@@available_signs.include?(@@chosen_symbol))
        puts "#{@@chosen_symbol} is not available, choose from #{@@available_signs}."
        @@chosen_symbol = gets.chomp.to_i
      end
      @@player_guess << @@chosen_symbol
      @@available_signs.delete(@@chosen_symbol)
      puts "Your guess is #{@@player_guess}"
    end
    return @@player_guess
  end
end
