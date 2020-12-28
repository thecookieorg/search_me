class Group < ApplicationRecord
  belongs_to :restaurant
  belongs_to :category
end
