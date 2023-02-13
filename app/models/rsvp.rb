# == Schema Information
#
# Table name: rsvps
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  attended_event_id :integer          not null
#  attendee_id       :integer          not null
#
# Indexes
#
#  index_rsvps_on_attended_event_id  (attended_event_id)
#  index_rsvps_on_attendee_id        (attendee_id)
#
# Foreign Keys
#
#  attended_event_id  (attended_event_id => events.id)
#  attendee_id        (attendee_id => users.id)
#
class Rsvp < ApplicationRecord
  belongs_to :attended_event, class_name: 'Event'
  belongs_to :attendee, class_name: 'User'
end
