require_relative "costants"

class Sign

  attr_reader :char
  attr_accessor :positions_status
  attr_accessor :inclusion_status

  private

  @inclusion_status = InclusionStates::NOT_TRIED
  @positions_status = Array.new(Options::COMBINATION_LENGTH)

  def initialize(char)
    @char = char
  end

end
