# frozen_string_literal: true

class AssignCategoryReflex < ApplicationReflex
  delegate :render, to: ApplicationController

  def create
    r_id = element.dataset["restaurant-id"]
    c_id = element.dataset["category-id"]
    
    if Group.where(restaurant_id: r_id, category_id: c_id).exists?
      morph "#already-exists-message", render(partial: "restaurants/category_already_exists")
    else
      Group.create!(
        restaurant_id: r_id,
        category_id: c_id
      )
    end
  end

  def destroy
    restaurant_id = element.dataset["restaurant-id"]
    category_id = element.dataset["category-id"]

    Group.where(restaurant_id: restaurant_id, category_id: category_id).destroy_all
  end
end
