class Gift < ApplicationRecord
	has_many :wishlist_items
	has_many :wishlists, through: :wishlist_items

  def add_wanted_gifts(params)
    # puts "***************add_wanted_gifts_method*************"
    # binding.pry
    params[:gift].values.select{|item| item[:want]}
  end


end
