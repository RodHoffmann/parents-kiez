class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :babysitter, dependent: :destroy
  has_many :items, dependent: :destroy

  has_one_attached :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chatrooms_as_user1, class_name: "Chatroom", foreign_key: :user1_id, dependent: :destroy
  has_many :chatrooms_as_user2, class_name: "Chatroom", foreign_key: :user2_id, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :gender, presence: true

  GENDERS = %w[Male Female Other]
end
