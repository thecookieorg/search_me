class Restaurant < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  # after_create_commit { broadcast_prepend_to "restaurants" }
  after_create_commit :geocode_and_broadcast_changes
  after_update_commit { broadcast_replace_to "restaurants" }
  after_destroy_commit { broadcast_remove_to "restaurants" }

  has_many :groups
  has_many :categories, through: :groups

  include PgSearch::Model
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

  private

  def geocode_and_broadcast_changes
    results = Geocoder.search(self.address)

    unless results.nil?
      self.update!(latitude: results.first.coordinates[0], longitude: results.first.coordinates[1])

      broadcast_prepend_to "restaurants"
    end
  end
end
