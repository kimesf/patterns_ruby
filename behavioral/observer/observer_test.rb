# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'observer'

# :nodoc:
class ObserverTest < Minitest::Test
  def test_notifying
    user = User.new('Kim', 'Sesame Street 42')
    user.attach(AntiInfectionUnitJob.new)
    user.attach(NewsJob.new)

    expected_output = <<~HEREDOC
      send extermination team to Sesame Street 42
      hey people, Kim is infected
    HEREDOC

    assert_output(expected_output) { user.infected! }
  end
end
