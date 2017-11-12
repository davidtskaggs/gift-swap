class WishlistItem < ApplicationRecord
	belongs_to :wishlist
	belongs_to :gift
end
