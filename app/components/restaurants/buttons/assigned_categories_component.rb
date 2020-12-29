class Restaurants::Buttons::AssignedCategoriesComponent < ViewComponent::Base
  with_collection_parameter :assigned_category

  def initialize(assigned_category:, restaurant_id:)
    @assigned_category = assigned_category
    @restaurant_id = restaurant_id
  end
end