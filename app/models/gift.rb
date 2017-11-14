class Gift < ApplicationRecord
	has_many :wishlist_items
	has_many :wishlists, through: :wishlist_items

  def add_wanted_gifts(params)
    params[:gift].values.select{|item| item[:want]}
  end


end
