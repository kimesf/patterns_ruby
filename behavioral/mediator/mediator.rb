# frozen_string_literal: true

# :nodoc:
class TransferService
  def initialize(recipient, mock_result)
    @recipient = recipient
    @mock_result = mock_result
    @bank = Bank.new
    @email_sender = EmailSender.new
  end

  def call
    result = bank.call(mock_result) ? 'success' : 'failure'

    email_sender.call(recipient, result)
  end

  private

  attr_reader :recipient, :mock_result, :bank, :email_sender
end

# :nodoc:
class EmailSender
  def call(recipient, subject)
    puts "Email #{subject} sent for #{recipient}"
  end
end

# :nodoc:
class Bank
  def call(mock_result) = mock_result
end
