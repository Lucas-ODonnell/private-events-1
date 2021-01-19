# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  description :text
#  end_time    :datetime
#  location    :string
#  start_time  :datetime
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  creator_id  :integer
#
class Event < ApplicationRecord
  validates :title, presence: true
  validates :location, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :start_time_must_be_in_future, :end_time_must_be_after_start

  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: :event_id
  has_many :attendees, through: :invitations, source: :attendee

  # accepts_nested_attributes_for :invitations
  
  scope :upcoming, -> { where('start_time > ?', Time.zone.now) }
  scope :past, -> { where('end_time < ?', Time.zone.now) }

  private

  def start_time_must_be_in_future
    unless start_time > Time.zone.now
      errors.add(:start_time, "must be in the future.")
    end
  end

  def end_time_must_be_after_start
    unless start_time < end_time
      errors.add(:end_time, "must be after start time.")
    end
  end
end
