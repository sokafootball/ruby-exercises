require_relative "game_options"

class Sign
  attr_reader :char
  attr_accessor :positions_status
  def initialize(char)
    @char = char
  end

  private

  @@positions_status = Array.new()

end
