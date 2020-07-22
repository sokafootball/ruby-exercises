require_relative "costants"

class Sign

  attr_reader :char
  attr_accessor :positions_status
  attr_accessor :inclusion_status

  def tried_positions
    return @positions_status.count(Options::COMBINATION_LENGTH - PositionStates::NOT_TRIED)
  end

  private

  @inclusion_status
  @positions_status

  def initialize(char)
    @char = char
    @inclusion_status = InclusionStates::NOT_TRIED
    @positions_status = Array.new(Options::COMBINATION_LENGTH, PositionStates::NOT_TRIED)
  end



end
