class AdminDashboardsController < ApplicationController
  def index
    @restaurants = Restaurant.all.size
    @categories = Category.all.size
  end
end
