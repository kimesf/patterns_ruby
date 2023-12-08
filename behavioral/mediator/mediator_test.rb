# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'mediator'

# :nodoc:
class MediatorTest < Minitest::Test
  def test_success
    mediator = TransferService.new('Kim', true)

    assert_output("Email success sent for Kim\n") { mediator.call }
  end

  def test_failure
    mediator = TransferService.new('Kim', false)

    assert_output("Email failure sent for Kim\n") { mediator.call }
  end
end
