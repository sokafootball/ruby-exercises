#load a random word between 5 and 12 letters from words.txt
secret_word = IO.readlines("words.txt").sample
while (secret_word.length)