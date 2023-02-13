# == Schema Information
#
# Table name: attended_events
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  attended_event_id :integer          not null
#  attendee_id       :integer
#
# Indexes
#
#  index_attended_events_on_attended_event_id  (attended_event_id)
#  index_attended_events_on_attendee_id        (attendee_id)
#
# Foreign Keys
#
#  attended_event_id  (attended_event_id => attended_events.id)
#
require "test_helper"

class AttendedEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
