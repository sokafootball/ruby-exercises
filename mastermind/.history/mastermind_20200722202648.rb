require_relative "sign"
require_relative "game"
require_relative "costants"

sign = Sign.new("1")
p sign.tried_positions.to_s
