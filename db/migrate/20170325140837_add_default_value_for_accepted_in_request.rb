class AddDefaultValueForAcceptedInRequest < ActiveRecord::Migration[5.0]
  def change
    change_column :requests, :accepted, :boolean, default: false
  end
end
