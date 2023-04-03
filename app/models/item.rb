class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :age, presence: true
  validates :house, presence: true

  has_one_attached :image

  belongs_to :user
end
