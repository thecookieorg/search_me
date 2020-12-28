class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :groups
  has_many :restaurants, through: :groups

  validates :name, presence: true
end
