class Restaurant < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  geocoded_by :address

  has_many :groups
  has_many :categories, through: :groups
end
