class Game
  SYMBOLS = []
  (1..8).each {|num| SYMBOLS << num}

  @@solution = []

  private

  def self.generate_solution
    @@solution = SYMBOLS.shuffle.first(4)

  end
end

