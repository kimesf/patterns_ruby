# frozen_string_literal: true

# :nodoc:
module Sellable
  def initialize(sellables: [], **_)
    @sellables = sellables
  end

  def price
    raise 'not implemented'
  end

  def add(sellable_item)
    sellable.push(sellable_item)
  end

  def remove(sellable_item)
    sellable.delete(sellable_item)
  end

  private

  attr_accessor :sellables
end

# :nodoc:
class Product
  include Sellable

  attr_reader :price

  def initialize(price:, **_)
    @price = price

    super
  end
end

# :nodoc:
class Box
  include Sellable

  def initialize(fee_cost: 0, **_)
    @fee_cost = fee_cost

    super
  end

  def price
    sellables.reduce(fee_cost) { |acc, sellable| acc + sellable.price }
  end

  private

  attr_reader :fee_cost
end

# :nodoc:
class Container
  include Sellable

  def initialize(shipping_cost: 0, **_)
    @shipping_cost = shipping_cost

    super
  end

  def price
    sellables.reduce(0) { |acc, sellable| acc + sellable.price + shipping_cost }
  end

  private

  attr_reader :shipping_cost
end
