class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.date :start_date
      t.date :end_date
      t.string :suggested_budget, null: false
      t.integer :creator_id, null: false, foreign_key: true, index: true


      t.timestamps
    end
  end
end
