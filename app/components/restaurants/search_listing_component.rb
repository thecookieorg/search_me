class Restaurants::SearchListingComponent < ViewComponent::Base
  def initialize(restaurants:)
    @restaurants = restaurants
  end
end
