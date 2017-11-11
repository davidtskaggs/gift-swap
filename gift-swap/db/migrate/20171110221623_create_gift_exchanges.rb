class CreateGiftExchanges < ActiveRecord::Migration[5.1]
  def change
    create_table :gift_exchanges do |t|
      t.integer :recipient_id, foreign_key: true, null: false
      t.integer :sender_id, foreign_key: true, null: false
      t.integer :event_id, foreign_key: true, null: false
      t.integer :wishlist_item_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
