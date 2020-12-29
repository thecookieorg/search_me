class Restaurants::ListingComponent < ViewComponent::Base
  with_collection_parameter :restaurant

  def initialize(restaurant:)
    @restaurant = restaurant
  end
end
