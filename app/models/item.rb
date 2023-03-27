class Item < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :name, presence: true
  validates :description, presence: true
  validates :age, presence: true
  validates :house, presence: true
end
