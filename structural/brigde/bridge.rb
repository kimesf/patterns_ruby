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
class Transferable
  def balance
    raise 'not implemented'
  end

  def add(_amount)
    raise 'not implemented'
  end

  def subtract(_amount)
    raise 'not implemented'
  end
end

# :nodoc:
class BankOne < Transferable
  attr_reader :balance

  def initialize(balance)
    @balance = balance
  end

  def add(amount)
    @balance += amount
  end

  def subtract(amount)
    @balance -= amount
  end
end

# :nodoc:
class BankTwo < Transferable
  def initialize(total)
    @total = total
  end

  def balance = @total

  def add(amount) = modify(amount.abs)

  def subtract(amount) = modify(-amount.abs)

  private

  def modify(amount)
    @total += amount
  end
end
