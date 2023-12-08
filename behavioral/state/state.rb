# frozen_string_literal: true

# :nodoc:
class Article
  attr_reader :text

  def initialize(text)
    @text = text

    transition_to(WaitingReview.new)
  end

  def show = @state.show

  def approved! = transition_to(Done.new)

  private

  def transition_to(state)
    @state = state
    @state.context = self
  end
end

# :nodoc
class ArticleState
  attr_writer :context

  def show
    raise 'not implemented'
  end
end

# :nodoc
class WaitingReview < ArticleState
  def show; end
end

# :nodoc
class Done < ArticleState
  def show = @context.text
end
