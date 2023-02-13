class AddAttendeeForeignKeyToRsvp < ActiveRecord::Migration[7.0]
  def change
    remove_column :rsvps, :attendee_id
    add_reference :rsvps, :attendee, index: true, foreign_key: { to_table: :users }, null: false

  end
end
