class Player

  attr_reader :name
  attr_accessor :weapon, :score

  def initialize(name)
    @name = name
    @score = 0
  end

end
