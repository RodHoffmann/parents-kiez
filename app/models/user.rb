class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :babysitter, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :events, dependent: :destroy

  has_one_attached :image

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  acts_as_voter

  def bookmarked_events
    self.get_voted(Event)
  end

  def bookmarked_babysitters
    self.get_voted(Babysitter)
  end



  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :chatrooms_as_user1, class_name: "Chatroom", foreign_key: :user1_id, dependent: :destroy
  has_many :chatrooms_as_user2, class_name: "Chatroom", foreign_key: :user2_id, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :gender, presence: true

  GENDERS = ['Male', 'Female', 'Prefer not to say']
end
