require_relative "costants"

class Sign

  attr_reader :char
  attr_accessor :positions_status
  attr_accessor :inclusion_status

  @inclusion_status = PositionStates::NOT_TRIED
  @positions_status = Array.new(Options::COMBINATION_LENGTH)

  def initialize(char)
    @char = char
  end

  private



end
