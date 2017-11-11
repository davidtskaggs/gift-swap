class GiftExchange < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :sender, class_name: "User"
  belongs_to :event
  belongs_to :wishlist_item



end
