# frozen_string_literal: true

# :nodoc:
class User
  attr_reader :name, :age, :wealth

  def initialize(name:, age:, wealth:)
    @name = name
    @age = age
    @wealth = wealth

    @history = []
  end

  def update(...)
    snapshot!

    update!(...)
  end

  def undo!
    memento = @history.pop
    return unless memento

    update!(
      name: memento.name,
      age: memento.age,
      wealth: memento.wealth
    )
  end

  private

  def update!(name: self.name, age: self.age, wealth: self.wealth)
    @name = name
    @age = age
    @wealth = wealth
  end

  def snapshot!
    @history.push(clone)
  end
end
