# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'template_method'

# :nodoc:
class TemplateMethodTest < MiniTest::Test
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
    printer = ReversePrinter.new(phrases)

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
    printer = RandomPrinter.new(phrases)

    expected_output = /^((one|two|three|four)\n){4}$/

    assert_output(expected_output) { printer.call }
  end
end
