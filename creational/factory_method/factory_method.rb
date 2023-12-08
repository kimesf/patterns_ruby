# frozen_string_literal: true

# :nodoc:
module Discount
  # :nodoc:
  class TenPercent
    def apply_to(price) = price * 0.90
  end

  # :nodoc:
  class TwelvePercent
    def apply_to(price) = price * 0.88
  end

  # :nodoc:
  class TenDollars
    def apply_to(price) = price - 10
  end

  # :nodoc:
  class NoDiscount
    def apply_to(price) = price
  end

  NO_DISCOUNT = NoDiscount.new

  CUPONS = {
    'FOO' => TenPercent.new,
    'BAR' => TwelvePercent.new,
    'FOOBAR' => TenDollars.new
  }.freeze

  def self.for(cupom:)
    CUPONS[cupom] || NO_DISCOUNT
  end
end
