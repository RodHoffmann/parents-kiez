class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :age, presence: true
  validates :house, presence: true

  has_one_attached :image
  has_many_attached :images

  belongs_to :user
end
