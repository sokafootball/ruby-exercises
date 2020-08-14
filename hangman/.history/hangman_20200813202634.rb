secret_word = pick_secret_word()
puts secret_word

def pick_secret_word()
  secret_word = ""
  loop do
    secret_word = IO.readlines("words.txt").sample
    break if (secret_word.length >= 5 && secret_word.length <= 12)
  end
  return secret_word
end

