class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :start_time, presence: true
  validates :end_time, presence: true

  scope :active, -> { where('end_time > ?', Time.current) }
end
