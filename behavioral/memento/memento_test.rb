# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'memento'

# :nodoc:
class MementoTest < Minitest::Test
  def test_undo
    user = User.new(name: 'Carlos', age: 18, wealth: 1_000)
    user.update(age: 19, wealth: 3_000)
    user.update(age: 20, wealth: 10_000)

    assert_equal('Carlos', user.name)
    assert_equal(20, user.age)
    assert_equal(10_000, user.wealth)

    user.undo!
    assert_equal('Carlos', user.name)
    assert_equal(19, user.age)
    assert_equal(3_000, user.wealth)

    user.undo!
    assert_equal('Carlos', user.name)
    assert_equal(18, user.age)
    assert_equal(1_000, user.wealth)

    user.undo!
    assert_equal('Carlos', user.name)
    assert_equal(18, user.age)
    assert_equal(1_000, user.wealth)
  end
end
