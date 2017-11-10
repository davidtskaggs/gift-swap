class Event < ApplicationRecord
  validates :name, :description, :start_date, :end_date, :suggested_budget, :creator_id, presence: true

  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  has_many :participations
  has_many :participants, through: :participations
  has_many :gift_exchanges
  has_many :wishlist_items, through: :gift_exchanges
end
