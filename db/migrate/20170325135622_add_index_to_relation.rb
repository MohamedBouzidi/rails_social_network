class AddIndexToRelation < ActiveRecord::Migration[5.0]
  def up
    add_index :relations, [:sender_id, :receiver_id], unique: true
  end
end
