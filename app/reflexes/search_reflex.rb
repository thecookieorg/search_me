class SearchReflex < ApplicationReflex
  delegate :render, to: ApplicationController

  def perform(query="")
    return unless query.size > 1
    
    restaurants = Restaurant.search_by_name(query).with_pg_search_highlight.limit(5)
    
    morph "#results", render(Restaurants::SearchListingComponent.new(restaurants: restaurants))
    morph "#results-counter", render(Global::AlertComponent.new(text: "#{restaurants.size} restaurants found", type: :success))
  end
  
  def perform_by_category_id(category_id=nil)
    return if category_id.nil?

    restaurants = Category.find(category_id).restaurants

    morph "#results", render(Restaurants::SearchListingComponent.new(restaurants: restaurants))
    morph "#results-counter", render(Global::AlertComponent.new(text: "#{restaurants.size} restaurants found", type: :success))
  end
end