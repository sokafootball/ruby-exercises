class Hangman

  ALPHABET = ('a'..'z').to_a
  MAX_GUESSES = 8
  @@available_letters = ALPHABET
  @@guesses_left = MAX_GUESSES

  def self.pick_secret_word
    secret_word = ""
    loop do
      secret_word = IO.readlines("words.txt").sample
      break if (secret_word.length >= 5 && secret_word.length <= 12)
    end
    return secret_word
  end

  def self.show_guessed_word
    puts @@guessed_word
  end

  def self.show_guesses_left
    puts "You have #{@@guesses_left} guesses left."
  end

  def self.ask_guessed_letter
    guessed_letter = gets.chomp.downcase
    puts "Guess a letter!"
    until (@@available_letters.include?(guessed_letter))
      guessed_letter = gets.chomp.downcase
      puts "The letter you chose is either invalid or already chosen before, choose another one."
    end
    return guessed_letter
  end

  @@secret_word = self.pick_secret_word()
  @@guessed_word = Array.new(@@secret_word.length, "_").join

  def self.play_game
    while (@@guesses_left >= 0)
      self.show_guessed_word
      self.show_guesses_left
      self.ask_guessed_letter
      self.update_guessed_word
      if (@@guessed_word == @@secret_word)
        self.show_win_msg
        break
      end
      @@guesses_left -= 1
    end
    self.show_lost_msg
  end
end


