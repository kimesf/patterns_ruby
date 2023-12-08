# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'adapter'

# :nodoc:
class AdapterTest < Minitest::Test
  def test_transfer_between_bank_one
    from = BankOne.new(100)
    to   = BankOne.new(100)

    Transfer.new(from:, to:, amount: 30).execute

    assert_equal(70, from.balance)
    assert_equal(130, to.balance)
  end

  def test_transfer_between_bank_two
    from = BankTwoAdapter.new(100)
    to   = BankTwoAdapter.new(100)

    Transfer.new(from:, to:, amount: 20).execute

    assert_equal(80, from.balance)
    assert_equal(120, to.balance)
  end

  def test_transfer_from_bank_one_to_bank_two
    from = BankOne.new(100)
    to   = BankTwoAdapter.new(100)

    Transfer.new(from:, to:, amount: 50).execute

    assert_equal(50, from.balance)
    assert_equal(150, to.balance)
  end

  def test_transfer_from_bank_two_to_bank_one
    from = BankTwoAdapter.new(100)
    to   = BankOne.new(100)

    Transfer.new(from:, to:, amount: 90).execute

    assert_equal(10, from.balance)
    assert_equal(190, to.balance)
  end
end
