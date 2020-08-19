class Hangman

  ALPHABET = ('a'..'z').to_a
  MAX_GUESSES = 12
  SAVE_COMMAND = "save"
  MIN_WORD_LENGTH = 5
  MAX_WORD_LENGTH = 12
  @@available_letters = ALPHABET
  @@guesses_left = MAX_GUESSES

  def self.pick_secret_word
    secret_word = ""
    loop do
      secret_word = IO.readlines("words.txt").sample
      break if (secret_word.length >= MIN_WORD_LENGTH && secret_word.length <= MAX_WORD_LENGTH)
    end
    return secret_word
  end

  def self.show_guessed_word
    puts @@guessed_word
  end

  def self.show_guesses_left
    puts "You have #{@@guesses_left} guesses left."
  end

  def self.ask_input
    puts "Guess a letter! (or type #{SAVE_COMMAND} to save and exit the game.)"
    player_input = gets.chomp.downcase
    self.save_and_exit if player_input == SAVE_COMMAND
    until (@@available_letters.include?(player_input))
      puts "The letter you chose is either invalid or already chosen before, choose another one."
      player_input = gets.chomp.downcase
    end
    return player_input
  end

  def self.update_guessed_word
    @@secret_word.split("").each_with_index do |letter, index|
      @@guessed_word[index] = letter if (letter == @@guessed_letter)
    end
  end

  def self.show_win_msg
    puts "You won!"
  end

  def self.show_lost_msg
    puts "You lost! The word was #{@@secret_word}"
  end

  @@secret_word = self.pick_secret_word()
  @@guessed_word = Array.new(@@secret_word.length, "_").join
  @@guessed_letter = ""

  def self.play_game
    while (@@guesses_left > 0)
      self.show_guessed_word
      self.show_guesses_left
      @@guessed_letter = self.ask_input
      @@available_letters.delete(@@guessed_letter)
      self.update_guessed_word
      if (@@guessed_word == @@secret_word)
        self.show_win_msg
        break
      end
      @@guesses_left -= 1
    end
    self.show_lost_msg if @@guesses_left <= 0
  end
end

def self.save_and_exit

end

Hangman.play_game



