class Hangman

  require 'json'

  ALPHABET = ('a'..'z').to_a
  MAX_GUESSES = 12
  SAVE_COMMAND = "save"
  LOAD_COMMAND = "load"
  MIN_WORD_LENGTH = 5
  MAX_WORD_LENGTH = 12

  def initialize
    @available_letters = ALPHABET
    @guesses_left = MAX_GUESSES
    @secret_word = pick_secret_word()
    @guessed_word = Array.new(@secret_word.length, "_").join
    @guessed_letter = ""
  end

  def pick_secret_word
    secret_word = ""
    loop do
      secret_word = IO.readlines("words.txt").sample
      break if (secret_word.length >= MIN_WORD_LENGTH && secret_word.length <= MAX_WORD_LENGTH)
    end
    return secret_word
  end

  def show_guessed_word
    puts @guessed_word
  end

  def show_guesses_left
    puts "You have #{@guesses_left} guesses left."
  end

  def ask_input
    puts "Guess a letter! (or type #{SAVE_COMMAND} to save and exit the game.)"
    player_input = gets.chomp.downcase
    save_and_exit if player_input == SAVE_COMMAND
    until (@available_letters.include?(player_input))
      puts "The letter you chose is either invalid or already chosen before, choose another one."
      player_input = gets.chomp.downcase
    end
    return player_input
  end

  def update_guessed_word
    @secret_word.split("").each_with_index do |letter, index|
      @guessed_word[index] = letter if (letter == @guessed_letter)
    end
  end

  def show_win_msg
    puts "You won!"
  end

  def show_lost_msg
    puts "You lost! The word was #{@secret_word}"
  end

  def start_game
    puts "Welcome to Hangman!"
    puts "Press Enter to start playing or type #{LOAD_COMMAND} to load the previous save game."
    player_input = gets.chomp.downcase
    load_game if player_input == LOAD_COMMAND
    play_game
  end

  def play_game
    while (@guesses_left > 0)
      show_guessed_word
      show_guesses_left
      @guessed_letter = ask_input
      @available_letters.delete(@guessed_letter)
      update_guessed_word
      if (@guessed_word == @secret_word)
        show_win_msg
        break
      end
      @guesses_left -= 1
    end
    show_lost_msg if @guesses_left <= 0
  end

  def save_and_exit
    puts "Saving game..."
    save_game = JSON.dump(self)
    File.write("save.json", save_game.to_json)
    puts "Game saved succesfully. See you next time!"
    exit
  end

  def load_game
    #save_game = File.open("save.json")
    #loaded_game = JSON.parse(save_game.read)
    #loaded_game.play_game
    #File.open('save.json') do |f|
    #  hash = JSON.parse(f.read)  #***HERE***
    #  p hash
    #end
  end


hangman = Hangman.new


hangman.start_game

end
