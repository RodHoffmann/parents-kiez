class Babysitter < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :gender, inclusion: { in: %w[Female Male Else] }
  validates :address, presence: true
  validates :cost_per_hour, presence: true
  validates :years_of_experience, presence: true

  acts_as_votable

  include PgSearch::Model
  pg_search_scope :search_by_first_name_and_last_name_and_cost_per_hour_and_address_and_age_and_gender,
                  against: %i[first_name last_name cost_per_hour address age gender],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
