# frozen_string_literal: true

# :nodoc:
class Subscription
  def initialize
    @repo = Repo.new
    @charger = ThirdyPartyTransferService.new
    @email_service = SendEmailJob.new
  end

  def call(account)
    charge(account)
    unlock_content(account)
    send_welcome_email(account)
  end

  private

  attr_reader :charger, :email_service, :repo

  def charge(account)
    charger.call(account.name)
    email_service.send(account.name, 'Charged')
  end

  def unlock_content(account)
    repo.unlock(account.name)
  end

  def send_welcome_email(account)
    email_service.send(account.name, 'Welcome')
  end
end

# :nodoc:
class Account
  attr_reader :name

  def initialize(name:)
    @name = name
  end
end

# :nodoc:
class Repo
  def unlock(username)
    puts "Content unlocked for #{username}"
  end
end

# :nodoc:
class ThirdyPartyTransferService
  def call(username)
    puts "#{username} charged"
  end
end

# :nodoc:
class SendEmailJob
  def send(username, title)
    puts "Sent #{title} email to #{username}"
  end
end
