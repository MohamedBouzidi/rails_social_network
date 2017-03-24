class CreateRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :relations do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :accepted
      t.timestamp :accepted_at

      t.timestamps
    end
  end
end
