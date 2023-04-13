class Event < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :category, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  acts_as_votable


  include PgSearch::Model
  pg_search_scope :search_by_name_and_description_and_address_and_cost_and_date_and_category,
                  against: %i[name description address cost date category],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
