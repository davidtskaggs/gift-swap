class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.integer :participant_id, null: false, foreign_key: true, index: true
      t.references :event, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
