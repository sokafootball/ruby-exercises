require_relative "costants"

class Sign

  @@INCLUSION_STATES = {

  }

  attr_reader :char
  attr_accessor :positions_status
  attr_accessor :inclusion_status

  def initialize(char)
    @char = char
  end

  private

  @inclusion_status = ""
  @positions_status = Array.new(Options::COMBINATION_LENGTH)

end
