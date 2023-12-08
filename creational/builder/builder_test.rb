# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'builder'

# :nodoc:
class BuilderTest < Minitest::Test
  def test_10_dollars
    initial_price = 300
    discount_builder = DiscountBuilder.new(initial_price)

    discount_builder.ten_dollars

    assert_equal discount_builder.create, 290
  end

  def test_10_percent
    initial_price = 300
    discount_builder = DiscountBuilder.new(initial_price)

    discount_builder.ten_percent

    assert_equal discount_builder.create, 270
  end

  def test_composition_10_dollars_with_10_percent
    initial_price = 300
    discount_builder = DiscountBuilder.new(initial_price)

    discount_builder
      .ten_dollars
      .ten_percent

    assert_equal discount_builder.create, 261
  end

  def test_composition_10_percent_with_10_dollars
    initial_price = 300
    discount_builder = DiscountBuilder.new(initial_price)

    discount_builder
      .ten_percent
      .ten_dollars

    assert_equal discount_builder.create, 260
  end
end
