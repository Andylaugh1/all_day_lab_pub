require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../food.rb')



class PubTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("JD", 5, 10)
    @drink2 = Drink.new("Beer", 3, 20)
    @drink3 = Drink.new("Wine", 4, 30)
    @drink4 = Drink.new("Vodka", 4, 40)

    @food1 = Food.new("Burger", 8, 15)

    @customer1 = Customer.new("Euan", 25, 100, 20)
    @customer2 = Customer.new("Andy", 16, 90, 20)

    @pub = Pub.new("Chanter", 500, ["JD", "Beer", "Wine", "Vodka"])

  end

  def test_pub_name
    assert_equal("Chanter", @pub.name)
  end

  def test_pub_till
    assert_equal(500, @pub.till)
  end

  def test_drink_numbers
    assert_equal(4, @pub.drinks.length)
  end

  def test_increase_till_value
    @pub.increase_till(@drink1)
    assert_equal(505, @pub.till)
  end

  def test_buy_drink
    @pub.customer_buy_drink(@customer1, @drink1)
    assert_equal(95, @customer1.wallet)
    assert_equal(505, @pub.till)
  end

  def test_check_customer_age
    @pub.check_age(@customer1)
    assert_equal(25, @pub.check_age(@customer1))
  end

  def test_check_customer_age__buy
    @pub.sell_drink_or_not(@customer1, @drink1)
    assert_equal(505, @pub.till)
  end

  def test_check_customer_age__reject
    @pub.sell_drink_or_not(@customer2, @drink1)
    assert_equal(500, @pub.till)
  end

  def test_increase_drunkenness_level_ok
    @pub.increase_drunkenness(@customer1, @drink1)
    assert_equal(30, @customer1.drunkenness)
  end

  def test_increase_drunkenness_level__reject
    customer_reject = @pub.reject_customer_drunk(@customer1, @drink4)
    assert_equal("Not tonight son, too much", customer_reject)
  end

  def test_reduce_cust_drunkenness_level
    customer_reduce = @pub.reduce_customer_drunkenness(@customer1, @food1)
    assert_equal(5, @customer1.drunkenness)
  end





end
