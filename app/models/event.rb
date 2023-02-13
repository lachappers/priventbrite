# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  date       :date
#  location   :string
#  start_time :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creator_id :integer          not null
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
  belongs_to :creator, class_name: 'User', foreign_key: "creator_id"
  
  has_many :attendees, through: :attendee_events

  # has_and_belongs_to_many :attendees, class_name: 'User', join_table: :attendees_events, association_foreign_key: :attendee_id
  
  # has_and_belongs_to_many :attendees, class_name: 'User', association_foreign_key: :attendee_id
  # has_many :event_users
  # has_many :events, through: event_users

end
