require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')


class PubTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("JD", 5)
    @drink2 = Drink.new("Beer", 3)
    @drink3 = Drink.new("Wine", 4)
    @drink4 = Drink.new("Vodka", 4)

    @customer1 = Customer.new("Euan", 100)
    @customer2 = Customer.new("Andy", 90)

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

end
