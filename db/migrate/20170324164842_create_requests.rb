class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :accepted
      t.timestamp :accepted_at

      t.timestamps
    end
    add_index :requests, [:sender_id, :receiver_id], unique: true
  end
end
