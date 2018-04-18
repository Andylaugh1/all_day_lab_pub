require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')

class DrinkTest < MiniTest::Test
  def setup
    @drink1 = Drink.new("JD", 3)
  end

  def test_drink_name
    assert_equal("JD", @drink1.name)
  end

  def test_drink_price
    assert_equal(3, @drink1.price)
  end

end
