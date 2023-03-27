class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :babysitter, dependent: :destroy
  has_many :items
  has_many :reservations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
