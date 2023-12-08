# frozen_string_literal: true

# :nodoc:
class Transfer
  def initialize(from:, to:, amount:)
    @from   = from
    @to     = to
    @amount = amount
  end

  def execute
    from.subtract(amount)
    to.add(amount)
  end

  private

  attr_reader :from, :to, :amount
end

# :nodoc:
class BankOne
  attr_reader :balance

  def initialize(balance)
    @balance = balance
  end

  def add(amount)
    @balance += amount.abs
  end

  def subtract(amount)
    @balance -= amount.abs
  end
end

# :nodoc:
class BankTwo
  attr_reader :total

  def initialize(total)
    @total = total
  end

  def modify(amount)
    @total += amount
  end
end

# :nodoc:
class BankTwoAdapter < BankTwo
  def balance = total
  def add(amount) = modify(amount.abs)
  def subtract(amount) = modify(-amount.abs)
end
