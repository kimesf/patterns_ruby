# frozen_string_literal: true

require 'date'
require 'minitest/autorun'
require_relative 'decorator'

# :nodoc:
class DecoratorTest < Minitest::Test
  YEAR_IN_SECONDS = 60 * 60 * 24 * 365.25

  def eighteen_years_ago
    now = Time.now
    eighteen_years_ago = YEAR_IN_SECONDS * 18

    now - eighteen_years_ago
  end

  def test_full_name
    user = User.new(first_name: 'John', last_name: 'Wick', birth_date: Time.now)
    decorator = UserDecorator.new(user)

    assert_equal('John Wick', decorator.full_name)
  end

  def test_birth_date
    user = User.new(first_name: 'John', last_name: 'Wick', birth_date: eighteen_years_ago)
    decorator = UserDecorator.new(user)

    assert_equal(18, decorator.age)
  end
end
