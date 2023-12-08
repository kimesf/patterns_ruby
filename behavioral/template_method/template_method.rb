# frozen_string_literal: true

# :nodoc:
class Printer
  def initialize(phrases)
    @phrases = phrases
  end

  def call
    puts order
  end

  private

  attr_reader :phrases

  def order
    phrases
  end
end

# :nodoc:
class RandomPrinter < Printer
  private

  def order
    phrases.shuffle
  end
end

# :nodoc:
class ReversePrinter < Printer
  def order
    phrases.reverse
  end
end
