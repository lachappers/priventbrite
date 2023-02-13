class AddTitleAndDescriptionToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :title, :string
    add_column :events, :description, :string
  end
end
