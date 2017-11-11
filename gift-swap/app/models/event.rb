class Event < ApplicationRecord
  validates :name, :description, :start_date, :end_date, :suggested_budget, :creator_id, presence: true

  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  has_many :participations
  has_many :participants, through: :participations

  #  def gift_exchange
  #   @gift_exchange = GiftExchange.find_by(id: @event.gift_exchange)
  #   @event = @gift_exchange.event
  #   @participants_give = @event.participants
  #   @participants_receive = @event.participants
  #   @recipient = @participants.sample
  #   @participants.pop(@recipient)
  #   return @recipient
  # end

end
