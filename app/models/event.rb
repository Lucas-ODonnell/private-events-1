# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  description :text
#  end_date    :date
#  end_time    :time
#  location    :string
#  start_date  :date
#  start_time  :time
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  creator_id  :integer
#
class Event < ApplicationRecord
  validates :title, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :start_time, presence: true
  validates :end_date, presence: true
  validates :end_time, presence: true
  validate :start_date_must_be_in_future, :end_must_be_after_start

  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: :event_id
  has_many :attendees, through: :invitations, source: :attendee

  scope :upcoming, -> { where('start_date >= ?', Time.zone.today) }
  scope :past, -> { where('start_date < ?', Time.zone.today) }

  private

  def start_date_must_be_in_future
    unless start_date > Time.zone.today
      errors.add(:start_date, "must be in the future.")
    end
  end

  def end_must_be_after_start
    if start_date == end_date && start_time > end_time
      errors.add(:end_time, "must be after start time.")
    elsif start_date > end_date
      errors.add(:end_date, "must be the same or after start date.")
    end
  end
end
