require_relative "costants"
require_relative "board"
require_relative "sign"
require_relative "game"

class Computer

  def self.calculate_feedback()

    def solution
      return @@solution
    end

    @@feedback = Array.new()
    Game.player_guess.each_with_index do |sign, idx|
      if (Game.solution.include?(sign))
        if (idx == Game.solution.index(sign))
          @@feedback << UI::FULL_MATCH
        else
          @@feedback << UI::HALF_MATCH
        end
      else
        @@feedback << UI::NO_MATCH
      end
    end
    return @@feedback.sort!
  end

  private

  @@solution
end
