# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'command'

# :nodoc:
class CommandTest < Minitest::Test
  def test_item_save
    btn = Button.new('green', 'save item', ItemSave.new)

    assert_output("Pen saved\n") { btn.click('Pen') }
  end

  def test_undo
    btn = Button.new('green', 'save item', Undo.new)

    assert_output("undone\n") { btn.click }
  end

  def test_confirm
    btn = Button.new('green', 'save item', Confirm.new)

    assert_output("confirmed\n") { btn.click }
  end
end
