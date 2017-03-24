class RemoveAcceptedFromRelation < ActiveRecord::Migration[5.0]
  def change
    remove_column :relations, :accepted
    remove_column :relations, :accepted_at
  end
end
