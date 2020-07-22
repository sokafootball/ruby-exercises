require_relative "sign"
require_relative "game"
require_relative "costants"

sign = Sign.new("1")
p sign.inclusion_status
sign.positions_status.map! { |pos| PositionStates::SURE_WRONG }
p sign.inclusion_status
