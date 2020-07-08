class Game
  SYMBOLS = []
  (1..8).each {|num| SYMBOLS << num}

  @@solution = []

  private

  def self.create_sequence
    @@available_symbols = SYMBOLS

  end
end

