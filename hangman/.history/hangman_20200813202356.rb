#load a random word between 5 and 12 letters from words.txt
def pick_secret_word
  secret_word = ""
  loop do
    secret_word = IO.readlines("words.txt").sample
    break if (secret_word.length >= 5 && secret_word.length <= 12)
  end

  puts secret_word
end
