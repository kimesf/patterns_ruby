# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'facade'

# :nodoc:
class FacadeTest < Minitest::Test
  def test_subscription
    facade = Subscription.new
    account = Account.new(name: 'Gerald')

    output_expectation = <<~HEREDOC
      Gerald charged
      Sent Charged email to Gerald
      Content unlocked for Gerald
      Sent Welcome email to Gerald
    HEREDOC

    assert_output(output_expectation) { facade.call(account) }
  end
end
