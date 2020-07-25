require_relative "costants"
require_relative "board"
require_relative "sign"
require_relative "computer"

class Game

  def self.play
    self.print_welcome_msg
    self.start_game_loop
  end

  def self.player_guess
    return @@player_guess
  end

  private

  SIGNS = []
  (1..Options::NUMBER_OF_SIGNS).each {|num| SIGNS << Sign.new(num)}

  @@player_guess = Array.new()

  def self.start_game_loop
    loop do
      puts UI::SEPARATOR
      if (self.ask_game_mode == 1)
        self.play_guess_round
      else
        self.play_master_round
      end

    end
  end

  def self.play_guess_round
    Computer.generate_solution
      while (Board.guesses_history.length < Options::NUMBER_OF_GUESSES)
        self.play_turn
        if (@@player_guess == Computer.solution)
          self.show_win_msg
          break
        end
      end
      self.show_lose_msg if Board.guesses_history.length >= Options::NUMBER_OF_GUESSES

      puts "Press enter to start another game"
      gets
      Board.reset_guesses
  end

  def self.ask_game_mode
    puts "Which role would you like to play?"
    puts "(1) I want to guess the Computer combination!"
    puts "(2) I want the Computer to guess my combination!"
    puts "Press the corresponding number and press Enter."
    @@game_mode = gets.chomp.to_i
    until (@@game_mode != 1 && @@game_mode != 2)
      puts "1 and 2 are the only available options!"
      @@game_mode = gets.chomp.to_i
    end
    return @@game_mode
  end

  def self.print_welcome_msg
    puts "Welcome to Mastermind!"
    puts "The objective of the game is to guess the combination of #{Options::COMBINATION_LENGTH} numbers from 1 to #{Options::NUMBER_OF_SIGNS} within #{Options::NUMBER_OF_GUESSES} guesses."
    puts "Each guess will receive a feedback of signs:
     \"#{UI::FULL_MATCH}\" for a correct number in the correct position,
     \"#{UI::HALF_MATCH}\" for a correct number in the wrong position,
     \"#{UI::NO_MATCH}\" for a wrong number."
    puts "Enjoy!"
  end

  def self.show_win_msg
    puts "You won! Well done!"
  end

  def self.show_lose_msg
    puts "You ran out of guesses, you lost!"
  end

  def self.play_turn
    Board.guesses_history << {self.get_player_guess => Computer.calculate_feedback}
    Board.print_guesses
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

  def self.get_player_feedback
    @@player_feedback = []
    self.ask_for_full_matches.times {@@player_feedback << UI::FULL_MATCH}
    self.ask_for_half_matches.times {@@player_feedback << UI::HALF_MATCH}
    while (@@player_feedback.length < Options::COMBINATION_LENGTH)
      @@player_feedback << UI::NO_MATCH
    end
    return @@player_feedback
  end

  def self.ask_for_full_matches
    puts "How many are in the correct position?"
    @@player_answer = gets.chomp.to_i
    return self.get_player_input(@@player_answer)
  end

  def self.ask_for_half_matches
    return 0 if @@player_feedback.length >= Options::COMBINATION_LENGTH
    puts "How many are in the wrong position?"
    @@player_answer = gets.chomp.to_i
    return self.get_player_input(@@player_answer)
  end

  def self.get_player_input(player_answer)
    until ((0..Options::COMBINATION_LENGTH - @@player_feedback.length).include?(player_answer))
      puts "You have to give a number between 0 and #{Options::COMBINATION_LENGTH - @@player_feedback.length}!"
      player_answer = gets.chomp.to_i
    end
    return player_answer
  end

end
