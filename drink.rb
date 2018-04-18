class Drink

  attr_reader :name, :price
  attr_accessor :alcohol_level

  def initialize(name, price, alcohol_level)
    @name = name
    @price = price
    @alcohol_level = alcohol_level
  end


end
