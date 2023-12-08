# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'factory_method'

# :nodoc:
class FactoryMethodTest < Minitest::Test
  def test_10_percent_discount
    cupom = 'FOO'
    price = 100

    assert_equal Discount.for(cupom:).apply_to(price), 90
  end

  def test_12_percent_discount
    cupom = 'BAR'
    price = 200

    assert_equal Discount.for(cupom:).apply_to(price), 176
  end

  def test_10_dollars_discount
    cupom = 'FOOBAR'
    price = 200

    assert_equal Discount.for(cupom:).apply_to(price), 190
  end

  def test_invalid_cupom
    cupom = 'INVALIDCUPOM'
    price = 123

    assert_equal Discount.for(cupom:).apply_to(price), 123
  end
end
