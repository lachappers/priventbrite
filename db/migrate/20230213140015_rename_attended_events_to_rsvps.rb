class RenameAttendedEventsToRsvps < ActiveRecord::Migration[7.0]
  def change
    rename_table :attended_events, :rsvps
  end
end
