class Pub

  attr_reader :name, :drinks
  attr_accessor :till

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks

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


end
