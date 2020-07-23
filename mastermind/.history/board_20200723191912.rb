#array of guesses + feedbacks
#available signs for a guess
#method for printing all previous guesses and feedbacks

require_relative "costants"

class Board

  def self.guesses_history
    return @guesses_history
  end

  def self.reset_guesses
    @guesses_history = Array.new()
  end

  def self.print_guesses
    puts UI::SEPARATOR
    @guesses_history.each_with_index do |guess, idx|
      puts "#{idx + 1}. #{guess.keys[0]} | #{guess.values[0]} \n"
    end
    puts UI::SEPARATOR
  end

  private

  @guesses_history

end
