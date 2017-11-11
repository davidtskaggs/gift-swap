class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :participations, foreign_key: :participant_id
  has_many :events, through: :participations
  has_many :wishlists
  has_many :gift_exchanges, foreign_key: :recipient_id
  has_many :gift_exchanges, foreign_key: :sender_id
end
