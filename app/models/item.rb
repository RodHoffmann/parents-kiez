class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :age, presence: true

  has_one_attached :image

  belongs_to :user

  AGES = ["less than 1 month old", "between 1 and 3 months old", "between 3 and 6 months old", "between 6 and 12 months old", "between 1 and 1,5 years old", "between 1 and 1,5 years old", "between 1,5 and 2 years old", "more than 2 years old"]
end
