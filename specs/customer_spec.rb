require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../food.rb')

class CustomerTest < MiniTest::Test

  def setup

    @drink1 = Drink.new("JD", 5, 10)
    @drink2 = Drink.new("Beer", 3, 20)
    @drink3 = Drink.new("Wine", 4, 30)
    @drink4 = Drink.new("Vodka", 4, 40)

    @food1 = Food.new("Burger", 8, 15)

    @customer1 = Customer.new("Euan", 25, 100, 20)
    @customer2 = Customer.new("Andy", 16, 90, 20)
  end


  def test_customer_name
    assert_equal("Euan",@customer1.name)
  end

  def test_customer_wallet
    assert_equal(100, @customer1.wallet)
  end

  def test_buy_drink_decrease_wallet
    decrease_wallet = @customer1.wallet -= @drink1.price
    assert_equal(95, @customer1.wallet)
  end

  def test_check_customer_age
    assert_equal(25, @customer1.age)
  end

  def test_increase_drunkenness_customer()
    @customer1.increase_drunkenness_customer(@drink1)
    assert_equal(30, @customer1.drunkenness)
  end

  def test_customer_buys_food()
  @customer1.buy_food(@food1)
  assert_equal(92, @customer1.wallet)
  assert_equal(5, @customer1.drunkenness)
  end

end
