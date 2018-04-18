require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../drink.rb')

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new("Euan", 100)
    @customer2 = Customer.new("Andy", 90)
  end


  def test_customer_name
    assert_equal("Euan",@customer1.name)
  end

  def test_customer_wallet
    assert_equal(100, @customer1.wallet)
  end

end
