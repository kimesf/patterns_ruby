# frozen_string_literal: true

# :nodoc:
class Subscription
  def subscribe(username)
    puts "#{username} subscribed!"
  end
end

# :nodoc:
class SubscriptionRenovation
  def initialize(actual = Subscription.new)
    @actual = actual
  end

  def subscribe(username)
    return unless paid?(username)

    actual.subscribe(username)
    send_subscription_email(username)
  end

  private

  attr_reader :actual

  def paid?(username)
    puts "Checking if #{username} paid for subscription"

    true
  end

  def send_subscription_email(username)
    puts "Subscription email sent for #{username}"
  end
end
