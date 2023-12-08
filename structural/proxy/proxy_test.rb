# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'proxy'

# :nodoc:
class ProxyTest < Minitest::Test
  def test_unproxied
    subscription = Subscription.new

    output_expectation = <<~HEREDOC
      Lucas subscribed!
    HEREDOC

    assert_output(output_expectation) { subscription.subscribe('Lucas') }
  end

  def test_proxy
    subscription = SubscriptionRenovation.new

    output_expectation = <<~HEREDOC
      Checking if Lucas paid for subscription
      Lucas subscribed!
      Subscription email sent for Lucas
    HEREDOC

    assert_output(output_expectation) { subscription.subscribe('Lucas') }
  end
end
