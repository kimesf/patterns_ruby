# frozen_string_literal: true

# :nodoc:
class Handler
  def initialize(_args = nil); end

  def handle(request)
    resolve(request)

    next_handler&.handle(request)
  end

  def chain(next_handler)
    @next_handler = next_handler

    @next_handler
  end

  private

  attr_reader :next_handler

  def resolve = raise('not implemented')
end

# :nodoc:
class ItemValidator < Handler
  private

  def resolve(request)
    item_name = request.fetch(:item_name)

    puts "#{item_name} validated"
  end
end

# :nodoc:
class AuthorizeCreation < Handler
  private

  def resolve(request)
    user_id = request.fetch(:user_id)

    puts "User #{user_id} authorized"
  end
end

# :nodoc:
class ItemCreator < Handler
  private

  def resolve(request)
    item_name = request.fetch(:item_name)

    puts "#{item_name} created"
  end
end

# :nodoc:
class EmailSender < Handler
  def initialize(subject)
    @subject = subject

    super
  end

  private

  attr_reader :subject

  def resolve(request)
    user_id = request.fetch(:user_id)

    puts "Email sent: #{subject} for user #{user_id}"
  end
end
