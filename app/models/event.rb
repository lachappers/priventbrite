# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  date        :date
#  description :string
#  location    :string
#  start_time  :time
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  creator_id  :integer          not null
#
# Indexes
#
#  index_events_on_creator_id  (creator_id)
#
# Foreign Keys
#
#  creator_id  (creator_id => users.id)
#
class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  # , foreign_key: "creator_id"
  
  # has_many :attended_events, foreign_key: :attended_event_id

  has_many :rsvps, foreign_key: :attended_event_id, dependent: :destroy
  # , class_name: 'Event'
  has_many :attendees, through: :rsvps
  # , class_name: 'User', foreign_key
  # , source: :user

  # has_and_belongs_to_many :attendees, class_name: 'User', join_table: :attendees_events, association_foreign_key: :attendee_id
  
  # has_and_belongs_to_many :attendees, class_name: 'User', association_foreign_key: :attendee_id
  # has_many :event_users
  # has_many :events, through: event_users

end
