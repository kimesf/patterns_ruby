# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'chain_of_responsability'

# :nodoc:
class ChainOfResponsabilityTest < Minitest::Test
  def test_chain
    request = { user_id: 1, item_name: 'Pen' }

    send_email = EmailSender.new('item created')
    create     = ItemCreator.new
    validate   = ItemValidator.new
    authorize  = AuthorizeCreation.new

    authorize.chain(validate)
             .chain(create)
             .chain(send_email)

    output_expectation = <<~HEREDOC
      User 1 authorized
      Pen validated
      Pen created
      Email sent: item created for user 1
    HEREDOC

    assert_output(output_expectation) { authorize.handle(request) }
  end
end
