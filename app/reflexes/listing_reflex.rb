class ListingReflex < ApplicationReflex
  delegate :render, to: ApplicationController

  def show_map
    r_id = element.dataset['restaurant-id']
    restaurant = Restaurant.find(r_id)

    morph "#restaurant_map", render(Global::ToastComponent.new(show: true, restaurant: restaurant))
  end
end