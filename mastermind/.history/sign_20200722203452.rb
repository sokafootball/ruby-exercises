require_relative "costants"

class Sign

  attr_reader :char
  attr_accessor :positions_status
  attr_accessor :inclusion_status

  def tried_positions
    return Options::COMBINATION_LENGTH - @positions_status.count(PositionStates::NOT_TRIED)
  end

  def exclude_if_possible

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
