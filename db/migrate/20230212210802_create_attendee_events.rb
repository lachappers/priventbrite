class CreateAttendeeEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :attendee_events do |t|
      t.belongs_to :attendee, index: true
      t.belongs_to :event, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
