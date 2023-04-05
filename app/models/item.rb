class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :age, presence: true
  validates :house, presence: true

  has_one_attached :image

  belongs_to :user

  AGES = ["Less than 1 month", "Between 1 and 3 months", "Between 3 and 6 months", "Between 6 and 12 months", "Between 1 and 1,5 years", "Between 1 and 1,5 years", "Between 1,5 and 2 years", "More than 2 years"]
end
