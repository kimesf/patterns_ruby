# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'composite'

# :nodoc:
class CompositeTest < Minitest::Test
  def test_composite_price
    product1 = Product.new(price: 100)
    product2 = Product.new(price: 200)
    product3 = Product.new(price: 300)
    box1 = Box.new(fee_cost: 5, sellables: [product1, product2])
    box2 = Box.new(fee_cost: 15, sellables: [product3])
    container1 = Container.new(shipping_cost: 10, sellables: [box1, box2])

    assert_equal(100, product1.price)
    assert_equal(200, product2.price)
    assert_equal(300, product3.price)
    assert_equal(305, box1.price)
    assert_equal(315, box2.price)
    assert_equal(640, container1.price)
  end
end
