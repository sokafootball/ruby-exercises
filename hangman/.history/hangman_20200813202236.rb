#load a random word between 5 and 12 letters from words.txt
loop do
  secret_word = IO.readlines("words.txt").sample
  break if (secret_word.length => 5 && secret_word.length <= 12)
end

puts secret_word
