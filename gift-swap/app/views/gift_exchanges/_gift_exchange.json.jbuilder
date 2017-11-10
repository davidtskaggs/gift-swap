json.extract! gift_exchange, :id, :recipient_id, :sender_id, :event_id, :wishlist_item_id, :created_at, :updated_at
json.url gift_exchange_url(gift_exchange, format: :json)
