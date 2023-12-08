# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'strategy'

# :nodoc:
class StrategyTest < Minitest::Test
  def test_default
    phrases = %w[one two three four]
    printer = Printer.new(phrases)

    expected_output = <<~HEREDOC
      one
      two
      three
      four
    HEREDOC

    assert_output(expected_output) { printer.call }
  end

  def test_reverse
    phrases = %w[one two three four]
    printer = Printer.new(phrases, ReverseOrder.new)

    expected_output = <<~HEREDOC
      four
      three
      two
      one
    HEREDOC

    assert_output(expected_output) { printer.call }
  end

  def test_random
    phrases = %w[one two three four]
    printer = Printer.new(phrases, RandomOrder.new)

    expected_output = /^((one|two|three|four)\n){4}$/

    assert_output(expected_output) { printer.call }
  end
end
