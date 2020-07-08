class Game
  COMBINATION_LENGTH = 4
  NUMBER_OF_SYMBOLS = 8
  SYMBOLS = []
  (1..NUMBER_OF_SYMBOLS).each {|num| SYMBOLS << num}

  @@solution = []

  private

  def self.generate_solution
    @@solution = SYMBOLS.shuffle.first(COMBINATION_LENGTH)
  end
end

Game.generate_solution

