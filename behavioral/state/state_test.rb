# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'state'

# :nodoc:
class StateTest < Minitest::Test
  def test_states
    article = Article.new('Cool article on AI world conquer')
    assert_nil article.show

    article.approved!
    assert_equal 'Cool article on AI world conquer', article.show
  end
end
