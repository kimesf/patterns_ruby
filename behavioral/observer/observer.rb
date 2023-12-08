# frozen_string_literal: true

# :nodoc:
class User
  attr_reader :name, :address

  def initialize(name, address)
    @name = name
    @address = address

    @is_infected = false
    @observers = []
  end

  def infected!
    @is_infected = true

    notify
  end

  def infected?
    @is_infected
  end

  def attach(observer)
    @observers.push(observer)
  end

  private

  def notify
    @observers.each { _1.run(self) }
  end
end

# :nodoc:
class AntiInfectionUnitJob
  def run(user)
    return unless user.infected?

    puts "send extermination team to #{user.address}"
  end
end

# :nodoc:
class NewsJob
  def run(user)
    return unless user.infected?

    puts "hey people, #{user.name} is infected"
  end
end
