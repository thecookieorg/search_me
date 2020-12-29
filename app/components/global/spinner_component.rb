class Global::SpinnerComponent < ViewComponent::Base
  def initialize(show:)
    @show = show
  end

  def render?
    @show == true
  end
end