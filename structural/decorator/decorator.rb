# frozen_string_literal: true

require 'delegate'

# :nodoc:
class User
  attr_reader :first_name, :last_name, :birth_date

  def initialize(first_name:, last_name:, birth_date:)
    @first_name = first_name
    @last_name = last_name
    @birth_date = birth_date
  end
end

# :nodoc:
class UserDecorator < SimpleDelegator
  YEAR_IN_SECONDS = 60 * 60 * 24 * 365.25

  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    age_in_seconds = Time.now - birth_date
    exact_age      = age_in_seconds / YEAR_IN_SECONDS

    exact_age.floor
  end
end
