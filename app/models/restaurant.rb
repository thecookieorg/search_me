class Restaurant < ApplicationRecord
  include PgSearch::Model

  extend FriendlyId
  friendly_id :name, use: :slugged

  geocoded_by :address
  after_validation :geocode

  has_many :groups
  has_many :categories, through: :groups

  pg_search_scope :search_by_name,
                  against: [:name],
                  using: {
                    tsearch: {
                      prefix: true,
                      highlight: {
                        StartSel: '<b>',
                        StopSel: '</b>'
                      }
                    }
                  }
end
