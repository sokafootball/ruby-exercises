#array of guesses + feedbacks
#available signs for a guess
#method for printing all previous guesses and feedbacks
class Board
  attr_accessor :guesses_history

  def self.print_guesses
    puts "__________________________________________\n\n"
    @@guesses_history.each_with_index do |guess, idx|
      puts "#{idx + 1}. #{guess.keys[0]} | #{guess.values[0]} \n"
    end
    puts "__________________________________________\n\n"
  end

  private

  @@guesses_history

end
