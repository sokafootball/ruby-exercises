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

  end

  @@secret_word = self.pick_secret_word()
  while (guesses_left >= 0)
    self.show_guessed_word
    self.show_guesses
    self.ask_input
    @@guesses_left -= 1
  end



end


