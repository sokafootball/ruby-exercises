class Hangman

  ALPHABET = ('a'..'z').to_a
  NUMBER_OF_GUESSES = 8
  @@available_letters = ALPHABET

  def self.pick_secret_word
    secret_word = ""
    loop do
      secret_word = IO.readlines("words.txt").sample
      break if (secret_word.length >= 5 && secret_word.length <= 12)
    end
    return secret_word
  end

  @@x = 1
  while (x <= NUMBER_OF_GUESSES)
  end

  @@secret_word = self.pick_secret_word()



end


