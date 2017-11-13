class CreateWishlists < ActiveRecord::Migration[5.1]
  def change
    create_table :wishlists do |t|
      t.string :name
      t.integer :user_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
