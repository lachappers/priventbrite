# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  date        :date
#  description :string
#  is_private  :boolean          default(FALSE), not null
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

  has_many :rsvps, foreign_key: :attended_event_id, dependent: :delete_all
  has_many :attendees, through: :rsvps

  scope :past, -> { where("DATE(date) < ?", Date.today)}
  scope :future, -> { where("DATE(date) >= ?", Date.today)}
  scope :is_public, -> { where(is_private: false)}
  
end
