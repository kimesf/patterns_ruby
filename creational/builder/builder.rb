# frozen_string_literal: true

# :nodoc:
class DiscountBuilder
  def initialize(price)
    @price = price
  end

  def create = @price

  def ten_dollars
    @price -= 10

    self
  end

  def ten_percent
    @price *= 0.90

    self
  end
end
