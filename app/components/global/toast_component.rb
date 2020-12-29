class Global::ToastComponent < ViewComponent::Base
  def initialize(show:, restaurant:)
    @show = show
    @restaurant = restaurant
  end

  def render?
    @show == true
  end
end