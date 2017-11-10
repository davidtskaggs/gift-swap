json.extract! wishlist_item, :id, :wishlist_id, :gift_id, :created_at, :updated_at
json.url wishlist_item_url(wishlist_item, format: :json)
