class CreateAttendedEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :attended_events do |t|
      t.belongs_to :attendee, index: true
      t.belongs_to :attended_event, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
