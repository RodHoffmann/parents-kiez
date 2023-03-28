class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validate :item_must_be_available, on: :create
  validates :start_time, presence: true
  validates :end_time, presence: true
end
