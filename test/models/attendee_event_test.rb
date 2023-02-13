# == Schema Information
#
# Table name: attendee_events
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  attendee_id :integer
#  event_id    :integer          not null
#
# Indexes
#
#  index_attendee_events_on_attendee_id  (attendee_id)
#  index_attendee_events_on_event_id     (event_id)
#
# Foreign Keys
#
#  event_id  (event_id => events.id)
#
require "test_helper"

class AttendeeEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
