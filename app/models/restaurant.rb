class Restaurant < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :groups
  has_many :categories, through: :groups
end
