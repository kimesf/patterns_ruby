# frozen_string_literal: true

# :nodoc:
class Printer
  def initialize(phrases, order = DefaultOrder.new)
    @phrases = phrases
    @order = order
  end

  def call
    puts order.call(phrases)
  end

  private

  attr_reader :phrases, :order
end

# :nodoc:
class DefaultOrder
  def call(phrases)
    phrases
  end
end

# :nodoc:
class RandomOrder
  def call(phrases)
    phrases.shuffle
  end
end

# :nodoc:
class ReverseOrder
  def call(phrases)
    phrases.reverse
  end
end
