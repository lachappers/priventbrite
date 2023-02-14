class AddPrivateColumnToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :is_private, :boolean, default: false, null: false
  end
end
