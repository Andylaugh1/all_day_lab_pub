class Pub

  attr_reader :name
  attr_accessor :till, :drinks

  def initialize(name, till, drinks, stock_count=0)
    @name = name
    @till = till
    @drinks = drinks
    @stock_count = 0

  end

  def increase_till(drink)
    @till += drink.price
  end

  def customer_buy_drink(customer, drink)
    customer.reduce_wallet(drink)
    increase_till(drink)
  end

  def check_age(customer)
    customer.age
  end

  def sell_drink_or_not(customer, drink)
    if check_age(customer) >= 18
      customer_buy_drink(customer, drink)
    else
      return "Not tonight son"
    end
  end

  def increase_drunkenness(customer, drink)
    sell_drink_or_not(customer, drink)
    customer.increase_drunkenness_customer(drink)
  end

  def reject_customer_drunk(customer, drink)
    increase_drunkenness(customer, drink)
    if customer.drunkenness > 30
      return "Not tonight son, too much"
    else
      return
    end
  end

  def reduce_customer_drunkenness(customer, food)
    customer.buy_food(food)
  end

  def stock_count()
    stock = 0
    @drinks.each do |d, q|
      stock += q
    end
    return stock
  end

  def drink_stock_value(drink)
    return @drinks[:@drink1] * drink.price
  end

  def total_stock_value(drink1, drink2, drink3, drink4)
    @stock_count += (@drinks[:@drink1] * drink1.price)
    @stock_count += (@drinks[:@drink2] * drink2.price)
    @stock_count += (@drinks[:@drink3] * drink3.price)
    @stock_count += (@drinks[:@drink4] * drink4.price)
    return @stock_count
  end

end
