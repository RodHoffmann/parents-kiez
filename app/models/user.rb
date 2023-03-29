class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :babysitter, dependent: :destroy
  has_many :items, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chatrooms_as_user1, class_name: "Chatroom", foreign_key: :user1_id
  has_many :chatrooms_as_user2, class_name: "Chatroom", foreign_key: :user2_id
end
