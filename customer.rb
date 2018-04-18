class Customer

  attr_reader :name, :age
  attr_accessor :wallet, :drunkenness

  def initialize(name, age, wallet, drunkenness)
    @name = name
    @age = age
    @wallet = wallet
    @drunkenness = drunkenness
  end

  def reduce_wallet(drink)
    @wallet -= drink.price
  end

  def increase_drunkenness_customer(drink)
    @drunkenness += drink.alcohol_level
  end

  def buy_food(food)
    @wallet -= food.price
    @drunkenness -= food.rejuv_level
  end
end
