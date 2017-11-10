class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  has_many :participations

  has_many :participants, through: :participations
  has_one :creator, through: :participants

  # has_many :participants, through: :events
  # has_many :creators, through: :participations

end
