require_relative "costants"

class Sign

  attr_reader :char
  attr_accessor :positions_status
  attr_accessor :inclusion_status

  private

  @inclusion_status
  @positions_status

  def initialize(char)
    @char = char
    @inclusion_status = InclusionStates::NOT_TRIED
    @positions_status = Array.new(4, Options::COMBINATION_LENGTH)
  end

end
