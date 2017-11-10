class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :participations, foreign_key: :participant_id

  # has_many :participants, through: :participations
  has_many :events, through: :participations

  # has_one :creator, class_name: "User", foreign_key: :creator_id

  # has_many :participants, through: :events
  # has_many :creators, through: :participations

end
