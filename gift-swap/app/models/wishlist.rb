class Wishlist < ApplicationRecord
	belongs_to :user 
	has_many :wishlist_items 
	has_many :gifts, through: :wishlist_items  
end
