require('minitest/autorun')
require('minitest/rg')
require_relative('../food.rb')

class FoodTest < MiniTest::Test

  def setup
    @food1 = Food.new("Burger", 8, 15)
  end

  def test_get_rejuv_level
    assert_equal(15, @food1.rejuv_level)
  end

end
