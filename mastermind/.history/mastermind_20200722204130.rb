require_relative "sign"
require_relative "game"
require_relative "costants"

sign = Sign.new("1")
p sign.positions_status
sign.positions_status.each do |pos|
  pos = PositionStates::SURE_WRONG
end
