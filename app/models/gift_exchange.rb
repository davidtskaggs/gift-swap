class GiftExchange < ApplicationRecord

  belongs_to :recipient, class_name: "User", foreign_key: :recipient_id
  belongs_to :sender, class_name: "User",  foreign_key: :sender_id
  belongs_to :event
  belongs_to :wishlist_item

end
