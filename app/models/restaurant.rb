class Restaurant < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  geocoded_by :address
  after_validation :geocode

  has_many :groups
  has_many :categories, through: :groups
end
