class UpdateRsvpForeignKeys < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key "rsvps", "rsvps", column: "attended_event_id"
    add_foreign_key "rsvps", "events", column: "attended_event_id"
  end
end
