# frozen_string_literal: true

# :nodoc:
class Button
  def initialize(color, name, command)
    @color = color
    @name = name
    @command = command
  end

  def click(payload = nil) = @command.call(payload)
end

# :nodoc:
class Command
  def call(_payload)
    raise 'not implemented'
  end
end

# :nodoc:
class ItemSave < Command
  def call(item_name)
    puts "#{item_name} saved"
  end
end

# :nodoc:
class Undo < Command
  def call(_)
    puts 'undone'
  end
end

# :nodoc:
class Confirm < Command
  def call(_)
    puts 'confirmed'
  end
end
