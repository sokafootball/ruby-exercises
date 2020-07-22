require_relative "sign"
require_relative "game"
require_relative "costants"

sign = Sign.new("1")
p sign.inclusion_status
p InclusionStates::NOT_TRIED
